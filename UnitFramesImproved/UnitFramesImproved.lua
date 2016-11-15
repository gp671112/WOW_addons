-- Credits to stassart on curse.com for suggesting to use InCombatLockdown() checks in the code

-- Debug function. Adds message to the chatbox (only visible to the loacl player)
function dout(msg)
	DEFAULT_CHAT_FRAME:AddMessage(msg);
end

-- Additional debug info can be found on http://www.wowwiki.com/Blizzard_DebugTools
-- /framestack [showhidden]
--		showhidden - if "true" then will also display information about hidden frames
-- /eventtrace [command]
-- 		start - enables event capturing to the EventTrace frame
--		stop - disables event capturing
--		number - captures the provided number of events and then stops
--		If no command is given the EventTrace frame visibility is toggled. The first time the frame is displayed, event tracing is automatically started.
-- /dump expression
--		expression can be any valid lua expression that results in a value. So variable names, function calls, frames or tables can all be dumped.

function tokenize(str)
	local tbl = {};
	for v in string.gmatch(str, "[^ ]+") do
		tinsert(tbl, v);
	end
	return tbl;
end

-- Create the addon main instance
local UnitFramesImproved = CreateFrame('Button', 'UnitFramesImproved');

-- Event listener to make sure we enable the addon at the right time
function UnitFramesImproved:PLAYER_ENTERING_WORLD()
	-- Set some default settings
	if (characterSettings == nil) then
		UnitFramesImproved_LoadDefaultSettings();
	end
	
	EnableUnitFramesImproved();
end

-- Event listener to make sure we've loaded our settings and thta we apply them
function UnitFramesImproved:VARIABLES_LOADED()
	-- dout("UnitFramesImproved settings loaded!");
	
	-- Set some default settings
	if (characterSettings == nil) then
		UnitFramesImproved_LoadDefaultSettings();
	end
	
	if (not (characterSettings["PlayerFrameAnchor"] == nil)) then
		StaticPopup_Show("LAYOUT_RESETDEFAULT");
		characterSettings["PlayerFrameX"] = nil;
		characterSettings["PlayerFrameY"] = nil;
		characterSettings["PlayerFrameMoved"] = nil;
		characterSettings["PlayerFrameAnchor"] = nil;
	end
	
	UnitFramesImproved_ApplySettings(characterSettings);
end

function UnitFramesImproved_ApplySettings(settings)
	UnitFramesImproved_SetFrameScale(settings["FrameScale"])
end

function UnitFramesImproved_LoadDefaultSettings()
	characterSettings = {}
	characterSettings["FrameScale"] = "1.0";
	
	if not TargetFrame:IsUserPlaced() then
		TargetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPRIGHT", 36, 0);
	end
end

function EnableUnitFramesImproved()
	-- Generic status text hook
	hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", UnitFramesImproved_TextStatusBar_UpdateTextStringWithValues);
	
	-- Hook PlayerFrame functions
	hooksecurefunc("PlayerFrame_ToPlayerArt", UnitFramesImproved_PlayerFrame_ToPlayerArt);
	hooksecurefunc("PlayerFrame_ToVehicleArt", UnitFramesImproved_PlayerFrame_ToVehicleArt);
	
	-- Hook TargetFrame functions
	hooksecurefunc("TargetFrame_CheckDead", UnitFramesImproved_TargetFrame_Update);
	hooksecurefunc("TargetFrame_Update", UnitFramesImproved_TargetFrame_Update);
	hooksecurefunc("TargetFrame_CheckFaction", UnitFramesImproved_TargetFrame_CheckFaction);
	hooksecurefunc("TargetFrame_CheckClassification", UnitFramesImproved_TargetFrame_CheckClassification);
	hooksecurefunc("TargetofTarget_Update", UnitFramesImproved_TargetFrame_Update);
	
	-- BossFrame hooks
	hooksecurefunc("BossTargetFrame_OnLoad", UnitFramesImproved_BossTargetFrame_Style);

	-- Setup relative layout for targetframe compared to PlayerFrame
	if not TargetFrame:IsUserPlaced() then
		if not InCombatLockdown() then 
			TargetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPRIGHT", 36, 0);
		end
	end
	
	-- Set up some stylings
	UnitFramesImproved_Style_PlayerFrame();
	UnitFramesImproved_BossTargetFrame_Style(Boss1TargetFrame);
	UnitFramesImproved_BossTargetFrame_Style(Boss2TargetFrame);
	UnitFramesImproved_BossTargetFrame_Style(Boss3TargetFrame);
	UnitFramesImproved_BossTargetFrame_Style(Boss4TargetFrame);
	UnitFramesImproved_Style_TargetFrame(TargetFrame);
	UnitFramesImproved_Style_TargetFrame(FocusFrame);
	UnitFramesImproved_Style_TargetOfTargetFrame();
	
	-- Update some values
	TextStatusBar_UpdateTextString(PlayerFrame.healthbar);
	TextStatusBar_UpdateTextString(PlayerFrame.manabar);
