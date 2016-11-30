--- **LibInit** should make using Ace3 even more easier and pleasant.
-- An embeddable library which offer clean methods to build a configuration table
-- instead of directly fiddling wit an Ace options table
-- @name LibInit
-- @class module
-- @author Alar of Daggerspine
-- @release 31
--
local __FILE__=tostring(debugstack(1,2,0):match("(.*):9:")) -- Always check line number in regexp and file

local MAJOR_VERSION = "LibInit"
local MINOR_VERSION = 33
local off=(_G.RED_FONT_COLOR_CODE or '|cffff0000') .. _G.VIDEO_OPTIONS_DISABLED ..  _G.FONT_COLOR_CODE_CLOSE or '|r'
local on=(_G.GREEN_FONT_COLOR_CODE or '|cff00ff00') .. _G.VIDEO_OPTIONS_ENABLED ..  _G.FONT_COLOR_CODE_CLOSE or '|r'
local nop=function()end
local pp=print -- Keeping a handy plain print around
local assert=assert
local strconcat=strconcat
local tostring=tostring
local _G=_G -- Unmodified env
local dprint=function() end
--@debug@
LoadAddOn("LibDebug")
LoadAddOn("Blizzard_DebugTools")
if LibDebug then
	--pulling libdebug print in without pulling also the whole _G management and without changing loading addon env
	LibDebug()
	dprint=print
	setfenv(1,_G)
end
--@end-debug@
--GAME_LOCALE="itIT"
local me, ns = ...
local LibStub=LibStub
local obj,old=LibStub:NewLibrary(MAJOR_VERSION,MINOR_VERSION)
local upgrading
if obj then
	upgrading=old
--@debug@
	if old then
		dprint(strconcat("Upgrading ",MAJOR_VERSION,'.',old,' to',MINOR_VERSION,' from ',__FILE__))
	else
		dprint(strconcat("Loading ",MAJOR_VERSION,'.',MINOR_VERSION,' from ',__FILE__))
	end
--@end-debug@
else
--@debug@
	dprint(strconcat("Equal or newer ",MAJOR_VERSION,' already loaded from ',__FILE__))
--@end-debug@
	return
end
local lib=obj --#Lib
local L
local C=LibStub("LibInit-Colorize")()
-- Upvalues
local _G=_G
local floor=floor
local abs=abs
local wipe=wipe
local print=print
local next = next
local pairs = pairs
local pcall = pcall
local type = type
local GetTime = GetTime
local gcinfo = gcinfo
local unpack = unpack
local geterrorhandler = geterrorhandler
local GetContainerNumSlots=GetContainerNumSlots
local GetContainerItemID=GetContainerItemID
local GetItemInfo=GetItemInfo
local UnitHealth=UnitHealth
local UnitHealthMax=UnitHealthMax
local setmetatable=setmetatable
local NUM_BAG_SLOTS=NUM_BAG_SLOTS
local InCombatLockdown=InCombatLockdown
local error=error
local tinsert=tinsert
local debugstack=debugstack
local ipairs=ipairs
local GetAddOnMetadata=GetAddOnMetadata
local format=format
local tostringall=tostringall
local tonumber=tonumber
local strconcat=strconcat
local strjoin=strjoin
local strsplit=strsplit
local select=select
local coroutine=coroutine
local cachedGetItemInfo
local toc=select(4,GetBuildInfo())

--]]
-- Help sections
local titles
local RELNOTES
local LIBRARIES
local PROFILE
local HELPSECTIONS
local AceConfig = LibStub("AceConfig-3.0",true)
assert(AceConfig,"LibInit needs AceConfig-3.0")
local AceRegistry = LibStub("AceConfigRegistry-3.0",true)
local AceDBOptions=LibStub("AceDBOptions-3.0",true)
local AceConfigDialog=LibStub("AceConfigDialog-3.0",true)
local AceGUI=LibStub("AceGUI-3.0",true)
local Ace=LibStub("AceAddon-3.0")
local AceLocale=LibStub("AceLocale-3.0",true)
local AceDB  = LibStub("AceDB-3.0",true)


-- Persistent tables
lib.mixinTargets=lib.mixinTargets or {}
lib.toggles=lib.toggles or {}
lib.chats=lib.chats or {}
lib.options=lib.options or {}
lib.pool=lib.pool or setmetatable({},{__mode="k"})
lib.coroutines=lib.coroutines or setmetatable({},{__index=function(t,k) rawset(t,k,{}) return t[k] end})
-- Recycling function from ACE3
local new, del, copy, cached, stats
do
	local pool = lib.pool
--@debug@
	local newcount, delcount,createdcount,cached = 0,0,0
--@end-debug@
	function new()
--@debug@
		newcount = newcount + 1
--@end-debug@
		local t = next(pool)
		if t then
			pool[t] = nil
			return t
		else
--@debug@
			createdcount = createdcount + 1
--@end-debug@
			return {}
		end
	end
	function copy(t)
		local c = new()
		for k, v in pairs(t) do
			c[k] = v
		end
		return c
	end
	function del(t)
--@debug@
		delcount = delcount + 1
--@end-debug@
		wipe(t)
		pool[t] = true
	end
	function cached()
		local n = 0
		for k in pairs(pool) do
			n = n + 1
		end
		return n
	end
--@debug@
	function stats()
		print("Created:",createdcount)
		print("Aquired:",newcount)
		print("Released:",delcount)
		print("Cached:",cached())
	end
--@end-debug@
--[===[@non-debug@
	function stats()
		return
	end
--@end-non-debug@]===]
end
--- Create a new AceAddon-3.0 addon.
-- Any library you specified will be embeded, and the addon will be scheduled for
-- its OnInitializee and OnEnabled callbacks.
-- The final addon object, with all libraries embeded, will be returned.
-- Options table format:
-- 	*profile: choose the initial profile (if omittete, uses a per character one)
--		*noswitch: disables Ace profile managemente, user will not be able to change it
--		*nogui: do not generate a gui for configuration
--		*nohelp: do not generate help (actually, help generation is not yet implemented)
--		*enhancedProfile: adds "Switch all profiles to default" and "Remove unused profiles" do Ace profile gui
--
-- @tparam[opt] table target to use as a base for the addon (optional)
-- @tparam string name Name of the addon object to create
-- @tparam[opt] table options options list
-- @tparam[opt] bool full If true, all available and embeddable Ace3 library are embedded
-- @tparam[opt] string ... List of libraries to embed into the addon
-- @treturn table new addon
--
-- @usage
-- --Create a simple addon object
-- MyAddon = LibStub("LibInit"):NewAddon("MyAddon", "AceEvent-3.0")
--
-- -- Create a Addon object based on the table of a frame
-- local MyFrame = CreateFrame("Frame")
-- MyAddon = LibStub("LibInit"):NewAddon(MyFrame, "MyAddon", "AceEvent-3.0")
-- -- Create an Addon based on the private table provided by Blizzard Code:
-- local myname,addon = ...
-- LibStub("LibInit"):NewAddon(addon,myname)
--
---
function lib:NewAddon(target,...)
	local name
	local customOptions
	local start=1
	if type(target) ~= "table" then
		name=target
		target={}
	else
		name=(select(1,...))
		start=2
	end
	assert(Ace,"Could not find Ace3 Library")
	assert(type(name)=="string","Name is mandatory")
	local appo={}
	appo[MAJOR_VERSION]=true
	appo["AceConsole-3.0"]=true
	for i=start,select('#',...) do
		local mix=select(i,...)
		if type(mix)=="boolean" and mix then
			for n,k in  LibStub:IterateLibraries() do
				if (n:match("Ace%w*-3%.0") and k.Embed) then appo[n]=true end
			end
		elseif type(mix)=="string" then
			appo[mix]=true
		elseif type(mix)=="table" then
			customOptions=mix
		end
	end
	local mixins=new()
	for i,_ in pairs(appo) do
		tinsert(mixins,i)
	end
	local target=Ace:NewAddon(target,name,unpack(mixins))
	del(mixins)
	appo=nil
	local options={}
	options.name=name
	options.first=true
	options.libstub=__FILE__
	options.version=GetAddOnMetadata(name,'Version') or "Internal"
	if (options.version:sub(1,1)=='@') then
		options.version=GetAddOnMetadata(name,'X-Version') or "Internal"
	end
	local b,e=options.version:find(" ")
	if b and b>1 then
		options.version=options.version:sub(1,b-1)
	end
	options.revision=GetAddOnMetadata(name,'X-revision') or "Alpha"
	if (options.revision:sub(1,1)=='@') then
		options.revision='Development'
	end
	options.prettyversion=format("%s (Revision: %s)",tostringall(options.version,options.revision))
	options.title=GetAddOnMetadata(name,"title") or 'No title'
	options.notes=GetAddOnMetadata(name,"notes") or 'No notes'
	-- Setting sensible default for mandatory fields
	options.ID=GetAddOnMetadata(name,"X-ID") or name
	options.DATABASE=GetAddOnMetadata(name,"X-Database") or "db" .. options.ID
	lib.toggles[target]={}
	if customOptions then
		for k,v in pairs(customOptions) do
			local key=strlower(k)
			if key=="enhanceprofile" then key = "enhancedprofile" end
			if 	key=="profile"
				or key=="noswitch"
				or key=="nogui"
				or key=="nohelp"
				or key=="enhancedprofile"
					then
				options[key]=v
			else
				error("Invalid options: " .. k)
			end
		end
	end
	lib.options[target]=options
	RELNOTES=L["Release Notes"]
	PROFILE=L["Profile"]
	HELPSECTIONS={PROFILE,RELNOTES}
	titles={
		RELNOTES=RELNOTES,
		PROFILE=PROFILE
	}
	return target
end
-- Combat scheduler done with LibCallbackHandler
local CallbackHandler = LibStub:GetLibrary("CallbackHandler-1.0")
if not lib.CombatScheduler then
	lib.CombatScheduler = CallbackHandler:New(lib,"_OnLeaveCombat","_CancelCombatAction")
	lib.CombatFrame=CreateFrame("Frame")
	lib.CombatFrame:SetScript("OnEvent",function()
		lib.CombatScheduler:Fire("LIBINIT_END_COMBAT")
		if lib.CombatScheduler.insertQueue then
			wipe(lib.CombatScheduler.insertQueue) -- hackish, depends on internal callbackhanlder implementation
		end
		wipe(lib.CombatScheduler.events)
		lib.CombatScheduler.recurse=0
		for _,co in pairs(lib.coroutines) do
			if co.waiting then
				co.waiting=false
				co.repeater()
			end
		end
	end)
	lib.CombatFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
end
local tremove=tremove
local function Run(args) tremove(args,1)(unpack(args)) end
--- Executes an action as soon as combat restrictions lift
-- Action can be executed immediately if toon is out of combat
-- @tparam string|function action To be executed, Can be a function or a method name
-- @tparam[opt] mixed ... More parameters will be directly passed to action
--
function lib:OnLeaveCombat(action,...)
	if type(action)~="string" and type(action)~="function" then
		error("Usage: OnLeaveCombat (\"action\", ...): 'action' - string or function expected.", 2)
	end
	if type(action)=="string" and type(self[action]) ~= "function" then
		error("Usage: OnLeaveCombat (\"action\", ...): 'action' - method '"..tostring(action).."' not found on self.", 2)
	end
	if type(action) =="string" then
		lib._OnLeaveCombat(self,"LIBINIT_END_COMBAT",Run,{self[action],self,...})
	else
		lib._OnLeaveCombat(self,"LIBINIT_END_COMBAT",Run,{action,...})
	end
	if (not InCombatLockdown()) then
		lib.CombatFrame:GetScript("OnEvent")()
	end
end

function lib:NewSubModule(name,...)
	local obj=self:NewModule(name,...)
	-- To avoid strange interactions
	obj.OnInitialized=function()end -- placeholder
	obj.OnInitialize=function(self,...) return  self:OnInitialized(...) end
	obj.OnEnable=nil
	obj.OnDisable=nil
	return obj
end
function lib:NewSubClass(name)
	return self:NewSubModule(name,self)
end
function lib:NewTable()
	return new()
end
function lib:DelTable(t)
	return del(t)
end
function lib:CachedTableCount()
	return cached()
end
function lib:CacheStats()
	return stats()
end
--- Returns a closure to call a method as simple local function
--@usage local print=lib:Wrap("print")
function lib:Wrap(nome)
	if (nome=="Trace") then
		return function(...) lib._Trace(self,1,...) end
	end
	if (type(self[nome])=="function") then
		return function(...) self[nome](self,...) end
	else
		return nop
	end
end
function lib:GetAddon(name)
	return Ace:GetAddon(name,true)
end
function lib:GetLocale()
	return AceLocale:GetLocale(self.name)
end
function lib:Gradient(perc)
	return self:ColorGradient(perc,0,1,0,1,1,0,1,0,0)
end
function lib:ColorToString(r,g,b)
	return format("%02X%02X%02X", 255*r, 255*g, 255*b)
