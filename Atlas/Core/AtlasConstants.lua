-- $Id: AtlasConstants.lua 158 2017-02-07 06:35:15Z arith $
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

local LibStub = _G.LibStub

local FOLDER_NAME, private = ...
private.addon_name = "Atlas"

local constants = {}
private.constants = constants

-- Initialization
ATLAS_VERSION = GetAddOnMetadata(private.addon_name, "Version");
ATLAS_PLAYER_FACTION = UnitFactionGroup("player");
ATLAS_DROPDOWNS = {};
ATLAS_INST_ENT_DROPDOWN = {};
ATLAS_NUM_LINES = 26;
ATLAS_CUR_LINES = 0;
ATLAS_SCROLL_LIST = {};
ATLAS_SCROLL_ID = {};
ATLAS_DATA = {};
ATLAS_SEARCH_METHOD = nil;
ATLAS_PLUGINS = {};
ATLAS_PLUGIN_DATA = {};
Atlas_MapTypes = {};
AtlasMaps_NPC_DB = {};
ATLAS_SMALLFRAME_SELECTED = false;
ATLAS_DROPDOWN_WIDTH = 190;
ATLAS_PLUGINS_COLOR = "|cff66cc33";

ATLAS_GAMETOOLTIP_ORIGINAL_SCALE = GameTooltip:GetScale();

-- Only update this version number when the options have been revised and a force update is needed.
ATLAS_OLDEST_VERSION_SAME_SETTINGS = "1.24.00"; 

constants.defaultoptions = {
	["AtlasVersion"] = ATLAS_OLDEST_VERSION_SAME_SETTINGS,
	["AtlasAlpha"] = 1.0,			-- Atlas frame's transparency
	["AtlasLocked"] = false,		-- Lock Atlas frame position
	["AtlasAutoSelect"] = false,		-- Auto select map
	-- ["AtlasButtonPosition"] = 26,	-- Minimap button position
	-- ["AtlasButtonRadius"] = 78,		-- Minimap button radius
	["AtlasButtonShown"] = true,		-- Show / hide Atlas button
	["AtlasWorldMapButtonShown"] = true,	-- Show / hide Atlas button on World Map window
	["AtlasRightClick"] = false,		-- Right click to open world map
	["AtlasType"] = 1,			-- Default or last selected map type (category)
	["AtlasZone"] = 1,			-- Default or last selected map / zone
	["AtlasAcronyms"] = true,		-- Show dungeon's acronyms
	["AtlasScale"] = 1.0,			-- Atlas frame scale
	["AtlasClamped"] = true,		-- Clamp to WoW window
	["AtlasSortBy"] = 1,			-- Maps sorting type, 1: CONTINENT, 2: LEVEL, 3: PARTYSIZE, 4: EXPANSION, 5: TYPE
	["AtlasCtrl"] = false,			-- Press ctrl and mouse over to show full description text
	["AtlasBossDesc"] = true,		-- Toggle to show boss description or not
	["AtlasBossDescScale"] = 0.9,		-- The boss description GameToolTip scale
	["AtlasDontShowInfo"] = false, 		-- Atlas latest information
	["AtlasDontShowInfo_12201"] = false,
	["AtlasCheckModule"] = true,		-- Check if there is missing module / plugin
	["AtlasColoringDropDown"] = true,	-- Coloring dungeon dropdown list with difficulty colors
};