end

function UnitFramesImproved_Style_TargetOfTargetFrame()
	if not InCombatLockdown() then 
		TargetFrameToTHealthBar.lockColor = true;
	end
end

function UnitFramesImproved_Style_PlayerFrame()
	if not InCombatLockdown() then 
		PlayerFrameHealthBar.lockColor = true;
		PlayerFrameHealthBar.capNumericDisplay = true;
		PlayerFrameHealthBar:SetWidth(119);
		PlayerFrameHealthBar:SetHeight(29);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-22);
		PlayerFrameHealthBarText:SetPoint("CENTER",50,6);
	end
	
	PlayerFrameTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
	PlayerStatusTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-Player-Status");
	PlayerFrameHealthBar:SetStatusBarColor(UnitColor("player"));
end

function UnitFramesImproved_Style_TargetFrame(self)
	--if not InCombatLockdown() then
		local classification = UnitClassification(self.unit);
		if (classification == "minus") then
			self.healthbar:SetHeight(12);
			self.healthbar:SetPoint("TOPLEFT",7,-41);
			self.healthbar.TextString:SetPoint("CENTER",-50,4);
			self.deadText:SetPoint("CENTER",-50,4);
			self.Background:SetPoint("TOPLEFT",7,-41);
		else
			self.healthbar:SetHeight(29);
			self.healthbar:SetPoint("TOPLEFT",7,-22);
			self.healthbar.TextString:SetPoint("CENTER",-50,6);
			self.deadText:SetPoint("CENTER",-50,6);
			self.nameBackground:Hide();
			self.Background:SetPoint("TOPLEFT",7,-22);
		end
		
		self.healthbar:SetWidth(119);
		self.healthbar.lockColor = true;
	--end
end

function UnitFramesImproved_BossTargetFrame_Style(self)
	self.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-UnitFrame-Boss");

	UnitFramesImproved_Style_TargetFrame(self);
	if (not (characterSettings["FrameScale"] == nil)) then
		if not InCombatLockdown() then 
			self:SetScale(characterSettings["FrameScale"] * 0.9);
		end
	end
end

function UnitFramesImproved_SetFrameScale(scale)
	if not InCombatLockdown() then 
		-- Scale the main frames
		PlayerFrame:SetScale(scale);
		TargetFrame:SetScale(scale);
		FocusFrame:SetScale(scale);
		
		-- Scale sub-frames
		ComboFrame:SetScale(scale); -- Still needed
		--RuneFrame:SetScale(scale); -- Can't do this as it messes up the scale horribly
		--RuneButtonIndividual1:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		--RuneButtonIndividual2:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		--RuneButtonIndividual3:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		--RuneButtonIndividual4:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		--RuneButtonIndividual5:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		--RuneButtonIndividual6:SetScale(scale); -- No point in doing these either as the runeframes are now sacled to parent
		
		-- Scale the BossFrames, skip now as this seems to break
		-- Boss1TargetFrame:SetScale(scale*0.9);
		-- Boss2TargetFrame:SetScale(scale*0.9);
		-- Boss3TargetFrame:SetScale(scale*0.9);
		-- Boss4TargetFrame:SetScale(scale*0.9);
		
		characterSettings["FrameScale"] = scale;
	end
end

-- Slashcommand stuff
SLASH_UNITFRAMESIMPROVED1 = "/unitframesimproved";
SLASH_UNITFRAMESIMPROVED2 = "/ufi";
SlashCmdList["UNITFRAMESIMPROVED"] = function(msg, editBox)
	local tokens = tokenize(msg);
	if(table.getn(tokens) > 0 and strlower(tokens[1]) == "reset") then
		StaticPopup_Show("LAYOUT_RESET");
	elseif(table.getn(tokens) > 0 and strlower(tokens[1]) == "settings") then
		InterfaceOptionsFrame_OpenToCategory(UnitFramesImproved.panelSettings);
	elseif(table.getn(tokens) > 0 and strlower(tokens[1]) == "scale") then
		if(table.getn(tokens) > 1) then
			UnitFramesImproved_SetFrameScale(tokens[2]);
		else
			dout("請輸入 0.0 到 10.0 之間的數字做為第二個參數。");
		end
	else
		dout("暴雪頭像美化插件可使用的指令有:")
		dout("    help    (顯示這個訊息)");
		dout("    scale # (縮放玩家框架)");
		dout("    reset   (重置玩家框架的縮放大小)");
		dout("");
	end
