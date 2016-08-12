
local AddonName, HubData = ...;
local LocalVars = TidyPlatesHubDefaults


-- CachedUnitDescription, CachedUnitGuild, GetLevelDescription

------------------------------------------------------------------
-- References
------------------------------------------------------------------
local GetAggroCondition = TidyPlatesWidgets.GetThreatCondition
local IsFriend = TidyPlatesUtility.IsFriend
local IsGuildmate = TidyPlatesUtility.IsGuildmate
local IsTankedByAnotherTank = function() return false end
local IsTankingAuraActive = function() return false end
local InCombatLockdown = InCombatLockdown
local GetFriendlyClass = HubData.Functions.GetFriendlyClass
local GetEnemyClass = HubData.Functions.GetEnemyClass
local StyleDelegate = TidyPlatesHubFunctions.SetStyleNamed
local ColorFunctionByHealth = HubData.Functions.ColorFunctionByHealth
local CachedUnitDescription = TidyPlatesUtility.CachedUnitDescription
local CachedUnitGuild = TidyPlatesUtility.CachedUnitGuild
local CachedUnitClass = TidyPlatesUtility.CachedUnitClass

local AddHubFunction = TidyPlatesHubHelpers.AddHubFunction

local function DummyFunction() end

-- Colors
local White = {r = 1, g = 1, b = 1}
local WhiteColor = { r = 250/255, g = 250/255, b = 250/255, }


------------------------------------------------------------------------------
-- Optional/Health Text
------------------------------------------------------------------------------


local function GetLevelDescription(unit)
	local description = ""
	description = "等級 "..unit.level
	if unit.isElite then description = description.." (精英)" end
	return description
end


local arenaUnitIDs = {"arena1", "arena2", "arena3", "arena4", "arena5"}

local function GetArenaIndex(unitname)
	-- Kinda hackish.  would be faster to cache the arena names using event handler.  later!
	if IsActiveBattlefieldArena() then
		local unitid, name
		for i = 1, #arenaUnitIDs do
			unitid = arenaUnitIDs[i]
			name = UnitName(unitid)
			if name and (name == unitname) then return i end
		end
	end
end


local function ShortenNumber(number)
	if not number then return "" end

	if number > 10000000 then
		return (ceil((number/1000000))/10).." 千萬"
	elseif number > 1000000 then
		return (ceil((number/100000))/10).." 百萬"
	elseif number > 10000 then
		return (ceil((number/1000))/10).." 萬"
	elseif number > 1000 then
		return (ceil((number/100))/10).." 千"
	else
		return number
	end
end

local function SepThousands(number)
	if not number then return "" end
	local n = tonumber(number) 

	local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)')
	return left..(num:reverse():gsub('(%d%d%d)', '%1,'):reverse())..right
end


local function TextFunctionMana(unit)
	if unit.isTarget then
		local power = ceil((UnitPower("target") / UnitPowerMax("target"))*100)
		--local r, g, b = UnitPowerType("target")
		--local powername = getglobal(select(2, UnitPowerType("target")))
		--if power and power > 0 then	return power.."% "..powername end
		local powertype = select(2,UnitPowerType("target"))
		local powercolor = PowerBarColor[powertype]
		local powername = getglobal(powertype)
		---print(power, powertype, powercolor, powercolor.r, powercolor.g, powercolor.b)
		if power and power > 0 then return power.."% "..powername, powercolor.r, powercolor.g, powercolor.b, 1 end
	end
end

local function GetHealth(unit)
	--if unit.healthmaxCached then 
		return unit.health
	--else return nil end
end

local function GetHealthMax(unit)
	--if unit.healthmaxCached then 
		return unit.healthmax
	--else return nil end
end

-- None
local function HealthFunctionNone() return "" end

-- Percent
local function TextHealthPercentColored(unit)
	local color = ColorFunctionByHealth(unit)
	return ceil(100*(unit.health/unit.healthmax)).."%", color.r, color.g, color.b, .7
end

local function HealthFunctionPercent(unit)
	if unit.health < unit.healthmax then
		return TextHealthPercentColored(unit)
	else return "" end
end

-- Actual
local function HealthFunctionExact(unit)
	return SepThousands(GetHealth(unit))
end
-- Approximate
local function HealthFunctionApprox(unit)
	return ShortenNumber(GetHealth(unit))
end
-- Approximate
local function HealthFunctionApproxAndPercent(unit)
	local color = ColorFunctionByHealth(unit)
	return HealthFunctionApprox(unit).."  ("..ceil(100*(unit.health/unit.healthmax)).."%)", color.r, color.g, color.b, .7
end
--Deficit
local function HealthFunctionDeficit(unit)
	local health, healthmax = GetHealth(unit), GetHealthMax(unit)
	if health and healthmax and (health ~= healthmax) then return "-"..SepThousands(healthmax - health) end
end
-- Total and Percent
local function HealthFunctionTotal(unit)
	local color = ColorFunctionByHealth(unit)
	--local color = White
	local health, healthmax = GetHealth(unit), GetHealthMax(unit)
	return ShortenNumber(health).."|cffffffff ("..ceil(100*(unit.health/unit.healthmax)).."%)", color.r, color.g, color.b
