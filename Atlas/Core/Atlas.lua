-- $Id: Atlas.lua 253 2017-05-25 07:22:48Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert at gmail dot com>
	Copyright 2010 - Lothaer <lothayer at gmail dot com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

-- ----------------------------------------------------------------------------
-- Localized Lua globals.
-- ----------------------------------------------------------------------------
-- Functions
local _G = getfenv(0);
local pairs, select, type, unpack, next = pairs, select, type, unpack, next
local string, table, math, tonumber = string, table, math, tonumber
-- Libraries
local bit = bit
local strfind, strsub, format, gsub, strlower, strgmatch = string.find, string.sub, string.format, string.gsub, string.lower, string.gmatch
local strlen, strgfind = string.len, string.gfind
local strtrim = strtrim
local floor = math.floor
local getn, tinsert, tsort = table.getn, table.insert, table.sort

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...

local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):NewAddon(private.addon_name, "AceConsole-3.0")
addon.constants = private.constants
addon.constants.addon_name = private.addon_name
addon.Name = FOLDER_NAME
_G.Atlas = addon

local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name);
local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local BB = Atlas_GetLocaleLibBabble("LibBabble-Boss-3.0");
local LibDialog = LibStub("LibDialog-1.0");
local AceDB = LibStub("AceDB-3.0")

local profile;

-- Minimap button with LibDBIcon-1.0
local LDB = LibStub("LibDataBroker-1.1"):NewDataObject("Atlas", {
	type = "launcher",
	text = L["ATLAS_TITLE"],
	icon = "Interface\\WorldMap\\WorldMap-Icon",
})

local minimapButton = LibStub("LibDBIcon-1.0");

function addon:OnInitialize()
	self.db = AceDB:New("AtlasDB", addon.constants.defaults, true)
	
	profile = self.db.profile;
	
	minimapButton:Register("Atlas", LDB, self.db.profile.minimap);
	self:RegisterChatCommand("atlasbutton", Atlas_ButtonToggle2);
	self:RegisterChatCommand("atlas", Atlas_Toggle);
	--self:RegisterChatCommand("atlas "..ATLAS_SLASH_OPTIONS, AtlasOptions_Toggle);

	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
	
	self:SetupOptions();
end

function addon:OnEnable()

end

function addon:Refresh()
	profile = self.db.profile;

	Atlas_PopulateDropdowns();
	Atlas_Refresh();
	AtlasFrameDropDownType_OnShow();
	AtlasFrameDropDown_OnShow();
	addon:UpdateLock();
	addon:UpdateAlpha();
	addon:UpdateScale();
	AtlasFrame:SetClampedToScreen(profile.options.frames.clamp);
	AtlasFrameLarge:SetClampedToScreen(profile.options.frames.clamp);
	AtlasFrameSmall:SetClampedToScreen(profile.options.frames.clamp);
	if (profile.options.worldMapButton) then
		AtlasToggleFromWorldMap:Show();
	else
		AtlasToggleFromWorldMap:Hide();
	end

end
--[[
function addon:Toggle()
	self.db.profile.minimap.hide = not self.db.profile.minimap.hide
	if self.db.profile.minimap.hide then
		minimapButton:Hide("Atlas")
		--AtlasOptions.AtlasButtonShown = false;
	else
		minimapButton:Show("Atlas")
		--AtlasOptions.AtlasButtonShown = true;
	end
end
]]
function Atlas_ButtonToggle2()
	profile.minimap.hide = not profile.minimap.hide
	Atlas_ButtonToggle()
end
function Atlas_ButtonToggle()
	if profile.minimap.hide then
		minimapButton:Hide("Atlas")
		--AtlasOptions.AtlasButtonShown = false;
	else
		minimapButton:Show("Atlas")
		--AtlasOptions.AtlasButtonShown = true;
	end
end

local function copyOptions()
	local options = profile.options;
	
	if not AtlasOptions then return; end
	options.autoSelect = AtlasOptions.AtlasAutoSelect;

	options.frames.alpha = AtlasOptions.AtlasAlpha;
	options.frames.scale = AtlasOptions.AtlasScale;
	options.frames.boss_description_scale = AtlasOptions.AtlasBossDescScale;
	options.frames.showBossDesc = AtlasOptions.AtlasBossDesc;
	options.frames.lock = AtlasOptions.AtlasLocked;
	options.frames.rightClick = AtlasOptions.AtlasRightClick;
	options.frames.controlClick = AtlasOptions.AtlasCtrl;
	options.frames.clamp = AtlasOptions.AtlasClamped;
	options.frames.showAcronyms = AtlasOptions.AtlasAcronyms;

	options.dropdowns.color = AtlasOptions.AtlasColoringDropDown;
	options.dropdowns.menuType = AtlasOptions.AtlasSortBy;
	options.dropdowns.module = AtlasOptions.AtlasType;
	options.dropdowns.zone = AtlasOptions.AtlasZone;

	options.worldMapButton = AtlasOptions.AtlasWorldMapButtonShown;
	options.checkMissingModules = AtlasOptions.AtlasCheckModule;
	options.disableUpdateNotification = AtlasOptions.AtlasDontShowInfo;
end

local function debug(info)
	if (ATLAS_DEBUGMODE) then
		DEFAULT_CHAT_FRAME:AddMessage(L["ATLAS_TITLE"]..L["Colon"]..info);
	end
end

-- get creature's name from server
local cache_tooltip = CreateFrame("GameTooltip", "cacheToolTip", UIParent, "GameTooltipTemplate")
local creature_cache
local function getCreatureNamebyID(id)
	if not id then return end

	cache_tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	cache_tooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(id))
	creature_cache = _G["cacheToolTipTextLeft1"]:GetText()
end

function addon:GetCreatureName(creatureName, id)
	if (not creatureName) and (not id) then return end
	
	getCreatureNamebyID(id)
	creatureName = creature_cache or creatureName
	creature_cache = nil

	return creatureName
end

-- Below to temporarily create a table to store the core map's data
-- in order to identify the dropdown's zoneID is belonging to the
-- core Atlas or plugins
local Atlas_CoreMapsKey = {};
local Atlas_CoreMapsKey_Index = 0;
for kc, vc in pairs(AtlasMaps) do
	Atlas_CoreMapsKey[Atlas_CoreMapsKey_Index] = kc;
	Atlas_CoreMapsKey_Index = Atlas_CoreMapsKey_Index + 1;
end

function Atlas_RegisterPlugin(name, myCategory, myData)
	ATLAS_PLUGINS[name] = {};
	local i = getn(Atlas_MapTypes) + 1;
	Atlas_MapTypes[i] = ATLAS_PLUGINS_COLOR..myCategory; -- Plugin category name to be added with green color, and then added to array
	
	for k, v in pairs(myData) do
		tinsert(ATLAS_PLUGINS[name], k);
		AtlasMaps[k] = v;
	end
	
	tinsert(ATLAS_PLUGIN_DATA, myData);
	
	local catName = Atlas_DropDownLayouts_Order[profile.options.dropdowns.menuType];
	local subcatOrder = Atlas_DropDownLayouts_Order[catName];
--	if (ATLAS_OLD_TYPE and ATLAS_OLD_TYPE <= getn(AtlasMaps)) then
	if ( ATLAS_OLD_TYPE and ATLAS_OLD_TYPE <= getn(subcatOrder) + getn(Atlas_MapTypes) ) then
		profile.options.dropdowns.module = ATLAS_OLD_TYPE;
		profile.options.dropdowns.zone = ATLAS_OLD_ZONE;
	end
	
	Atlas_PopulateDropdowns();
	Atlas_Refresh();
end

local function Atlas_BossButtonCleanUp(button)
	button:SetID(0);
	button.encounterID = nil;
	button.instanceID = nil;
	button.overviewDescription = nil;
	button.roleOverview = nil;
	button.achievementID = nil;
	button.tooltiptitle = nil;
	button.tooltiptext = nil;
	button.link = nil;
	button.displayInfo = nil;
	if (button.bgImage) then button.bgImage:SetTexture(nil); end
	if (button.TaxiImage) then button.TaxiImage:SetTexture(nil); end
end