end
function lib:ColorGradient(perc, ...)
	if perc >= 1 then
		local r, g, b = select(select('#', ...) - 2, ...)
		return r, g, b
	elseif perc <= 0 then
		local r, g, b = ...
		return r, g, b
	end
	local num = select('#', ...) / 3
	local segment, relperc = math.modf(perc*(num-1))
	local r1, g1, b1, r2, g2, b2 = select((segment*3)+1, ...)
	return r1 + (r2-r1)*relperc, g1 + (g2-g1)*relperc, b1 + (b2-b1)*relperc
end
-- Gestione variabili
local varmeta={}
do
	local function f1(self,flag,value)
		return self:Apply(flag,value)
	end
	local function f2(self,flag,value)
		return self['Apply' .. flag](self,value)
	end
	varmeta={
		__index =
		function(table,cmd)
			local self=rawget(table,'_handler')
			if (type(self["Apply" .. cmd]) =='function') then
				rawset(table,cmd,f2)
			elseif (type(self.Apply)=='function') then
				rawset(table,cmd,f1)
			else
				rawset(table,cmd,function(...) end)
			end
			return rawget(table,cmd)
		end
	}
end
function lib:GetChatFrame(chat)
	if (chat) then
		if (lib.chats[chat]) then return lib.chats[chat] end
		for i=1,NUM_CHAT_WINDOWS do
			local frame=_G["ChatFrame" .. i]
			if (not frame) then break end
			if (frame.name==chat) then lib.chats[chat]=frame return frame end
		end
		return nil
	end
	return DEFAULT_CHAT_FRAME
end

local Myclass
---
-- Check if the unit in target hast the requested class
-- @tparam #string class Requested Class
-- @tparam #string target Requested Unit (default 'player')
-- @return #boolean true if target has the requeste class
function lib:Is(class,target)
	target=target or "player"
	if (target == "player") then
		if (not Myclass) then
			Myclass=select(2,UnitClass('player'))
		end
		return Myclass==strupper(class)
	else
		local    rc,_,unitclass=pcall(UnitClass,target)
		if (rc) then
			return unitclass==strupper(class)
		else
			return false
		end
	end
end
---
-- Parses a command from chat or from an table options handjer command
-- Internally calls AceConsole-3.0:GetArgs
-- @tparam mixed msg Can be a string (chat command) or a table (called by Ace3 Options Table Handler)
-- @tparam number n index in command list
-- @return command,subcommand,arg,full string after command
function lib:Parse(msg,n)
	if (not msg) then
		return nil
	end
	if (type(msg) == 'table' and msg.input ) then msg=msg.input end
	if (type(msg) ~= 'string') then return end
	return self:GetArgs(msg,n)
end
---
-- Parses an itemlink and returns itemId without calling API again
-- @tparam string itemlink A standard wow itemlink
-- @treturn number itemId or 0
function lib:GetItemID(itemlink)
	if (type(itemlink)=="string") then
			local itemid,context=GetItemInfoFromHyperlink(itemlink)
			return tonumber(itemid) or 0
			--return tonumber(itemlink:match("Hitem:(%d+):")) or 0
	else
			return 0
	end
end
---
-- Return the toal numner of bag slots
function lib:GetTotalBagSlots()
	local i=0
	for bag=0,NUM_BAG_SLOTS do
		i=i+GetContainerNumSlots(bag)
	end
	return i
end
---
-- Scans Bags for an item based on different criteria
--
-- All parameters are optional.
-- With no parameters ScanBags returns the first empty slot
--
-- @tparam[opt] number index is index in GetItemInfo result. 0 is a special case to match just itemid
-- @tparam[opt] number value is the value against to match. 0 is a special case for empty slot
-- @tparam[opt] number startbag and startslot are used to restart scan from the last item found
-- @tparam[opt] number startslot
-- @return Found ItemId,bag,slot,full GetItemInfo result
function lib:ScanBags(index,value,startbag,startslot)
	index=index or 0
	value=value or 0
	startbag=startbag or 0
	startslot=startslot or 1
	for bag=startbag,NUM_BAG_SLOTS do
		for slot=startslot,GetContainerNumSlots(bag),1 do
			local itemlink=GetContainerItemLink(bag,slot)
			if (itemlink) then
				if (index==0) then
					if (self:GetItemID(itemlink)==value) then
						return itemlink,bag,slot
					end
				else
					local test=CachedGetItemInfo(itemlink,index)
					if (value==test) then
						return itemlink,bag,slot
					end
				end
			elseif value==0 then
				return bag,slot

			end
		end
	end
	return false
end
--- Returns unit's health as a normalized percent value
-- @tparam string unit A standard unit name
-- @treturn number health as percent value

function lib:Health(unit)
		local totale=UnitHealthMax(unit) or 1
		local corrente=UnitHealth(unit) or 1
		if (corrente == 0) then corrente =1 end
		if (totale==0) then totale = corrente end
		local life=corrente/totale*100
		return math.ceil(life)
end

function lib:Age(secs)
		return self:TimeToStr(GetTime() - secs)
end
function lib:Mana(unit)
		local totale=UnitManaMax(unit) or 1
		local corrente=UnitMana(unit) or 1
		if (corrente == 0) then corrente =1 end
		if (totale==0) then totale = corrente end
		local life=corrente/totale*100
		return math.ceil(life)
end
function lib:IsFriend(player)
	local i
	for i =1,GetNumFriends() do
		local name,_,_,_,_ =GetFriendInfo(i)
		if (name == player) then
			return true
		end
	end
	return false
end
function lib:GetDistanceFromMe(unit)
	if not unit then return 99999 end
	local x,y=GetPlayerMapPosition(unit)
	return self:GetUnitDistance(x,y)
end
function lib:GetUnitDistance(x,y,unit)
		unit=unit or "player"
		local from={}
		local to={}
		from.x,from.y=GetPlayerMapPosition(unit)
		to.x=x
		to.y=y
		return self:GetDistance(from,to) * 10000
end
function lib:GetDistance(a,b)
--------------
-- Calculates distance betweeb 2 points given as
-- a.x,a.y and b.x,b.y
	local x=b.x - a.x
	local y=b.y -a.y
	local d=x*x + y* y
	local rc,distance=pcall(math.sqrt,d)
	if (rc) then
				return distance
		else
				return 99999
		end
end
---
-- Returns a numeric representation of version.
-- Can be overridden
-- In default incarnation assumes that version is in the form x,y,z
-- @return z+y*100+x*10000
--
function lib:NumericVersion()
	local v=tonumber(self.version)
	if (v) then return v end
	if (type(self.version) == "string") then
		local a,b,c=self.version:match("(%d*)%D?(%d*)%D?(%d*)%D*")
		a=tonumber(a) or 0
		b=tonumber(b) or 0
		c=tonumber(c) or 0
		return a*10000+b*100+c
	else
		return 0
	end
end
function lib:OnInitialized()
	print("|cff33ff99"..tostring( self ).."|r:",format(ITEM_MISSING,"OnInitialized"))
end
function lib:LoadHelp()
end
function lib:SetDbDefaults()
end
function lib:SetOptionsTable()
end
local function loadOptionsTable(self)
	local options=lib.options[self]
	self.OptionsTable={
		handler=self,
		type="group",
		childGroups="tab",
		name=options.title,
		desc=options.notes,
		args={
			gui = {
				name="GUI",
				desc=_G.CHAT_CONFIGURATION,
				type="execute",
				func="Gui",
				guiHidden=true,
			},
--@debug@
			help = {
				name="HELP",
				desc="Show help",
				type="execute",
				func="Help",
				guiHidden=true,
			},
			debug = {
				name="DBG",
				desc="Enable debug",
				type="execute",
				func="Debug",
				guiHidden=true,
				cmdHidden=true,
			},
--@end-debug@
			silent = {
				name="SILENT",
				desc="Eliminates startup messages",
				type="execute",
				func=function()
					self.db.global.silent=not self.db.global.silent
					print("Silent is now",self.db.global.silent,self.db.global.silent and "true" or "false" )
				end,
				guiHidden=true,
			},
			on = {
				name=strlower(_G.ENABLE),
				desc=_G.ENABLE .. ' ' .. options.title,
				type="execute",
				func="Enable",
				guiHidden=true,
			},
			off = {
				name=strlower(_G.DISABLE),
				desc=_G.DISABLE .. ' ' .. options.title,
				type="execute",
				func="Disable",
				guiHidden=true,
				arg='Active'
			},
		}
	}
end
local function loadDbDefaults(self)
	self.DbDefaults={
		char={
			firstrun=true,
			lastversion=0,
		},
		global={
			firstrun=true,
			lastversion=0,
			lastinterface=60200
		},
		profile={
			toggles={
					Active=true,
			},
			["*"]={},
		}
	}
	self.MenuLevels={"root"}
	self.ItemOrder=setmetatable({},{
		__index=function(table,key) rawset(table,key,1)
			return 1
		end
		}
	)
end
local function BuildHelp(self)
	local main=self.name
	for _,section in ipairs(HELPSECTIONS) do
		if (section == RELNOTES) then
			self:HF_Load(section,main..section,' ' .. tostring(self.version) .. ' (r:' .. tostring(self.revision) ..')')
		else
			self:HF_Load(section,main .. section,'')
		end
	end
end
function lib:IsFirstRun()
	return self.db.global.firstrun
end
function lib:IsNewVersion()
	return self.numericversion > self.db.global.lastnumericversion and self.db.global.lastnumericversion or false
end
function lib:IsNewTocVersion()
	return self.interface > self.db.global.lastinterface  and self.db.global.lastinterface or false
end
function lib:RegisterDatabase(dbname,defaults,profile)
	return AceDB:New(dbname,defaults,profile)
end
local function SetCommonProfile(info,...)
	local db=info.handler.db
	for k,v in pairs(db.sv.profileKeys) do
		db.sv.profileKeys[k]="Default"
	end
	db:SetProfile("Default")
end
local function PurgeProfiles(info,...)
	local profiles=new()
	local used=new()
	local db=info.handler.db
	db:GetProfiles(profiles)
	for k,v in pairs(db.sv.profileKeys) do
		used[v]=true
	end
--@debug@
	DevTools_Dump(profiles)
	DevTools_Dump(used)
--@end-debug@
	for _,v in ipairs(profiles) do
		if not used[v] then
			db:DeleteProfile(v)
		end
	end
	del(used)
	del(profiles)

end
local function SetupProfileSwitcher(tbl,addon)
	local profiles=tbl.handler:ListProfiles({args="both"})
	local default=profiles.Default or "Default"
	wipe(profiles)
	tbl.args.UseDefault_Desc={
		order=900,
		type='description',
		name="\n"..format(L['UseDefault_Desc'],default)
	}
	tbl.args.UseDefault={
		order=910,
		type='execute',
		func=SetCommonProfile,
		name=format(L['UseDefault1'],default),
		desc=format(L['UseDefault2'],default),
		width="double",
	}
	tbl.args.Purge_Desc={
		order=920,
		type='description',
		--name="forcedescname",
		name="\n"..L['Purge_Desc'],
	}
	tbl.args.Purge={
		order=930,
		type='execute',
		func=PurgeProfiles,
		name=L['Purge1'],
		desc=L['Purge2'],
		width="double",
	}
end
function lib:OnInitialize(...)
	self.numericversion=self:NumericVersion() -- Initialized now becaus NumericVersion could be overrided
	--CachedGetItemInfo=self:GetCachingGetItemInfo()
	loadOptionsTable(self)
	loadDbDefaults(self)
	self:SetOptionsTable(self.OptionsTable) --hook
	self:SetDbDefaults(self.DbDefaults) -- hook
	local options=lib.options[self]
	self.version=self.version or options.version
	self.prettyversion=self.prettyversion or options.prettyversion
	self.revision=self.revision or options.revision
	if (AceDB and not self.db) then
		self.db=AceDB:New(options.DATABASE,nil,options.profile)
		dprint(self.db:GetCurrentProfile())
	end
	if self.db then
		self.db:RegisterDefaults(self.DbDefaults)
		--[[
		if (not self.db.global.silent) then
			self:Print(format("Version %s %s loaded (%s)",
				self:Colorize(options.version,'green'),
				self:Colorize(format("(Revision: %s)",options.revision),"silver"),
				"Disable message with /" .. strlower(options.ID) .. " silent")
			)
		end
		--]]
		self:SetEnabledState(self:GetBoolean("Active"))
	else
		self.db=setmetatable({},{
			__index=function(t,l)
				assert(false,"You need AceDB-3.0 in order to use database")
			end
			}
		)
		self:SetEnabledState(true)
	end
	-- I have for sure some library that needs to be intialized Before the addon
	for _,library in self:IterateEmbeds(self) do
		local lib=LibStub(library)
		if (lib.OnEmbedPreInitialize) then
			lib:OnEmbedPreInitialize(self)
		end
	end

	self.help=setmetatable(
			{},
			{__index=function(table,key)
					rawset(table,key,"")
					return rawget(table,key)
					end
			}
	)
	--===============================================================================
	-- Calls initialization Callback
	local ignoreProfile=self:OnInitialized(...)
	--===============================================================================
	if (not self.OnDisabled) then
		self.OptionsTable.args.on=nil
		self.OptionsTable.args.off=nil
		self.OptionsTable.args.standby=nil
	end
	if (type(self.LoadHelp)=="function") then self:LoadHelp() end
	local main=options.name
	-- 選項分類轉換為中文名稱
	local mainLoc = main
	if main == "ItemLevelDisplay" then
		mainLoc = "裝備-物品等級"
	elseif main== "GarrisonCommander" then
		mainLoc = "任務-職業大廳和要塞"
	end
	BuildHelp(self)
	if AceConfig and not options.nogui then
		AceConfig:RegisterOptionsTable(main,self.OptionsTable,{main,strlower(options.ID)})
		self.CfgDlg=AceConfigDialog:AddToBlizOptions(main,mainLoc )
		if (not ignoreProfile and not options.noswitch) then
			if (AceDBOptions) then
				local profileOpts=AceDBOptions:GetOptionsTable(self.db)
				self.ProfileOpts={} -- We dont want to propagate this change to all ace3 addons
				for k,v in pairs(profileOpts) do
					if k=='args' then
						self.ProfileOpts.args={}
						for k2,v2 in pairs(v) do
							self.ProfileOpts.args[k2]=v2
						end
					else
						self.ProfileOpts[k]=v
					end
				end
				titles.PROFILE=self.ProfileOpts.name
				self.ProfileOpts.name=self.name
				if options.enhancedprofile then
					SetupProfileSwitcher(self.ProfileOpts,self)
				end
				local profile=main..PROFILE
			end
			AceConfig:RegisterOptionsTable(main .. PROFILE,self.ProfileOpts)
			AceConfigDialog:AddToBlizOptions(main .. PROFILE,titles.PROFILE,mainLoc)
		end
	else
		self.OptionsTable.args.gui=nil
	end
	if (self.help[RELNOTES]~='') then
		self.CfgRel=AceConfigDialog:AddToBlizOptions(main..RELNOTES,titles.RELNOTES,mainLoc)
	end
	if AceDB then
		self:UpdateVersion()
	end
