-- $Id: Constants.lua 218 2017-04-13 15:10:34Z arith $
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
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
private.addon_name = "Atlas"

local LibStub = _G.LibStub
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
ATLAS_OLD_TYPE = false;
ATLAS_OLD_ZONE = false;


ATLAS_GAMETOOLTIP_ORIGINAL_SCALE = GameTooltip:GetScale();

-- Only update this version number when the options have been revised and a force update is needed.
ATLAS_OLDEST_VERSION_SAME_SETTINGS = "1.24.00"; 

-- Turn ON / OFF Atlas debug mode
ATLAS_DEBUGMODE = false;

ATLAS_LETTER_MARKS_TCOORDS = {
	["Atlas_Letter_Blue_A"] 	= {0.00000000, 0.15625000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_B"] 	= {0.15625000, 0.31250000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_C"] 	= {0.31250000, 0.46875000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_D"] 	= {0.46875000, 0.62500000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_E"] 	= {0.62500000, 0.78125000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_F"] 	= {0.78125000, 0.93750000, 0.00000000, 0.15625000},
	["Atlas_Letter_Blue_G"] 	= {0.00000000, 0.15625000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_H"] 	= {0.15625000, 0.31250000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_I"] 	= {0.31250000, 0.46875000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_J"] 	= {0.46875000, 0.62500000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_K"] 	= {0.62500000, 0.78125000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_L"] 	= {0.78125000, 0.93750000, 0.15625000, 0.31250000},
	["Atlas_Letter_Blue_M"] 	= {0.00000000, 0.15625000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_N"] 	= {0.15625000, 0.31250000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_O"] 	= {0.31250000, 0.46875000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_P"] 	= {0.46875000, 0.62500000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_Q"] 	= {0.62500000, 0.78125000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_R"] 	= {0.78125000, 0.93750000, 0.31250000, 0.46875000},
	["Atlas_Letter_Blue_S"] 	= {0.00000000, 0.15625000, 0.46875000, 0.62500000},
	["Atlas_Letter_Blue_T"] 	= {0.15625000, 0.31250000, 0.46875000, 0.62500000},
	["Atlas_Letter_Blue_U"] 	= {0.31250000, 0.46875000, 0.46875000, 0.62500000},
	["Atlas_Letter_Blue_V"] 	= {0.46875000, 0.62500000, 0.46875000, 0.62500000},
	["Atlas_Letter_Purple_A"] 	= {0.62500000, 0.78125000, 0.46875000, 0.62500000},
	["Atlas_Letter_Purple_B"] 	= {0.78125000, 0.93750000, 0.46875000, 0.62500000},
	["Atlas_Letter_Purple_C"] 	= {0.00000000, 0.15625000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_D"] 	= {0.15625000, 0.31250000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_E"] 	= {0.31250000, 0.46875000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_F"] 	= {0.46875000, 0.62500000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_G"] 	= {0.62500000, 0.78125000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_H"] 	= {0.78125000, 0.93750000, 0.62500000, 0.78125000},
	["Atlas_Letter_Purple_I"] 	= {0.00000000, 0.15625000, 0.78125000, 0.93750000},
	["Atlas_Letter_Purple_J"] 	= {0.15625000, 0.31250000, 0.78125000, 0.93750000},
	["Atlas_Letter_Purple_K"] 	= {0.31250000, 0.46875000, 0.78125000, 0.93750000},
	["Atlas_Letter_Purple_L"] 	= {0.46875000, 0.62500000, 0.78125000, 0.93750000},
	["Atlas_Letter_Purple_M"] 	= {0.62500000, 0.78125000, 0.78125000, 0.93750000},
	["Atlas_Letter_Purple_N"] 	= {0.78125000, 0.93750000, 0.78125000, 0.93750000},
};

ATLAS_FONT_COLORS = {
	["White"] 	= {1.00, 1.00, 1.00},
	["Yellow"] 	= {1.00, 1.00, 0.00},
	["Green"] 	= {0.00, 1.00, 0.00},
	["Red"] 	= {1.00, 0.00, 0.00},
	["Orange"] 	= {1.00, 0.82, 0.00},
	["Purple"]	= {0.73, 0.40, 1.00},
	["Blue"]	= {0.40, 0.40, 1.00},
};

ATLAS_TAXI_TCOORDS = {
	["TaxiNeutral"] 	= {0.00000000, 0.31250000, 0.00000000, 0.31250000},
	["TaxiHorde"] 		= {0.31250000, 0.62500000, 0.00000000, 0.31250000},
	["TaxiAlliance"] 	= {0.62500000, 0.93750000, 0.00000000, 0.31250000},
};


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

constants.defaults = {
	profile = {
		minimap = {
			hide = false,
			minimapPos = 190,
		},
		dropdowns = {
		},
		options = {
			autoSelect = false,			-- AtlasAutoSelect
			frames = {
				alpha = 1.0,			-- AtlasAlpha
				scale = 1.0,			-- AtlasScale
				boss_description_scale = 0.9,	-- AtlasBossDescScale
				showBossDesc = true,		-- AtlasBossDesc
				showBossPotrait = true,
				lock = false,			-- AtlasLocked
				rightClick = false,		-- AtlasRightClick
				contrClclick = false, 		-- AtlasCtrl
				clamp = true, 			-- AtlasClamped
				showAcronyms = true,		-- AtlasAcronyms
			},
			dropdowns = {
				color = true,			-- AtlasColoringDropDown
				menuType = 1,			-- AtlasSortBy
				module = 9,			-- AtlasType (continent menu type's 9th item is Broken Isles - Dungeon)
				zone = 1,			-- AtlasZone
			},
			worldMapButton = true,			-- AtlasWorldMapButtonShown
			checkMissingModules = true,		-- AtlasCheckModule
			disableUpdateNotification = false,	-- AtlasDontShowInfo
			last_compatible_version = ATLAS_OLDEST_VERSION_SAME_SETTINGS, -- AtlasVersion
		},
		options_copied = false,
	},
};

constants.moduleList = {
	"Atlas_ClassicWoW",
	"Atlas_BurningCrusade",
	"Atlas_WrathoftheLichKing",
	"Atlas_Cataclysm",
	"Atlas_MistsofPandaria",
	"Atlas_WarlordsofDraenor",
	"Atlas_Legion",
	"Atlas_Battlegrounds",
	"Atlas_DungeonLocs",
	"Atlas_OutdoorRaids",
	"Atlas_Transportation",
	"Atlas_Scenarios",
	"Atlas_ClassOrderHalls",
};

constants.deprecatedList = {
	-- List of deprecated Atlas modules.
	-- First value is the addon name
	-- Second value is the version
	-- Nil version means NO version will EVER be loaded!
	-- Non-nil version mean ONLY IT OR NEWER versions will be loaded!
	-- Note that 2.10 isn't greater than 2.9 (2.10 >= 2.9 will fail), so the addon version number must be with the same digits
	-- For example, name it as 2.09 instead of 2.9
	-- Most recent (working) versions of known modules at time of release
	-- Atlas Modules
	{ "Atlas_Legion",	 	"1.40.00" },
	{ "Atlas_WarlordsofDraenor", 	"1.39.00" },
	{ "Atlas_MistsofPandaria",	"1.39.00" },
	{ "Atlas_Cataclysm", 		"1.39.00" },
	{ "Atlas_WrathoftheLichKing", 	"1.39.00" },
	{ "Atlas_BurningCrusade", 	"1.39.00" },
	{ "Atlas_ClassicWoW", 		"1.39.00" },
	-- Atlas Plugins
	{ "Atlas_Battlegrounds", 	"1.39.00" },
	{ "Atlas_DungeonLocs", 		"1.39.00" },
	{ "Atlas_OutdoorRaids", 	"1.39.00" },
	{ "Atlas_Transportation", 	"1.39.00" },
	{ "Atlas_Scenarios", 		"1.39.00" },
	{ "Atlas_ClassOrderHalls",	"1.39.00" },
	-- 3rd parties plugins
	{ "AtlasQuest", 		"4.10.25" },
	{ "Atlas_Arena", 		"1.06.00" },
	{ "Atlas_WorldEvents", 		"3.15" },
	{ "AtlasLoot", 			"v8.03.02", "r4615" },
	{ "AtlasMajorCitiesEnhanced", 	"v1.13" }, 	
	--{ "AtlasWorld", 		"3.3.5.25" }, 	-- updated July 14, 2010 -- comment out because this plugin is no longer maintained
};
