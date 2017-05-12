-- $Id: Maps.lua 218 2017-04-13 15:10:34Z arith $
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

-- Atlas Map Data
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
local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas");
local ALIL = Atlas_IngameLocales;

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local GREY = "|cff999999";
local LBLU = "|cff33cccc";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PINK = "|ccfcc33cc";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local YLOW = "|cffcccc33";
local INDENT = "      ";


--[[
# Structure of JournalInstance.dbc
Column	Field		Type		Notes
------	-------------	--------	----------------------------------------------------------------------------------------------
1	ID		Integer
2	Map ID		Integer		Map ID refer to Map.dbc's 1st column
3	Area ID		Integer		Area ID refer to AreaTable.dbc's 1st column
4~6			Integer
7			Integer
8	Name		String
9	Description	String


# Structure of JournalEncounter.dbc
Column	Field		Type		Notes
------	-------------	--------	----------------------------------------------------------------------------------------------
1	ID		Integer
2	Map ID?		Integer
3	Area ID?	Integer
4~5			Float
6	Selection ID	Integer
7	Instance ID	Integer		Refer to JournalInstance.dbc's 1st column
8	Index		Integer		Boss index
9
10	Name		String		Boss name
11	Description	String		Boss description


# Structure of JournalEncounterCreature.dbc
Column	Field 		Type 		Notes
------	-------------	--------	----------------------------------------------------------------------------------------------
1	ID		Integer
2	encounterID	Integer
3	modelID		Integer
4	Index		Integer
5			Integer
6	name		String


# Structure of LFGDungeons.dbc
Column	Field 		Type 		Notes
------	-------------	--------	----------------------------------------------------------------------------------------------
1 	ID 		Integer 		
2	Map Name	String		Dungeon Name
3	level_min 	Integer 	Minimum level to participate. 
4 	level_max 	Integer 	Maximum level when this dungeon becomes trivial. 
5	rec_level	Integer
6	rec_minlevel	Integer
7	rec_maxlevel	Integer
8 	Map ID	        Integer 	Here you must add the Map Id where you will be ported
9	difficulty	Integer
13	systemname
14	expansion

]]