end
function lib:UpdateVersion()
	if (type(self.db.char) == "table") then
		self.db.char.lastversion=self.numericversion
		self.db.char.firstun=false
	end
	if (type(self.db.global)=="table") then
		self.db.global.lastversion=self.numericversion
		self.db.global.firstrun=false
		self.db.global.lastinterface=self.interface
	end
end

-- help related functions
function lib:HF_Push(section,text)
	if section then section=titles[section] end
	section=section or self.lastsection or RELNOTES
	self.lastsection=section
	self.help[section]=self.help[section]  .. '\n' .. text
end
local getlibs
do
	local libs={}
		function lib:HF_Lib(libname)
				local o,minor=LibStub(libname,true)
				if (o and libs) then
						if (not libs[o] or libs[o] <minor) then
								libs[libname]=minor
						end
				end
		end
		function getlibs(self)
				local appo={}
				if (not libs) then return end
				for i,_ in pairs(libs) do
						table.insert(appo,i)
				end
				table.sort(appo)
				for _,libname in pairs(appo) do
						local minor=libs[libname]
						self:HF_Pre(format("%s release: %s",self:Colorize(libname,'green'),self:Colorize(minor,'orange')),LIBRARIES)
				end
				libs=nil
		end
end

function lib:HF_Toggle(flag,description)
	flag=C(format("/%s toggle %s: ",strlower(lib.options[self].ID),flag),'orange') ..C(description,'white')
	self:HF_Push(TOGGLES,"\n" .. C(flag,'orange'))
end

function lib:HF_Title(text,section)
	self:HF_Push(section,C(text or '','yellow') .. "\n")
end
function lib:HF_Command(text,description,section)
	self:HF_Push(section,C(text or '','orange') .. ':' ..  C(description or '','yellow') .. "\n")
end

function lib:HF_Paragraph(text,section)
	self:HF_Push(section,"\n"..C(text,'green'))
end
function lib:HF_CmdA(command,description,tooltip)
	self:HF_Push(nil,
	C('/' .. command,'orange') .. ' : ' .. (description or '') .. '\n' .. C(tooltip or '','yellow'))
end
function lib:HF_Cmd(command,description,tooltip)
	command=lib.options[self].ID .. ' ' .. command
	self:HF_CmdA(command,description,tooltip)
end
function lib:HF_Pre(testo,section)
	self:HF_Push(section,testo)
end
function lib:Wiki(testo,section)
	section=section or self.lastsection or RELNOTES
	self.lastsection=section
	local fmtbullet=" * %s\n"
	local progressive=1
	local fmtnum=" %2d. %s\n"
	local fmthead1="|cff" .. C.Orange  .."%s|r\n \n \n"
	local fmthead2="|cff" .. C.Yellow  .."%s|r\n \n"
	local text=''
	for line in testo:gmatch("(%C*)%c+") do
		line=line:gsub("^ *","")
		line=line:gsub(" *$","")
		local i,j= line:find('^%=+')
		if (i) then
			if (j==1) then
				text=text .. fmthead1:format(line:sub(j+1,-j-1))
			else
				text=text .. fmthead2:format(line:sub(j+1,-j-1))
			end
		else
			local i,j= line:find('^%*+')
			if (i) then
				text=text.. fmtbullet:format(line:sub(j+1))
			else
				local i,j= line:find('^#+')
				if (i) then
					text=text .. fmtnum:format(progressive,line:sub(j+1))
					progressive=progressive + 1
				else
					text=text .. line.."\n"
				end
			end
		end
	end
	self.help[section]=self.help[section]  .. '\n' .. text
end

function lib:RelNotes(major,minor,revision,t)
	local fmt=self:Colorize("Release note for %d.%d.%s",'Yellow') .."\n%s"
	local lines={}
	local spacer=""
	local maxpanlen=70
	lines={strsplit("\n",t)}
	local max=5
	for i,tt in ipairs(lines) do
		local prefix,text=tt:match("^(%a+):(.*)")
		if (prefix == "Fixed" or prefix=="Fix") then
			prefix=self:Colorize("Fix: ",'Red')
			spacer="       "
		elseif (prefix == "Feature") then
			prefix=self:Colorize("Feature: ",'Green')
			spacer=             "         "
		else
			text=tt
			prefix=spacer
		end
		local tta=""
		tt=text
		while (tt:len() > maxpanlen)  do
			local p=tt:find("[%s%p]",maxpanlen -10) or maxpanlen
			tta=tta..prefix..tt:sub(1,p) .. "\n"
			prefix=spacer
			tt=tt:sub(p+1)
		end
		tta=tta..prefix..tt
		tta=tta:gsub("Upgrade:",self:Colorize("Upgrade:",'Azure'))
		lines[i]=tta:gsub("Example:",self:Colorize("Example:",'Orange'))
		max=max-1
		if (max<1) then
			break
		end
	end
	self:HF_Push(RELNOTES,fmt:format(major,minor,revision,strjoin("\n",unpack(lines))))
end

function lib:HF_Load(section,optionname,versione)
-- Creazione pannello di help
-- Livello due del
	if (section == LIBRARIES) then
		getlibs(self)
	end
	local testo =self.help[section]
	--debug(section)
	--debug(optionname)
	--debug(self.title)
	if (testo ~= '') then
		AceConfig:RegisterOptionsTable(optionname, {
			name = lib.options[self].title .. (versione or ""),
			type = "group",
			args = {
				help = {
					type = "description",
					name = testo,
					fontSize='medium',
				},
			},
		})
		AceConfigDialog:SetDefaultSize(optionname, 600, 400)
	end
end
-- var area
local function getgroup(self)
	local group=self.OptionsTable
	local m=self.MenuLevels
	for i=2,#m do
			group=group.args[self.MenuLevels[i]]
	end
	if (type(group) ~= "table") then
			group={}
	end
	return group
end
local function getorder(self,group)
	local i=self.ItemOrder[group.name]+1
	self.ItemOrder[group.name]=i
	return i
end
local function toflag(...)
	local appo=''
	for i=1,select("#",...) do
		appo=appo .. tostring(select(i,...))
	end
		return appo:gsub("%W",'')