local function Atlas_BossButtonUpdate(button, encounterID, instanceID, b_iconImage, moduleData)
	local rolesByFlag = {
		[0] = "TANK",
		[1] = "DAMAGER",
		[2] = "HEALER"
	}

	button:SetID(encounterID);
	button.encounterID = encounterID;
	if (instanceID and instanceID ~= 0) then
		button.instanceID = instanceID;
	end
	button.AtlasModule = moduleData or nil;

	local ejbossname, description, _, rootSectionID, link = EJ_GetEncounterInfo(encounterID);
	if (ejbossname) then
		button.tooltiptitle = ejbossname;
		button.tooltiptext = description;
		button.link = link;
		if (addon:EncounterJournal_CheckForOverview(rootSectionID)) then
			-- title, description, depth, abilityIcon, displayInfo, 
			-- siblingID, nextSectionID, filteredByDifficulty, link, 
			-- startsOpen, flag1, flag2, flag3, flag4 = EJ_GetSectionInfo(sectionID)
			local _, overviewDescription, _, _, _, _, nextSectionID = EJ_GetSectionInfo(rootSectionID);
			button.overviewDescription = overviewDescription or nil;

			local spec, role;

			spec = GetSpecialization();
			if (spec) then
				role = GetSpecializationRole(spec);
			else
				role = "DAMAGER";
			end

			local title, description, siblingID, filteredByDifficulty, flag1;
			local i = 1;
			while nextSectionID do
				title, description, _, _, _, siblingID, _, filteredByDifficulty, _, _, flag1 = EJ_GetSectionInfo(nextSectionID);
				if (role == rolesByFlag[flag1]) then
					description = gsub(description, "$bullet;", "- ");
					button.roleOverview = "|cffffffff"..title.."|r".."\n"..description;
					break;
				end
				i = i + 1;
				nextSectionID = siblingID;
			end
		end
		
		if (b_iconImage) then
			local _, _, _, displayInfo, iconImage = EJ_GetCreatureInfo(1, encounterID);
			button.displayInfo = displayInfo;
			if ( iconImage ) then
				SetPortraitTexture(button.bgImage, displayInfo);
			end
		end
	end
end

function Atlas_Search(text)
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	local mapdata = AtlasMaps;
	local base = mapdata[zoneID];

	local data = nil;

	if (ATLAS_SEARCH_METHOD == nil) then
		data = ATLAS_DATA;
	else
		data = ATLAS_SEARCH_METHOD(ATLAS_DATA, text);
	end

	-- Populate the scroll frame entries list, the update func will do the rest
	local i = 1;
	while ( data[i] ~= nil ) do
		ATLAS_SCROLL_LIST[i] = data[i][1];
		if (data[i][2] ~= nil) then
			ATLAS_SCROLL_ID[i] = { data[i][2], base.JournalInstanceID or 0, data[i][3] or "", data[i][4] or ""};
		else
			ATLAS_SCROLL_ID[i] = { 0, 0, "", "" };
		end
		i = i + 1;
	end

	ATLAS_CUR_LINES = i - 1;
end

function Atlas_SearchAndRefresh(text)
	Atlas_Search(text);
	Atlas_ScrollBar_Update();
end

local function parse_entry_strings(typeStr, id, preStr, index, lineplusoffset)
	if (typeStr == "item") then
		local itemID = id;
		local itemName = GetItemInfo(itemID);
		itemName = itemName or GetItemInfo(itemID) or preStr or "";
		if (itemName) then _G["AtlasEntry"..index.."_Text"]:SetText(ATLAS_SCROLL_LIST[lineplusoffset]..itemName); end
	end
end

function Atlas_ScrollBar_Update()
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	local mapdata = AtlasMaps;
	local base = mapdata[zoneID];

	GameTooltip:Hide();
	local lineplusoffset;
	FauxScrollFrame_Update(AtlasScrollBar,ATLAS_CUR_LINES,ATLAS_NUM_LINES,15);
	for i = 1, ATLAS_NUM_LINES do
		local button = _G["AtlasEntry"..i];
		if button then Atlas_BossButtonCleanUp(button); end
		
		lineplusoffset = i + FauxScrollFrame_GetOffset(AtlasScrollBar);
		if (lineplusoffset <= ATLAS_CUR_LINES) then
			_G["AtlasEntry"..i.."_Text"]:SetText(ATLAS_SCROLL_LIST[lineplusoffset]);
			if (ATLAS_SCROLL_ID[lineplusoffset]) then
				if (type(ATLAS_SCROLL_ID[lineplusoffset][1]) == "number") then
					local id = ATLAS_SCROLL_ID[lineplusoffset][1];
					Atlas_BossButtonUpdate(button, ATLAS_SCROLL_ID[lineplusoffset][1], ATLAS_SCROLL_ID[lineplusoffset][2], false, base.Module or base.ALModule);
				elseif (type(ATLAS_SCROLL_ID[lineplusoffset][1]) == "string") then
					local spos, epos = strfind(ATLAS_SCROLL_ID[lineplusoffset][1], "ac=");
					if (spos) then
						local achievementID = strsub(ATLAS_SCROLL_ID[lineplusoffset][1], epos+1);
						achievementID = tonumber(achievementID);
						addon:AchievementButtonUpdate(button, achievementID);
					end
				else
				end
				
				if (ATLAS_SCROLL_ID[lineplusoffset][3] and ATLAS_SCROLL_ID[lineplusoffset][3]~= "") then
					parse_entry_strings(ATLAS_SCROLL_ID[lineplusoffset][3], ATLAS_SCROLL_ID[lineplusoffset][1], ATLAS_SCROLL_ID[lineplusoffset][4], i, lineplusoffset)
--[[					if (ATLAS_SCROLL_ID[lineplusoffset][3] == "item") then
						local itemID = ATLAS_SCROLL_ID[lineplusoffset][1];
						local itemName = GetItemInfo(itemID);
						itemName = itemName or GetItemInfo(itemID) or ATLAS_SCROLL_ID[lineplusoffset][4] or "";
						if (itemName) then _G["AtlasEntry"..i.."_Text"]:SetText(ATLAS_SCROLL_LIST[lineplusoffset]..itemName); end
					end]]
				end
			end
			button:Show();
		elseif (button) then
			button:Hide();
		end
	end
end

function Atlas_SimpleSearch(data, text)
	if (strtrim(text or "") == "") then
		return data
	end
	local new = {}; -- Create a new table
	local i, v, n;
	local search_text = strlower(text);
	search_text = search_text:gsub("([%^%$%(%)%%%.%[%]%+%-%?])", "%%%1");
	search_text = search_text:gsub("%*", ".*");
	local fmatch;

	i, v = next(data, nil); -- The i is an index of data, v = data[i]
	n = i;
	while i do
		if ( type(i) == "number" ) then
			if ( strgmatch ) then 
				fmatch = strgmatch(strlower(data[i][1]), search_text)();
			else 
				fmatch = strgfind(strlower(data[i][1]), search_text)(); 
			end
			if ( fmatch ) then
				new[n] = {};
				new[n][1] = data[i][1];
				n = n + 1;
			end
		end
		i, v = next(data, i); -- Get next index
	end
	return new;
end

function Atlas_PopulateDropdowns()
	local i = 1;
	local catName = Atlas_DropDownLayouts_Order[profile.options.dropdowns.menuType];
	local subcatOrder = Atlas_DropDownLayouts_Order[catName];
	for n = 1, getn(subcatOrder), 1 do
		local subcatItems = Atlas_DropDownLayouts[catName][subcatOrder[n]];

		ATLAS_DROPDOWNS[n] = {};

		for k,v in pairs(subcatItems) do
			tinsert(ATLAS_DROPDOWNS[n], v);
		end

		tsort(ATLAS_DROPDOWNS[n], Atlas_SortZonesAlpha);

		i = n + 1;
	end
	
	if (ATLAS_PLUGIN_DATA) then
		for ka, va in pairs(ATLAS_PLUGIN_DATA) do

			ATLAS_DROPDOWNS[i] = {};

			for kb,vb in pairs(va) do
				if (type(vb) == "table") then
					tinsert(ATLAS_DROPDOWNS[i], kb);
				end
			end

			tsort(ATLAS_DROPDOWNS[i], Atlas_SortZonesAlpha);

			i = i + 1;
		end	
	end
end

local function Atlas_Process_Deprecated()
	local Deprecated_List = addon.constants.deprecatedList;

	-- Check for outdated modules, build a list of them, then disable them and tell the player
	local OldList = {};
	for k, v in pairs(Deprecated_List) do
		-- name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(index or "name")
		--    loadable : Boolean - Indicates if the AddOn is loaded or eligible to be loaded, true if it is, false if it is not.
		local loadable = select(4, GetAddOnInfo(v[1]));
		-- GetAddOnEnableState("character", index): 
		--	0: addon is disabled
		--	1: partially enabled (only when querying all characters)
		-- 	2: fully enabled
		local enabled = GetAddOnEnableState(UnitName("player"), GetAddOnInfo(v[1]))
		if ( (enabled > 0) and loadable ) then
			local oldVersion = true;			
			if (v[2] ~= nil and GetAddOnMetadata(v[1], "Version") >= v[2]) then
				oldVersion = false;
			elseif (v[3] ~= nil and GetAddOnMetadata(v[1], "Version") >= v[3]) then
				oldVersion = false;
			end
			if (oldVersion) then
				tinsert(OldList, v[1]);
			end
		end
	end
	if table.getn(OldList) > 0 then
		local textList = "";
		for k, v in pairs(OldList) do
			textList = textList.."\n"..v..", "..GetAddOnMetadata(v, "Version");
			--DisableAddOn(v);
		end

		LibDialog:Register("ATLAS_OLD_MODULES", {
			text = L["ATLAS_DEP_MSG1"].."\n"..L["ATLAS_DEP_MSG3"].."\n|cff6666ff"..textList.."|r\n\n"..L["ATLAS_DEP_MSG4"],
			buttons = {
				{
					text = OKAY,
				},
			},
			width = 550,
			show_while_dead = false,
			hide_on_escape = true,
		});
		LibDialog:Spawn("ATLAS_OLD_MODULES");
	end
