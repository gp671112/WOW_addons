
local AddonName, HubData = ...;
local LocalVars = TidyPlatesHubDefaults


------------------------------------------------------------------------------
-- References
------------------------------------------------------------------------------
local InCombatLockdown = InCombatLockdown
local GetAggroCondition = TidyPlatesWidgets.GetThreatCondition
local IsTankedByAnotherTank = TidyPlatesWidgets.IsTankedByAnotherTank
local IsTankingAuraActive = TidyPlatesWidgets.IsPlayerTank
local IsHealer = function() return false end
local IsAuraShown = function() return false end
local UnitFilter = TidyPlatesHubFunctions.UnitFilter
local function DummyFunction() end

------------------------------------------------------------------------------
-- Opacity / Alpha
------------------------------------------------------------------------------

-- By Low Health
local function AlphaFunctionByLowHealth(unit)
	if unit.health/unit.healthmax < LocalVars.LowHealthThreshold then return LocalVars.OpacitySpotlight end
end

-- By Threat (High)
local function AlphaFunctionByThreatHigh (unit)
	if InCombatLockdown() and unit.reaction ~= "FRIENDLY" then
		if unit.threatValue > 1 and unit.health > 0 then return LocalVars.OpacitySpotlight end
	elseif LocalVars.ColorShowPartyAggro and unit.reaction == "FRIENDLY" then
		if GetAggroCondition(unit.rawName) then return LocalVars.OpacitySpotlight end
	end
end

-- Tank Mode
local function AlphaFunctionByThreatLow (unit)
	if InCombatLockdown() and unit.reaction ~= "FRIENDLY" then
		if IsTankedByAnotherTank(unit) then return end
		if unit.threatValue < 2 and unit.health > 0 then return LocalVars.OpacitySpotlight end
	elseif LocalVars.ColorShowPartyAggro and unit.reaction == "FRIENDLY" then
		if GetAggroCondition(unit.rawName) then return LocalVars.OpacitySpotlight end
	end
end

local function AlphaFunctionByMouseover(unit)
	if unit.isMouseover then return LocalVars.OpacitySpotlight end
end

local function AlphaFunctionByEnemy(unit)
	if unit.reaction ~= "FRIENDLY" then return LocalVars.OpacitySpotlight end
end

local function AlphaFunctionByNPC(unit)
	if unit.type == "NPC" then return LocalVars.OpacitySpotlight end
end

local function AlphaFunctionByRaidIcon(unit)
	if unit.isMarked then return LocalVars.OpacitySpotlight end
end

local function AlphaFunctionByActive(unit)
	if (unit.health < unit.healthmax) or (unit.threatValue > 1) or unit.isInCombat or unit.isMarked then return LocalVars.OpacitySpotlight end
end

local function AlphaFunctionByActiveAuras(unit)
	local widget = unit.frame.widgets.DebuffWidget
	--local widget = TidyPlatesWidgets.GetAuraWidgetByGUID(unit.guid)
	if IsAuraShown(widget) then return LocalVars.OpacitySpotlight end
end

-- By Enemy Healer
local function AlphaFunctionByEnemyHealer(unit)
	if unit.reaction == "HOSTILE" and unit.type == "PLAYER" then
		--if TidyPlatesCache and TidyPlatesCache.HealerListByName[unit.rawName] then
		if IsHealer(unit.rawName) then
			return LocalVars.OpacitySpotlight
		end
	end
end

-- By Threat (Auto Detect)
local function AlphaFunctionByThreat(unit)
		if unit.reaction == "NEUTRAL" and unit.threatValue < 2 then return AlphaFunctionByThreatHigh(unit) end

		if (LocalVars.ThreatWarningMode == "Auto" and IsTankingAuraActive())
			or LocalVars.ThreatWarningMode == "Tank" then
				return AlphaFunctionByThreatLow(unit)	-- tank mode
		else return AlphaFunctionByThreatHigh(unit) end
end


local function AlphaFunctionGroupMembers(unit)
	local class = TidyPlatesUtility.GroupMembers.Class[unit.name]
	if class then return LocalVars.OpacitySpotlight end
end


local function AlphaFunctionByPlayers(unit)
	if unit.type == "PLAYER" then return LocalVars.OpacitySpotlight end
end