end
function lib:EndLabel()
	local m=self.MenuLevels
	if (#m > 1) then
			table.remove(m)
	end
end

--self:AddLabel("General","General Options",C.Green)
function lib:AddLabel(title,description,stringcolor)
	self:EndLabel()
	description=description or title
	stringcolor=stringcolor or C.yellow
	local t=self:AddSubLabel(title,description,stringcolor)
	t.childGroups="tab"
	self:AddSeparator(description)
	return t
end
--self:AddSubLabel("Local","Local Options",C.Green)
function lib:AddSubLabel(title,description,stringcolor)
	local m=self.MenuLevels
	description=description or title
	stringcolor=stringcolor or C.orange
	local group=getgroup(self)
	local flag=toflag(group.name,title)
	group.args[flag]={
			name="|cff" .. stringcolor .. title .. "|r",
			desc=description,
			type="group",
			cmdHidden=true,
			args={},
			order=getorder(self,group),
	}
	table.insert(m,flag)
	return group.args[flag]
end

--self:AddText("Testo"[,texture[,height[,width[,texcoords]]]])
function lib:AddText(text,image,imageHeight,imageWidth,imageCoords)
	local group=getgroup(self)
	local flag=toflag(group.name,text)
	local t={
			name=text,
			type="description",
			image=image,
			imageHeight=imageHeight,
			imageWidth=imageWidth,
			imageCoords=imageCoords,
			desc=text,
			order=getorder(self,group),

	}
	group.args[flag]=t
	return t
end

--self:AddToggle("AUTOLEAVE",true,"Quick Battlefield Leave","Alt-Click on hide button in battlefield alert leaves the queue")
function lib:AddBoolean(...) return self:AddToggle(...) end
function lib:AddToggle(flag,defaultvalue,name,description,icon)
	description=description or name
	local group=getgroup(self)
	local t={
			name=name,
			type="toggle",
			get="OptToggleGet",
			set="OptToggleSet",
			desc=description,
			width='full',
			arg=flag,
			cmdHidden=true,
			icon=icon,
			order=getorder(self,group),
	}
	lib.toggles[self][flag]=t
	group.args[flag]=t
	if (self.db.profile.toggles[flag]== nil) then
		self.db.profile.toggles[flag]=defaultvalue
	end
	return t
end

-- self:AddEdit("REFLECTTO",1,{a=1,b=2},"Whisper reflection receiver:","All your whispers will be forwarded to this guy")
function lib:AddSelect(flag,defaultvalue,values,name,description)
	description=description or name
	local group=getgroup(self)
	local t={
			name=name,
			type="select",
			get="OptToggleGet",
			set="OptToggleSet",
			desc=description,
			width="full",
			values=values,
			arg=flag,
			cmdHidden=true,
			order=getorder(self,group)
	}
	group.args[flag]=t
	if (self.db.profile.toggles[flag]== nil) then
		self.db.profile.toggles[flag]=defaultvalue
	end
	lib.toggles[self][flag]=t
	return t
end
function lib:AddMultiSelect(flag,defaultvalue,...)
	local t=self:AddSelect(flag,defaultvalue,...)
	t.type="multiselect"
	if type(self.db.profile.toggles[flag])~="table" then
		self.db.profile.toggles[flag]={}
	end
	if type(self.db.profile.toggles[flag]._default)=="nil" then
		self.db.profile.toggles[flag]=defaultvalue
		self.db.profile.toggles[flag]._default=true
	end
	return t
end
--self:AddSlider("RESTIMER",5,1,10,"Enable res timer","Shows a timer for battlefield resser",1)
function lib:AddRange(...) return self:AddSlider(...) end
function lib:AddSlider(flag,defaultvalue,min,max,name,description,step)
	description=description or name
	min=min or 0
	max=max or 100
	local group=getgroup(self)
	local isPercent=nil
	if (type(step)=="boolean") then
		isPercent=step
		step=nil
	else
		step=tonumber(step) or 1
	end
	local t={
		name=name,
		type="range",
		get="OptToggleGet",
		set="OptToggleSet",
		desc=description,
		width="full",
		arg=flag,
		step=step,
		isPercent=isPercent,
		min=min,
		max=max,
		order=getorder(self,group),
	}
	group.args[flag]=t
	if (self.db.profile.toggles[flag]== nil) then
		self.db.profile.toggles[flag]=defaultvalue
	end
	lib.toggles[self][flag]=t
	return t
end
-- self:AddEdit("REFLECTTO","","Whisper reflection receiver:","All your whispers will be forwarded to this guy","How to use it")
function lib:AddEdit(flag,defaultvalue,name,description,usage)
	description=description or name
	usage = usage or description
	local group=getgroup(self)
	local t={
			name=name,
			type="input",
			get="OptToggleGet",
			set="OptToggleSet",
			desc=description,
			arg=flag,
			usage=usage,
			order=getorder(self,group),

	}
	group.args[flag]=t
	if (self.db.profile.toggles[flag]== nil) then
			self.db.profile.toggles[flag]=defaultvalue
	end
	lib.toggles[self][flag]=t
	return t
end

-- self:AddAction("openSpells","Opens spell panel","You can choose yoru spells in spell panel")
function lib:AddAction(method,label,description,private)
	label=label or method
	description=description or label
		local group=getgroup(self)
		local t={
			func=method,
			name=label,
			type="execute",
			desc=description,
			confirm=false,
			cmdHidden=true,
			order=getorder(self,group)
		}
	if (private) then t.hidden=true end
	group.args[strlower(label)]=t
	lib.toggles[self][method]=t
	return t
end

function lib:AddPrivateAction(method,name,description)
	return self:AddAction(method,name,description,true)
end
function lib:AddKeyBinding(flag,name,description)
	name=name or strlower(name)
	description=description or name
	local group=getgroup(self)
	local t={
		name=name,
		type="keybinding",
		get="OptToggleGet",
		set="OptToggleSet",
		desc=description,
		arg=flag,
		order=getorder(self,group)
	}
	group.args[flag]=t
	lib.toggles[self][flag]=t
	return t
end
function lib:AddTable(flag,table)
	local group=getgroup(self)
	group.args[flag]=table
	lib.toggles[self][flag]=table
end
local function OpenCmd(self,info,args)
	return self[info.arg](self,args,strsplit(' ',args))
end
function lib:AddOpenCmd(command,method,description,arguments,private)
	method=method or command
	description=description or command
	local group=getgroup(self)
	if (not private) then
		local command=C('/' .. lib.options[self].ID .. ' ' .. command .. " (" .. description .. ")" ,'orange')
		local t={
			name=command,
			type="description",
			order=getorder(self,group),
			fontSize='medium',
			width='full'
		}
		group.args[command .. 'title']=t
	end
	local t={
		name=command,
		type="input",
		arg=method,
		get=function(...) end,
		set=function(...) return OpenCmd(self,...) end,
		desc=description,
		order=getorder(self,group),
		guiHidden=true,
		hidden=private
	}
	if (type(arguments)=="table") then
		local validate={}
		for _,v in pairs(arguments) do
			validate[v]=v
		end
		t.values=validate
		t.type="select"
	end
	self.OptionsTable.args[command]=t

	return t
end
function lib:AddPrivateOpenCmd(command,method,description,arguments)
	return self:AddOpenCmd(command,method,description,arguments,true)
end
function lib:GetVarInfo(flag)
	return lib.toggles[self][flag]
end

--self:AddSubCmd(flagname,method,label,description)
function lib:AddSubCmd(flag,method,name,description,input)
	method=method or flag
	name=name or flag
	description=description or name
	local group=getgroup(self)
	debug("AddSubCmd " .. flag .. " for " .. method)
	local t={
		func=method,
		name=name,
		type="execute",
		input=input,
		desc=description,
		confirm=true,
		order=getorder(self,group),
		guiHidden=true,
	}
	group.args[flag]=t
	return t
end



--self:AddChatCmd(method,label,description)
function lib:AddChatCmd(method,label,description)
	if (not self.RegisterChatCommand) then
		LibStub("AceConsole-3.0"):Embed(self)
	end
	label=label or method
	self:RegisterChatCommand(label,method)
	description=description or label

	local group=getgroup(self)
	local t={
			name=C('/' .. label ..  " (" .. description .. ")",'orange'),
			type="description",
			order=getorder(self,group),
			fontSize="medium",
			width="full"
	}
	group.args[label .. 'title']=t
	return t
end

--self:AddSeparator(text)

function lib:AddSeparator(text)
	local group=getgroup(self)
	local i=getorder(self,group)
	local flag=group.name .. i
	flag=flag:gsub('%W','')
	local t={
			name=text,
			type="header",
			order=i,
	}
	group.args[flag]=t
	return t
end

function lib:OnEmbedEnable(first)
end

function lib:OnEmbedDisable()
end


function lib:OnEnable()
	if (self.OnEnabled) then
		if (not self.db.global.silent) then
			self:Print(C(VIDEO_OPTIONS_ENABLED,"green"))
		end
		pcall(self.OnEnabled,self,lib.options[self].first)
		lib.options[self].first=nil
	end
end
function lib:OnDisable(...)
	if (self.OnDisabled) then
		if (not self.db.global.silent) then
			self.print(C(VIDEO_OPTIONS_DISABLED,'red'))
		end
		pcall(self.OnDisabled,self,...)
	end
end
local function _GetMethod(target,prefix,func)
	if (func == 'Start' or func == 'Stop') then return end
	local method=prefix .. func
	if (type(target[method])== "function") then
			return method
	elseif (type(target["_" .. prefix])) then
			return "_" .. prefix
	end
end
function lib:StartAutomaticEvents()
	for k,v in pairs(self) do
		if (type(v)=='function') then
			if (k:sub(1,3)=='Evt') then
				self:RegisterEvent(k:sub(4),k)
			end
		end
	end
end
function lib:StopAutomaticEvents(ignore)
	for k,v in pairs(self) do
		if (type(v)=='function') then
			if (k:sub(1,3)=='Evt') then
				if (ignore and k==ignore or k:sub(4)==ignore) then
					--a kickstart event not to be disabled
				else
					self:UnregisterEvent(k:sub(4))
				end
			end
		end
	end
end
function lib:Dprint(...)
end
function lib:Notify(...)
	return self:CustomPrint(C.orange.r,C.orange.g,C.orange.b, nil, nil, ' ', ...)
end
function lib:Debug()
	self.DebugOn=not self.DebugOn
	self:Print("Debug:",self.DebugOn and on or off)
	if self.DebugOn then
		self.Dprint=dprint
	else
		self.Dprint=nop
	end
end

function lib:Colorize(stringa,colore)
	return C(stringa,colore) .. "|r"
end
function lib:GetTocVersion()
	return select(4,GetBuildInfo())
end
function lib:Toggle()
	if (self:IsEnabled()) then
		self:Disable()
	else
		self:Enable()
	end
end
function lib:Vars()
	return pairs(self.db.profile.toggles)
end
function lib:SetBoolean(flag,value)
	if (value) then
		value=true
	else
		value=false
	end
	self.db.profile.toggles[flag]=value
	return not value
end
function lib:GetBoolean(flag)
	if (self.db.profile.toggles[flag]) then
		return true
	else
		return false
	end
end
lib.GetToggle=lib.GetBoolean -- alias
function lib:GetNumber(flag,default)
	return tonumber(self:GetSet(flag) or default or 0)
end
function lib:GetString(flag,default)
	return tostring(self:GetSet(flag) or default or '')
end

function lib:PrintBoolean(flag)
	if (type(flag) == "string") then
		flag=self:GetBoolean(flag)
	end
	if (flag) then
		return on
	else
		return off
	end
end
function lib:GetSet(...)
	local flag,value=select(1,...)
	if (select('#',...) == 2) then
		self.db.profile.toggles[flag]=value
	else
		return self.db.profile.toggles[flag]
	end
end
function lib:GetIndexedVar(flag,index)
	local rc=GetVar(flag)
	if index and type(rc)=="table" then
		return rc[index]
	else
		return rc
	end

end
function lib:GetVar(flag)
	return self:GetSet(flag)
end
function lib:SetVar(flag,value)
	return self:GetSet(flag,value)
end
--- Simulates a configuration  variable change.
--
-- Generates Apply* events if needed
-- @tparam string flag Variable name
function lib:Trigger(flag)
	local info=self:GetVarInfo(flag)
	if (info) then
		local value=info.type=="toggle" and self:GetBoolean(flag) or self:GetVar(flag)
		self._Apply[flag](self,flag,value)
	end

end
function lib:OptToggleSet(info,value,extra)
	local flag=info.option.arg
	local tipo=info.option.type

	if (tipo=="toggle") then
		self:SetBoolean(flag,value)
	elseif (tipo=="multiselect") then
		self.db.profile.toggles[flag][value]=extra
	else
		self:GetSet(flag,value)
	end
	if (self:IsEnabled()) then
		self._Apply[flag](self,flag,value)
	end
end
function lib:OptToggleGet(info,extra)
	local flag=info.option.arg
	local tipo=info.option.type
	if (tipo=="toggle") then
		return self:GetBoolean(flag)
	elseif (tipo=="multiselect") then
		if type(self.db.profile.toggles[flag])~="table" then
			self.db.profile.toggles[flag]={}
		end
		return self.db.profile.toggles[flag][extra]
	else
		return self:GetSet(flag)
	end
end
function lib:ApplySettings()
	if (type(self.ApplyAll)=="function") then
		self:ApplyAll()
	else
		for i,v in self:Vars() do
			self._Apply[i](self,i,v)
		end
	end
end
local neveropened=true
function lib:Gui(info)
	if (AceConfigDialog and AceGUI) then
		if (neveropened) then
			InterfaceAddOnsList_Update()
			neveropened=false
		end
		InterfaceOptionsFrame_OpenToCategory(self.CfgDlg)
	else
		self:Print("No GUI available")
	end
end

function lib:Help(info)
	if (AceConfigDialog and AceGUI) then
		if (neveropened) then
			InterfaceAddOnsList_Update()
			neveropened=false
		end
		InterfaceOptionsFrame_OpenToCategory(self.CfgRel)
	else
		self:Print("No GUI available")
	end
end
function lib:Long(msg) C:OnScreen('Yellow',msg,20) end
function lib:Onscreen_Orange(msg) C:OnScreen('Orange',msg,2) end
function lib:Onscreen_Purple(msg) C:OnScreen('Purple',msg,8) end
function lib:Onscreen_Yellow(msg) C:OnScreen('Yellow',msg,1) end
function lib:Onscreen_Azure(msg) C:OnScreen('Azure',msg,1) end
function lib:Onscreen_Red(msg) C:OnScreen('Red',msg,1) end
function lib:Onscreen_Green(msg) C:OnScreen('Green',msg,1) end
function lib:OnScreen(color,...) C:OnScreen(color,strjoin(' ',tostringall(...))) end
function lib:TimeToStr(time) -- Converts time data to a string format
	local p,s,m,h;
	if (not time) then
		return ("0:00")
	end
	if (time < 0) then
		time=abs(time)
		p='-'
	else
		p=''
	end
	s = floor(mod(time, 60));
	m = floor(time/ 60);
	if (m > 59) then
		h=floor(m/60)
		m=floor(mod(m,60))
	end
	if (h) then
		return format("%s%d:%02d:%02d",p,h,m,s)
	else
		return format("%s%d:%02d",p,m,s)
	end
end

function lib:GetColorTable()
	return C
end
-- In case of upgrade, we need to redo embed for ALL Addons
-- This function get called on addon creation
-- Anything I define here is immediately available to addon code
function lib:Embed(target)
	-- All methods are pulled in via metatable in order to not pollute addon table
	local mt=getmetatable(target)
	if not mt then mt={__tostring=function(me) return me.name end} end
	mt.__index=lib.mixins
	setmetatable(target,mt)
	target._Apply=target._Apply or {}
	target._Apply._handler=target
	for k,v in pairs(self) do
		if type(v)=="string" or type(v)=="number" then pp (self,k,v) end
	end
	setmetatable(target._Apply,varmeta)
	lib.mixinTargets[target] = true
end

local function kpairs(t,f)
	local a = new()
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then
				del(a)
				return nil
		else
				local k=a[i]
				a[i]=nil -- Should optimize memory usage
				return k, t[k]
		end
	end
	return iter
end
if (not _G.kpairs) then
		_G.kpairs=kpairs
end
function lib:getKpairs()
	return kpairs
end
-- This metatable is used to generate a sorted proxy to an hashed table.
-- It should not used directly
lib.mt={__metatable=true,__version=MINOR_VERSION}
local mt=lib.mt
function mt:__index(k)
	if k=="n" then
		return #mt.keys[self.__source]
	end
	return self.__source[k]
end
function mt:__len()
	return #self.__keys
end
function mt:__newindex(k,v)
	local pos=#self.__keys+1
	for i,x in ipairs(self.__keys) do
		if x>k then
			pos=i
			break;
		end
	end
	if (k:sub(1,2)~="__") then
		table.insert(self.__keys,pos,k)
	end
	self.__source[k]=v -- We want to trigger metamethods on original table
end
function mt:__call()
	do
		local current=0
		return function(unsorted,i)
			current=current+1
			local k=self.__keys[current]
			if k then return k,self.__source[k] end
		end,self,0
	end
end
function lib:GetSortedProxy(table)
	local proxy=setmetatable({__keys={},__source=table,__metatable=true},mt)
	for k,v in pairs(table) do
		proxy[k]=v
	end
	return proxy
end

function lib:ScheduleLeaveCombatAction(method, ...)
	return self:OnLeaveCombat(method,...)
end

--- Generates and executes a coroutine with configurable interval and combat status
-- If called for already running coroutine changes the interval and the combat status
-- @tparam number interval between steps
-- @tparam string|function action To be executed, Can be a function or a method name
-- @tparam[opt] bool
--
function lib:coroutineExecute(interval,func,safeForCombat)
	if type(func)=="string" then
		func=self[func]
	end
	assert(type(func) =="function","coroutineExecute arg1 was not convertible to a function " .. tostring(func))
	local c=lib.coroutines[func]
	c.combatSafe=safeForCombat
	c.interval=interval
	c.obj=self
	if type(c.co)=="thread" and coroutine.status(c.co)=="suspended" then print("Already running",func) return end
	c.co=coroutine.create(func)
	c.paused=false
	c.repeater=function()
		if not c.combatSafe and InCombatLockdown() then
			c.waiting=true
			return
		end
		if c.paused then return end
		local rc,res=pcall(coroutine.resume,c.co,c.obj)
		if rc and res then
			C_Timer.After(c.interval,c.repeater)
		else
			c=nil
		end
	end
	c.repeater()
	return c
end
function lib:coroutinePause(func)
	if type(func)=="string" then
		func=self[func]
	end
	local co=rawget(lib.coroutines,func)
	if co then
		co.paused=true
	end
end
function lib:coroutineRestart(func)
	if type(func)=="string" then
		func=self[func]
	end
	local co=rawget(lib.coroutines,func)
	if co then
		co.paused=false
		pcall(co.repeater)
	end
end
if not lib.secureframe then
	lib.secureframe=CreateFrame("Button",nil,nil,"StaticPopupButtonTemplate,SecureActionButtonTemplate")
	lib.secureframe:Hide()
end
local function StopSpellCasting(this)
	local b2=_G[this:GetName().."Button2"]
	local AC=lib.secureframe
	AC:SetParent(b2)
	AC:SetAllPoints()
	AC:SetText(b2:GetText())
	AC:SetAttribute("type","stop")
	AC:SetScript("PostClick",function() b2:Click() end)
	AC:Show()
end
local function StopSpellCastingCleanup(this)
	local AC=lib.secureframe
	AC:SetParent(nil)
	AC:Hide()

end
local StaticPopupDialogs=StaticPopupDialogs
local StaticPopup_Show=StaticPopup_Show
--- Show a popup
-- Display a popup message with Accept and optionally Cance button
-- @tparam string msg Message to be shown
-- @tparam[opt] number timeout In seconds, if omitted assumes 60
-- @tparam[opt] func OnAccept Executed when clicked on Accept
-- @tparam[opt] func OnCancel Executed when clicked on Cancel (if nill, Cancel button is not shown)
-- @tparam[opt] mixed data Passed to the callbacl function
-- @tparam[opt] bool StopCasting If true, when the popup appear will stop any running casting.
-- Useful to ask confirmation before performing a programmatic initiated spellcasting
function lib:Popup(msg,timeout,OnAccept,OnCancel,data,StopCasting)
	if InCombatLockdown() then
		return self:ScheduleLeaveCombatAction("Popup",msg,timeout,OnAccept,OnCancel,data,StopCasting)
	end
	msg=msg or "Something strange happened"
	if type(timeout)=="function" then
		StopCasting=data
		data=OnCancel
		OnAccept=timeout
		timeout=60
	end
	StaticPopupDialogs["LIBINIT_POPUP"] = StaticPopupDialogs["LIBINIT_POPUP"] or
	{
	text = msg,
	showAlert = true,
	timeout = timeout or 60,
	exclusive = true,
	whileDead = true,
	interruptCinematic = true
	};
	local popup=StaticPopupDialogs["LIBINIT_POPUP"]
	if StopCasting then
		popup.OnShow=StopSpellCasting
		popup.OnHide=StopSpellCastingCleanup
	else
		popup.OnShow=nil
		popup.OnHide=nil
	end
	popup.text=msg
	popup.OnCancel=nil
	popup.OnAccept=OnAccept
	popup.button1=ACCEPT
	popup.button2=nil
	if (OnCancel) then
		if (type(OnCancel)=="function") then
			popup.OnCancel=OnCancel
		end
		popup.button2 = CANCEL
	else
		popup.button1=OKAY
	end
	StaticPopup_Show("LIBINIT_POPUP",nil,nil,data);
end
-- Interface widgets
local factory={} --#factory
do
	local nonce=0
	local GetTime=GetTime
	local function SetScript(this,...)
		this.child:SetScript(...)
	end
	local function SetStep(this,value)
		this:SetObeyStepOnDrag(true)
		this:SetValueStep(value)
		this:SetStepsPerPage(1)
	end
	function factory:Slider(father,min,max,current,message,tooltip)
		if type(message)=="table" then
			tooltip=message.desc
			message=message.name
		end
		local name=tostring(GetTime()*1000) ..nonce
		nonce=nonce+1
		local sl = CreateFrame('Slider',name, father, 'OptionsSliderTemplate')
		sl:SetWidth(128)
		sl:SetHeight(20)
		sl:SetOrientation('HORIZONTAL')
		sl:SetMinMaxValues(min, max)
		sl:SetValue(current)
		sl.SetStep=SetStep
		sl.Low=_G[name ..'Low']
		sl.Low:SetText(min)
		sl.High=_G[name .. 'High']
		sl.High:SetText(max)
		sl.Text=_G[name.. 'Text']
		sl.Text:SetText(message)
		sl.OnValueChanged=function(this,value)
			if (not this.unrounded) then
				value = math.floor(value)
			end
			if (this.isPercent) then
				this.Text:SetFormattedText('%d%%',value)
			else
				this.Text:SetText(value)
			end
			return value
		end
		sl.SetText=function(this,value) this.Text:SetText(value) end
		sl.SetFormattedText=function(this,...) this.Text:SetFormattedText(...) end
		sl.SetTextColor=function(this,...) this.Text:SetTextColor(...) end
		sl:SetScript("OnValueChanged",sl.OnValueChanged)
		sl.tooltipText=tooltip
		return sl
	end
	function factory:Checkbox(father,current,message,tooltip)
		if type(message)=="table" then
			tooltip=message.desc
			message=message.name
		end
		local name=tostring(GetTime()*1000) ..nonce
		nonce=nonce+1
		local frame=CreateFrame("Frame",nil,father)
		local ck=CreateFrame("CheckButton",name,frame,"ChatConfigCheckButtonTemplate")
		frame.SetScript=SetScript
		frame.child=ck
		ck:SetPoint('TOPLEFT')
		ck.Text=_G[name..'Text']
		ck.Text:SetText(message)
		ck:SetChecked(current)
		ck.tooltip=tooltip
		frame:SetWidth(ck:GetWidth()+ck.Text:GetWidth()+2)
		frame:SetHeight(ck:GetHeight())
		return frame
	end
	function factory:Dropdown(father,current,list,message,tooltip)
		if type(message)=="table" then
			tooltip=message.desc
			message=message.name
		end
		do
		local dd=CreateFrame("Frame",nil,father)
		if (tooltip) then
			dd.tooltip=tooltip
			dd:SetScript("OnEnter",function(self)
					GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
					GameTooltip:SetText(self.tooltip, nil, nil, nil, nil, (self.tooltipStyle or true));
				end
			)
		end
		dd:SetScript("OnLeave",function() GameTooltip:Hide() end)
		dd.text=dd:CreateFontString(nil,"ARTWORK","GameFontHighlight")
		function dd:SetText(...)
			self.text:SetText(...)
		end
		function dd:SetFormattedText(...)
			self.text:SetFormattedText(...)
		end
		function dd:SetTextColor(...)
			self.text:SetTextColor(...)
		end
		function dd:OnChange() end
		function dd:OnValueChanged(this,index,value)
			value=value or index
			UIDropDownMenu_SetSelectedID(dd,index)
			return self:OnChange(value)
		end
		function dd:SetOnChange(func)
			self.OnChange=func
		end
		dd.list=list
		local name=tostring(GetTime()*1000) ..nonce
		nonce=nonce+1
		dd.dropdown=CreateFrame('Frame',name,father,"UIDropDownMenuTemplate")
		UIDropDownMenu_Initialize(dd, function(...)
			local i=0
			for k,v in pairs(dd.list) do
				i=i+1
				local info=UIDropDownMenu_CreateInfo()
				info.text=v
				info.value=v
				info.func=function(...) return dd:OnValueChanged(...) end
				info.arg1=i
				info.arg2=v
				UIDropDownMenu_AddButton(info,1)
			end
		end)
		UIDropDownMenu_SetWidth(dd, 100);
		UIDropDownMenu_SetButtonWidth(dd, 124)
		UIDropDownMenu_SetSelectedID(dd, 1)
		UIDropDownMenu_JustifyText(dd, "LEFT")
		end
	end
end
function lib:GetFactory()
	return factory
end
local meta={__index=_G,
__newindex=function(t,k,v)
	assert(type(_G[k]) == 'nil',"Attempting to override global " ..k)
	return rawset(t,k,v)
end
}
function lib:SetCustomEnvironment(new_env)
	local old_env = getfenv(2)
	if old_env==new_env then return end
	if getmetatable(new_env)==meta then return end
	if not getmetatable(new_env) then
		if not new_env.print then new_env.print=dprint end
		setmetatable(new_env,meta)
		new_env.dprint=dprint
	else
		assert(false,"new_env already has metatable")
	end
	setfenv(2, new_env)
end
--- reembed routine
-- Prepares the mixins table
lib.mixins=lib.mixins or {}
wipe(lib.mixins)
for name,method in pairs(lib) do
	if type(method)=="function" and name~="NewAddon" and name~="GetAddon" and name:sub(1,1)~="_" then
		lib.mixins[name] = method
	end
end
for target,_ in pairs(lib.mixinTargets) do
	lib:Embed(target)
end
local l=AceLocale
if not l then
	L=setmetatable({},{
		__index=function(t,k) return k end
	})
	return
end
-- To avoid clash between versions, localization is versioned on major and minor
-- Lua strings are immutable so having more copies of the same string does not waist a noticeable slice of memory
local me=MAJOR_VERSION .. MINOR_VERSION
--@do-not-package@
-- Actual translations for test purpose
-- This part will NOT be packaged at all
do
	local L=l:NewLocale(me,"enUS",true,true)
	L["Configuration"] = "Configuration"
	L["Description"] = "Description"
	L["Libraries"] = "Libraries"
	L["Purge1"] = "Delete unused profiles"
	L["Purge2"] = "Deletes all profiles that are not used by a character"
	L["Purge_Desc"] = "You can delete all unused profiles with just one click"
	L["Release Notes"] = "Release Notes"
	L["Toggles"] = "Toggles"
	L["UseDefault1"] = "Switch all characters to \"%s\" profile"
	L["UseDefault2"] = "Uses the \"%s\" profiles for all your toons"
	L["UseDefault_Desc"] = "You can force all your characters to use the \"%s\" profile in order to manage a single configuration"
	L=l:NewLocale(me,"ptBR")
	if (L) then
	L["Configuration"] = "configura\195\167\195\163o"
	L["Description"] = "Descri\195\167\195\163o"
	L["Libraries"] = "bibliotecas"
	L["Release Notes"] = "Notas de Lan\195\167amento"
	L["Toggles"] = "Alterna"
	end
	L=l:NewLocale(me,"frFR")
	if (L) then
	L["Configuration"] = "configuration"
	L["Description"] = "description"
	L["Libraries"] = "biblioth\195\168ques"
	L["Release Notes"] = "notes de version"
	L["Toggles"] = "Bascule"
	end
	L=l:NewLocale(me,"deDE")
	if (L) then
	L["Configuration"] = "Konfiguration"
	L["Description"] = "Beschreibung"
	L["Libraries"] = "Bibliotheken"
	L["Release Notes"] = "Release Notes"
	L["Toggles"] = "Schaltet"
	end
	L=l:NewLocale(me,"koKR")
	if (L) then
	L["Configuration"] = "\234\181\172\236\132\177"
	L["Description"] = "\236\132\164\235\170\133"
	L["Libraries"] = "\235\157\188\236\157\180\235\184\140\235\159\172\235\166\172"
	L["Release Notes"] = "\235\166\180\235\166\172\236\138\164 \235\133\184\237\138\184"
	L["Toggles"] = "\236\160\132\237\153\152"
	end
	L=l:NewLocale(me,"esMX")
	if (L) then
	L["Configuration"] = "Configuraci\195\179n"
	L["Description"] = "Descripci\195\179n"
	L["Libraries"] = "Bibliotecas"
	L["Release Notes"] = "Notas de la versi\195\179n"
	L["Toggles"] = "Alterna"
	end
	L=l:NewLocale(me,"ruRU")
	if (L) then
	L["Configuration"] = "\208\154\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\209\143"
	L["Description"] = "\208\158\208\191\208\184\209\129\208\176\208\189\208\184\208\181"
	L["Libraries"] = "\208\145\208\184\208\177\208\187\208\184\208\190\209\130\208\181\208\186\208\184"
	L["Release Notes"] = "\208\159\209\128\208\184\208\188\208\181\209\135\208\176\208\189\208\184\209\143 \208\186 \208\178\209\139\208\191\209\131\209\129\208\186\209\131"
	L["Toggles"] = "\208\159\208\181\209\128\208\181\208\186\208\187\209\142\209\135\208\181\208\189\208\184\208\181"
	end
	L=l:NewLocale(me,"zhCN")
	if (L) then
	L["Configuration"] = "\233\133\141\231\189\174"
	L["Description"] = "\232\175\180\230\152\142"
	L["Libraries"] = "\229\155\190\228\185\166\233\166\134"
	L["Release Notes"] = "\229\143\145\232\161\140\232\175\180\230\152\142"
	L["Toggles"] = "\229\136\135\230\141\162"
	end
	L=l:NewLocale(me,"esES")
	if (L) then
	L["Configuration"] = "Configuraci\195\179n"
	L["Description"] = "Descripci\195\179n"
	L["Libraries"] = "Bibliotecas"
	L["Release Notes"] = "Notas de la versi\195\179n"
	L["Toggles"] = "Alterna"
	end
	L=l:NewLocale(me,"zhTW")
	if (L) then
	L["Configuration"] = "設定"
	L["Description"] = "說明"
	L["Libraries"] = "函式庫"
	L["Purge1"] = "刪除未使用的設定檔"
	L["Purge2"] = "刪除所有未被任何一個角色使用的設定檔"
	L["Purge_Desc"] = "點一下便可刪除所有未使用的設定檔"
	L["Release Notes"] = "說明"
	L["Toggles"] = "切換"
	L["UseDefault1"] = "所有角色都切換成使用 \"%s\" 設定檔"
	L["UseDefault2"] = "所有分身都用 \"%s\" 設定檔"
	L["UseDefault_Desc"] = "強制讓你的所有角色都使用 \"%s\" 設定檔，以方便統一管理單一設定。"
	end
	L=l:NewLocale(me,"itIT")
	if (L) then
	L["Configuration"] = "Configurazione"
	L["Description"] = "Descrizione"
	L["Libraries"] = "Librerie"
	L["Purge1"] = "Cancella i profili inutilizzati"
	L["Purge2"] = "Cancella tutti i profili che non sono usati da un personaggio"
	L["Purge_Desc"] = "Puoi cancellare tutti i profili inutilizzati con un singolo click"
	L["Release Notes"] = "Note di rilascio"
	L["Toggles"] = "Interruttori"
	L["UseDefault1"] = "Imposta il profilo \"%s\" su tutti i personaggi"
	L["UseDefault2"] = "Usa il profilo '%s\" per tutti i personaggi"
	L["UseDefault_Desc"] = "Puoi far usare a tutti i tuoi personaggi il profilo \"%s\""
	end
end
L=LibStub("AceLocale-3.0"):GetLocale(me,true)
if true then return end
--@end-do-not-package@
do
	local L=l:NewLocale(me,"enUS",true,true)
L["Appearance"] = true
L["Assume Buckle on waist"] = true
L["Bottom Left"] = true
L["Bottom Right"] = true
L["Change colors and appearance"] = true
L["Choose a color scheme"] = true
L["Choose profile"] = true
L["Choose what is shown"] = true
L["Colorize level text by"] = true
L["Common profile for all characters"] = true
L["Current profile is: "] = true
L["Debug info"] = true
L["E"] = true
L["Gem frame position"] = true
L["itemlevel (green best)"] = true
L["itemlevel (red best)"] = true
L["Level text aligned to"] = true
L["none (plain white)"] = true
L["Options"] = true
L["Per character profile"] = true
L["Please, choose between global or per character profile"] = true
L["Position"] = true
L["quality"] = true
L["Show raw item info.Please post the screenshot to Curse Forum"] = true
L["Shows missing enchants"] = true
L["Shows number of empty socket"] = true
L["Shows total number of gems"] = true
L["Switch between global and per character profile"] = true
L["Top Left"] = true
L["Top Right"] = true
L["Total compatible gems/Total sockets"] = true
L["You can change this decision on a per character basis in configuration panel."] = true
L["You can now choose if you want all your character share the same configuration or not."] = true
	L=l:NewLocale(me,"ptBR")
	if (L) then
L["Appearance"] = "apar\\234ncia"
L["Assume Buckle on waist"] = "Suponha Curvatura na cintura"
L["Bottom Left"] = "inferior Esquerda"
L["Bottom Right"] = "inferior direito"
L["Change colors and appearance"] = "Mude cores e apar\\234ncia"
L["Choose a color scheme"] = "Escolha um esquema de cores"
L["Choose profile"] = "Escolha perfil"
L["Choose what is shown"] = "Escolha o que \\233 mostrado"
L["Colorize level text by"] = "Colorize texto de n\\237vel por"
L["Common profile for all characters"] = "Perfil comum para todos os caracteres"
L["Current profile is: "] = "Perfil atual \\233:"
L["Debug info"] = "informa\\231\\245es de depura\\231\\227o"
L["E"] = true
L["Gem frame position"] = "Gem posi\\231\\227o do quadro"
L["itemlevel (green best)"] = "itemlevel (verde mais)"
L["itemlevel (red best)"] = "itemlevel (vermelha melhor)"
L["Level text aligned to"] = "N\\237vel texto alinhado \\224"
L["none (plain white)"] = "nenhum (branco liso)"
L["Options"] = "op\\231\\245es"
L["Per character profile"] = "Por perfil do personagem"
L["Please, choose between global or per character profile"] = "Por favor, escolha entre o global ou por perfil de personagem"
L["Position"] = "posi\\231\\227o"
L["quality"] = "qualidade"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Mostrar item de mat\\233ria-info.Please postar a imagem para amaldi\\231oar Forum"
L["Shows missing enchants"] = "Mostra encanta desaparecidas"
L["Shows number of empty socket"] = "Mostra o n\\250mero de soquete vazio"
L["Shows total number of gems"] = "Mostra o n\\250mero total de gemas"
L["Switch between global and per character profile"] = "Alternar entre global e por perfil de personagem"
L["Top Left"] = "Top Esquerda"
L["Top Right"] = true
L["Total compatible gems/Total sockets"] = "Total de gemas compat\\237veis / Total soquetes"
L["You can change this decision on a per character basis in configuration panel."] = "Voc\\234 pode alterar essa decis\\227o com base no painel de configura\\231\\227o por personagem."
L["You can now choose if you want all your character share the same configuration or not."] = "Agora voc\\234 pode escolher se voc\\234 quer toda a sua quota de car\\225ter a mesma configura\\231\\227o ou n\\227o."
	end
	L=l:NewLocale(me,"frFR")
	if (L) then
L["Appearance"] = "apparition"
L["Assume Buckle on waist"] = "Supposons Boucle sur la taille"
L["Bottom Left"] = "En bas \\224 gauche"
L["Bottom Right"] = "En bas \\224 droite"
L["Change colors and appearance"] = "Changer les couleurs et l'apparence"
L["Choose a color scheme"] = "Choisissez un jeu de couleurs"
L["Choose profile"] = "Choisissez profil"
L["Choose what is shown"] = "Choisissez ce qui est montr\\233"
L["Colorize level text by"] = "Colorier texte de niveau par"
L["Common profile for all characters"] = "Profil commun pour tous les caract\\232res"
L["Current profile is: "] = "Profil actuel est:"
L["Debug info"] = "informations de d\\233bogage"
L["E"] = true
L["Gem frame position"] = "Position du cadre Gem"
L["itemlevel (green best)"] = "itemlevel (vert meilleur)"
L["itemlevel (red best)"] = "itemlevel (rouge meilleur)"
L["Level text aligned to"] = "Niveau de texte align\\233 \\224"
L["none (plain white)"] = "aucune (de couleur blanche)"
L["Options"] = "options de"
L["Per character profile"] = "Par profil des personnages"
L["Please, choose between global or per character profile"] = "S'il vous pla\\238t, choisir entre global ou par fiche de personnage"
L["Position"] = "position"
L["quality"] = "qualit\\233"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Voir l'article brut info.Please poster la capture d'\\233cran pour maudire Forum"
L["Shows missing enchants"] = "Affiche enchante manquantes"
L["Shows number of empty socket"] = "Affiche le num\\233ro de vide prise"
L["Shows total number of gems"] = "Affiche le nombre total de gemmes"
L["Switch between global and per character profile"] = "Basculer entre global et par profil de personnage"
L["Top Left"] = "En haut \\224 gauche"
L["Top Right"] = "En haut \\224 droite"
L["Total compatible gems/Total sockets"] = "Total des gemmes compatibles / Total prises"
L["You can change this decision on a per character basis in configuration panel."] = "Vous pouvez modifier cette d\\233cision sur une base par caract\\232re dans le panneau de configuration."
L["You can now choose if you want all your character share the same configuration or not."] = "Vous pouvez maintenant choisir si vous voulez que tous vos parts de caract\\232re la m\\234me configuration ou pas."
	end
	L=l:NewLocale(me,"deDE")
	if (L) then
L["Appearance"] = "Aussehen"
L["Assume Buckle on waist"] = "Angenommen, Schnalle an der Taille"
L["Bottom Left"] = "Unten links"
L["Bottom Right"] = "Unten rechts"
L["Change colors and appearance"] = "Farben und Aussehen \\228ndern"
L["Choose a color scheme"] = "W\\228hle ein Farbschema"
L["Choose profile"] = "W\\228hle ein Profil"
L["Choose what is shown"] = "W\\228hle, was gezeigt wird"
L["Colorize level text by"] = "Stufentext f\\228rben nach"
L["Common profile for all characters"] = "Gemeinsames Profil f\\252r alle Charaktere"
L["Current profile is: "] = "Aktuelles Profil:"
L["Debug info"] = "Debug-Informationen"
L["E"] = true
L["Gem frame position"] = "Edelst.-Rahmenposition"
L["itemlevel (green best)"] = "Gegenstandsstufe (gr\\252n am besten)"
L["itemlevel (red best)"] = "Gegenstandsstufe (rot am besten)"
L["Level text aligned to"] = "Stufentext ausgerichtet an"
L["none (plain white)"] = "keine (einfache wei\\223e)"
L["Options"] = "Optionen"
L["Per character profile"] = "Profil pro Charakter"
L["Please, choose between global or per character profile"] = "Bitte w\\228hle zwischen globalem und charakterspezifischem Profil"
L["Position"] = true
L["quality"] = "Qualit\\228t"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Zeige unbearbeitete Gegenstandsinfo. Bitte poste den Screenshot im Curse-Forum"
L["Shows missing enchants"] = "Zeigt fehlende Verzauberungen"
L["Shows number of empty socket"] = "Zeigt die Anzahl der leeren Sockel"
L["Shows total number of gems"] = "Zeigt Gesamtzahl der Edelsteine"
L["Switch between global and per character profile"] = "Zwischen globalem und charakterspezifischem Profil wechseln"
L["Top Left"] = "Oben links"
L["Top Right"] = "Oben rechts"
L["Total compatible gems/Total sockets"] = "Alle kompatiblen Edelsteine \\8203\\8203/ Gesamtsockel"
L["You can change this decision on a per character basis in configuration panel."] = "Sie k\\246nnen diese Entscheidung pro Charakter im Konfigurationsmen\\252 \\228ndern."
L["You can now choose if you want all your character share the same configuration or not."] = "Sie k\\246nnen nun w\\228hlen, ob all Ihre Charaktere die gleichen Konfiguration verwenden oder nicht."
	end
	L=l:NewLocale(me,"itIT")
	if (L) then
L["Appearance"] = "Aspetto"
L["Assume Buckle on waist"] = "Considera che la cintura abbia una borchia"
L["Bottom Left"] = "In basso a sinistra"
L["Bottom Right"] = "In basso a destra"
L["Change colors and appearance"] = "Cambia colori e aspetto"
L["Choose a color scheme"] = "Scegli uno schema colori"
L["Choose profile"] = "Scegli un profilo"
L["Choose what is shown"] = "Scegli le informazioni mostrate"
L["Colorize level text by"] = "Colora le informazioni sul livello in base a"
L["Common profile for all characters"] = "Profilo unico per tutti i personaggi"
L["Current profile is: "] = "Il profilo corrente \\232:"
L["Debug info"] = "Stampa informazioni per il debug"
L["E"] = true
L["Gem frame position"] = "Posizione delle informazioni sulle gemme"
L["itemlevel (green best)"] = "itemlevel (in verde i migliori)"
L["itemlevel (red best)"] = "itemlevel (in rosso i migliori)"
L["Level text aligned to"] = "Posizione del livello nello slot"
L["none (plain white)"] = "nessun colore"
L["Options"] = "Opzioni"
L["Per character profile"] = "Profilo specifico per personaggio"
L["Please, choose between global or per character profile"] = "Per favore, scegli fra usare un profilo globale o uno specifico del personaggio"
L["Position"] = "Posizione"
L["quality"] = "qualit\\224"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Mostra le informazioni grezze sugli oggetti, per favore posta questo screenshot nel forum di Curse"
L["Shows missing enchants"] = "Segnala dove mancano incantamenti"
L["Shows number of empty socket"] = "Mostra il numero di incavi vuoti"
L["Shows total number of gems"] = "Mostra il numero totale delle gemme"
L["Switch between global and per character profile"] = "Passa da profilo globale a profilo per personaggio e viceversa"
L["Top Left"] = "In alto a sinistra"
L["Top Right"] = "In alto a destra"
L["Total compatible gems/Total sockets"] = "Numero gemme compatibili/Numero incavi"
L["You can change this decision on a per character basis in configuration panel."] = "Potrai cambiare questa decisone dal pannello di configurazione"
L["You can now choose if you want all your character share the same configuration or not."] = "Adesso \\232 possibile scegliere fra una configurazione globale e uno specifica per personaggio"
	end
	L=l:NewLocale(me,"koKR")
	if (L) then
L["Appearance"] = "\\50808\\54805"
L["Assume Buckle on waist"] = "\\54728\\47532\\46944\\50640 \\51412\\49632 \\44032\\51221"
L["Bottom Left"] = "\\50812\\51901 \\50500\\47000"
L["Bottom Right"] = "\\50724\\47480\\51901 \\50500\\47000"
L["Change colors and appearance"] = "\\49353\\49345\\44284 \\50808\\54805 \\48320\\44221"
L["Choose a color scheme"] = "\\49353\\49345\\51012 \\49440\\53469"
L["Choose profile"] = "\\54532\\47196\\54596 \\49440\\53469"
L["Choose what is shown"] = "\\47924\\50631\\51012 \\54364\\49884\\54624\\51648 \\49440\\53469"
L["Colorize level text by"] = "\\47112\\48296 \\53581\\49828\\53944 \\49353\\49345 \\51077\\55176\\44592"
L["Common profile for all characters"] = "\\47784\\46304 \\52880\\47533\\53552\\50640 \\51068\\48152 \\54532\\47196\\54596 \\49324\\50857"
L["Current profile is: "] = "\\54788\\51116 \\54532\\47196\\54596\\51008 \\45796\\51020\\44284 \\44057\\49845\\45768\\45796:"
L["Debug info"] = "\\46356\\48260\\44536 \\51221\\48372"
L["E"] = true
L["Gem frame position"] = "\\48372\\49437 \\54532\\47112\\51076 \\50948\\52824"
L["itemlevel (green best)"] = "\\50500\\51060\\53596\\47112\\48296 (\\45433\\49353 \\52572\\49345)"
L["itemlevel (red best)"] = "\\50500\\51060\\53596\\47112\\48296 (\\51201\\49353 \\52572\\49345)"
L["Level text aligned to"] = "\\47112\\48296 \\53581\\49828\\53944 \\51221\\47148"
L["none (plain white)"] = "\\50630\\51020 (\\51068\\48152 \\55152\\49353)"
L["Options"] = "\\50741\\49496"
L["Per character profile"] = "\\52880\\47533\\53552 \\48324 \\54532\\47196\\54596"
L["Please, choose between global or per character profile"] = "\\51204\\50669 \\54532\\47196\\54596 \\46608\\45716 \\52880\\47533\\53552 \\48324 \\54532\\47196\\54596 \\51473 \\49440\\53469\\54644\\51452\\49464\\50836"
L["Position"] = "\\50948\\52824"
L["quality"] = "\\54408\\51656"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "\\48120\\51089\\46041 \\50500\\51060\\53596 \\51221\\48372 \\48372\\44592.Curse \\54252\\47100\\50640 \\49828\\53356\\47536\\49399\\51012 \\50732\\47140\\51452\\49464\\50836"
L["Shows missing enchants"] = "\\45572\\46973 \\46108 \\47560\\48277 \\48512\\50668\\47484 \\54364\\49884\\54633\\45768\\45796"
L["Shows number of empty socket"] = "\\48712 \\48372\\49437 \\54856\\51032 \\44079\\49688\\47484 \\54364\\49884\\54633\\45768\\45796"
L["Shows total number of gems"] = "\\48372\\49437\\51032 \\51204\\52404 \\44079\\49688 \\54364\\49884"
L["Switch between global and per character profile"] = "\\51204\\50669 \\54532\\47196\\54596\\44284 \\52880\\47533\\53552 \\48324 \\54532\\47196\\54596 \\48320\\44221\\54616\\44592"
L["Top Left"] = "\\50812\\51901 \\50948"
L["Top Right"] = "\\50724\\47480\\51901 \\50948"
L["Total compatible gems/Total sockets"] = "\\51204\\52404 \\54840\\54872 \\48372\\49437 / \\51204\\52404 \\48372\\49437\\54856"
L["You can change this decision on a per character basis in configuration panel."] = "\\52880\\47533\\53552 \\48324 \\49444\\51221 \\54056\\45328\\50640\\49436 \\51060 \\49444\\51221\\51012 \\48320\\44221\\54624 \\49688 \\51080\\49845\\45768\\45796."
L["You can now choose if you want all your character share the same configuration or not."] = "\\47784\\46304 \\52880\\47533\\53552\\44032 \\44057\\51008 \\49444\\51221\\51012 \\44277\\50976\\54624\\51648 \\49440\\53469\\54624 \\49688 \\51080\\49845\\45768\\45796."
	end
	L=l:NewLocale(me,"esMX")
	if (L) then
L["Appearance"] = "Apariencia"
L["Assume Buckle on waist"] = "Supongamos Hebilla en la cintura"
L["Bottom Left"] = "Abajo a la izquierda"
L["Bottom Right"] = "Abajo a la derecha"
L["Change colors and appearance"] = "Cambie los colores y la apariencia"
L["Choose a color scheme"] = "Elegir un esquema de color"
L["Choose profile"] = "Elija el perfil"
L["Choose what is shown"] = "Elija lo que se muestra"
L["Colorize level text by"] = "Colorear texto de nivel por"
L["Common profile for all characters"] = "Perfil com\\250n para todos los personajes"
L["Current profile is: "] = "Perfil actual es:"
L["Debug info"] = "info de depuraci\\243n"
L["E"] = true
L["Gem frame position"] = "Posici\\243n del marco de la gema"
L["itemlevel (green best)"] = "itemlevel (verde mejor)"
L["itemlevel (red best)"] = "itemlevel (rojo mejor)"
L["Level text aligned to"] = "Nivel texto alineado a"
L["none (plain white)"] = "ninguno (blanco normal)"
L["Options"] = "Opciones"
L["Per character profile"] = "Por perfil de personaje"
L["Please, choose between global or per character profile"] = "Por favor, elija entre lo global o por cada perfil de personaje"
L["Position"] = "posici\\243n"
L["quality"] = "calidad"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Mostrar elemento prima info.Please publicar la pantalla para maldecir Foro"
L["Shows missing enchants"] = "Muestra encantamientos desaparecidos"
L["Shows number of empty socket"] = "Muestra el n\\250mero de z\\243calo vac\\237o"
L["Shows total number of gems"] = "Muestra el n\\250mero total de gemas"
L["Switch between global and per character profile"] = "Cambie entre global y por perfil del personaje"
L["Top Left"] = "Arriba a la izquierda"
L["Top Right"] = "Arriba a la derecha"
L["Total compatible gems/Total sockets"] = "Total de gemas compatibles / sockets totales"
L["You can change this decision on a per character basis in configuration panel."] = "Usted puede cambiar esta decisi\\243n en funci\\243n de cada personaje en el panel de configuraci\\243n."
L["You can now choose if you want all your character share the same configuration or not."] = "Ahora puede elegir si desea que todo su parte el car\\225cter de la misma configuraci\\243n o no."
	end
	L=l:NewLocale(me,"ruRU")
	if (L) then
L["Appearance"] = "\\1042\\1085\\1077\\1096\\1085\\1080\\1081 \\1074\\1080\\1076"
L["Assume Buckle on waist"] = "\\1055\\1088\\1077\\1076\\1087\\1086\\1083\\1086\\1078\\1080\\1084, \\1055\\1088\\1103\\1078\\1082\\1072 \\1085\\1072 \\1090\\1072\\1083\\1080\\1080"
L["Bottom Left"] = "\\1042\\1085\\1080\\1079\\1091 \\1089\\1083\\1077\\1074\\1072"
L["Bottom Right"] = "\\1053\\1080\\1078\\1085\\1080\\1081 \\1087\\1088\\1072\\1074\\1099\\1081"
L["Change colors and appearance"] = "\\1048\\1079\\1084\\1077\\1085\\1077\\1085\\1080\\1077 \\1094\\1074\\1077\\1090\\1072 \\1080 \\1074\\1085\\1077\\1096\\1085\\1080\\1081 \\1074\\1080\\1076"
L["Choose a color scheme"] = "\\1042\\1099\\1073\\1077\\1088\\1080\\1090\\1077 \\1094\\1074\\1077\\1090\\1086\\1074\\1091\\1102 \\1089\\1093\\1077\\1084\\1091"
L["Choose profile"] = "\\1042\\1099\\1073\\1088\\1072\\1090\\1100 \\1087\\1088\\1086\\1092\\1080\\1083\\1100"
L["Choose what is shown"] = "\\1042\\1099\\1073\\1077\\1088\\1080\\1090\\1077 \\1090\\1086, \\1095\\1090\\1086 \\1087\\1086\\1082\\1072\\1079\\1072\\1085\\1086"
L["Colorize level text by"] = "\\1056\\1072\\1089\\1082\\1088\\1072\\1089\\1080\\1090\\1100 \\1090\\1077\\1082\\1089\\1090 \\1091\\1088\\1086\\1074\\1085\\1103 \\1087\\1086"
L["Common profile for all characters"] = "\\1054\\1073\\1097\\1080\\1077 \\1087\\1088\\1086\\1092\\1080\\1083\\1100 \\1076\\1083\\1103 \\1074\\1089\\1077\\1093 \\1087\\1077\\1088\\1089\\1086\\1085\\1072\\1078\\1077\\1081"
L["Current profile is: "] = "\\1058\\1077\\1082\\1091\\1097\\1080\\1081 \\1087\\1088\\1086\\1092\\1080\\1083\\1100:"
L["Debug info"] = "\\1080\\1085\\1092\\1086\\1088\\1084\\1072\\1094\\1080\\1103 Debug"
L["E"] = true
L["Gem frame position"] = "Gem \\1087\\1086\\1083\\1086\\1078\\1077\\1085\\1080\\1103 \\1088\\1072\\1084\\1082\\1080"
L["itemlevel (green best)"] = "itemlevel (\\1079\\1077\\1083\\1077\\1085\\1099\\1081 \\1083\\1091\\1095\\1096\\1077)"
L["itemlevel (red best)"] = "itemlevel (\\1082\\1088\\1072\\1089\\1085\\1099\\1081 \\1083\\1091\\1095\\1096\\1077)"
L["Level text aligned to"] = "\\1058\\1077\\1082\\1089\\1090 \\1059\\1088\\1086\\1074\\1077\\1085\\1100 \\1074\\1099\\1088\\1072\\1074\\1085\\1080\\1074\\1072\\1077\\1090\\1089\\1103"
L["none (plain white)"] = "\\1085\\1077\\1090 (\\1087\\1088\\1086\\1089\\1090\\1086\\1081 \\1073\\1077\\1083\\1099\\1081)"
L["Options"] = "\\1054\\1087\\1094\\1080\\1080"
L["Per character profile"] = "\\1047\\1072 \\1087\\1088\\1086\\1092\\1080\\1083\\1077 \\1087\\1077\\1088\\1089\\1086\\1085\\1072\\1078\\1072"
L["Please, choose between global or per character profile"] = "\\1055\\1086\\1078\\1072\\1083\\1091\\1081\\1089\\1090\\1072, \\1074\\1099\\1073\\1080\\1088\\1072\\1090\\1100 \\1084\\1077\\1078\\1076\\1091 \\1075\\1083\\1086\\1073\\1072\\1083\\1100\\1085\\1099\\1084\\1080 \\1080\\1083\\1080 \\1079\\1072 \\1087\\1088\\1086\\1092\\1080\\1083\\1077 \\1087\\1077\\1088\\1089\\1086\\1085\\1072\\1078\\1072"
L["Position"] = "\\1055\\1086\\1083\\1086\\1078\\1077\\1085\\1080\\1077"
L["quality"] = "\\1082\\1072\\1095\\1077\\1089\\1090\\1074\\1086"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "\\1055\\1086\\1082\\1072\\1079\\1072\\1090\\1100 \\1089\\1099\\1088\\1086\\1081 \\1087\\1091\\1085\\1082\\1090 info.Please \\1088\\1072\\1079\\1084\\1077\\1089\\1090\\1080\\1090\\1100 \\1089\\1082\\1088\\1080\\1085\\1096\\1086\\1090 \\1087\\1088\\1086\\1082\\1083\\1080\\1085\\1072\\1090\\1100 \\1092\\1086\\1088\\1091\\1084"
L["Shows missing enchants"] = "\\1055\\1086\\1082\\1072\\1079\\1099\\1074\\1072\\1090\\1100 \\1086\\1090\\1089\\1091\\1090\\1089\\1090\\1074\\1091\\1102\\1097\\1080\\1077 \\1086\\1095\\1072\\1088\\1086\\1074\\1099\\1074\\1072\\1077\\1090"
L["Shows number of empty socket"] = "\\1055\\1086\\1082\\1072\\1079\\1099\\1074\\1072\\1077\\1090 \\1082\\1086\\1083\\1080\\1095\\1077\\1089\\1090\\1074\\1086 \\1087\\1091\\1089\\1090\\1086\\1077 \\1075\\1085\\1077\\1079\\1076\\1086"
L["Shows total number of gems"] = "\\1055\\1086\\1082\\1072\\1079\\1099\\1074\\1072\\1077\\1090 \\1086\\1073\\1097\\1077\\1077 \\1082\\1086\\1083\\1080\\1095\\1077\\1089\\1090\\1074\\1086 \\1076\\1088\\1072\\1075\\1086\\1094\\1077\\1085\\1085\\1099\\1093 \\1082\\1072\\1084\\1085\\1077\\1081"
L["Switch between global and per character profile"] = "\\1055\\1077\\1088\\1077\\1082\\1083\\1102\\1095\\1077\\1085\\1080\\1077 \\1084\\1077\\1078\\1076\\1091 \\1075\\1083\\1086\\1073\\1072\\1083\\1100\\1085\\1099\\1084 \\1080 \\1079\\1072 \\1087\\1088\\1086\\1092\\1080\\1083\\1077 \\1087\\1077\\1088\\1089\\1086\\1085\\1072\\1078\\1072"
L["Top Left"] = "\\1042\\1074\\1077\\1088\\1093\\1091 \\1089\\1083\\1077\\1074\\1072"
L["Top Right"] = "\\1042\\1074\\1077\\1088\\1093\\1091 \\1089\\1087\\1088\\1072\\1074\\1072"
L["Total compatible gems/Total sockets"] = "\\1042\\1089\\1077\\1075\\1086 \\1089\\1086\\1074\\1084\\1077\\1089\\1090\\1080\\1084\\1099\\1077 \\1076\\1088\\1072\\1075\\1086\\1094\\1077\\1085\\1085\\1099\\1077 \\1082\\1072\\1084\\1085\\1080 / \\1042\\1089\\1077\\1075\\1086 \\1088\\1086\\1079\\1077\\1090\\1082\\1080"
L["You can change this decision on a per character basis in configuration panel."] = "\\1042\\1099 \\1084\\1086\\1078\\1077\\1090\\1077 \\1080\\1079\\1084\\1077\\1085\\1080\\1090\\1100 \\1101\\1090\\1086 \\1088\\1077\\1096\\1077\\1085\\1080\\1077 \\1085\\1072 \\1085\\1072 \\1089\\1080\\1084\\1074\\1086\\1083 \\1086\\1089\\1085\\1086\\1074\\1077 \\1074 \\1087\\1072\\1085\\1077\\1083\\1080 \\1082\\1086\\1085\\1092\\1080\\1075\\1091\\1088\\1072\\1094\\1080\\1080."
L["You can now choose if you want all your character share the same configuration or not."] = "\\1058\\1077\\1087\\1077\\1088\\1100 \\1074\\1099 \\1084\\1086\\1078\\1077\\1090\\1077 \\1074\\1099\\1073\\1088\\1072\\1090\\1100, \\1077\\1089\\1083\\1080 \\1074\\1099 \\1093\\1086\\1090\\1080\\1090\\1077, \\1095\\1090\\1086\\1073\\1099 \\1074\\1089\\1077 \\1089\\1074\\1086\\1102 \\1076\\1086\\1083\\1102 \\1093\\1072\\1088\\1072\\1082\\1090\\1077\\1088 \\1080 \\1090\\1091 \\1078\\1077 \\1082\\1086\\1085\\1092\\1080\\1075\\1091\\1088\\1072\\1094\\1080\\1102 \\1080\\1083\\1080 \\1085\\1077\\1090."
	end
	L=l:NewLocale(me,"zhCN")
	if (L) then
L["Appearance"] = "\\22806\\35266"
L["Assume Buckle on waist"] = "\\20551\\35774\\26377\\33136\\24102\\25187\\25554\\27133"
L["Bottom Left"] = "\\24038\\19979"
L["Bottom Right"] = "\\21491\\19979"
L["Change colors and appearance"] = "\\25913\\21464\\39068\\33394\\21450\\22806\\35266"
L["Choose a color scheme"] = "\\36873\\25321\\19968\\31181\\33394\\24425\\26041\\26696"
L["Choose profile"] = "\\36873\\25321\\37197\\32622\\25991\\20214"
L["Choose what is shown"] = "\\36873\\25321\\26174\\31034\\21738\\20123"
L["Colorize level text by"] = "\\31561\\32423\\25991\\23383\\30528\\33394\\25353\\29031"
L["Common profile for all characters"] = "\\25152\\26377\\35282\\33394\\20849\\29992\\37197\\32622"
L["Current profile is: "] = "\\24403\\21069\\37197\\32622\\25991\\20214\\65306"
L["Debug info"] = "\\35843\\35797\\20449\\24687"
L["E"] = true
L["Gem frame position"] = "\\23453\\30707\\32479\\35745\\31383\\21475\\20301\\32622"
L["itemlevel (green best)"] = "\\29289\\21697\\31561\\32423\\65288\\32511\\33394\\26368\\20339\\65289"
L["itemlevel (red best)"] = "\\29289\\21697\\31561\\32423\\65288\\32418\\33394\\26368\\20339\\65289"
L["Level text aligned to"] = "\\25991\\26412\\27700\\24179\\23545\\40784"
L["none (plain white)"] = "\\26080\\65288\\32431\\30333\\33394\\65289"
L["Options"] = "\\36873\\39033"
L["Per character profile"] = "\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Please, choose between global or per character profile"] = "\\35831\\36873\\25321\\20351\\29992\\20840\\23616\\20844\\29992\\37197\\32622\\25110\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Position"] = "\\20301\\32622"
L["quality"] = "\\21697\\36136"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "\\26174\\31034\\21407\\22987\\29289\\21697\\20449\\24687. \\35831\\25552\\20132\\25130\\22270\\21040Curse\\35770\\22363"
L["Shows missing enchants"] = "\\26174\\31034\\20002\\22833\\30340\\38468\\39764"
L["Shows number of empty socket"] = "\\26174\\31034\\31354\\30340\\25554\\27133\\25968"
L["Shows total number of gems"] = "\\26174\\31034\\23453\\30707\\24635\\25968"
L["Switch between global and per character profile"] = "\\20999\\25442\\20351\\29992\\20840\\23616\\20844\\29992\\37197\\32622\\25110\\27599\\20010\\35282\\33394\\29420\\31435\\37197\\32622"
L["Top Left"] = "\\24038\\19978"
L["Top Right"] = "\\21491\\19978"
L["Total compatible gems/Total sockets"] = "\\24635\\20860\\23481\\23453\\30707\\25968/\\24635\\25554\\27133\\25968"
L["You can change this decision on a per character basis in configuration panel."] = "\\24744\\20173\\28982\\21487\\20197\\22522\\20110\\27599\\20010\\35282\\33394\\22312\\30028\\38754\\37197\\32622\\38754\\26495\\20013\\20877\\27425\\26356\\25913\\36825\\19968\\36873\\39033\\12290"
L["You can now choose if you want all your character share the same configuration or not."] = "\\24744\\29616\\22312\\21487\\20197\\36873\\25321\\65292\\26159\\21542\\24819\\35201\\25152\\26377\\30340\\35282\\33394\\20849\\29992\\30456\\21516\\37197\\32622\\12290"
	end
	L=l:NewLocale(me,"esES")
	if (L) then