end

-- Removal of articles in map names (for proper alphabetic sorting)
-- For example: "The Deadmines" will become "Deadmines"
-- Thus it will be sorted under D and not under T
local function Atlas_SanitizeName(text)
   text = strlower(text);
   if (AtlasSortIgnore) then
	   for _, v in pairs(AtlasSortIgnore) do
		   local fmatch; 
		   if (strgmatch) then 
			fmatch = strgmatch(text, v)();
		   else 
			fmatch = strgfind(text, v)(); 
		   end
		   if (fmatch) and ((strlen(text) - strlen(fmatch)) <= 4) then
			   return fmatch;
		   end
	   end
   end
   return text;
end

-- Comparator function for alphabetic sorting of maps
-- Yey, one function for everything
local function Atlas_SortZonesAlpha(a, b)
	local aa = Atlas_SanitizeName(AtlasMaps[a].ZoneName[1]);
	local bb = Atlas_SanitizeName(AtlasMaps[b].ZoneName[1]);
	return aa < bb;
end

-- Called when the Atlas frame is first loaded
-- We CANNOT assume that data in other files is available yet!
function Atlas_OnLoad(self)

	Atlas_Process_Deprecated();

	-- Register the Atlas frame for the following events
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("ADDON_LOADED");

	-- Allows Atlas to be closed with the Escape key
	tinsert(UISpecialFrames, "AtlasFrame");
	tinsert(UISpecialFrames, "AtlasFrameLarge");
	tinsert(UISpecialFrames, "AtlasFrameSmall");
	
	-- Dragging involves some special registration
	self:RegisterForDrag("LeftButton");
end

-- Main Atlas event handler
function Atlas_OnEvent(self, event, ...)
	local arg1 = ...;
	if (event=="ADDON_LOADED" and (arg1=="Atlas" or arg1=="Blizzard_EncounterJournal")) then
		--Blizzard_EncounterJournal
		if (IsAddOnLoaded("Blizzard_EncounterJournal") and IsAddOnLoaded("Atlas")) then
			addon:EncounterJournal_Binding();
		end
	end

	if (event == "ADDON_LOADED" and arg1 == "Atlas") then
		addon:Init();
	end
	
end

--Called whenever the Atlas frame is displayed
function Atlas_OnShow()
	--if (AtlasOptions.AtlasAutoSelect) then
	if (profile.options.autoSelect) then
		Atlas_AutoSelect();
	end
	-- Sneakiness
	AtlasFrameDropDownType_OnShow();
	AtlasFrameDropDown_OnShow();
end

-- Detect if not all modules / plugins are installed
function Atlas_Check_Modules()
	if (not profile.options.checkMissingModules) then
		return;
	end
	local Module_List = addon.constants.moduleList;

	-- Check for outdated modules, build a list of them, then disable them and tell the player
	local List = {};
	for _, module in pairs(Module_List) do
		local loadable = select(4, GetAddOnInfo(module));
		local enabled = GetAddOnEnableState(UnitName("player"), module)
		if ( (enabled == 0) or (not loadable) ) then
			tinsert(List, module);
		end
	end
	if table.getn(List) > 0 then
		local textList = "";
		for _, str in pairs(List) do
			textList = textList.."\n"..str;
		end

		LibDialog:Register("DetectMissing", {
			text = L["ATLAS_MISSING_MODULE"].."\n|cff6666ff"..textList.."|r\n",
			buttons = {
				{
					text = CLOSE,
				},
				{
					text = L["ATLAS_OPEN_ADDON_LIST"],
					on_click = AddonList_Show,
				},
			},
			width = 500,
			show_while_dead = false,
			hide_on_escape = true,
		});
		LibDialog:Spawn("DetectMissing");
	end
end

-- Initializes everything relating to saved variables and data in other lua files
-- This should be called ONLY when we're sure our variables are in memory
function addon:Init() 
	-- Make the Atlas window go all the way to the edge of the screen, exactly
	AtlasFrame:SetClampRectInsets(12, 0, -12, 0);
	AtlasFrameLarge:SetClampRectInsets(12, 0, -12, 0);
	AtlasFrameSmall:SetClampRectInsets(12, 0, -12, 0);

--	addon:SetupOptions();
	if (AtlasOptions and profile.options_copied == false) then
		copyOptions();
		profile.options_copied = true;
	else
		profile.options_copied = true;
	end

	-- Populate the dropdown lists...yeeeah this is so much nicer!
	Atlas_PopulateDropdowns();
	
	if (not ATLAS_DROPDOWNS[profile.options.dropdowns.module]) then
		ATLAS_OLD_TYPE = profile.options.dropdowns.module;
		ATLAS_OLD_ZONE = profile.options.dropdowns.zone;
		profile.options.dropdowns.module = 1;
		profile.options.dropdowns.zone = 1;
	end
	
	-- Now that saved variables have been loaded, update everything accordingly
	Atlas_Refresh();
	addon:UpdateLock();
	addon:UpdateAlpha();
	AtlasFrame:SetClampedToScreen(profile.options.frames.clamp);
	AtlasFrameLarge:SetClampedToScreen(profile.options.frames.clamp);
	AtlasFrameSmall:SetClampedToScreen(profile.options.frames.clamp);
	--AtlasButton_UpdatePosition();
	--AtlasOptions_Init();
	
	-- Make an LDB object
	LDB.OnClick = function(self, button)
		if button == "LeftButton" then
			Atlas_Toggle();
		elseif button == "RightButton" then
			addon:OpenOptions();
		end
	end;
	LDB.OnTooltipShow = function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		tooltip:AddLine("|cffffffff"..ATLAS_TITLE)
		tooltip:AddLine(ATLAS_LDB_HINT)
	end;
	
	Atlas_Check_Modules();

	if (profile.options.worldMapButton) then
		AtlasToggleFromWorldMap:Show();
	else
		AtlasToggleFromWorldMap:Hide();
	end
end

-- Simple function to toggle the visibility of the Atlas frame
function Atlas_Toggle()
	if (ATLAS_SMALLFRAME_SELECTED) then
		if (AtlasFrameSmall:IsVisible()) then
			HideUIPanel(AtlasFrameSmall);
		else
			ShowUIPanel(AtlasFrameSmall);
		end
	else
		if (AtlasFrame:IsVisible()) then
			HideUIPanel(AtlasFrame);
		else
			ShowUIPanel(AtlasFrame);
		end
	end
end

local function Atlas_CheckInstanceHasGearLevel()
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	if (not zoneID) then
		return false;
	end
	local data = AtlasMaps;
	local base = data[zoneID];

	local minGearLevel, minGearLevelH, minGearLevelM;

	if (base.DungeonID) then
		_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, minGearLevel = GetLFGDungeonInfo(base.DungeonID);
	end
	if (base.DungeonHeroicID) then
		_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, minGearLevelH = GetLFGDungeonInfo(base.DungeonHeroicID);
	end
	if (base.DungeonMythicID) then
		_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, minGearLevelM = GetLFGDungeonInfo(base.DungeonMythicID);
	end

	local iLFGhasGearInfo = false;
	if ((minGearLevel and minGearLevel ~= 0) or (minGearLevelH and minGearLevelH ~= 0) or (minGearLevelM and minGearLevelM ~= 0)) then
		iLFGhasGearInfo = true;
	else
		iLFGhasGearInfo = false;
	end
	
	return iLFGhasGearInfo;
end

function Atlas_FormatColor(color_array)
	if (not color_array or type(color_array) ~= "table") then return; end
	if (not (color_array.r and color_array.g and color_array.b)) then return; end
	
	local colortag = format("|cff%02x%02x%02x", color_array.r * 255, color_array.g * 255, color_array.b * 255);
	return colortag;
end

local function round(num, idp)
	local mult = 10 ^ (idp or 0);
	return floor(num * mult + 0.5) / mult;
end

