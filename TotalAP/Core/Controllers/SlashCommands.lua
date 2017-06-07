  ----------------------------------------------------------------------------------------------------------------------
    -- This program is free software: you can redistribute it and/or modify
    -- it under the terms of the GNU General Public License as published by
    -- the Free Software Foundation, either version 3 of the License, or
    -- (at your option) any later version.
	
    -- This program is distributed in the hope that it will be useful,
    -- but WITHOUT ANY WARRANTY; without even the implied warranty of
    -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    -- GNU General Public License for more details.

    -- You should have received a copy of the GNU General Public License
    -- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------------------------------------------


-- SlashCommands.lua
-- Handling of slash commands (duh)

local addonName, TotalAP = ...

if not TotalAP then return end


-- TODO: Localised versions (especially for non-Latin characters) - they would be optional, of course // -- TODO: Slash commands themselves aren't localised yet. Maybe they should be?
-- TODO: Set this somewhere else?
local slashCommand = "totalap"
local slashCommandAlias = "ap"

-- AceLocale localisation table -> used for console output
local L = LibStub("AceLocale-3.0"):GetLocale("TotalAP", false); -- Localization table

-- TODO: Use AceDB for this
--local settings = TotalAP.DBHandler.GetDB() -- TODO: Upvalue / LUA Error

-- TODO: settings in slashHandlers is a workaround from incomplete migration issues -> it's not final and should probably be reworked after migration is complete


-- Match commands to locale table keys (the actual strings are NOT used, except to look up the correct translation)
local slashCommands = {
	
	["counter"] = "Toggle display of the item counter",
	["progress"] = "Toggle spell overlay notification (glow effect) when new traits are available",
	["glow"] = "Toggle spell overlay notification (glow effect) when new traits are available",
	["buttontext"] = "Toggle short summary of the tooltip information as an additional display next to the action button",
	
	["hide"] = "Toggle all displays (will override the individual display's settings)",
	["button"] = "Toggle button visibility (tooltip visibility is unaffected)",
	["bars"] = "Toggle bar display for artifact power progress",
	["tooltip"] = "Toggle tooltip display for artifact power items",
	["icons"] = "Toggle icon and text display for artifact power progress",
	
	["unignore"] = "Resets ignored specs for the currently active character",
	
	["loginmsg"] = "Toggle login message on load",
	["combat"] = "Toggle visibility in combat",
	["reset"] =  "Load default settings (will overwrite any changes made)",
	["debug"] = "Toggle debug mode (not particularly useful as long as everything is working as expected)",
	
}

-- Undocumented -> Won't be listed (and there is no need to translate them either)
local hiddenSlashCommands = {
	["align-top"] = "",
	["align-bottom"] = "",
	["align-center"] = "",
}