end
-- TargetOf
local function HealthFunctionTargetOf(unit)
	if unit.reaction ~= "FRIENDLY" and unit.isInCombat then 
		return UnitName(unitid.."target")
	end
	--[[
	if unit.isTarget then return UnitName("targettarget")
	elseif unit.isMouseover then return UnitName("mouseovertarget")
	else return "" end
	--]]
end
-- Level
local function HealthFunctionLevel(unit)
	local level = unit.level
	if unit.isElite then level = level.." (精英)" end
	return level, unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue, .9
end

-- Level and Health
local function HealthFunctionLevelHealth(unit)
	local level = unit.level
	if unit.isElite then level = level.."E" end
	return "("..level..") |cffffffff"..HealthFunctionApprox(unit), unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue, .9
	--return "|cffffffff"..HealthFunctionApprox(unit).."  |r"..level, unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue, .9
end


-- Arena Vitals (ID, Mana, Health
local function HealthFunctionArenaID(unit)
	local localid
	local powercolor = White
	local powerstring = ""
	local arenastring = ""
	local arenaindex = GetArenaIndex(unit.rawName)

	--arenaindex = 2	-- Tester
	if unit.type == "PLAYER" then

		if arenaindex and arenaindex > 0 then
			arenastring = "|cffffcc00["..(tostring(arenaindex)).."]  |r"
		end


		if unit.isTarget then localid = "target"
		elseif unit.isMouseover then localid = "mouseover"
		end


		if localid then
			local power = ceil((UnitPower(localid) / UnitPowerMax(localid))*100)
			local powerindex, powertype = UnitPowerType(localid)

			--local powername = getglobal(powertype)

			if power and power > 0 then
				powerstring = "  "..power.."%"		--..powername
				powercolor = PowerBarColor[powerindex] or White
			end
		end
	end

	local healthstring = "|cffffffff"..tostring(ceil(unit.health/10000)).."萬|cff0088ff"

--[[
-- Test Strings
	powerstring = "  ".."43".."%"
	--arenastring = "|cffffcc00["..(tostring(2)).."]  |r"
	arenastring = "|cffffcc00#"..(tostring(2)).."  |r"
	powercolor = PowerBarColor[2]
--]]

	--	return '4'.."|r"..(powerstring or "")
	return arenastring..healthstring..powerstring, powercolor.r, powercolor.g, powercolor.b, 1

	--[[
	Arena ID, HealthFraction, ManaPercent
	#1  65%  75%

	Arena ID, HealthK, ManaFraction
	#2  300k  75%

	--]]
end


local HealthTextModesCustom = {}


--[[
local hexChars = {
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
}


local function intToHex(num)
	--local sig, sep
	--sig = fmod(num, 16)
	sep = num - sig*16
	return hexChars[sig]..hexChars[sep]
end

--]]


-- Custom
local function HealthFunctionCustom(unit)

	local LeftText, RightText, CenterText = "", "", ""

	--HealthTextModesCustom[LocalVars.StatusTextLeft]


	return LeftText, RightText, CenterText
	--if LocalVars.CustomHealthFunction then return LocalVars.CustomHealthFunction(unit) end

	--HealthTextModesCustom(mode, addColor)

	--[[
	FriendlyStatusTextMode
	FriendlyStatusTextModeCenter
	FriendlyStatusTextModeRight

	EnemyStatusTextMode
	EnemyStatusTextModeCenter
	EnemyStatusTextModeRight
	--]]


	--[[
	StatusTextLeft = 8,
	StatusTextCenter = 5,
	StatusTextRight = 7,

	StatusTextLeftColor = true,
	StatusTextCenterColor = true,
	StatusTextRightColor = true,

	--]]
end

local HealthTextModeFunctions = {}


TidyPlatesHubDefaults.FriendlyStatusTextMode = "HealthFunctionNone"
TidyPlatesHubDefaults.EnemyStatusTextMode = "HealthFunctionNone"

AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionNone, "無", "HealthFunctionNone")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionPercent, "血量百分比", "HealthFunctionPercent")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionExact, "實際血量", "HealthFunctionExact")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionApprox, "近似血量", "HealthFunctionApprox")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionDeficit, "失去血量", "HealthFunctionDeficit")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionTotal, "血量總量 & 百分比", "HealthFunctionTotal")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionTargetOf, "目標屬於誰", "HealthFunctionTargetOf")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionLevel, "等級", "HealthFunctionLevel")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionLevelHealth, "等級和近似血量", "HealthFunctionLevelHealth")
AddHubFunction(HealthTextModeFunctions, TidyPlatesHubMenus.TextModes, HealthFunctionArenaID, "光環ID、血量和能量值", "HealthFunctionArenaID")