-- Calculate the dungeon difficulty based on the dungeon's level and player's level
-- Codes adopted from FastQuest_Classic
function Atlas_DungeonDifficultyColor(minRecLevel)
	local color = {r = 1.00, g = 1.00, b = 1.00};
	if (not minRecLevel) then 
		return color;
	end

	local lDiff = minRecLevel - UnitLevel("player");
	if (lDiff >= 0) then
		for i= 1.00, 0.10, -0.10 do
			color = {r = 1.00, g = i, b = 0.00};
			if ((i/0.10)==(10-lDiff)) then return color; end
		end
	elseif ( -lDiff < GetQuestGreenRange() ) then
		for i= 0.90, 0.10, -0.10 do
			color = {r = i, g = 1.00, b = 0.00};
			if ((9-i/0.10)==(-1*lDiff)) then return color; end
		end
	elseif ( -lDiff == GetQuestGreenRange() ) then
		color = {r = 0.50, g = 1.00, b = 0.50};
	else
		--color = {r = 0.75, g = 0.75, b = 0.75};
		color = {r = 1.00, g = 1.00, b = 1.00};
	end
	return color;
end

local function Atlas_GearItemLevelDiff(minGearLevel)
	local lDiff = minGearLevel - GetAverageItemLevel();
	local color;
	
	if (lDiff >= 0) then
		for i= 1.00, 0.10, -0.10 do
			color = {r = 1.00, g = i, b = 0.00};
			if ( (i/0.10)==round(((100-lDiff)/10),0) ) then return color; end
		end
	elseif (-lDiff < 100) then
		for i= 0.90, 0.10, -0.10 do
			color = {r = i, g = 1.00, b = 0.00};
			if ((9-i/0.10)==round(((-1*lDiff)/10),0) ) then return color; end
		end
	elseif (-lDiff == 100) then
		color = {r = 0.50, g = 1.00, b = 0.50};
	else
		color = {r = 1.00, g = 1.00, b = 1.00};
	end
	
	return color;
end

-- Add boss / NPC button here so that we can add GameTooltip
function Atlas_MapAddNPCButton()
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	local t = AtlasMaps_NPC_DB[zoneID];
	local data = AtlasMaps;
	local base = data[zoneID];
	local i = 1;
	local bossindex = 1;
	local buttonindex = 1;
	local bossindexS = 1;
	local buttonindexS = 1;
	local bossbutton, button, bossbuttonS, buttonS;

	if (t) then
		while (t[i]) do
			local info_mark 	= t[i][1];
			local info_id 		= t[i][2];
			local info_x 		= t[i][3];
			local info_y 		= t[i][4];
			local info_colortag	= t[i][7];
			
			if (info_x == nil) then info_x = -18; end
			if (info_y == nil) then info_y = -18; end

			if (info_id < 10000 and profile.options.frames.showBossPotrait) then
				bossbutton = _G["AtlasMapBossButton"..bossindex];
				if (not bossbutton) then
					bossbutton = CreateFrame("Button", "AtlasMapBossButton"..bossindex, AtlasFrame, "AtlasFrameBossButtonTemplate");
				end
				Atlas_BossButtonCleanUp(bossbutton);
				Atlas_BossButtonUpdate(bossbutton, info_id, base.JournalInstanceID, true);
				
				bossbuttonS = _G["AtlasMapBossButtonS"..bossindexS];
				if (not bossbuttonS) then
					bossbuttonS = CreateFrame("Button", "AtlasMapBossButtonS"..bossindexS, AtlasFrameSmall, "AtlasFrameBossButtonTemplate");
				end
				Atlas_BossButtonCleanUp(bossbuttonS);
				Atlas_BossButtonUpdate(bossbuttonS, info_id, base.JournalInstanceID, true);
				
				bossbutton:ClearAllPoints();
				--bossbutton:SetWidth(20);
				--bossbutton:SetHeight(20);
				bossbutton:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", info_x + 18-15, -info_y - 82+15);
				bossbutton:Show();

				bossbuttonS:ClearAllPoints();
				bossbuttonS:SetPoint("TOPLEFT", "AtlasFrameSmall", "TOPLEFT", info_x + 18-15, -info_y - 82+15);
				bossbuttonS:Show();

				bossindex = bossindex + 1;
				bossindexS = bossindexS + 1;
			else
				button = _G["AtlasMapNPCButton"..buttonindex];
				if (not button) then
					button = CreateFrame("Button", "AtlasMapNPCButton"..buttonindex, AtlasFrame, "AtlasMapNPCButtonTemplate");
				end
				buttonS = _G["AtlasMapNPCButtonS"..buttonindexS];
				if (not buttonS) then
					buttonS = CreateFrame("Button", "AtlasMapNPCButtonS"..buttonindexS, AtlasFrameSmall, "AtlasMapNPCButtonTemplate");
				end

				local tip_title;
				for k, v in pairs(AtlasMaps[zoneID]) do
					if (type(v[2]) == "number") then
						if (v[2] == info_id) then
							tip_title = v[1];
							if (v[3] and v[3] == "item") then
								local itemName = GetItemInfo(v[2]);
								itemName = itemName or GetItemInfo(v[2]);

								button.tooltiptitle = itemName or nil;
								buttonS.tooltiptitle = itemName or nil;
							else
								local _, endpos = strfind(tip_title, ") ");
								if (endpos) then
									button.tooltiptitle = strsub(tip_title, endpos+1);
									buttonS.tooltiptitle = strsub(tip_title, endpos+1);
								end
							end
							break;
						end
					end
				end
				button:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", info_x + 18, -info_y - 82 );
				button:SetID(info_id);
				button:Show();
				buttonS:SetPoint("TOPLEFT", "AtlasFrameSmall", "TOPLEFT", info_x + 18, -info_y - 82 );
				buttonS:SetID(info_id);
				buttonS:Show();

				buttonindex = buttonindex + 1;
				buttonindexS = buttonindexS + 1;
			end

			-- Disable the set text unless one day we want the text to be added dynamatically
			-- Or, enable it for debugging purpose
--[[
			local f_text = button:CreateFontString(button:GetName().."_Text", "MEDIUM", "NumberFont_Outline_Huge");
			f_text:SetPoint("CENTER", button, "CENTER", 0, 0);
			f_text:SetText(info_mark);
]]
			i = i + 1;
		end
		-- We started the counting from 1, plus 1 in each loop, need to adjust by removing 1 after the loop is ended
		--ATLAS_MAP_NPC_NUM = i - 1;
	end

	bossbutton = _G["AtlasMapBossButton"..bossindex];
	while bossbutton do
		bossbutton.bgImage:SetTexture(nil);
		bossbutton:Hide();
		bossindex = bossindex + 1;
		bossbutton = _G["AtlasMapBossButton"..bossindex];
	end

	bossbuttonS = _G["AtlasMapBossButtonS"..bossindexS];
	while bossbuttonS do
		bossbuttonS.bgImage:SetTexture(nil);
		bossbuttonS:Hide();
		bossindexS = bossindexS + 1;
		bossbuttonS = _G["AtlasMapBossButtonS"..bossindexS];
	end
	
	button = _G["AtlasMapNPCButton"..buttonindex];
	while button do
		button.bgImage:SetTexture(nil);
		button:Hide();
		buttonindex = buttonindex + 1;
		button = _G["AtlasMapNPCButton"..buttonindex];
	end

	buttonS = _G["AtlasMapNPCButtonS"..buttonindexS];
	while buttonS do
		buttonS.bgImage:SetTexture(nil);
		buttonS:Hide();
		buttonindexS = buttonindexS + 1;
		buttonS = _G["AtlasMapNPCButtonS"..buttonindexS];
	end

end

function Atlas_MapAddNPCButtonLarge()
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	local t = AtlasMaps_NPC_DB[zoneID];
	local data = AtlasMaps;
	local base = data[zoneID];
	local i = 1;
	local bossindex = 1;
	local buttonindex = 1;
	local bossbutton, button;

	if (t) then
		while (t[i]) do
			local info_mark 	= t[i][1];
			local info_id 		= t[i][2];
			local info_x 		= t[i][5];
			local info_y 		= t[i][6];
			local info_colortag	= t[i][7];

			if (info_id < 10000 and info_x and info_y and profile.options.frames.showBossPotrait) then
				bossbutton = _G["AtlasMapBossButtonL"..bossindex];
				if (not bossbutton) then
					bossbutton = CreateFrame("Button", "AtlasMapBossButtonL"..bossindex, AtlasFrameLarge, "AtlasFrameBossButtonTemplate");
				end
				Atlas_BossButtonCleanUp(bossbutton);
				Atlas_BossButtonUpdate(bossbutton, info_id, base.JournalInstanceID, true);
				bossbutton:ClearAllPoints();
				bossbutton:SetPoint("TOPLEFT", "AtlasFrameLarge", "TOPLEFT", info_x, -info_y - 82+15);
				bossbutton:Show();

				bossindex = bossindex + 1;
			elseif (info_x and info_y) then
				button = _G["AtlasMapNPCButtonL"..buttonindex];
				if (not button) then
					button = CreateFrame("Button", "AtlasMapNPCButtonL"..buttonindex, AtlasFrameLarge, "AtlasMapNPCButtonTemplate");
				end
				local text = _G[button:GetName().."_Text"];
				if (text) then
					text:SetText("");
				end
				button.TaxiImage:SetTexture(nil);
				button.bgImage:SetTexture(nil);
				--button.LetterImage:SetTexture(nil);

				local tip_title;
				for k, v in pairs(AtlasMaps[zoneID]) do
					if (v[2] == info_id) then
						tip_title = v[1];
						local _, endpos = strfind(tip_title, ") ");
						if (endpos) then
							button.tooltiptitle = strsub(tip_title, endpos+1);
						end
						break;
					end
				end

				if (info_colortag) then