end

-- Setup the static popup dialog for resetting the UI
StaticPopupDialogs["LAYOUT_RESET"] = {
	text = "是否確定要重置縮放大小?",
	button1 = "是",
	button2 = "否",
	OnAccept = function()
		UnitFramesImproved_LoadDefaultSettings();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

StaticPopupDialogs["LAYOUT_RESETDEFAULT"] = {
	text = "為了讓暴雪頭像美化插件可以正常運作，\n需要重置原有的版本配置設定。\n將會重新載入介面。",
	button1 = "重置",
	button2 = "忽略",
	OnAccept = function()
		PlayerFrame:SetUserPlaced(false);
		ReloadUI();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true
}

function UnitFramesImproved_TextStatusBar_UpdateTextStringWithValues(statusFrame, textString, value, valueMin, valueMax)
	if( statusFrame.LeftText and statusFrame.RightText ) then
		statusFrame.LeftText:SetText("");
		statusFrame.RightText:SetText("");
		statusFrame.LeftText:Hide();
		statusFrame.RightText:Hide();
		textString:Show();
	end
	
	if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( statusFrame.pauseUpdates ) ) then
		local valueDisplay = value;
		local valueMaxDisplay = valueMax;
		if ( statusFrame.capNumericDisplay ) then
			valueDisplay = UnitFramesImproved_AbbreviateLargeNumbers(value);
			valueMaxDisplay = UnitFramesImproved_AbbreviateLargeNumbers(valueMax);
		else
			valueDisplay = BreakUpLargeNumbers(value);
			valueMaxDisplay = BreakUpLargeNumbers(valueMax);
		end

		local textDisplay = GetCVar("statusTextDisplay");
		if ( value and valueMax > 0 and ( textDisplay ~= "NUMERIC" or statusFrame.showPercentage ) and not statusFrame.showNumeric) then
			-- if ( value == 0 and statusFrame.zeroText ) then
				-- textString:SetText(statusFrame.zeroText);
				-- statusFrame.isZero = 1;
				-- textString:Show();
				-- return;
			-- end
			
			percent = math.ceil((value / valueMax) * 100) .. "%";
			if ( textDisplay == "BOTH" and not statusFrame.showPercentage) then
				valueDisplay = valueDisplay .. " (" .. percent .. ")";
				textString:SetText(valueDisplay);
			else
				valueDisplay = percent;
				if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
					textString:SetText(statusFrame.prefix .. " " .. valueDisplay);
				else
					textString:SetText(valueDisplay);
				end
			end
		elseif ( value == 0 and statusFrame.zeroText ) then
			-- textString:SetText(statusFrame.zeroText);
			-- statusFrame.isZero = 1;
			-- textString:Show();
			return;
		else
			statusFrame.isZero = nil;
			if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
				textString:SetText(statusFrame.prefix.." "..valueDisplay.."/"..valueMaxDisplay);
			else
				textString:SetText(valueDisplay.."/"..valueMaxDisplay);
			end
		end
	end
end

function UnitFramesImproved_PlayerFrame_ToPlayerArt(self)
	if not InCombatLockdown() then
		UnitFramesImproved_Style_PlayerFrame();
	end
end

function UnitFramesImproved_PlayerFrame_ToVehicleArt(self)
	if not InCombatLockdown() then
		PlayerFrameHealthBar:SetHeight(12);
		PlayerFrameHealthBarText:SetPoint("CENTER",50,3);
	end
end

function UnitFramesImproved_TargetFrame_Update(self)
	-- Set back color of health bar
	if ( not UnitPlayerControlled(self.unit) and UnitIsTapDenied(self.unit) ) then
		-- Gray if npc is tapped by other player
		self.healthbar:SetStatusBarColor(0.5, 0.5, 0.5);
	else
		-- Standard by class etc if not
		self.healthbar:SetStatusBarColor(UnitColor(self.healthbar.unit));
	end
end