L["Appearance"] = "Apariencia"
L["Assume Buckle on waist"] = "Supongamos Hebilla en la cintura"
L["Bottom Left"] = "Abajo a la izquierda"
L["Bottom Right"] = "Abajo a la derecha"
L["Change colors and appearance"] = "Cambie los colores y la apariencia"
L["Choose a color scheme"] = "Elegir un esquema de color"
L["Choose profile"] = "Elija el perfil"
L["Choose what is shown"] = "Elija lo que se muestra"
L["Colorize level text by"] = "Colorear texto de nivel por"
L["Common profile for all characters"] = "Perfil com\\250n para todos los personajes"
L["Current profile is: "] = "Perfil actual es:"
L["Debug info"] = "info de depuraci\\243n"
L["E"] = true
L["Gem frame position"] = "Posici\\243n del marco de la gema"
L["itemlevel (green best)"] = "itemlevel (verde mejor)"
L["itemlevel (red best)"] = "itemlevel (rojo mejor)"
L["Level text aligned to"] = "Nivel texto alineado a"
L["none (plain white)"] = "ninguno (blanco normal)"
L["Options"] = "Opciones"
L["Per character profile"] = "Por perfil de personaje"
L["Please, choose between global or per character profile"] = "Por favor, elija entre lo global o por cada perfil de personaje"
L["Position"] = "posici\\243n"
L["quality"] = "calidad"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "Mostrar elemento prima info.Please publicar la pantalla para maldecir Foro"
L["Shows missing enchants"] = "Muestra encantamientos desaparecidos"
L["Shows number of empty socket"] = "Muestra el n\\250mero de z\\243calo vac\\237o"
L["Shows total number of gems"] = "Muestra el n\\250mero total de gemas"
L["Switch between global and per character profile"] = "Cambie entre global y por perfil del personaje"
L["Top Left"] = "Arriba a la izquierda"
L["Top Right"] = "Arriba a la derecha"
L["Total compatible gems/Total sockets"] = "Total de gemas compatibles / sockets totales"
L["You can change this decision on a per character basis in configuration panel."] = "Usted puede cambiar esta decisi\\243n en funci\\243n de cada personaje en el panel de configuraci\\243n."
L["You can now choose if you want all your character share the same configuration or not."] = "Ahora puede elegir si desea que todo su parte el car\\225cter de la misma configuraci\\243n o no."
	end
	L=l:NewLocale(me,"zhTW")
	if (L) then