--[[
					-- Arith: 2016.08.15 - I decided to use fontstring instead of pre-made character image. But codes can be left here for future reference until I don't need it anymore.
					if (info_colortag == "Blue" or info_colortag == "Purple") then
						local texcoord;
						texcoord = "Atlas_Letter_"..info_colortag.."_"..info_mark;
						button.LetterImage:SetTexture("Interface\\AddOns\\Atlas\\Images\\Atlas_Marks_Letters1");
						button.LetterImage:SetTexCoord(unpack(ATLAS_LETTER_MARKS_TCOORDS[texcoord]));
						button:SetWidth(20);
						button:SetHeight(20);
]]
					if (info_colortag == "Dungeon" or info_colortag == "Raid") then
						button.bgImage:SetTexture("Interface\\MINIMAP\\"..info_colortag);
					elseif (info_colortag == "Battlegrounds") then
						button.bgImage:SetTexture("Interface\\MINIMAP\\Tracking\\BattleMaster");
					elseif (info_colortag == "PvP") then
						button.bgImage:SetAtlas("worldquest-icon-pvp-ffa", true);
					elseif (info_colortag == "FlightMaster") then
						button.TaxiImage:SetTexture("Interface\\MINIMAP\\Tracking\\FlightMaster");
						button.TaxiImage:SetTexCoord(0, 1, 0, 1);
					elseif (info_colortag == "TaxiAlliance" or info_colortag == "TaxiHorde" or info_colortag == "TaxiNeutral" ) then
						button.TaxiImage:SetTexture("Interface\\AddOns\\Atlas\\Images\\POIICONS");
						button.TaxiImage:SetTexCoord(unpack(ATLAS_TAXI_TCOORDS[info_colortag]));
					elseif (info_colortag == "White" or 
						info_colortag == "Yellow" or 
						info_colortag == "Red" or 
						info_colortag == "Orange" or 
						info_colortag == "Green" or 
						info_colortag == "Purple" or
						info_colortag == "Blue") then
						if (not text) then
							text = button:CreateFontString(button:GetName().."_Text", "MEDIUM", "AtlasSystemFont_Large_Outline_Thick");
						end
						text:SetPoint("CENTER", button, "CENTER", 0, 0);
						text:SetText(info_mark);
						text:SetTextColor(unpack(ATLAS_FONT_COLORS[info_colortag]));
						button:SetWidth(20);
						button:SetHeight(20);
					elseif (info_colortag == "HUNTER" or
						info_colortag == "WARLOCK" or
						info_colortag == "PRIEST" or
						info_colortag == "PALADIN" or
						info_colortag == "MAGE" or
						info_colortag == "ROGUE" or
						info_colortag == "DRUID" or
						info_colortag == "SHAMAN" or
						info_colortag == "WARRIOR" or
						info_colortag == "DEATHKNIGHT" or
						info_colortag == "MONK" or
						info_colortag == "DEMONHUNTER") then
						if (not text) then
							text = button:CreateFontString(button:GetName().."_Text", "MEDIUM", "AtlasSystemFont_Large_Outline_Thick");
						end
						local color = RAID_CLASS_COLORS[info_colortag];
						text:SetPoint("CENTER", button, "CENTER", 0, 0);
						text:SetText(info_mark);
						text:SetTextColor(color.r, color.g, color.b);
						button:SetWidth(20);
						button:SetHeight(20);

					else
						-- Do Nothing
					end
					
				end
				button:SetPoint("TOPLEFT", "AtlasFrameLarge", "TOPLEFT", info_x + 18, -info_y - 82 );
				button:SetID(info_id);
				button:Show();

				buttonindex = buttonindex + 1;
			else
				-- Do Nothing;
			end

			i = i + 1;
		end
	end

	bossbutton = _G["AtlasMapBossButtonL"..bossindex];
	while bossbutton do
		bossbutton.bgImage:SetTexture(nil);
		bossbutton:Hide();
		bossindex = bossindex + 1;
		bossbutton = _G["AtlasMapBossButtonL"..bossindex];
	end
	
	button = _G["AtlasMapNPCButtonL"..buttonindex];
	while button do
		button.bgImage:SetTexture(nil);
		button:Hide();
		buttonindex = buttonindex + 1;
		button = _G["AtlasMapNPCButtonL"..buttonindex];
	end
end