local function HealthTextDelegate(unit)

	local func
	local mode = 1
	local showText = not (LocalVars.TextShowOnlyOnTargets or LocalVars.TextShowOnlyOnActive)

	if unit.reaction == "FRIENDLY" then mode = LocalVars.FriendlyStatusTextMode
	else mode = LocalVars.EnemyStatusTextMode end

	func = HealthTextModeFunctions[mode] or DummyFunction

	if LocalVars.TextShowOnlyOnTargets then
		if (unit.isTarget or unit.isMouseover or unit.isMarked) then showText = true end
	end

	if LocalVars.TextShowOnlyOnActive then
		if (unit.isMarked) or (unit.threatValue > 0) or (unit.health < unit.healthmax) then showText = true end
	end

	if showText then return func(unit) end
end



------------------------------------------------------------------------------------
-- Binary/Headline Text Styles
------------------------------------------------------------------------------------
local function RoleOrGuildText(unit)
	if unit.type == "NPC" then
		return (CachedUnitDescription(unit.name) or GetLevelDescription(unit) or "") , 1, 1, 1, .70
	end
end

-- Role, Guild or Level
local function TextRoleGuildLevel(unit)
	local description
	local r, g, b = 1,1,1

	if unit.type == "NPC" then
		description = CachedUnitDescription(unit.name)

		if not description then --  and unit.reaction ~= "FRIENDLY" then
			description =  GetLevelDescription(unit)
			r, g, b = unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue
		end

	elseif unit.type == "PLAYER" then
		description = GetGuildInfo(unit.unitid)
		r, g, b = .7, .7, .9
	end

	return description, r, g, b, .70
end

-- Role or Guild
local function TextRoleGuild(unit)
	local description
	local r, g, b = 1,1,1

	if unit.type == "NPC" then
		description = CachedUnitDescription(unit.name)

	elseif unit.type == "PLAYER" then
		description = GetGuildInfo(unit.unitid)
		--description = CachedUnitGuild(unit.name)
		r, g, b = .7, .7, .9
	end

	return description, r, g, b, .70
end

-- NPC Role
local function TextNPCRole(unit)
	if unit.type == "NPC" then
		return CachedUnitDescription(unit.name)
	end
end

-- Level
local function TextLevelColored(unit)
	--return GetLevelDescription(unit) , 1, 1, 1, .70
	return GetLevelDescription(unit) , unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue, .70
end

-- Guild, Role, Level, Health
function TextAll(unit)
	-- local color = ColorFunctionByHealth(unit) --6.0
	local color = White
	if unit.health < unit.healthmax then
		return ceil(100*(unit.health/unit.healthmax)).."%", color.r, color.g, color.b, .7
	else
		--return GetLevelDescription(unit) , unit.levelcolorRed, unit.levelcolorGreen, unit.levelcolorBlue, .7
		return TextRoleGuildLevel(unit)
	end
end


local EnemyNameSubtextFunctions = {}
TidyPlatesHubMenus.EnemyNameSubtextModes = {}
TidyPlatesHubDefaults.HeadlineEnemySubtext = "RoleGuildLevel"
TidyPlatesHubDefaults.HeadlineFriendlySubtext = "RoleGuildLevel"
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, DummyFunction, "無", "None")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextHealthPercentColored, "血量百分比", "PercentHealth")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextRoleGuildLevel, "角色、公會或等級", "RoleGuildLevel")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextRoleGuild, "角色或公會", "RoleGuild")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextNPCRole, "NPC角色", "Role")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextLevelColored, "等級", "Level")
AddHubFunction(EnemyNameSubtextFunctions, TidyPlatesHubMenus.EnemyNameSubtextModes, TextAll, "角色、公會、等級或血量百分比", "RoleGuildLevelHealth")

--[[
local FriendlyNameSubtextFunctions = {}
TidyPlatesHubMenus.FriendlyNameSubtextModes = {}
TidyPlatesHubDefaults.HeadlineFriendlySubtext = "None"
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, DummyFunction, "無", "None")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextHealthPercentColored, "血量百分比", "PercentHealth")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextRoleGuildLevel, "角色、公會或等級", "RoleGuildLevel")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextRoleGuild, "角色或公會", "RoleGuild")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextNPCRole, "NPC角色", "Role")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextLevelColored, "等級", "Level")
AddHubFunction(FriendlyNameSubtextFunctions, TidyPlatesHubMenus.FriendlyNameSubtextModes, TextAll, "角色、公會、等級或血量百分比", "RoleGuildLevelHealth")
--]]

local function CustomTextBinaryDelegate(unit)
	--if unit.style == "NameOnly" then

	if StyleDelegate(unit) == "NameOnly" then
		local func
		if unit.reaction == "FRIENDLY" then
			func = EnemyNameSubtextFunctions[LocalVars.HeadlineFriendlySubtext or 0] or DummyFunction
		else
			func = EnemyNameSubtextFunctions[LocalVars.HeadlineEnemySubtext or 0] or DummyFunction
		end

		return func(unit)
	end
	return HealthTextDelegate(unit)
end



------------------------------------------------------------------------------
-- Local Variable
------------------------------------------------------------------------------

local function OnVariableChange(vars) LocalVars = vars end
HubData.RegisterCallback(OnVariableChange)


------------------------------------------------------------------------------
-- Add References
------------------------------------------------------------------------------



TidyPlatesHubFunctions.SetCustomText = HealthTextDelegate
TidyPlatesHubFunctions.SetCustomTextBinary = CustomTextBinaryDelegate