--  Hub functions
local AddHubFunction = TidyPlatesHubHelpers.AddHubFunction

local AlphaFunctionsEnemy = {}

TidyPlatesHubDefaults.EnemyAlphaSpotlightMode = "ByThreat"			-- Sets the default function
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, DummyFunction, "無", "None")
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByThreat, "仇恨值", "ByThreat")
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByLowHealth, "低血量單位", "OnLowHealth")
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByNPC, "NPC", "OnNPC")
--AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByActiveAuras, "啟用中的光環", "OnActiveAura")
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByEnemyHealer, "敵方治療者", "OnEnemyHealer")
AddHubFunction(AlphaFunctionsEnemy, TidyPlatesHubMenus.EnemyOpacityModes, AlphaFunctionByActive, "仇恨/受攻擊對象", "OnActiveUnits")


local AlphaFunctionsFriendly = {}

TidyPlatesHubDefaults.FriendlyAlphaSpotlightMode = "None"			-- Sets the default function
AddHubFunction(AlphaFunctionsFriendly, TidyPlatesHubMenus.FriendlyOpacityModes, DummyFunction, "無", "None")
AddHubFunction(AlphaFunctionsFriendly, TidyPlatesHubMenus.FriendlyOpacityModes, AlphaFunctionByLowHealth, "低血量單位", "OnLowHealth")
AddHubFunction(AlphaFunctionsFriendly, TidyPlatesHubMenus.FriendlyOpacityModes, AlphaFunctionGroupMembers, "隊伍成員", "OnGroupMembers")
AddHubFunction(AlphaFunctionsFriendly, TidyPlatesHubMenus.FriendlyOpacityModes, AlphaFunctionByPlayers, "玩家", "OnPlayers")
AddHubFunction(AlphaFunctionsFriendly, TidyPlatesHubMenus.FriendlyOpacityModes, AlphaFunctionByActive, "仇恨/受攻擊對象", "OnActiveUnits")



-- Alpha Functions Listed by Role order: Damage, Tank, Heal
local AlphaFunctions = {AlphaFunctionsDamage, AlphaFunctionsTank}

local function Diminish(num)
	if num == 1 then return 1
	elseif num < .3 then return num*.60
	elseif num < .6 then return num*.70
	else return num * .80 end
end

local function AlphaDelegate(...)
	local unit = ...
	local alpha

	if LocalVars.UnitSpotlightOpacityEnable and LocalVars.UnitSpotlightLookup[unit.name] then
		return LocalVars.UnitSpotlightOpacity
	end

	if unit.isTarget then return Diminish(LocalVars.OpacityTarget)
	elseif unit.isCasting and unit.reaction == "HOSTILE" and LocalVars.OpacitySpotlightSpell then alpha = LocalVars.OpacitySpotlight
	elseif unit.isMouseover and LocalVars.OpacitySpotlightMouseover then alpha = LocalVars.OpacitySpotlight
	elseif unit.isMarked and LocalVars.OpacitySpotlightRaidMarked then alpha = LocalVars.OpacitySpotlight

	else
		-- Filter
		if UnitFilter(unit) then alpha = LocalVars.OpacityFiltered
		-- Spotlight
		else
			local func = DummyFunction

			if unit.reaction == "FRIENDLY" then
				func = AlphaFunctionsFriendly[LocalVars.FriendlyAlphaSpotlightMode or TidyPlatesHubDefaults.FriendlyAlphaSpotlightMode] or func
			else
				func = AlphaFunctionsEnemy[LocalVars.EnemyAlphaSpotlightMode or TidyPlatesHubDefaults.EnemyAlphaSpotlightMode] or func
			end

			alpha = func(...)
		end
	end


	if alpha then return Diminish(alpha)
	else
		if (not UnitExists("target")) and LocalVars.OpacityFullNoTarget then return Diminish(LocalVars.OpacityTarget)
		else return Diminish(LocalVars.OpacityNonTarget) end
	end
end

------------------------------------------------------------------------------
-- Local Variable
------------------------------------------------------------------------------

local function OnVariableChange(vars) LocalVars = vars end
HubData.RegisterCallback(OnVariableChange)


------------------------------------------------------------------------------
-- Add References
------------------------------------------------------------------------------
TidyPlatesHubFunctions.SetAlpha = AlphaDelegate