function Atlas_MapRefresh(mapID)
	local zoneID = mapID or ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	if (not zoneID) then
		return;
	end
	local data = AtlasMaps;
	local base = data[zoneID];
	if (not base) then
		return;
	end

	local _;
	local typeID, subtypeID, minLevel, maxLevel, minRecLevel, maxRecLevel, maxPlayers, minGearLevel;
	local typeIDH, subtypeIDH, minLevelH, maxLevelH, minRecLevelH, maxRecLevelH, maxPlayersH, minGearLevelH;
	local typeIDM, subtypeIDM, minLevelM, maxLevelM, minRecLevelM, maxRecLevelM, maxPlayersM, minGearLevelM;
	local _RED = "|cffcc3333";
	local WHIT = "|cffffffff";
	local colortag, dungeon_difficulty;
	local icontext_heroic 	= " |TInterface\\EncounterJournal\\UI-EJ-HeroicTextIcon:0:0|t";
	local icontext_mythic 	= " |TInterface\\AddOns\\Atlas\\Images\\\UI-EJ-MythicTextIcon:0:0|t";
	local icontext_dungeon 	= "|TInterface\\MINIMAP\\Dungeon:0:0|t";
	local icontext_raid 	= "|TInterface\\MINIMAP\\Raid:0:0|t";
	local icontext_instance;
	
	if (base.DungeonID) then
		-- name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday, bonusRepAmount, minPlayers, isTimeWalker, _, minGearLevel = GetLFGDungeonInfo(dungeonID)
		_, typeID, subtypeID, minLevel, maxLevel, _, minRecLevel, maxRecLevel, _, _, _, _, maxPlayers, _, _, _, _, _, _, minGearLevel = GetLFGDungeonInfo(base.DungeonID);

		-- For some unknown reason, some of the dungeons do not have recommended level range
		if (minRecLevel == 0) then 
			minRecLevel = minLevel;
		end
		if (maxRecLevel == 0) then
			maxRecLevel = maxLevel;
		end
	end
	if (base.DungeonHeroicID) then
		_, typeIDH, subtypeIDH, minLevelH, maxLevelH, _, minRecLevelH, maxRecLevelH, _, _, _, _, maxPlayersH, _, _, _, _, _, _, minGearLevelH = GetLFGDungeonInfo(base.DungeonHeroicID);

		if (minRecLevelH == 0) then
			minRecLevelH = minRecLevel;
		end
		if (maxRecLevelH == 0) then
			maxRecLevelH = maxRecLevel;
		end
	end
	if (base.DungeonMythicID) then
		_, typeIDM, subtypeIDM, minLevelM, maxLevelM, _, minRecLevelM, maxRecLevelM, _, _, _, _, maxPlayersM, _, _, _, _, _, _, minGearLevelM = GetLFGDungeonInfo(base.DungeonMythicID);

		if (minRecLevelM == 0) then
			minRecLevelM = minRecLevel;
		end
		if (maxRecLevelM == 0) then
			maxRecLevelM = maxRecLevel;
		end
	end
	
	if ((typeID and typeID == 2) or (typeIDH and typeIDH == 2) or (typeIDM and typeIDM == 2)) then
		icontext_instance = icontext_raid;
	elseif ((typeID and typeID == 1 and subtypeID == 3) or (typeIDH and typeIDH == 1 and subtypeIDH == 3) or (typeIDM and typeIDM == 1 and subtypeIDM == 3)) then
		icontext_instance = icontext_raid;
	else
		icontext_instance = icontext_dungeon;
	end

	-- Zone Name and Acronym
	local tName = base.ZoneName[1];
	if (base.LargeMap) then
		AtlasFrameLarge.ZoneName.Text:SetText(tName);
	end
	AtlasFrameSmall.ZoneName.Text:SetText(tName);
	AtlasFrame.ZoneName.Text:SetText(tName);
	if (profile.options.frames.showAcronyms and base.Acronym ~= nil) then
		tName = tName.._RED.." ["..base.Acronym.."]";
	end
	AtlasText_ZoneName_Text:SetText(tName);
	
	-- Map Location
	local tLoc = "";
	if (base.Location) then
		tLoc = L["ATLAS_STRING_LOCATION"]..L["Colon"]..WHIT..base.Location[1];
	end
	AtlasText_Location_Text:SetText(tLoc);

	-- Map's Level Range
	local tLR = "";
	if (minLevel or minLevelH or minLevelM) then
		local tmp_LR = L["ATLAS_STRING_LEVELRANGE"]..L["Colon"];
		if (minLevel) then 
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevel);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			if (minLevel ~= maxLevel) then
				tmp_LR = tmp_LR..colortag..minLevel.."-"..maxLevel..icontext_instance;
			else
				tmp_LR = tmp_LR..colortag..minLevel..icontext_instance;
			end
		end
		if (minLevelH) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevelH);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minLevel) then
				slash = L["Slash"];
			else
				slash = "";
			end
			if (minLevelH ~= maxLevelH) then
				tmp_LR = tmp_LR..slash..colortag..minLevelH.."-"..maxLevelH..icontext_heroic;
			else
				tmp_LR = tmp_LR..slash..colortag..minLevelH..icontext_heroic;
			end
		end
		if (minLevelM) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevelM);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minLevelH) then
				slash = L["Slash"];
			else
				slash = "";
			end
			if (minLevelM ~= maxLevelM) then
				tmp_LR = tmp_LR..slash..colortag..minLevelM.."-"..maxLevelM..icontext_mythic;
			else
				tmp_LR = tmp_LR..slash..colortag..minLevelM..icontext_mythic;
			end
		end
		tLR = tmp_LR;
	elseif (base.LevelRange) then
		tLR = L["ATLAS_STRING_LEVELRANGE"]..L["Colon"]..WHIT..base.LevelRange;
	end
	AtlasText_LevelRange_Text:SetText(tLR);

	-- Map's Recommended Level Range
	local tRLR = "";
	if (minRecLevel or minRecLevelH or minRecLevelM) then
		local tmp_RLR = L["ATLAS_STRING_RECLEVELRANGE"]..L["Colon"];
		if (minRecLevel) then 
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minRecLevel);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			if (minRecLevel ~= maxRecLevel) then
				tmp_RLR = tmp_RLR..colortag..minRecLevel.."-"..maxRecLevel..icontext_instance;
			else
				tmp_RLR = tmp_RLR..colortag..minRecLevel..icontext_instance;
			end
		end
		if (minRecLevelH) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minRecLevelH);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minRecLevel) then
				slash = L["Slash"];
			else
				slash = "";
			end
			if (minRecLevelH ~= maxRecLevelH) then
				tmp_RLR = tmp_RLR..slash..colortag..minRecLevelH.."-"..maxRecLevelH..icontext_heroic;
			else
				tmp_RLR = tmp_RLR..slash..colortag..minRecLevelH..icontext_heroic;
			end
		end
		if (minRecLevelM) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minRecLevelM);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minRecLevelH) then
				slash = L["Slash"];
			else
				slash = "";
			end
			if (minRecLevelM ~= maxRecLevelM) then
				tmp_RLR = tmp_RLR..slash..colortag..minRecLevelM.."-"..maxRecLevelM..icontext_mythic;
			else
				tmp_RLR = tmp_RLR..slash..colortag..minRecLevelM..icontext_mythic;
			end
		end
		tRLR = tmp_RLR;
	elseif (base.LevelRange) then
		tRLR = L["ATLAS_STRING_RECLEVELRANGE"]..L["Colon"]..WHIT..base.LevelRange;
	end
	AtlasText_RecommendedRange_Text:SetText(tRLR);

	-- Map's Minimum Level
	local tML = "";
	if (minLevel or minLevelH or minLevelM) then
		tML = L["ATLAS_STRING_MINLEVEL"]..L["Colon"];
		if (minLevel) then 
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevel);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			tML = tML..colortag..minLevel..icontext_instance;
		end
		if (minLevelH) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevelH);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minLevel) then
				slash = L["Slash"];
			else
				slash = "";
			end
			tML = tML..slash..colortag..minLevelH..icontext_heroic;
		end
		if (minLevelM) then
			dungeon_difficulty = Atlas_DungeonDifficultyColor(minLevelM);
			colortag = Atlas_FormatColor(dungeon_difficulty);
			local slash;
			if (minLevelH) then
				slash = L["Slash"];
			else
				slash = "";
			end
			tML = tML..slash..colortag..minLevelM..icontext_mythic;
		end
	elseif (base.MinLevel) then
		tML = L["ATLAS_STRING_MINLEVEL"]..L["Colon"]..WHIT..base.MinLevel;
	end
	AtlasText_MinLevel_Text:SetText(tML);

	-- Player Limit
	local tPL = "";
	if ((maxPlayers and maxPlayers ~= 0) or (maxPlayersH and maxPlayersH ~= 0) or (maxPlayersM and maxPlayersM ~= 0)) then
		tPL = L["ATLAS_STRING_PLAYERLIMIT"]..L["Colon"];
		if (maxPlayers and maxPlayers ~= 0) then 
			tPL = tPL..WHIT..maxPlayers..icontext_instance;
		end
		if (maxPlayersH and maxPlayersH ~= 0) then
			local slash;
			if (maxPlayers) then
				slash = L["Slash"];
			else
				slash = "";
			end
			tPL = tPL..slash..maxPlayersH..icontext_heroic;
		end
		if (maxPlayersM and maxPlayersM ~= 0) then
			local slash;
			if (maxPlayersH) then
				slash = L["Slash"];
			else
				slash = "";
			end
			tPL = tPL..slash..maxPlayersM..icontext_mythic;
		end
	elseif (base.PlayerLimit) then
		tPL = L["ATLAS_STRING_PLAYERLIMIT"]..L["Colon"]..WHIT..base.PlayerLimit;
	end
	AtlasText_PlayerLimit_Text:SetText(tPL);
	
	-- Map's Minimum Gear Level for player
	local tMGL = "";
	local iLFGhasGearInfo = Atlas_CheckInstanceHasGearLevel();

	if (iLFGhasGearInfo ) then
		tMGL = L["ATLAS_STRING_MINGEARLEVEL"]..L["Colon"]
		if ( minGearLevel and minGearLevel ~= 0 ) then 
			local itemDiff, gearcolortag;

			itemDiff = Atlas_GearItemLevelDiff(minGearLevel);
			gearcolortag = Atlas_FormatColor(itemDiff);
			tMGL = tMGL..gearcolortag..minGearLevel..icontext_instance;
		end
		if ( minGearLevelH and minGearLevelH ~= 0 ) then
			local itemDiff, gearcolortag, slash;

			itemDiff = Atlas_GearItemLevelDiff(minGearLevelH);
			gearcolortag = Atlas_FormatColor(itemDiff);
			if ( base.DungeonID and minGearLevel ~= 0 ) then 
				slash = L["Slash"]
			else
				slash = "";
			end
			tMGL = tMGL..WHIT..slash..gearcolortag..minGearLevelH..icontext_heroic;
		end
		if ( minGearLevelM and minGearLevelM ~= 0 ) then
			local itemDiff, gearcolortag, slash;

			itemDiff = Atlas_GearItemLevelDiff(minGearLevelM);
			gearcolortag = Atlas_FormatColor(itemDiff);
			if ( (base.DungeonID and minGearLevel ~= 0) or (base.DungeonHeroicID and minGearLevelH ~= 0) ) then 
				slash = L["Slash"]
			else
				slash = "";
			end
			tMGL = tMGL..WHIT..slash..gearcolortag..minGearLevelM..icontext_mythic;
		end
	else
		if (base.MinGearLevel) then
			local itemDiff, gearcolortag;

			itemDiff = Atlas_GearItemLevelDiff(base.MinGearLevel);
			gearcolortag = Atlas_FormatColor(itemDiff);
			tMGL = L["ATLAS_STRING_MINGEARLEVEL"]..L["Colon"]..gearcolortag..base.MinGearLevel;
		end
	end
	AtlasText_MinGearLevel_Text:SetText(tMGL);

	-- AtlasLoot supports
	addon:EnableAtlasLootButton(base, zoneID);

	-- Check if Journal Encounter Instance is available
	if (base.JournalInstanceID) then
		AtlasFrame.AdventureJournal.instanceID = base.JournalInstanceID;
		AtlasFrameLarge.AdventureJournal.instanceID = base.JournalInstanceID;
		AtlasFrameSmall.AdventureJournal.instanceID = base.JournalInstanceID;
		AtlasFrameAdventureJournalButton:Show();
		AtlasFrameLargeAdventureJournalButton:Show();
		AtlasFrameSmallAdventureJournalButton:Show();
		Atlas_SetEJBackground(base.JournalInstanceID);
	else
		AtlasFrameAdventureJournalButton:Hide();
		AtlasFrameLargeAdventureJournalButton:Hide();
		AtlasFrameSmallAdventureJournalButton:Hide();
		Atlas_SetEJBackground();
	end

	-- Check if WorldMap ID is available, if so, show the map button
	if (base.WorldMapID) then
		AtlasFrame.AdventureJournalMap.mapID = base.WorldMapID;
		AtlasFrameLarge.AdventureJournalMap.mapID = base.WorldMapID;
		AtlasFrameSmall.AdventureJournalMap.mapID = base.WorldMapID;
		AtlasFrameAdventureJournalMapButton:Show();
		AtlasFrameLargeAdventureJournalMapButton:Show();
		AtlasFrameSmallAdventureJournalMapButton:Show();
	else
		AtlasFrameAdventureJournalMapButton:Hide();
		AtlasFrameLargeAdventureJournalMapButton:Hide();
		AtlasFrameSmallAdventureJournalMapButton:Hide();
	end

	-- Check if DungeonLevel ID is available
	if (base.DungeonLevel) then
		AtlasFrame.AdventureJournalMap.dungeonLevel = base.DungeonLevel;
		AtlasFrameLarge.AdventureJournalMap.dungeonLevel = base.DungeonLevel;
		AtlasFrameSmall.AdventureJournalMap.dungeonLevel = base.DungeonLevel;
	end

	if (base.LargeMap) then
		AtlasFrameSizeUpButton:Show();
		AtlasFrameSmallSizeUpButton:Show();
	else
		AtlasFrameSizeUpButton:Hide();
		AtlasFrameSmallSizeUpButton:Hide();
	end
	
	-- Searching for the map path from Atlas or from plugins
	local AtlasMapPath;
	for k, v in pairs(Atlas_CoreMapsKey) do
		-- If selected map is Atlas' core map
		if (zoneID == v) then
			if (base.Module) then
				-- if the map belong to a module, set the path to module
				AtlasMapPath = "Interface\\AddOns\\"..base.Module.."\\Images\\";
			else
				AtlasMapPath = "Interface\\AddOns\\Atlas\\Images\\Maps\\";
			end
			break;
		-- Check if selected map is from plugin
		else
			-- Searching for plugins
			for ka,va in pairs(ATLAS_PLUGINS) do
				-- Searching for plugin's maps
				for kb,vb in pairs(ATLAS_PLUGINS[ka]) do
					if (zoneID == vb) then
						AtlasMapPath = "Interface\\AddOns\\"..ka.."\\Images\\";
						break;
					end
				end
				if (AtlasMapPath) then break; end
			end
		end
		if (AtlasMapPath) then break; end
	end
	AtlasMap:SetTexture(AtlasMapPath..zoneID);
	AtlasMapSmall:SetTexture(AtlasMapPath..zoneID);

	local AtlasMap_Text = _G["AtlasMap_Text"];
	local AtlasMapS_Text = _G["AtlasMapS_Text"];
	if (not AtlasMap_Text) then
		AtlasMap_Text = AtlasFrame:CreateFontString("AtlasMap_Text", "OVERLAY", "GameFontHighlightLarge");
	end
	if (not AtlasMapS_Text) then
		AtlasMapS_Text = AtlasFrameSmall:CreateFontString("AtlasMapS_Text", "OVERLAY", "GameFontHighlightLarge");
	end
	AtlasMap_Text:SetPoint("CENTER", "AtlasFrame", "LEFT", 256, -32);
	AtlasMapS_Text:SetPoint("CENTER", "AtlasFrameSmall", "LEFT", 256, -32);
	-- Check if the map image is available, if not replace with black and Map Not Found text
	if (base.Module) then
		local loadable = select(4, GetAddOnInfo(base.Module));
		local enabled = GetAddOnEnableState(UnitName("player"), base.Module)
		if ((enabled == 0) or (not loadable)) then
			-- AtlasMap:SetTexture(0, 0, 0);
			-- Legion changes: texture:SetTexture(r, g, b, a) changes into texture:SetColorTexture(r, g, b, a)
			AtlasMap:SetColorTexture(0, 0, 0, 0); 
			AtlasMap_Text:SetText(L["MapsNotFound"].."\n\n"..L["PossibleMissingModule"].."\n|cff6666ff"..base.Module);
			AtlasMapSmall:SetColorTexture(0, 0, 0, 0); 
			AtlasMapS_Text:SetText(L["MapsNotFound"].."\n\n"..L["PossibleMissingModule"].."\n|cff6666ff"..base.Module);
			if (not AtlasMap_Text:IsShown()) then
				AtlasMap_Text:Show();
			end
			if (not AtlasMapS_Text:IsShown()) then
				AtlasMapS_Text:Show();
			end
		else 
			AtlasMap_Text:SetText("");
			AtlasMapS_Text:SetText("");
		end
	else
		AtlasMap_Text:SetText("");
		AtlasMapS_Text:SetText("");
	end

	-- Large Atlas map
	if (base.LargeMap) then
		for i=1, 12 do
			_G["AtlasMapLarge"..i]:SetTexture(AtlasMapPath..zoneID.."\\"..base.LargeMap..i);
		end
	end

	-- The boss description to be added here
	Atlas_MapAddNPCButton();
	Atlas_MapAddNPCButtonLarge();
	--Atlas_Clear_NPC_Button();
