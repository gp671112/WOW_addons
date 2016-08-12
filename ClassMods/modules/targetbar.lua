--
-- ClassMods - target bar module
--

local L = LibStub("AceLocale-3.0"):GetLocale("ClassMods")
local UnitHealthMax, UnitHealth = UnitHealthMax, UnitHealth

local function getTargetBarColor(incPrediction)
	local health = UnitHealth("target")
	local maxHealth = UnitHealthMax("target")
	local barColor = ClassMods.db.profile.targetbar.barcolor

	if (health > 0) then
		if (not incPrediction) then incPrediction = 0 end

		if ClassMods.db.profile.targetbar.classcolored then
			local targetClass = select(2, UnitClassBase("target"))
			barColor = { RAID_CLASS_COLORS[targetClass].r, RAID_CLASS_COLORS[targetClass].g, RAID_CLASS_COLORS[targetClass].b, 1 }
		end
		if ClassMods.db.profile.targetbar.lowwarn and ( ((health + incPrediction) / maxHealth) <= ClassMods.db.profile.targetbar.lowwarnthreshold) then
			barColor = ClassMods.db.profile.targetbar.barcolorlow
		end
	end
	return barColor
end

function ClassMods.updateIncomingHealsTarget()
	local newPrediction1 = 0
	local health = UnitHealth("target")
	local maxHealth = UnitHealthMax("target")
	local barColor1 = getTargetBarColor(newPrediction1)

	if ClassMods.db.profile.targetbar.incomingheals then
		newPrediction1 = UnitGetIncomingHeals("target") or 0
		ClassMods.F.TargetBar.IncomingHeals:SetStatusBarColor(barColor1[1], barColor1[2], barColor1[3], 1)
		if (newPrediction1 ~= 0) and (not UnitIsDeadOrGhost("target") ) then
			if (health + newPrediction1) > maxHealth then
				ClassMods.F.TargetBar.IncomingHeals:SetSize( ((ClassMods.F.TargetBar:GetWidth() / maxHealth) * (maxHealth - health)), ClassMods.F.TargetBar:GetHeight() )
			else
				ClassMods.F.TargetBar.IncomingHeals:SetSize( ((ClassMods.F.TargetBar:GetWidth() / maxHealth) * newPrediction1), ClassMods.F.TargetBar:GetHeight() )
			end
			ClassMods.F.TargetBar.IncomingHeals:ClearAllPoints()
			ClassMods.F.TargetBar.IncomingHeals:SetPoint("LEFT", ClassMods.F.TargetBar, "LEFT", ClassMods.F.TargetBar:GetWidth() / (select(2, ClassMods.F.TargetBar:GetMinMaxValues() ) / ClassMods.F.TargetBar:GetValue()), 0)
			ClassMods.F.TargetBar.IncomingHeals:SetAlpha(ClassMods.F.TargetBar:GetAlpha() * 0.6)
			ClassMods.F.TargetBar.IncomingHeals:Show()
		else
			ClassMods.F.TargetBar.IncomingHeals:ClearAllPoints()
			ClassMods.F.TargetBar.IncomingHeals:SetPoint("LEFT", ClassMods.F.TargetBar, "LEFT", 0, 0)
			ClassMods.F.TargetBar.IncomingHeals:Hide()
		end
	end
end

function ClassMods.updateAbsorbsTarget()
	local newPrediction1 = 0
	local health = UnitHealth("target")
	local maxHealth = UnitHealthMax("target")

	if ClassMods.db.profile.targetbar.incomingheals then
		newPrediction1 = UnitGetTotalAbsorbs("target")
		ClassMods.F.TargetBar.Absorbs:SetStatusBarColor(1, 1, 1, 1)
		if (newPrediction1 ~= 0) and (not UnitIsDeadOrGhost("target") ) then
			ClassMods.F.TargetBar.Absorbs:SetSize( ((ClassMods.F.TargetBar:GetWidth() / maxHealth) * newPrediction1), ceil(ClassMods.F.TargetBar:GetHeight() / 2) )
			ClassMods.F.TargetBar.Absorbs:ClearAllPoints()
			if (health + newPrediction1) > maxHealth then
				ClassMods.F.TargetBar.Absorbs:SetPoint("TOPRIGHT", ClassMods.F.TargetBar, "TOPRIGHT", 0, 0 )
			else
				ClassMods.F.TargetBar.Absorbs:SetPoint("TOPLEFT", ClassMods.F.TargetBar, "TOPLEFT", ClassMods.F.TargetBar:GetWidth() / (select(2, ClassMods.F.TargetBar:GetMinMaxValues() ) / ClassMods.F.TargetBar:GetValue()), 0)
			end
			ClassMods.F.TargetBar.Absorbs:SetAlpha(1)
			ClassMods.F.TargetBar.Absorbs:Show()
		else
			ClassMods.F.TargetBar.Absorbs:ClearAllPoints()
			ClassMods.F.TargetBar.Absorbs:SetPoint("LEFT", ClassMods.F.TargetBar, "LEFT", 0, 0)
			ClassMods.F.TargetBar.Absorbs:Hide()
		end
	end