function UnitFramesImproved_TargetFrame_CheckClassification(self, forceNormalTexture)
	local texture;
	local classification = UnitClassification(self.unit);
	if ( classification == "worldboss" or classification == "elite" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Elite";
	elseif ( classification == "rareelite" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Rare-Elite";
	elseif ( classification == "rare" ) then
		texture = "Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame-Rare";
	end
	if ( texture and not forceNormalTexture) then
		self.borderTexture:SetTexture(texture);
	else
		if ( not (classification == "minus") ) then
			self.borderTexture:SetTexture("Interface\\Addons\\UnitFramesImproved\\Textures\\UI-TargetingFrame");
		end
	end
	
	self.nameBackground:Hide();
end

function UnitFramesImproved_TargetFrame_CheckFaction(self)
	local factionGroup = UnitFactionGroup(self.unit);
	if ( UnitIsPVPFreeForAll(self.unit) ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
		self.pvpIcon:Show();
	elseif ( factionGroup and UnitIsPVP(self.unit) and UnitIsEnemy("player", self.unit) ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
		self.pvpIcon:Show();
	elseif ( factionGroup == "Alliance" or factionGroup == "Horde" ) then
		self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
		self.pvpIcon:Show();
	else
		self.pvpIcon:Hide();
	end
	
	UnitFramesImproved_Style_TargetFrame(self);
end

-- Utility functions
function UnitColor(unit)
	local r, g, b;
	if ( ( not UnitIsPlayer(unit) ) and ( ( not UnitIsConnected(unit) ) or ( UnitIsDeadOrGhost(unit) ) ) ) then
		--Color it gray
		r, g, b = 0.5, 0.5, 0.5;
	elseif ( UnitIsPlayer(unit) ) then
		--Try to color it by class.
		local localizedClass, englishClass = UnitClass(unit);
		local classColor = RAID_CLASS_COLORS[englishClass];
		if ( classColor ) then
			r, g, b = classColor.r, classColor.g, classColor.b;
		else
			if ( UnitIsFriend("player", unit) ) then
				r, g, b = 0.0, 1.0, 0.0;
			else
				r, g, b = 1.0, 0.0, 0.0;
			end
		end
	else
		r, g, b = UnitSelectionColor(unit);
	end
	
	return r, g, b;
end

function UnitFramesImproved_AbbreviateLargeNumbers(value)
	local strLen = strlen(value);
	local retString = value;
	if (true) then
		if ( strLen >= 13 ) then
			retString = string.sub(value, 1, -13).."."..string.sub(value, -12, -12).."兆";
		elseif ( strLen >= 9 ) then
			retString = string.sub(value, 1, -9).."."..string.sub(value, -8, -8).."億";
		elseif ( strLen >= 8 ) then
			retString = string.sub(value, 1, -8).."."..string.sub(value, -7, -7).."千萬";
		elseif ( strLen >= 7 ) then
			retString = string.sub(value, 1, -7).."."..string.sub(value, -6, -6).."百萬";
		elseif ( strLen >= 5 ) then
			retString = string.sub(value, 1, -5).."."..string.sub(value, -4, -4).."萬";
		end
	else
		if ( strLen >= 13 ) then
			retString = string.sub(value, 1, -13).."兆";
		elseif ( strLen >= 9 ) then
			retString = string.sub(value, 1, -9).."億";
		elseif ( strLen >= 8 ) then
			retString = string.sub(value, 1, -8).."千萬";
		elseif ( strLen >= 7 ) then
			retString = string.sub(value, 1, -7).."百萬";
		elseif ( strLen >= 5 ) then
			retString = string.sub(value, 1, -5).."萬";
		end
	end
	return retString;
end

-- Bootstrap
function UnitFramesImproved_StartUp(self)
	self:SetScript('OnEvent', function(self, event) self[event](self) end);
	self:RegisterEvent('PLAYER_ENTERING_WORLD');
	self:RegisterEvent('VARIABLES_LOADED');
end

UnitFramesImproved_StartUp(UnitFramesImproved);

-- Table Dump Functions -- http://lua-users.org/wiki/TableSerialization
function print_r (t, indent, done)
  done = done or {}
  indent = indent or ''
  local nextIndent -- Storage for next indentation value
  for key, value in pairs (t) do
    if type (value) == "table" and not done [value] then
      nextIndent = nextIndent or
          (indent .. string.rep(' ',string.len(tostring (key))+2))
          -- Shortcut conditional allocation
      done [value] = true
      print (indent .. "[" .. tostring (key) .. "] => Table {");
      print  (nextIndent .. "{");
      print_r (value, nextIndent .. string.rep(' ',2), done)
      print  (nextIndent .. "}");
    else
      print  (indent .. "[" .. tostring (key) .. "] => " .. tostring (value).."")
    end
  end
end
