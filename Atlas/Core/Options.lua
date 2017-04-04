-- $Id: Options.lua 193 2017-03-30 16:53:28Z arith $
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
-- Libraries
local math = _G.math;
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local LibStub = _G.LibStub
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local profile;

local function AtlasOptions_ResetDropdowns()
	profile.options.dropdowns.module = 1;
	profile.options.dropdowns.zone = 1;

	Atlas_PopulateDropdowns();
	Atlas_Refresh();
	AtlasFrameDropDownType_OnShow();
	AtlasFrameDropDown_OnShow();
end

--[[
function AtlasOptions_Reset()
	Atlas:FreshOptions();
	--AtlasOptions_ResetPosition(); --also calls AtlasOptions_Init()
	AtlasOptions_ResetDropdowns(); --also calls Atlas_Refresh()
	AtlasButton_Init();
	Atlas_UpdateLock();
end
]]

-- Show the Atlas Options
function AtlasOptions_Toggle()
	if InterfaceOptionsFrame:IsVisible() then
		InterfaceOptionsFrame:Hide();
	else
		InterfaceOptionsFrame_OpenToCategory("Atlas");
		InterfaceOptionsFrame_OpenToCategory("Atlas");
	end
end

function AtlasOptions_ToggleWorldMapButton()
	profile.options.worldMapButton = not profile.options.worldMapButton;
	if (profile.options.worldMapButton) then
		AtlasToggleFromWorldMap:Show();
	else
		AtlasToggleFromWorldMap:Hide();
	end
end

function AtlasOptions_ToggleAutoSelect()
	profile.options.autoSelect = not profile.options.autoSelect;
end

function AtlasOptions_ToggleRightClick()
	profile.options.frames.rightClick = not profile.options.frames.rightClick;
end

function AtlasOptions_ToggleAcronyms()
	profile.options.frames.showAcronyms = not profile.options.frames.showAcronyms;
	Atlas_Refresh();
end

function AtlasOptions_ToggleClamped()
	profile.options.frames.clamp = not profile.options.frames.clamp;
	AtlasFrame:SetClampedToScreen(profile.options.frames.clamp);
	Atlas_Refresh();
end

function AtlasOptions_ToggleCtrl()
	profile.options.frames.controlClick = not profile.options.frames.controlClick;
	Atlas_Refresh();
end

function AtlasOptions_ToggleLock()
	profile.options.frames.lock = not profile.options.frames.lock;
	Atlas_UpdateLock();
	Atlas_Refresh();
end

function AtlasOptions_ToggleBossPotrait()
	profile.options.frames.showBossPotrait = not profile.options.frames.showBossPotrait;
	Atlas_Refresh();
end

function AtlasOptions_ToggleCheckModule()
	profile.options.checkMissingModules = not profile.options.checkMissingModules;
	Atlas_Refresh();
end

function AtlasOptions_ToggleColoringDropDown()
	profile.options.dropdowns.color = not profile.options.dropdowns.color;
	Atlas_Refresh();
	AtlasFrameDropDown_OnShow();
end

function AtlasOptions_OnLoad(panel)
	panel.name = "Atlas";
	panel.default = AtlasOptions_Reset;
	InterfaceOptions_AddCategory(panel);
	if (LibStub:GetLibrary("LibAboutPanel", true)) then
		LibStub("LibAboutPanel").new("Atlas", "Atlas");
	end
end

function AtlasOptions_OnShow(self)
	profile = Atlas.db.profile;
	local options = profile.options;

	AtlasOptionsFrameToggleButton:SetChecked(not profile.minimap.hide);
	AtlasOptionsFrameToggleWorldMapButton:SetChecked(options.worldMapButton);
	AtlasOptionsFrameAutoSelect:SetChecked(options.autoSelect);
	AtlasOptionsFrameRightClick:SetChecked(options.frames.rightClick);
	AtlasOptionsFrameAcronyms:SetChecked(options.frames.showAcronyms);
	AtlasOptionsFrameClamped:SetChecked(options.frames.clamp);
	AtlasOptionsFrameCtrl:SetChecked(options.frames.controlClick);
	AtlasOptionsFrameLock:SetChecked(options.frames.lock);
	AtlasOptionsFrameBossPotrait:SetChecked(options.frames.showBossPotrait);
	AtlasOptionsFrameCheckModule:SetChecked(options.checkMissingModules);
	AtlasOptionsFrameColoringDropdown:SetChecked(options.dropdowns.color);
--	AtlasOptionsFrameSliderButtonPos:SetValue(AtlasOptions.AtlasButtonPosition);
--	AtlasOptionsFrameSliderButtonRad:SetValue(AtlasOptions.AtlasButtonRadius);
	AtlasOptionsFrameSliderAlpha:SetValue(options.frames.alpha);
	AtlasOptionsFrameSliderScale:SetValue(options.frames.scale);
	AtlasOptionsFrameSliderBossDescScale:SetValue(options.frames.boss_description_scale);
	Lib_UIDropDownMenu_Initialize(AtlasOptionsFrameDropDownCats, AtlasOptionsFrameDropDownCats_Initialize);
	Lib_UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, options.dropdowns.menuType);
	Lib_UIDropDownMenu_SetWidth(AtlasOptionsFrameDropDownCats, 160);
end

function AtlasOptions_SetupSlider(self, text, mymin, mymax, step)
	self:SetMinMaxValues(mymin, mymax);
	--_G[self:GetName().."Low"]:SetText(mymin);
	--_G[self:GetName().."High"]:SetText(mymax);
	self:SetValueStep(step);
end

local function round(num, idp)
   local mult = 10 ^ (idp or 0);
   return math.floor(num * mult + 0.5) / mult;
end

function AtlasOptions_UpdateSlider(self, text)
	_G[self:GetName().."Text"]:SetText("|cffffd200"..text.." ("..round(self:GetValue(), 3)..")");
end

function AtlasOptionsFrameDropDownCats_Initialize()
	for i = 1, getn(Atlas_DropDownLayouts_Order) do
		local info = Lib_UIDropDownMenu_CreateInfo();
		info.text = Atlas_DropDownLayouts_Order[i];
		info.func = AtlasOptionsFrameDropDownCats_OnClick;
		info.arg1 = i;
		if (profile.options.dropdowns.menuType == i) then
			info.checked = true;
		else
			info.checked = nil;
		end
		Lib_UIDropDownMenu_AddButton(info, 1);
	end
end

function AtlasOptionsFrameDropDownCats_OnClick(self)
	local thisID = self:GetID();
	Lib_UIDropDownMenu_SetSelectedID(AtlasOptionsFrameDropDownCats, thisID);
	profile.options.dropdowns.menuType = thisID;
	AtlasOptions_ResetDropdowns();
end

function AtlasOptions_OnMouseWheel(self, delta)
	if (delta > 0) then
		self:SetValue(self:GetValue() + self:GetValueStep())
	else
		self:SetValue(self:GetValue() - self:GetValueStep())
	end
end