end

-- Refreshes the Atlas frame, usually because a new map needs to be displayed
-- The zoneID variable represents the internal name used for each map, ex: "BlackfathomDeeps"
-- Also responsible for updating all the text when a map is changed
function Atlas_Refresh(mapID)
	local zoneID = mapID or ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	if (not zoneID) then
		return;
	end
	local data = AtlasMaps;
	local base = data[zoneID];
	if (not base) then
		return;
	end

	-- Dealing with the scenario that when user is in a large map, but then the newly selected map does not have large map
	if (not base.LargeMap and AtlasFrameLarge:IsVisible() ) then
		if (ATLAS_SMALLFRAME_SELECTED) then
			HideUIPanel(AtlasFrameLarge);
			ShowUIPanel(AtlasFrameSmall);
		else
			HideUIPanel(AtlasFrameLarge);
			ShowUIPanel(AtlasFrame);
		end
	end
	
	if (AtlasEJLootFrame:IsShown()) then
		AtlasEJLootFrame:Hide();
	end
	Atlas_MapRefresh();
	
	ATLAS_DATA = base;
	ATLAS_SEARCH_METHOD = data.Search;

	if ( data.Search == nil ) then
		ATLAS_SEARCH_METHOD = Atlas_SimpleSearch;
	end
	
	if ( data.Search ~= false ) then
		AtlasSearchEditBox:Show();
		AtlasNoSearch:Hide();
	else
		AtlasSearchEditBox:Hide();
		AtlasNoSearch:Show();
		ATLAS_SEARCH_METHOD = nil;
	end

	-- Populate the scroll frame entries list, the update func will do the rest
	Atlas_Search("");
	AtlasSearchEditBox:SetText("");
	AtlasSearchEditBox:ClearFocus();

	-- Create and align any new entry buttons that we need
	for i = 1, ATLAS_CUR_LINES do
		if (not _G["AtlasEntry"..i]) then
			local f = CreateFrame("Button", "AtlasEntry"..i, AtlasFrame, "AtlasEntryTemplate");
			if i == 1 then
				f:SetPoint("TOPLEFT", "AtlasScrollBar", "TOPLEFT", 16, -2);
			else
				f:SetPoint("TOPLEFT", "AtlasEntry"..(i - 1), "BOTTOMLEFT");
			end
		end
	end

	Atlas_ScrollBar_Update();

	-- Deal with the switch to entrance/instance button here
	-- Only display if appropriate
	-- See if we should display the button or not, and decide what it should say
	local matchFound = {};
	local isEntrance = false;
	for k, v in pairs(Atlas_EntToInstMatches) do
		if (k == zoneID) then
			matchFound = v;
			isEntrance = false;
			break;
		end
	end
	if (not matchFound[1]) then
		for k, v in pairs(Atlas_InstToEntMatches) do
			if (k == zoneID) then
				matchFound = v;
				isEntrance = true;
				break;
			end
		end
	end
	-- Below try to add the series maps into switch button's map list
	if (not matchFound[1]) then
		for k, v in pairs(Atlas_MapSeries) do
			if (k == zoneID) then
				matchFound = v;
				isEntrance = false;
				break;
			end
		end
	end

	-- Set the button's text, populate the dropdown menu, and show or hide the button
	if (matchFound[1]) then
		ATLAS_INST_ENT_DROPDOWN = {};
		for k, v in pairs(matchFound) do
			tinsert(ATLAS_INST_ENT_DROPDOWN, v);
		end
		tsort(ATLAS_INST_ENT_DROPDOWN, AtlasSwitchDD_Sort);
		if (isEntrance) then
			AtlasSwitchButton:SetText(ATLAS_ENTRANCE_BUTTON);
		else
			AtlasSwitchButton:SetText(ATLAS_INSTANCE_BUTTON);
		end
		AtlasSwitchButton:Show();
		L_UIDropDownMenu_Initialize(AtlasSwitchDD, AtlasSwitchDD_OnLoad);
	else
		AtlasSwitchButton:Hide();
	end

	-- Handle the Prev / Next Map buttons' showing or hiding
	if (base.NextMap) then
		AtlasFrame.NextMap:Show();
		AtlasFrame.NextMap.mapID = base.NextMap;

		AtlasFrameSmall.NextMap:Show();
		AtlasFrameSmall.NextMap.mapID = base.NextMap;
	else
		AtlasFrame.NextMap:Hide();
		AtlasFrameSmall.NextMap:Hide();
	end
	if (base.PrevMap) then
		AtlasFrame.PrevMap:Show();
		AtlasFrame.PrevMap.mapID = base.PrevMap;

		AtlasFrameSmall.PrevMap:Show();
		AtlasFrameSmall.PrevMap.mapID = base.PrevMap;
	else
		AtlasFrame.PrevMap:Hide();
		AtlasFrameSmall.PrevMap:Hide();
	end
	