local myMaps = {
--[[
Syntax: 
	MapName = {
		ZoneName = { "Map name" };
		Location = { "Location of this map" };
		LevelRange = "level range";
		MinLevel = "minimum level";
		PlayerLimit = "player limit";
		Acronym = "acronym";
		MinGearLevel = "minimum itel level to enter this instance";
		JournalInstanceID = "journal instance ID"; 	-- ID can be found from JournalInstance.dbc, Column 1 is the dungeon ID, column 8 is dungeon name
		DungeonID = "LFGDungeon ID"; 			-- ID can be fround from LFGDungeons.dbc.txt
		DungeonHeoricID = "LFGDungeon ID for Heroic mode";
		DungeonMythicID = "LFGDungeon ID for Mythic mode";
		WorldMapID = "worldmap ID";
		DungeonLevel = "level number of the dungeon map series";
		Module = "map module name";
		LargeMap = "large map's prefix name";
		PrevMap = "previous map name";
		NextMap = "next map name";
		{ "list entry 1", id of list entry or encounter id };
		{ "list entry 2", "achivement id by using the format of ac=12345" };
		{ "list entry 3" item id, "item", "item's English name"};
		{ "list entry 4" };
	};
]]

--************************************************
-- Instance Entrance Maps
--************************************************

	BlackrockMountainEnt = {
		ZoneName = { BZ["Blackrock Mountain"]..L["L-Parenthesis"]..L["Entrance"]..L["R-Parenthesis"] };
		Location = { BZ["Searing Gorge"]..L["Slash"]..BZ["Burning Steppes"] };
		LevelRange = "49-100+";
		MinLevel = "47";
		PlayerLimit = "5/10/25/40";
		Acronym = L["BRM"];
		{ BLUE.." A) "..BZ["Searing Gorge"], 10001 };
		{ BLUE.." B) "..BZ["Burning Steppes"], 10002 };
		{ BLUE.." C) "..BZ["Blackrock Depths"], 10003 };
		{ BLUE.." D) "..BZ["Lower Blackrock Spire"], 10004 };
		{ BLUE..INDENT..BZ["Upper Blackrock Spire"] };
		{ GREN..INDENT..L["Bodley"]..L["L-Parenthesis"]..L["Ghost"]..L["R-Parenthesis"] };
		{ BLUE.." E) "..BZ["The Molten Core"], 10005 };
		{ GREN..INDENT..L["Lothos Riftwaker"] };
		{ BLUE.." F) "..BZ["Blackwing Lair"], 10006 };
		{ GREN..INDENT..L["Orb of Command"] };
		{ BLUE.." G) "..BZ["Blackrock Caverns"], 10007 };
		{ ORNG.." 1) "..L["Scarshield Quartermaster <Scarshield Legion>"]..L["L-Parenthesis"]..L["Upper"]..L["R-Parenthesis"], 10008 };
		{ ORNG.." 2) "..L["The Behemoth"]..L["L-Parenthesis"]..L["Rare"]..L["Comma"]..L["Wanders"]..L["R-Parenthesis"], 10009 };
		{ ORNG.." 3) "..addon:GetBossName("Overmaster Pyron")..L["L-Parenthesis"]..L["Wanders"]..L["R-Parenthesis"], 10010 };
		{ GREN.." 1') "..L["Meeting Stone"]..L["L-Parenthesis"]..BZ["Blackrock Depths"]..L["R-Parenthesis"], 10011 };
		{ GREN.." 2') "..L["Meeting Stone"]..L["L-Parenthesis"]..BZ["Lower Blackrock Spire"]..L["Comma"]..BZ["Upper Blackrock Spire"]..L["R-Parenthesis"], 10012 };
	};
	CavernsOfTimeEnt = {
		ZoneName = { BZ["Caverns of Time"]..L["L-Parenthesis"]..L["Entrance"]..L["R-Parenthesis"] };
		Location = { BZ["Tanaris"] };
		LevelRange = "66-85+";
		MinLevel = "66";
		PlayerLimit = "5/10/25";
		Acronym = L["CoT"];
		{ BLUE.." A) "..L["Entrance"], 10001 };
		{ BLUE.." B) "..BZ["Hyjal Summit"], 10002 };
		{ BLUE.." C) "..BZ["Old Hillsbrad Foothills"], 10003 };
		{ BLUE.." D) "..BZ["The Black Morass"], 10004 };
		{ BLUE.." E) "..BZ["The Culling of Stratholme"], 10005 };
		{ BLUE.." F) "..BZ["Dragon Soul"], 10006 };
		{ BLUE.." G) "..BZ["End Time"], 10007 };
		{ BLUE.." H) "..BZ["Well of Eternity"], 10008 };
		{ BLUE.." I) "..BZ["Hour of Twilight"], 10009 };
		{ GREN.." 1') "..L["Steward of Time <Keepers of Time>"], 10010 };
		{ GREN.." 2') "..L["Alexston Chrome <Tavern of Time>"], 10011 };
		{ GREN.." 3') "..L["Graveyard"], 10012 };
		{ GREN.." 4') "..L["Yarley <Armorer>"], 10013 };
		{ GREN.." 5') "..L["Bortega <Reagents & Poison Supplies>"], 10014 };
		{ GREN..INDENT..L["Alurmi <Keepers of Time Quartermaster>"] };
		{ GREN..INDENT..L["Galgrom <Provisioner>"] };
		{ GREN.." 6') "..L["Zaladormu"], 10015 };
		{ GREN..INDENT..L["Soridormi <The Scale of Sands>"]..L["L-Parenthesis"]..L["Wanders"]..L["R-Parenthesis"] };
		{ GREN..INDENT..L["Arazmodu <The Scale of Sands>"]..L["L-Parenthesis"]..L["Wanders"]..L["R-Parenthesis"] };
		{ GREN.." 7') "..L["Moonwell"], 10016 };
		{ GREN.." 8') "..L["Andormu <Keepers of Time>"]..L["L-Parenthesis"]..L["Child"]..L["R-Parenthesis"], 10017 };
		{ GREN..INDENT..L["Nozari <Keepers of Time>"]..L["L-Parenthesis"]..L["Child"]..L["R-Parenthesis"] };
		{ GREN.." 9') "..L["Anachronos <Keepers of Time>"], 10018 };
		{ GREN.."10') "..L["Andormu <Keepers of Time>"]..L["L-Parenthesis"]..L["Adult"]..L["R-Parenthesis"], 10019 };
		{ GREN..INDENT..L["Nozari <Keepers of Time>"]..L["L-Parenthesis"]..L["Adult"]..L["R-Parenthesis"] };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end