-- Actual handling of slash commands (TODO: Not fully migrated yet -> most won't work until it is done)
local slashHandlers = {

	["counter"] = function(settings) -- Toggle counter display in tooltip

		if not settings.tooltip.showNumItems then
			TotalAP.ChatMsg(L["Item counter enabled."])
		else
			TotalAP.ChatMsg(L["Item counter disabled."]);
		end
		
		settings.tooltip.showNumItems = not settings.tooltip.showNumItems;
	
	end,
	
	["progress"] = function(settings) -- Enable progress report in tooltip
	
		if not settings.tooltip.showProgressReport then
			TotalAP.ChatMsg(L["Progress report enabled."]);
		else
			TotalAP.ChatMsg(L["Progress report disabled."]);
		end
		
		settings.tooltip.showProgressReport = not settings.tooltip.showProgressReport;
	end,
	
	["glow"] = function(settings) -- Toggle button spell overlay effect -> Notification when new traits are available
		
		if not settings.actionButton.showGlowEffect then
			settings.actionButton.showGlowEffect = true; 
			TotalAP.ChatMsg(L["Button glow effect enabled."]);
		else
			settings.actionButton.showGlowEffect = false;
			TotalAP.ChatMsg(L["Button glow effect disabled."]);
		end
		
		if not settings.specIcons.showGlowEffect then
			settings.specIcons.showGlowEffect = true; 
			TotalAP.ChatMsg(L["Spec icons glow effect enabled."]);
		else
			settings.specIcons.showGlowEffect = false;
			TotalAP.ChatMsg(L["Spec icons glow effect disabled."]);
		end
		
	end,
	
	["buttontext"] = function(settings) -- Toggle an additional display of the (originally tooltip-only) current item's AP value / total AP in bags
		
		if settings.actionButton.showText then
			TotalAP.ChatMsg(L["Action button text disabled."]);
		else
			TotalAP.ChatMsg(L["Action button text enabled."]);
		end
		
	settings.actionButton.showText = not settings.actionButton.showText;

	end,
	
	["hide"] = function(settings)  -- Toggle all displays
		
	
		if settings.enabled then
			TotalAP.ChatMsg(L["All displays are now being hidden."])
		else
			TotalAP.ChatMsg(L["All displays are now being shown."])
		end
		
		TotalAP.Controllers.KeybindHandler("AllDisplaysToggle", false)

	end,
	
	["button"] = function(settings) -- Toggle button visibility (tooltip functionality remains)
				
		TotalAP.Controllers.KeybindHandler("ActionButtonToggle", false)
		
	end,
	
	["tooltip"] = function(settings) -- Toggle tooltip additions for AP items
	
		TotalAP.Controllers.KeybindHandler("TooltipToggle", false)

	end,
	
	["bars"] = function(settings) -- Toggle infoFrame (bar display)


		TotalAP.Controllers.KeybindHandler("BarDisplayToggle", false);	
		
	end,
	
	["icons"] = function(settings) -- Toggle spec icons

		TotalAP.Controllers.KeybindHandler("SpecIconsToggle", false);	

	end,
	
	["unignore"] = function(settings) -- Reset this character's ignored specs list

		TotalAP.DBHandler.UnignoreAllSpecs()
	
	end,
	
	["loginmsg"] = function(settings) -- Toggle notification when loading/logging in (effective on next login)
		
		if settings.showLoginMessage then
			TotalAP.ChatMsg(L["Login message is now hidden."]);
		else
			TotalAP.ChatMsg(L["Login message is now shown."]);
		end
		
	settings.showLoginMessage = not settings.showLoginMessage;
	
	end,
	
	["combat"] =  function(settings) -- Toggle automatic hiding of the display while player is in combat (also: vehicle/pet battle but those can't be turned off here)
		if settings.hideInCombat then
			TotalAP.ChatMsg(L["Display will now remain visible in combat."]);
		else
			TotalAP.ChatMsg(L["Display will now be hidden in combat."]);
		end
		
	settings.hideInCombat = not settings.hideInCombat;

	end,
	
	["reset"] =  function(settings) -- Load default values for all settings

		TotalAP.DBHandler.RestoreDefaults()
		--RestoreDefaultSettings();
		TotalAP.ChatMsg(L["Default settings loaded."]);
		-- TODO: Run UnignoreAllSpecs() also?
		TotalAPAnchorFrame:ClearAllPoints();
		TotalAPAnchorFrame:SetPoint("CENTER", UIParent, "CENTER");

	end,
	
	["debug"] = function(settings) -- Toggle debug mode (for debugging/testing purposes only -> undocumented)
				
		if settings.debugMode then
			TotalAP.ChatMsg(L["Debug mode disabled."]);
		else
			TotalAP.ChatMsg(L["Debug mode enabled."]);
		end
		
		settings.debugMode = not settings.debugMode;
	end,

	
--- Hidden slash commands
	["align-top"] = function(settings) -- Align bars and spec icons to the top
		 TotalAP.Controllers.AlignGUI("top")
	end,
	
	["align-bottom"] = function(settings) -- Align bars and spec icons to the top
		 TotalAP.Controllers.AlignGUI("bottom")
	end,
	
	["align-center"] = function(settings) -- Align bars and spec icons to the top
		 TotalAP.Controllers.AlignGUI("center")
	end,

-- TODO: Debugging/undocumented commands should be separate
	-- elseif command == "anchor" then -- Show anchor frame
		-- --TotalAPAnchorFrame:SetShown(TotalAPAnchorFrame:IsShown());
		-- TotalAPAnchorFrame:SetBackdrop(
			-- {
				-- bgFile = "Interface\\GLUES\\COMMON\\Glue-Tooltip-Background.blp",
												-- -- edgeFile = "Interface/Tooltips/UI-Tooltip-Border", 
												-- -- tile = true, tileSize = 16, edgeSize = 16, 
													-- -- insets = { left = 4, right = 4, top = 4, bottom = 4 }
			-- }
		-- ); 
	-- [[ For testing and debugging purposes only]] --
		-- elseif command == "load" then -- Load settings manually (including verification of SavedVars)  (for debugging purposes only)-> undocumented 	
		-- LoadSettings();

	-- end,
	
	
	-- elseif command == "flash" then --  Add spell overlay to action button (for debugging/testing purposes only -> undocumented)
	
		-- FlashActionButton(TotalAPButton, true);
		-- for i = 0, GetNumSpecializations() do
			-- FlashActionButton(TotalAPSpecIconButtons[i], true);
		-- end

	-- elseif command == "unflash" then -- Remove spell overlay from all buttons (for debugging/testing purposes only -> undocumented)
	
		-- FlashActionButton(TotalAPButton, false);
		-- for i = 0, GetNumSpecializations() do
				-- FlashActionButton(TotalAPSpecIconButtons[i], false);
		-- end
}


-- Returns handler function for a given slash command (if it exists) -- TODO: It's private, as it's only used in here currently - does it need to be exposed for something?
local function GetSlashHandlerFunction(command)
	return slashHandlers[command]
end

-- Returns the currently used (main) slash command
local function GetSlashCommand()
	return slashCommand
end


-- Returns shorthand (alias) for the currently used slash command
local function GetSlashCommandAlias()
	return slashCommandAlias
end


-- Prints a list of all available slash commands to the DEFAULT_CHAT_FRAME (using the addon-specific print methods with colour-coding)
local function PrintSlashCommands(usedAlias)

		-- TODO: Could use AceConsole:print(f) for this, but... meh. It would have to format the output manually to adhere to the addon's standards (as set in Core\ChatMsg), and who has time for that?
		TotalAP.ChatMsg(L["[List of available commands]"]);
		for cmd in pairs(slashCommands) do -- print description saved in localisation table - TODO: Order could be set via index/ipairs if it matters?
			
			local usedCmd = GetSlashCommand()
			if usedAlias then
				usedCmd = GetSlashCommandAlias()
			end
		
			TotalAP.ChatMsg("/" .. usedCmd .. " " .. cmd .. " - " .. L[slashCommands[cmd]])
		
		end
end


-- Handles console input (slash commands)
-- TODO: Only one argument is supported currently (use AceConsole:GetArgs to parse them more easily)
local function SlashCommandHandler(input, usedAlias)

	local addonObject = LibStub("AceAddon-3.0"):GetAddon("TotalAP") -- should be loaded by the main chunk earlier, otherwise it will error out
	local command = addonObject:GetArgs(input)
	
	-- Lists all available commands as chat output
	-- TODO: Better way to list all available commands, especially as functionality is extended (GUI?)
	for validCommand in pairs(slashCommands) do
	
		-- Undocumented: These command are for testing purposes only (and won't be listed by the regular chat window output)
		if command == "cmdtest" then 	-- Run all possible chat commands once, with some delay to make sure they are working properly
		
			-- TODO: Duplicate code - and also, do you really want to test /reset and similar commands!? Should be replaced by a proper selective testing routine
			-- TotalAP.Debug("Running slash command test for command = " .. validCommand)
			-- local slashHandlerFunction = slashHandlers[validCommand]
			-- local db = TotalAP.DBHandler.GetDB() 
			-- slashHandlerFunction(db)
			
		elseif command == "guitest" then -- Perform various GUI operations to make sure everything is working properly
		
		-- TODO once GUI/migration is complete
		
		elseif command == "dbtest" then -- Simulate DB operations to test functionality, without actually changing the savedVars in the process	
		
		-- TODO once AceDB handles vars (current db handling should work fine for the time being)
		
		elseif hiddenSlashCommands[command] then -- TODO: Handling for guitest etc. here also
		
			local slashHandlerFunction = slashHandlers[command]
			slashHandlerFunction() -- Parameter is nil -> There's no need to submit the DB for test commands, really
			return
		
		elseif command == validCommand then -- Execute individual handler function for this slash command
			
			local slashHandlerFunction = slashHandlers[command]
			TotalAP.Debug("Recognized slash command: " .. command .. " - executing handler function..." )
			local db = TotalAP.DBHandler.GetDB() 
			slashHandlerFunction(db)
			
			-- Always update displays to make sure any changes will be displayed immediately (if possible/not locked)
			TotalAP.Controllers.UpdateGUI()
			
			return
	
		end	

	end
	
		-- Display help / list of commands
	PrintSlashCommands(usedAlias)
	return
	
end

-- Notify slash command handler that the alias slash command was used instead of the regular one before calling it
-- TODO: I don't like this, but since AceConsole doesn't allow the option of differentiating between commands via parameters this should get the job done
local function SlashCommandHandler_UsedAlias(input)
	SlashCommandHandler(input, true)
end

-- Make functions available in the addon namespace
TotalAP.Controllers.GetSlashCommand = GetSlashCommand
TotalAP.Controllers.GetSlashCommandAlias = GetSlashCommandAlias
TotalAP.Controllers.PrintSlashCommands = PrintSlashCommands
TotalAP.Controllers.SlashCommandHandler = SlashCommandHandler
TotalAP.Controllers.SlashCommandHandler_UsedAlias = SlashCommandHandler_UsedAlias

return TotalAP.Controllers