end

-- Modifies the value of GetRealZoneText to account for some naming conventions
-- Always use this function instead of GetRealZoneText within Atlas
local function Atlas_GetFixedZoneText()
	local currentZone = GetRealZoneText();
	if (AtlasZoneSubstitutions[currentZone]) then
		return AtlasZoneSubstitutions[currentZone];
	end
	return currentZone;
end 

-- Checks the player's current location against all Atlas maps
-- If a match is found display that map right away
-- update for Outland zones contributed by Drahcir
-- 3/23/08 now takes SubZones into account as well
function Atlas_AutoSelect()
	local currentZone = Atlas_GetFixedZoneText();
	local currentSubZone = GetSubZoneText();
	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
--[[
	local factionGroup = UnitFactionGroup("player");
	if ( factionGroup and factionGroup ~= "Neutral" ) then
		if ( factionGroup == "Alliance" ) then
			
		elseif ( factionGroup == "Horde" ) then
			
		end
	end
]]
	debug("Using auto-select to open the best map.");

	-- Check if the current zone is defined in AssocDefaults table
	-- If yes, means there could be multiple maps for this zone
	-- And we will choose a proper one to be the default one.
	debug("currentZone: "..currentZone..", currentSubZone: "..currentSubZone);
	if (Atlas_AssocDefaults[currentZone]) then
		debug("currentZone: "..currentZone.." matched the one defined in Atlas_AssocDefaults{}.");
		local selected_map;
		if (Atlas_SubZoneData[currentZone]) then
			for k_instance_map, v_instance_map in pairs(Atlas_SubZoneData[currentZone]) do
				for k_subzone, v_subzone in pairs(Atlas_SubZoneData[currentZone][k_instance_map]) do
					if (v_subzone == currentSubZone) then
						selected_map = k_instance_map;
						debug("currentSubZone: "..currentSubZone.." matched found, now we will use map: \""..selected_map.."\" for instance: "..currentZone);
						break;
					end
				end
				if (selected_map) then break; end
			end
		end
		if (not selected_map) then
			debug("No subzone matched, now checking if we should specify a default map.");
			if (currentZone == Atlas_SubZoneAssoc[zoneID]) then
				debug("You're in the same instance as the former map. Doing nothing.");
				return;
			else
				selected_map = Atlas_AssocDefaults[currentZone];
				debug("We will use the map: "..selected_map.." for the current zone: "..currentZone..".");
			end
		end
		debug("Selecting the map...");
		for k_DropDownType, v_DropDownType in pairs(ATLAS_DROPDOWNS) do
			for k_DropDownZone, v_DropDownZone in pairs(v_DropDownType) do         
				if (selected_map == v_DropDownZone) then
					profile.options.dropdowns.module = k_DropDownType;
					profile.options.dropdowns.zone = k_DropDownZone;
					Atlas_Refresh();
					debug("Map selected! Type: "..k_DropDownType..", Zone: "..k_DropDownZone..", "..zoneID);
					return;
				end
			end
		end
	else
		debug("SubZone data isn't relevant here. Checking if it's outdoor zone.");
		if (Atlas_OutdoorZoneToAtlas[currentZone]) then
			debug("This world zone "..currentZone.." is associated with a map.");
			for k_DropDownType, v_DropDownType in pairs(ATLAS_DROPDOWNS) do
				for k_DropDownZone, v_DropDownZone in pairs(v_DropDownType) do         
					if (Atlas_OutdoorZoneToAtlas[currentZone] == v_DropDownZone) then
						profile.options.dropdowns.module = k_DropDownType;
						profile.options.dropdowns.zone = k_DropDownZone;
						Atlas_Refresh();
						debug("Map changed to the associated map: "..zoneID);
						return;
					end
				end
			end
			debug("Checking if instance/entrance pair can be found.");
		elseif (Atlas_InstToEntMatches[zoneID]) then
			for ka, va in pairs(Atlas_InstToEntMatches[zoneID]) do
				if (currentZone == AtlasMaps[va].ZoneName[1]) then
					debug("Instance/entrance pair found. Doing nothing.");
					return;
				end
			end
		elseif (Atlas_EntToInstMatches[zoneID]) then
			for ka, va in pairs(Atlas_EntToInstMatches[zoneID]) do
				if (currentZone == AtlasMaps[va].ZoneName[1]) then
					debug("Instance/entrance pair found. Doing nothing.");
					return;
				end
			end
		end
		debug("Searching through all maps for a ZoneName match.");
		for k_DropDownType, v_DropDownType in pairs(ATLAS_DROPDOWNS) do
			for k_DropDownZone, v_DropDownZone in pairs(v_DropDownType) do         
				-- Compare the currentZone to the new substr of ZoneName
				if (currentZone == strsub(AtlasMaps[v_DropDownZone].ZoneName[1], strlen(AtlasMaps[v_DropDownZone].ZoneName[1]) - strlen(currentZone) + 1)) then
					profile.options.dropdowns.module = k_DropDownType;
					profile.options.dropdowns.zone = k_DropDownZone;
					Atlas_Refresh();
					debug("Found a match. Map has been changed.");
					return;
				end
			end
		end
	end
	debug("Nothing changed because no match was found.");
end

function Atlas_DungeonMinGearLevelToolTip(self)
	local currGearLevel = GetAverageItemLevel();
	local str = format(ITEM_LEVEL, currGearLevel);

	local zoneID = ATLAS_DROPDOWNS[profile.options.dropdowns.module][profile.options.dropdowns.zone];
	if (not zoneID) then
		return;
	end
	local data = AtlasMaps;
	local base = data[zoneID];

	if (Atlas_CheckInstanceHasGearLevel() or base.MinGearLevel) then
		GameTooltip:SetOwner(self, "ANCHOR_TOP");
		GameTooltip:SetBackdropColor(0, 0, 0, 1 * profile.options.frames.alpha);
		GameTooltip:SetText(str, 1, 1, 1, nil, 1);
		GameTooltip:AddLine(STAT_AVERAGE_ITEM_LEVEL_TOOLTIP)
		GameTooltip:SetScale(profile.options.frames.boss_description_scale * profile.options.frames.scale);
		GameTooltip:Show();
	end
end

-- In Development, this could be fun
function Atlas_SetEJBackground(instanceID)
--[[	local f = _G["AtlasEJBackground"];
	if (not f) then
		f = CreateFrame("Frame", "AtlasEJBackground", AtlasFrame);
	end
	f:ClearAllPoints();
	f:SetWidth(625);
	f:SetHeight(471);
	f:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 530, -85);
	--f:SetPoint("TOPLEFT", "AtlasFrame", "TOPLEFT", 550, -220);
	if (instanceID) then
		local t = f:CreateTexture(nil,"BACKGROUND");
		local name, description, bgImage, buttonImage, loreImage, dungeonAreaMapID, link = EJ_GetInstanceInfo(instanceID)
		t:SetTexture(bgImage);
		t:SetTexCoord(0.1, 0.7, 0.1, 0.7)
		t:SetAllPoints();
		f.Texture = t;
		f:Show()
	else
		local t = f:CreateTexture(nil,"BACKGROUND");
		t:SetTexture(nil);
		t:SetAllPoints();
		f.Texture = t;
		--f:Hide()
		t:SetColorTexture(0.5, 0.5, 0.5, 0.5);
	end
]]
end

