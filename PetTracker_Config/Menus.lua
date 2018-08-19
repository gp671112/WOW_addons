--[[
Copyright 2012-2018 João Cardoso
PetTracker is distributed under the terms of the GNU General Public License (Version 3).
As a special exception, the copyright holders of this addon do not give permission to
redistribute and/or modify it.

This addon is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with the addon. If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.

This file is part of PetTracker.
--]]

local Addon, ADDON = PetTracker, 'PetTracker'
local Menus = Addon:NewModule('Menus')
local Questions = Addon.Locals.FAQ

function Menus:Startup()
	local options = self:CreatePanel(ADDON)
	options:SetChildren(function(self)
		Addon:ForAllModules('AddOptions', self)
	end)

	local help = self:CreatePanel(HELP_LABEL, ADDON)
	help:SetChildren(function(self)
		for i = 1, #Questions, 2 do
			self:CreateHeader(Questions[i], 'GameFontHighlight', true)
			self:CreateHeader(Questions[i+1], 'GameFontDisable').bottom = 15
		end
	end)

	local resetTutorials = SushiButton(help)
	resetTutorials:SetText(RESET_TUTORIALS)
	resetTutorials:SetPoint('BOTTOMLEFT', help, 5, 5)
	resetTutorials:SetCall('OnClick', function()
		Addon.Tutorial:Restart()
		HideUIPanel(InterfaceOptionsFrame)
		HideUIPanel(GameMenuFrame)
	end)
end

function Menus:CreatePanel(name, parent)
	local panel = CreateFrame('Frame')
	local group = SushiMagicGroup(panel)

	group:SetAddon(ADDON)
	group:SetFooter('Copyright 2012-2018 João Cardoso')
	panel.parent = parent
	panel.name = name

	InterfaceOptions_AddCategory(panel)
	return group
end

Menus:Startup()