L["Appearance"] = "\\22806\\35264"
L["Assume Buckle on waist"] = "\\20551\\35373\\25187\\22312\\33136\\38291"
L["Bottom Left"] = "\\24038\\19979"
L["Bottom Right"] = "\\21491\\19979"
L["Change colors and appearance"] = "\\25913\\35722\\38991\\33394\\21450\\22806\\35264"
L["Choose a color scheme"] = "\\36984\\25799\\19968\\20491\\33879\\33394\\26041\\26696"
L["Choose profile"] = "\\36984\\25799\\35373\\23450\\27284"
L["Choose what is shown"] = "\\36984\\25799\\39023\\31034\\20123\\20160\\40636"
L["Colorize level text by"] = "\\33879\\33394\\31561\\32026\\25991\\23383\\20381\\25818"
L["Common profile for all characters"] = "\\25152\\26377\\35282\\33394\\36890\\29992\\30340\\35373\\23450\\27284"
L["Current profile is: "] = "\\30446\\21069\\30340\\35373\\23450\\27284\\26159\\65306"
L["Debug info"] = "\\38500\\37679\\36039\\35338"
L["E"] = true
L["Gem frame position"] = "\\29664\\23542\\26694\\26550\\20301\\32622"
L["itemlevel (green best)"] = "\\29289\\21697\\31561\\32026(\\32160\\33394\\26368\\20339)"
L["itemlevel (red best)"] = "\\29289\\21697\\31561\\32026(\\32005\\33394\\26368\\20339)"
L["Level text aligned to"] = "\\31561\\32026\\25991\\23383\\23565\\40778"
L["none (plain white)"] = "\\28961\\65288\\32020\\30333\\33394\\65289"
L["Options"] = "\\36984\\38917"
L["Per character profile"] = "\\20491\\21029\\35282\\33394\\35373\\23450\\27284"
L["Please, choose between global or per character profile"] = "\\35531\\22312\\20840\\23616\\33287\\20491\\21029\\35282\\33394\\30340\\35373\\23450\\27284\\20013\\36984\\25799"
L["Position"] = "\\20301\\32622"
L["quality"] = "\\21697\\36074"
L["Show raw item info.Please post the screenshot to Curse Forum"] = "\\39023\\31034\\26410\\32147\\21152\\24037\\30340\\29289\\21697\\36039\\35338\\12290\\35531\\36028\\27492\\25847\\22294\\21040Curse\\35342\\35542\\21312"
L["Shows missing enchants"] = "\\39023\\31034\\32570\\23569\\30340\\38468\\39764"
L["Shows number of empty socket"] = "\\39023\\31034\\31354\\30340\\25554\\27133\\25976"
L["Shows total number of gems"] = "\\39023\\31034\\29664\\23542\\32317\\25976\\37327"
L["Switch between global and per character profile"] = "\\22312\\20840\\23616\\33287\\20491\\21029\\35282\\33394\\35373\\23450\\27284\\20013\\20999\\25563"
L["Top Left"] = "\\24038\\19978"
L["Top Right"] = "\\21491\\19978"
L["Total compatible gems/Total sockets"] = "\\32317\\30456\\23481\\23542\\30707/\\32317\\25554\\24231"
L["You can change this decision on a per character basis in configuration panel."] = "\\20320\\21487\\20197\\22312\\37197\\32622\\38754\\26495\\22522\\26044\\20491\\21029\\35282\\33394\\25913\\35722\\27492\\27770\\23450\\12290"
L["You can now choose if you want all your character share the same configuration or not."] = "\\29694\\22312\\20320\\21487\\20197\\36984\\25799\\26159\\21542\\35201\\25152\\26377\\35282\\33394\\20849\\20139\\30456\\21516\\30340\\37197\\32622\\12290"
	end
end
L=LibStub("AceLocale-3.0"):GetLocale(me,true)