end

function ClassMods.SetupTargetBar()
	-- Destruction
	if ClassMods.F.TargetBar then
		ClassMods.F.TargetBar:Hide()
		ClassMods.F.TargetBar:SetScript("OnUpdate", nil)
		ClassMods.F.TargetBar:SetScript("OnEvent", nil)
		ClassMods.F.TargetBar:UnregisterAllEvents()

		if ClassMods.F.TargetBar.smoother then
			ClassMods.RemoveSmooth(ClassMods.F.TargetBar)
		end

		ClassMods.DeregisterMovableFrame("MOVER_TARGETBAR")
		ClassMods.F.TargetBar:SetParent(nil)
	end

	-- Construction
	if ClassMods.db.profile.targetbar.enabled then
		local TARGETBAR_UPDATEINTERVAL = 0.08
		if (ClassMods.db.profile.overrideinterval) then
			TARGETBAR_UPDATEINTERVAL = ClassMods.db.profile.updateinterval
		else
			TARGETBAR_UPDATEINTERVAL = ClassMods.db.profile.targetbar.updateinterval or 0.08
		end
		local targetClass = (select(2, UnitClass("target"))) or "HUNTER"
		local health = UnitHealth("target")
		local maxHealth = UnitHealthMax("target")

		-- Create the Frame
		ClassMods.F.TargetBar = ClassMods.MakeFrame(ClassMods.F.TargetBar, "StatusBar", "CLASSMODS_TARGETBAR", ClassMods.db.profile.targetbar.anchor[2] or UIParent)
		ClassMods.F.TargetBar:SetParent(ClassMods.db.profile.targetbar.anchor[2] or UIParent)
		ClassMods.F.TargetBar:ClearAllPoints()
		ClassMods.F.TargetBar:SetStatusBarTexture(ClassMods.GetActiveTextureFile(ClassMods.db.profile.targetbar.bartexture))
		ClassMods.F.TargetBar:SetMinMaxValues(0, (maxHealth > 0) and maxHealth or 100)
		ClassMods.F.TargetBar:SetStatusBarColor(ClassMods.db.profile.targetbar.classcolored and (unpack({ RAID_CLASS_COLORS[targetClass].r, RAID_CLASS_COLORS[targetClass].g, RAID_CLASS_COLORS[targetClass].b, 1}) ) or unpack(ClassMods.db.profile.targetbar.barcolor) )
		ClassMods.F.TargetBar:SetSize(ClassMods.db.profile.targetbar.width, ClassMods.db.profile.targetbar.height)
		ClassMods.F.TargetBar:SetPoint(ClassMods.GetActiveAnchor(ClassMods.db.profile.targetbar.anchor) )
		ClassMods.F.TargetBar:SetAlpha(0)
		ClassMods.F.TargetBar:SetValue(health)

		-- Create the Background and border if the user wants one
		ClassMods.F.TargetBar.background = ClassMods.MakeBackground(ClassMods.F.TargetBar, ClassMods.db.profile.targetbar, nil, nil, ClassMods.F.TargetBar.background)

		ClassMods.RegisterMovableFrame(
			"MOVER_TARGETBAR",
			ClassMods.F.TargetBar,
			ClassMods.F.TargetBar,
			L["Target Bar"],
			ClassMods.db.profile.targetbar,
			ClassMods.SetupTargetBar,
			ClassMods.db.profile.targetbar,
			ClassMods.db.profile.targetbar
		)

		if ClassMods.db.profile.targetbar.smoothbar then
			ClassMods.MakeSmooth(ClassMods.F.TargetBar)
		end

		-- Setup Health Number
		if ClassMods.db.profile.targetbar.healthnumber then
			ClassMods.F.TargetBar.value = ClassMods.F.TargetBar.value or ClassMods.F.TargetBar:CreateFontString(nil, "OVERLAY")
			ClassMods.F.TargetBar.value:ClearAllPoints()
			ClassMods.F.TargetBar.value:SetJustifyH("CENTER")
			ClassMods.F.TargetBar.value:SetPoint("CENTER", ClassMods.F.TargetBar, "CENTER", ClassMods.db.profile.targetbar.healthfontoffset, (ClassMods.db.profile.targetbar.shotbar == true) and 2 or 0)
			ClassMods.F.TargetBar.value:SetFont(ClassMods.GetActiveFont(ClassMods.db.profile.targetbar.healthfont) )
			ClassMods.F.TargetBar.value:SetTextColor(unpack(ClassMods.db.profile.targetbar.healthfontcolor) )
			ClassMods.F.TargetBar.value:SetText(health)
			ClassMods.F.TargetBar.value:Show()
		elseif ClassMods.F.TargetBar.value then
			ClassMods.F.TargetBar.value:Hide()
		end

		-- Setup target health text %
		if ClassMods.db.profile.targetbar.targethealth then
			ClassMods.F.TargetBar.targetHealthValue = ClassMods.F.TargetBar.targetHealthValue or ClassMods.F.TargetBar:CreateFontString(nil, "OVERLAY")
			ClassMods.F.TargetBar.targetHealthValue:ClearAllPoints()
			ClassMods.F.TargetBar.targetHealthValue:SetJustifyH("LEFT")
			ClassMods.F.TargetBar.targetHealthValue:SetPoint("CENTER", ClassMods.F.TargetBar, "CENTER", 1 + ClassMods.db.profile.targetbar.percentfontoffset, 0)
			ClassMods.F.TargetBar.targetHealthValue:SetFont(ClassMods.GetActiveFont(ClassMods.db.profile.targetbar.percentfont) )
			ClassMods.F.TargetBar.targetHealthValue:SetText("")
			ClassMods.F.TargetBar.targetHealthValue:Show()
		elseif ClassMods.F.TargetBar.targetHealthValue then
			ClassMods.F.TargetBar.targetHealthValue:Hide()
		end

			-- Setup incoming heal bar
		if ClassMods.db.profile.targetbar.incomingheals then
			ClassMods.F.TargetBar.IncomingHeals = ClassMods.F.TargetBar.IncomingHeals or CreateFrame("StatusBar", nil, ClassMods.F.TargetBar)
			ClassMods.F.TargetBar.IncomingHeals:SetParent(ClassMods.F.TargetBar)
			ClassMods.F.TargetBar.IncomingHeals:ClearAllPoints()
			ClassMods.F.TargetBar.IncomingHeals:SetStatusBarTexture(ClassMods.F.TargetBar:GetStatusBarTexture():GetTexture() ) -- Use the main bar's texture
			ClassMods.F.TargetBar.IncomingHeals:SetMinMaxValues(0, 1)
			ClassMods.F.TargetBar.IncomingHeals:SetValue(1)
			ClassMods.F.TargetBar.IncomingHeals:SetFrameLevel(ClassMods.F.TargetBar:GetFrameLevel() )
			ClassMods.F.TargetBar.IncomingHeals:SetSize(0, ClassMods.F.TargetBar:GetHeight() ) -- temp
			ClassMods.F.TargetBar.IncomingHeals:Hide()
		elseif ClassMods.F.TargetBar.IncomingHeals then
			ClassMods.F.TargetBar.IncomingHeals:Hide()
		end

		-- Setup absorbs bar
		if ClassMods.db.profile.targetbar.incomingheals then
			ClassMods.F.TargetBar.Absorbs = ClassMods.F.TargetBar.Absorbs or CreateFrame("StatusBar", nil, ClassMods.F.TargetBar)
			ClassMods.F.TargetBar.Absorbs:SetParent(ClassMods.F.TargetBar)
			ClassMods.F.TargetBar.Absorbs:ClearAllPoints()
			ClassMods.F.TargetBar.Absorbs:SetStatusBarTexture(ClassMods.F.TargetBar:GetStatusBarTexture():GetTexture() ) -- Use the main bar's texture
			ClassMods.F.TargetBar.Absorbs:SetMinMaxValues(0, 1)
			ClassMods.F.TargetBar.Absorbs:SetValue(1)
			ClassMods.F.TargetBar.Absorbs:SetFrameLevel(ClassMods.F.TargetBar:GetFrameLevel())
			ClassMods.F.TargetBar.Absorbs:SetSize(0, ClassMods.F.TargetBar:GetHeight() ) -- temp
			ClassMods.F.TargetBar.Absorbs:Hide()
		elseif ClassMods.F.TargetBar.Absorbs then
			ClassMods.F.TargetBar.Absorbs:Hide()
		end

		-- Register Events to support the bar
		ClassMods.F.TargetBar:RegisterEvent("PLAYER_TARGET_CHANGED")
		ClassMods.F.TargetBar:RegisterUnitEvent("UNIT_MAXHEALTH", "target")
		ClassMods.F.TargetBar:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "target")
		ClassMods.F.TargetBar:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", "target")
		ClassMods.F.TargetBar:SetScript("OnEvent",
			function(self, event, ...)
			    local timestamp, eventtype, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...

				if (event == "UNIT_MAXHEALTH") then
					self:SetMinMaxValues(0, UnitHealthMax("target"))
				elseif (event == "UNIT_HEALTH_FREQUENT") then
					ClassMods.updateIncomingHealsTarget()
					ClassMods.updateAbsorbsTarget()
				elseif (event == "UNIT_ABSORB_AMOUNT_CHANGED") and (ClassMods.db.profile.targetbar.incomingheals) then
					ClassMods.updateAbsorbsTarget()
				elseif (event == "PLAYER_TARGET_CHANGED") then
					ClassMods.SetupTargetBar()
				end
			end)

		-- Setup the script for handling the bar
		ClassMods.F.TargetBar.updateTimer = 0
		ClassMods.F.TargetBar:SetScript("OnUpdate",
			function(self, elapsed)
				self.updateTimer = self.updateTimer + elapsed
				if self.updateTimer < TARGETBAR_UPDATEINTERVAL then return else self.updateTimer = 0 end
				local health = UnitHealth("target")
				local maxHealth = UnitHealthMax("target")

				-- Overrides take precidence over normal alpha
				if C_PetBattles.IsInBattle() then
					self:SetAlpha(0) -- Hide for pet battles
				elseif ClassMods.db.profile.targetbar.deadoverride and UnitIsDeadOrGhost("player") then
					self:SetAlpha(ClassMods.db.profile.targetbar.deadoverridealpha)
				elseif ClassMods.db.profile.targetbar.mountoverride and (IsMounted() or UnitHasVehicleUI("player") ) and (UnitBuff("player", "Telaari Talbuk") == nil) and (UnitBuff("player", "Frostwolf War Wolf") == nil) and (UnitBuff("player", "Rune of Grasping Earth") == nil) then
					self:SetAlpha(ClassMods.db.profile.targetbar.mountoverridealpha)
				elseif ClassMods.db.profile.targetbar.oocoverride and (not InCombatLockdown() ) then
					self:SetAlpha(ClassMods.db.profile.targetbar.oocoverridealpha)
				elseif (health ~= maxHealth) then
					self:SetAlpha(ClassMods.db.profile.targetbar.activealpha)
				else
					self:SetAlpha(ClassMods.db.profile.targetbar.inactivealpha)
				end

				-- Handle status bar updating
				self:SetValue(health)
				if (health > 0) then
					self:SetStatusBarColor(unpack(getTargetBarColor()))
				end

				if (ClassMods.db.profile.targetbar.healthnumber and self.value) then
					if ClassMods.db.profile.targetbar.abbreviatenumber then
						self.value:SetText(ClassMods.AbbreviateNumber(health))
					else
						self.value:SetText(health)
					end
				end

				-- Update the incoming heals bar, if enabled
				if ClassMods.db.profile.targetbar.incomingheals then
					ClassMods.updateIncomingHealsTarget()
					ClassMods.updateAbsorbsTarget()
				end

				-- Handle Target Health Percentage
				if ClassMods.db.profile.targetbar.targethealth then
					if (not UnitExists("target") ) or (UnitIsDeadOrGhost("target") ) then
						self.targetHealthValue:SetText("")
					else
						if ((health / maxHealth) >= .9) then
							self.targetHealthValue:SetFormattedText("|cffffff00%d %%|r", (health / maxHealth) * 100)
						elseif  ClassMods.db.profile.targetbar.lowwarn and ((health / maxHealth) <= ClassMods.db.profile.targetbar.lowwarnthreshold) then
							self.targetHealthValue:SetFormattedText("|cffffffff%d %%|r", (health / maxHealth) * 100)
						else
							self.targetHealthValue:SetFormattedText("|cffff0000%d %%|r", (health / maxHealth) * 100)
						end
					end
				end

			end)
		ClassMods.F.TargetBar:Show()
	end
end