 -- $Id: Data.lua 36 2018-01-21 15:43:43Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2011 ~ 2018 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

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
-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local pairs = _G.pairs
-- Libraries
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local LibStub = _G.LibStub;
local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas")
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")
local WoLK = Atlas:GetModule(private.module_name)

local db = {}
WoLK.db = db

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

db.AtlasMaps = {
	AhnKahet = {
		ZoneName = { BZ["Ahn'kahet: The Old Kingdom"] },
		Location = { BZ["Dragonblight"] },
		DungeonID = "218",
		DungeonHeroicID = "219",
		Acronym = L["AK, Kahet"],
		WorldMapID = "522",
		JournalInstanceID = "271",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Seer Ixit"] },
		{ BLUE.." B) "..ALC["Exit"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Elder Nadox", 580), 580 },
		{ WHIT.." 2) "..Atlas:GetBossName("Prince Taldaram", 581), 581 },
		{ WHIT.." 3) "..Atlas:GetBossName("Amanitar", 583)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 583 },
		{ WHIT.." 4) "..Atlas:GetBossName("Jedoga Shadowseeker", 582), 582 },
		{ WHIT.." 5) "..Atlas:GetBossName("Herald Volazj", 584), 584 },
		{ GREN.." 1') "..L["Ahn'kahet Brazier"], 10003 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Ahn'kahet: The Old Kingdom", "ac=481" },
		{ "Volazj's Quick Demise", "ac=1862" },
		{ "Respect Your Elders", "ac=2038" },
		{ "Volunteer Work", "ac=2056" },
		{ "Heroic: Ahn'kahet: The Old Kingdom", "ac=492" },
		{ "Heroic: Ahn'kahet: The Old Kingdom Guild Run", "ac=5098" },
	},
	AzjolNerub = {
		ZoneName = { BZ["Azjol-Nerub"] },
		Location = { BZ["Dragonblight"] },
		DungeonID = "204",
		DungeonHeroicID = "241",
		Acronym = L["AN, Nerub"],
		WorldMapID = "533",
		JournalInstanceID = "272",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Reclaimer A'zak"] },
		{ BLUE.." B) "..ALC["Connection"], 10002 },
		{ BLUE.." C) "..ALC["Exit"], 10003 },
		{ WHIT.." 1) "..Atlas:GetBossName("Krik'thir the Gatewatcher", 585), 585 },
		{ WHIT..INDENT..L["Watcher Gashra"] },
		{ WHIT..INDENT..L["Watcher Narjil"] },
		{ WHIT..INDENT..L["Watcher Silthik"] },
		{ WHIT.." 2) "..Atlas:GetBossName("Hadronox", 586), 586 },
		{ WHIT.." 3) "..Atlas:GetBossName("Anub'arak", 587), 587 },
		{ GREN.." 1') "..L["Elder Nurgen"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10004 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Azjol-Nerub", "ac=480" },
		{ "Watch Him Die", "ac=1296" },
		{ "Hadronox Denied", "ac=1297" },
		{ "Gotta Go!", "ac=1860" },
		{ "Heroic: Azjol-Nerub", "ac=491" },
		{ "Heroic: Azjol-Nerub Guild Run", "ac=5097" },
	},
	CavernsOfTimeEnt = {
		ZoneName = { BZ["Caverns of Time"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] },
		Location = { BZ["Tanaris"] },
		LevelRange = "66-85+",
		MinLevel = "66",
		PlayerLimit = { 5, 10, 25},
		Acronym = L["CoT"],
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..L["Entrance"], 10001 },
		{ BLUE.." B) "..BZ["Hyjal Summit"], 10002 },
		{ BLUE.." C) "..BZ["Old Hillsbrad Foothills"], 10003 },
		{ BLUE.." D) "..BZ["The Black Morass"], 10004 },
		{ BLUE.." E) "..BZ["The Culling of Stratholme"], 10005 },
		{ BLUE.." F) "..BZ["Dragon Soul"], 10006 },
		{ BLUE.." G) "..BZ["End Time"], 10007 },
		{ BLUE.." H) "..BZ["Well of Eternity"], 10008 },
		{ BLUE.." I) "..BZ["Hour of Twilight"], 10009 },
		{ GREN.." 1') "..L["Steward of Time <Keepers of Time>"], 10010 },
		{ GREN.." 2') "..L["Alexston Chrome <Tavern of Time>"], 10011 },
		{ GREN.." 3') "..L["Graveyard"], 10012 },
		{ GREN.." 4') "..L["Yarley <Armorer>"], 10013 },
		{ GREN.." 5') "..L["Bortega <Reagents & Poison Supplies>"], 10014 },
		{ GREN..INDENT..L["Alurmi <Keepers of Time Quartermaster>"] },
		{ GREN..INDENT..L["Galgrom <Provisioner>"] },
		{ GREN.." 6') "..L["Zaladormu"], 10015 },
		{ GREN..INDENT..L["Soridormi <The Scale of Sands>"]..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Arazmodu <The Scale of Sands>"]..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"] },
		{ GREN.." 7') "..L["Moonwell"], 10016 },
		{ GREN.." 8') "..L["Andormu <Keepers of Time>"]..ALC["L-Parenthesis"]..ALC["Child"]..ALC["R-Parenthesis"], 10017 },
		{ GREN..INDENT..L["Nozari <Keepers of Time>"]..ALC["L-Parenthesis"]..ALC["Child"]..ALC["R-Parenthesis"] },
		{ GREN.." 9') "..L["Anachronos <Keepers of Time>"], 10018 },
		{ GREN.."10') "..L["Andormu <Keepers of Time>"]..ALC["L-Parenthesis"]..ALC["Adult"]..ALC["R-Parenthesis"], 10019 },
		{ GREN..INDENT..L["Nozari <Keepers of Time>"]..ALC["L-Parenthesis"]..ALC["Adult"]..ALC["R-Parenthesis"] },
	},
	CoTOldStratholme = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["The Culling of Stratholme"] },
		Location = { BZ["Tanaris"] },
		DungeonID = "209",
		DungeonHeroicID = "210",
		Acronym = L["CoT-Strat"],
		WorldMapID = "521",
		JournalInstanceID = "279",
		Module = "Atlas_WrathoftheLichKing",
		{ PURP..ALC["Event"]..ALC["Colon"]..L["The Culling of Stratholme"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Exit"]..ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 },
		{ ORNG.." X) "..L["Scourge Invasion Points"], 10003 },
		{ WHIT..INDENT..ALC["Wave 5"]..ALC["Colon"]..Atlas:GetBossName("Meathook", 611), 611 },
		{ WHIT..INDENT..ALC["Wave 10"]..ALC["Colon"]..Atlas:GetBossName("Salramm the Fleshcrafter", 612), 612 },
		{ WHIT.." 3) "..Atlas:GetBossName("Chrono-Lord Epoch", 613), 613 },
		{ WHIT.." 4) "..Atlas:GetBossName("Infinite Corruptor")..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 10004 },
		{ GREN..INDENT..L["Guardian of Time"] },
		{ WHIT.." 5) "..Atlas:GetBossName("Mal'Ganis", 614), 614 },
		{ GREN..INDENT..L["Chromie"] },
		{ GREN.." 1') "..L["Chromie"], 10005 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Culling of Stratholme", "ac=479" },
		{ "The Culling of Time", "ac=1817" },
		{ "Zombiefest!", "ac=1872" },
		{ "Heroic: The Culling of Stratholme", "ac=500" },
		{ "Heroic: The Culling of Stratholme Guild Run", "ac=5106" },
	},
	DrakTharonKeep = {
		ZoneName = { BZ["Drak'Tharon Keep"] },
		Location = { BZ["Grizzly Hills"] },
		DungeonID = "214",
		DungeonHeroicID = "215",
		Acronym = L["DTK"],
		WorldMapID = "534",
		JournalInstanceID = "273",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Image of Drakuru"] },
		{ GREN..INDENT..L["Kurzel"] },
		{ BLUE.." B-C) "..ALC["Connection"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Trollgore", 588), 588 },
		{ WHIT.." 2) "..Atlas:GetBossName("Novos the Summoner", 589), 589 },
		{ WHIT.." 3) "..Atlas:GetBossName("King Dred", 590), 590 },
		{ WHIT.." 4) "..Atlas:GetBossName("The Prophet Tharon'ja", 591), 591 },
		{ GREN.." 1') "..L["Elder Kilias"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10003 },
		{ GREN.." 2') "..L["Drakuru's Brazier"], 10004 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Drak'Tharon Keep", "ac=482" },
		{ "Consumption Junction", "ac=2151" },
		{ "Better Off Dred", "ac=2039" },
		{ "Oh Novos!", "ac=2057" },
		{ "Heroic: Drak'Tharon Keep", "ac=493" },
		{ "Heroic: Drak'Tharon Keep Guild Run", "ac=5099" },
	},
	FHHallsOfReflection = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["Halls of Reflection"] },
		Location = { BZ["Icecrown Citadel"] },
		DungeonID = "255",
		DungeonHeroicID = "256",
		Acronym = L["HoR"]..ALC["Comma"]..L["FH3"],
		WorldMapID = "603",
		JournalInstanceID = "276",
		Module = "Atlas_WrathoftheLichKing",
		{ ORNG..ALC["Attunement Required"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Dalaran"]..ALC["R-Parenthesis"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Falric", 601)..ALC["L-Parenthesis"]..ALC["Wave 5"]..ALC["R-Parenthesis"], 601 },
		{ WHIT.." 2) "..Atlas:GetBossName("Marwyn", 602)..ALC["L-Parenthesis"]..ALC["Wave 10"]..ALC["R-Parenthesis"], 602 },
		{ WHIT.." 3) "..Atlas:GetBossName("Escape from Arthas", 603)..ALC["L-Parenthesis"]..ALC["Event"]..ALC["R-Parenthesis"], 603 },
		{ GREN..INDENT..L["The Captain's Chest"] },
		{ GREN.." 1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 },
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Halls of Reflection", "ac=4518" },
		{ "We're Not Retreating, We're Advancing in a Different Direction.", "ac=4526" },
		{ "Heroic: The Halls of Reflection", "ac=4521" },
		{ "Heroic: The Halls of Reflection Guild Run", "ac=5114" },
	},
	FHPitOfSaron = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["Pit of Saron"] },
		Location = { BZ["Icecrown Citadel"] },
		DungeonID = "253",
		DungeonHeroicID = "254",
		Acronym = L["PoS"]..ALC["Comma"]..L["FH2"],
		WorldMapID = "602",
		JournalInstanceID = "278",
		Module = "Atlas_WrathoftheLichKing",
		{ ORNG..ALC["Attunement Required"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Halls of Reflection"]..ALC["R-Parenthesis"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Forgemaster Garfrost", 608), 608 },
		{ GREN..INDENT..L["Martin Victus"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Gorkun Ironskull"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ WHIT.." 2) "..Atlas:GetBossName("Ick & Krick", 609), 609 },
		{ WHIT.." 3) "..Atlas:GetBossName("Scourgelord Tyrannus", 610), 610 },
		{ WHIT..INDENT..L["Rimefang"] },
		{ GREN.."1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 },
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Archmage Elandra <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Kalira"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Pit of Saron", "ac=4517" },
		{ "Doesn't Go to Eleven", "ac=4524" },
		{ "Don't Look Up", "ac=4525" },
		{ "Heroic: The Pit of Saron", "ac=4520" },
		{ "Heroic: The Pit of Saron Guild Run", "ac=5113" },
	},
	FHTheForgeOfSouls = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["The Forge of Souls"] },
		Location = { BZ["Icecrown Citadel"] },
		DungeonID = "251",
		DungeonHeroicID = "252",
		Acronym = L["FoS"]..ALC["Comma"]..L["FH1"],
		WorldMapID = "601",
		JournalInstanceID = "280",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Pit of Saron"]..ALC["R-Parenthesis"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Bronjahm", 615), 615 },
		{ WHIT.." 2) "..Atlas:GetBossName("Devourer of Souls", 616), 616 },
		{ GREN.." 1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 },
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Archmage Elandra <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Kalira"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Forge of Souls", "ac=4516" },
		{ "Soul Power", "ac=4522" },
		{ "Three Faced", "ac=4523" },
		{ "Heroic: The Forge of Souls", "ac=4519" },
		{ "Heroic: The Forge of Souls Guild Run", "ac=5112" },
	},
	Gundrak = {
		ZoneName = { BZ["Gundrak"] },
		Location = { BZ["Zul'Drak"] },
		DungeonID = "216",
		DungeonHeroicID = "217",
		Acronym = L["Gun"],
		WorldMapID = "530",
		JournalInstanceID = "274",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Chronicler Bah'Kini"]..ALC["Slash"]..L["Tol'mar"] },
		{ BLUE.." B) "..ALC["Exit"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Slad'ran", 592), 592 },
		{ WHIT.." 2) "..Atlas:GetBossName("Drakkari Colossus", 593), 593 },
		{ WHIT.." 3) "..Atlas:GetBossName("Moorabi", 594), 594 },
		{ WHIT.." 4) "..Atlas:GetBossName("Eck the Ferocious", 595)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"], 595 },
		{ WHIT.." 5) "..Atlas:GetBossName("Gal'darah", 596), 596 },
		{ GREN.." 1') "..L["Elder Ohanzee"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10003 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Gundrak", "ac=484" },
		{ "What the Eck?", "ac=1864" },
		{ "Share The Love", "ac=2152" },
		{ "Less-rabi", "ac=2040" },
		{ "Snakes. Why'd It Have To Be Snakes?", "ac=2058" },
		{ "Heroic: Gundrak", "ac=495" },
		{ "Heroic: Gundrak Guild Run", "ac=5101" },
	},
	IcecrownEnt = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] },
		Location = { BZ["Icecrown"] },
		LevelRange = "80-83",
		MinLevel = "75",
		PlayerLimit = { 5, 10, 25 },
		Acronym = L["IC"],
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..BZ["The Forge of Souls"], 10002 },
		{ BLUE.." C) "..BZ["Pit of Saron"], 10003 },
		{ BLUE.." D) "..BZ["Halls of Reflection"], 10004 },
		{ BLUE.." E) "..BZ["Icecrown Citadel"], 10005 },
		{ GREN.." 1') "..ALC["Meeting Stone"], 10006 },
	},
	IcecrownCitadelA = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapA"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] },
		Location = { BZ["Icecrown"] },
		DungeonID = "279",
		DungeonHeroicID = "280",
		Acronym = L["IC"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "604",
		DungeonLevel = "1",
		JournalInstanceID = "758",
		Module = "Atlas_WrathoftheLichKing",
		NextMap = "IcecrownCitadelB",
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Elevator"], 10002 },
		{ BLUE.." C) "..L["To next map"], 10003 },
		{ WHIT.." 1) "..Atlas:GetBossName("Lord Marrowgar", 1624), 1624 },
		{ WHIT.." 2) "..Atlas:GetBossName("Lady Deathwhisper", 1625), 1625 },
		{ WHIT.." 3) "..Atlas:GetBossName("Icecrown Gunship Battle", 1626)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 1626 },
		{ WHIT.." 4) "..Atlas:GetBossName("Icecrown Gunship Battle", 1627)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 1627 },
		{ WHIT.." 5) "..Atlas:GetBossName("Deathbringer Saurfang", 1628), 1628 },
		{ GREN.." 1') "..BZ["Light's Hammer"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10009 },
		{ GREN.." 2') "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Dalaran"]..ALC["R-Parenthesis"], 10012 },
		{ GREN.." 3') "..BZ["Oratory of the Damned"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10010 },
		{ GREN.." 4') "..BZ["Rampart of Skulls"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["Comma"]..ALC["Lower"]..ALC["R-Parenthesis"], 10011 },
		{ GREN..INDENT..BZ["Deathbringer's Rise"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["Comma"]..ALC["Upper"]..ALC["R-Parenthesis"] },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Storming the Citadel (10 player)", "ac=4531" },
		{ "Storming the Citadel (25 player)", "ac=4604" },
		{ "The Plagueworks (10 player)", "ac=4528" },
		{ "The Plagueworks (25 player)", "ac=4605" },
		{ "The Crimson Hall (10 player)", "ac=4529" },
		{ "The Crimson Hall (25 player)", "ac=4606" },
		{ "The Frostwing Halls (10 player)", "ac=4527" },
		{ "The Frostwing Halls (25 player)", "ac=4607" },
		{ "The Frozen Throne (10 player)", "ac=4530" },
		{ "The Frozen Throne (25 player)", "ac=4597" },
		{ "Bane of the Fallen King", "ac=4583" },
		{ "The Light of Dawn", "ac=4584" },
		{ "Fall of the Lich King (10 player)", "ac=4532" },
		{ "Boned (10 player)", "ac=4534" },
		{ "Boned (25 player)", "ac=4610" },
		{ "Full House (10 player)", "ac=4535" },
		{ "Full House (25 player)", "ac=4611" },
		{ "I'm on a Boat (10 player)", "ac=4536" },
		{ "I'm on a Boat (25 player)", "ac=4612" },
		{ "I've Gone and Made a Mess (10 player)", "ac=4537" },
		{ "I've Gone and Made a Mess (25 player)", "ac=4613" },
		{ "Dances with Oozes (10 player)", "ac=4538" },
		{ "Dances with Oozes (25 player)", "ac=4614" },
		{ "Flu Shot Shortage (10 player)", "ac=4577" },
		{ "Flu Shot Shortage (25 player)", "ac=4615" },
		{ "Nausea, Heartburn, Indigestion... (10 player)", "ac=4578" },
		{ "Nausea, Heartburn, Indigestion... (25 player)", "ac=4616" },
		{ "The Orb Whisperer (10 player)", "ac=4582" },
		{ "The Orb Whisperer (25 player)", "ac=4617" },
		{ "Once Bitten, Twice Shy (10 player)", "ac=4539" },
		{ "Once Bitten, Twice Shy (25 player)", "ac=4618" },
		{ "Portal Jockey (10 player)", "ac=4579" },
		{ "Portal Jockey (25 player)", "ac=4619" },
		{ "All You Can Eat (10 player)", "ac=4580" },
		{ "All You Can Eat (25 player)", "ac=4620" },
		{ "Been Waiting a Long Time for This (10 player)", "ac=4601" },
		{ "Been Waiting a Long Time for This (25 player)", "ac=4621" },
		{ "Neck-Deep in Vile (10 player)", "ac=4581" },
		{ "Neck-Deep in Vile (25 player)", "ac=4622" },
		{ "The Frozen Throne - Guild Edition", "ac=5023" },
		{ "Heroic: Storming the Citadel (10 player)", "ac=4628" },
		{ "Heroic: Storming the Citadel (25 player)", "ac=4632" },
		{ "Heroic: The Plagueworks (10 player)", "ac=4629" },
		{ "Heroic: The Plagueworks (25 player)", "ac=4633" },
		{ "Heroic: The Crimson Hall (10 player)", "ac=4630" },
		{ "Heroic: The Crimson Hall (25 player)", "ac=4634" },
		{ "Heroic: The Frostwing Halls (10 player)", "ac=4631" },
		{ "Heroic: The Frostwing Halls (25 player)", "ac=4635" },
		{ "Heroic: Fall of the Lich King (10 player)", "ac=4636" },
		{ "Realm First! Fall of the Lich King", "ac=4576" },
	},
	IcecrownCitadelB = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapB"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"] },
		Location = { BZ["Icecrown"] },
		DungeonID = "279",
		DungeonHeroicID = "280",
		Acronym = L["IC"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "604",
		DungeonLevel = "5",
		JournalInstanceID = "758",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "IcecrownCitadelA",
		NextMap = "IcecrownCitadelC",
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] },
		{ BLUE.." C) "..L["From previous map"], 10001 },
		{ BLUE.." D-H) "..ALC["Connection"], 10002 },
		{ BLUE.." I) "..L["To next map"], 10003 },
		{ WHIT.." 6) "..L["Stinky"], 10004 },
		{ WHIT.." 7) "..L["Precious"], 10005 },
		{ WHIT.." 8) "..Atlas:GetBossName("Festergut", 1629), 1629 },
		{ WHIT.." 9) "..Atlas:GetBossName("Rotface", 1630), 1630 },
		{ WHIT.."10) "..Atlas:GetBossName("Professor Putricide", 1631), 1631 },
		{ WHIT.."11) "..Atlas:GetBossName("Blood Prince Council", 1632), 1632 },
		{ WHIT..INDENT..Atlas:GetBossName("Prince Valanar", 1632, 1) },
		{ WHIT..INDENT..Atlas:GetBossName("Prince Keleseth", 1632, 2) },
		{ WHIT..INDENT..Atlas:GetBossName("Prince Taldaram", 1632, 3) },
		{ WHIT.."12) "..Atlas:GetBossName("Blood-Queen Lana'thel", 1633), 1633 },
		{ WHIT.."13) "..L["Sister Svalna"], 10011 },
		{ WHIT.."14) "..Atlas:GetBossName("Valithria Dreamwalker", 1634), 1634 },
		{ WHIT.."15) "..Atlas:GetBossName("Sindragosa", 1635), 1635 },
		{ WHIT..INDENT..L["Rimefang"] },
		{ WHIT..INDENT..L["Spinestalker"] },
		{ GREN.." 4') "..L["Upper Spire"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10014 },
		{ GREN.." 5') "..L["Sindragosa's Lair"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10015 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Storming the Citadel (10 player)", "ac=4531" },
		{ "Storming the Citadel (25 player)", "ac=4604" },
		{ "The Plagueworks (10 player)", "ac=4528" },
		{ "The Plagueworks (25 player)", "ac=4605" },
		{ "The Crimson Hall (10 player)", "ac=4529" },
		{ "The Crimson Hall (25 player)", "ac=4606" },
		{ "The Frostwing Halls (10 player)", "ac=4527" },
		{ "The Frostwing Halls (25 player)", "ac=4607" },
		{ "The Frozen Throne (10 player)", "ac=4530" },
		{ "The Frozen Throne (25 player)", "ac=4597" },
		{ "Bane of the Fallen King", "ac=4583" },
		{ "The Light of Dawn", "ac=4584" },
		{ "Fall of the Lich King (10 player)", "ac=4532" },
		{ "Boned (10 player)", "ac=4534" },
		{ "Boned (25 player)", "ac=4610" },
		{ "Full House (10 player)", "ac=4535" },
		{ "Full House (25 player)", "ac=4611" },
		{ "I'm on a Boat (10 player)", "ac=4536" },
		{ "I'm on a Boat (25 player)", "ac=4612" },
		{ "I've Gone and Made a Mess (10 player)", "ac=4537" },
		{ "I've Gone and Made a Mess (25 player)", "ac=4613" },
		{ "Dances with Oozes (10 player)", "ac=4538" },
		{ "Dances with Oozes (25 player)", "ac=4614" },
		{ "Flu Shot Shortage (10 player)", "ac=4577" },
		{ "Flu Shot Shortage (25 player)", "ac=4615" },
		{ "Nausea, Heartburn, Indigestion... (10 player)", "ac=4578" },
		{ "Nausea, Heartburn, Indigestion... (25 player)", "ac=4616" },
		{ "The Orb Whisperer (10 player)", "ac=4582" },
		{ "The Orb Whisperer (25 player)", "ac=4617" },
		{ "Once Bitten, Twice Shy (10 player)", "ac=4539" },
		{ "Once Bitten, Twice Shy (25 player)", "ac=4618" },
		{ "Portal Jockey (10 player)", "ac=4579" },
		{ "Portal Jockey (25 player)", "ac=4619" },
		{ "All You Can Eat (10 player)", "ac=4580" },
		{ "All You Can Eat (25 player)", "ac=4620" },
		{ "Been Waiting a Long Time for This (10 player)", "ac=4601" },
		{ "Been Waiting a Long Time for This (25 player)", "ac=4621" },
		{ "Neck-Deep in Vile (10 player)", "ac=4581" },
		{ "Neck-Deep in Vile (25 player)", "ac=4622" },
		{ "The Frozen Throne - Guild Edition", "ac=5023" },
		{ "Heroic: Storming the Citadel (10 player)", "ac=4628" },
		{ "Heroic: Storming the Citadel (25 player)", "ac=4632" },
		{ "Heroic: The Plagueworks (10 player)", "ac=4629" },
		{ "Heroic: The Plagueworks (25 player)", "ac=4633" },
		{ "Heroic: The Crimson Hall (10 player)", "ac=4630" },
		{ "Heroic: The Crimson Hall (25 player)", "ac=4634" },
		{ "Heroic: The Frostwing Halls (10 player)", "ac=4631" },
		{ "Heroic: The Frostwing Halls (25 player)", "ac=4635" },
		{ "Heroic: Fall of the Lich King (10 player)", "ac=4636" },
		{ "Realm First! Fall of the Lich King", "ac=4576" },
	},
	IcecrownCitadelC = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapC"]..ALC["L-Parenthesis"]..BZ["The Frozen Throne"]..ALC["R-Parenthesis"] },
		Location = { BZ["Icecrown"] },
		DungeonID = "279",
		DungeonHeroicID = "280",
		Acronym = L["IC"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "604",
		DungeonLevel = "7",
		JournalInstanceID = "758",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "IcecrownCitadelB",
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] },
		{ BLUE.." I) "..L["From previous map"], 10001 },
		{ WHIT.."16) "..Atlas:GetBossName("The Lich King", 1636), 1636 },
		{ "Storming the Citadel (10 player)", "ac=4531" },
		{ "Storming the Citadel (25 player)", "ac=4604" },
		{ "The Plagueworks (10 player)", "ac=4528" },
		{ "The Plagueworks (25 player)", "ac=4605" },
		{ "The Crimson Hall (10 player)", "ac=4529" },
		{ "The Crimson Hall (25 player)", "ac=4606" },
		{ "The Frostwing Halls (10 player)", "ac=4527" },
		{ "The Frostwing Halls (25 player)", "ac=4607" },
		{ "The Frozen Throne (10 player)", "ac=4530" },
		{ "The Frozen Throne (25 player)", "ac=4597" },
		{ "Bane of the Fallen King", "ac=4583" },
		{ "The Light of Dawn", "ac=4584" },
		{ "Fall of the Lich King (10 player)", "ac=4532" },
		{ "Boned (10 player)", "ac=4534" },
		{ "Boned (25 player)", "ac=4610" },
		{ "Full House (10 player)", "ac=4535" },
		{ "Full House (25 player)", "ac=4611" },
		{ "I'm on a Boat (10 player)", "ac=4536" },
		{ "I'm on a Boat (25 player)", "ac=4612" },
		{ "I've Gone and Made a Mess (10 player)", "ac=4537" },
		{ "I've Gone and Made a Mess (25 player)", "ac=4613" },
		{ "Dances with Oozes (10 player)", "ac=4538" },
		{ "Dances with Oozes (25 player)", "ac=4614" },
		{ "Flu Shot Shortage (10 player)", "ac=4577" },
		{ "Flu Shot Shortage (25 player)", "ac=4615" },
		{ "Nausea, Heartburn, Indigestion... (10 player)", "ac=4578" },
		{ "Nausea, Heartburn, Indigestion... (25 player)", "ac=4616" },
		{ "The Orb Whisperer (10 player)", "ac=4582" },
		{ "The Orb Whisperer (25 player)", "ac=4617" },
		{ "Once Bitten, Twice Shy (10 player)", "ac=4539" },
		{ "Once Bitten, Twice Shy (25 player)", "ac=4618" },
		{ "Portal Jockey (10 player)", "ac=4579" },
		{ "Portal Jockey (25 player)", "ac=4619" },
		{ "All You Can Eat (10 player)", "ac=4580" },
		{ "All You Can Eat (25 player)", "ac=4620" },
		{ "Been Waiting a Long Time for This (10 player)", "ac=4601" },
		{ "Been Waiting a Long Time for This (25 player)", "ac=4621" },
		{ "Neck-Deep in Vile (10 player)", "ac=4581" },
		{ "Neck-Deep in Vile (25 player)", "ac=4622" },
		{ "The Frozen Throne - Guild Edition", "ac=5023" },
		{ "Heroic: Storming the Citadel (10 player)", "ac=4628" },
		{ "Heroic: Storming the Citadel (25 player)", "ac=4632" },
		{ "Heroic: The Plagueworks (10 player)", "ac=4629" },
		{ "Heroic: The Plagueworks (25 player)", "ac=4633" },
		{ "Heroic: The Crimson Hall (10 player)", "ac=4630" },
		{ "Heroic: The Crimson Hall (25 player)", "ac=4634" },
		{ "Heroic: The Frostwing Halls (10 player)", "ac=4631" },
		{ "Heroic: The Frostwing Halls (25 player)", "ac=4635" },
		{ "Heroic: Fall of the Lich King (10 player)", "ac=4636" },
		{ "Realm First! Fall of the Lich King", "ac=4576" },
	},
	Naxxramas = {
		ZoneName = { BZ["Naxxramas"] },
		Location = { BZ["Dragonblight"] },
		DungeonID = "159",
		DungeonHeroicID = "227",
		Acronym = L["Nax"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "535",
		JournalInstanceID = "754",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Mr. Bigglesworth"]..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"] },
		{ WHIT..BZ["The Construct Quarter"] },
		{ WHIT..INDENT.."1) "..Atlas:GetBossName("Patchwerk", 1610), 1610 },
		{ WHIT..INDENT.."2) "..Atlas:GetBossName("Grobbulus", 1611), 1611 },
		{ WHIT..INDENT.."3) "..Atlas:GetBossName("Gluth", 1612), 1612 },
		{ WHIT..INDENT.."4) "..Atlas:GetBossName("Thaddius", 1613), 1613 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Stalagg") },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Feugen") },
		{ ORNG..BZ["The Arachnid Quarter"] },
		{ ORNG..INDENT.."1) "..Atlas:GetBossName("Anub'Rekhan", 1601), 1601 },
		{ ORNG..INDENT.."2) "..Atlas:GetBossName("Grand Widow Faerlina", 1602), 1602 },
		{ ORNG..INDENT.."3) "..Atlas:GetBossName("Maexxna", 1603), 1603 },
		{ _RED..BZ["The Military Quarter"] },
		{ _RED..INDENT.."1) "..Atlas:GetBossName("Instructor Razuvious", 1607), 1607 },
		{ _RED..INDENT.."2) "..Atlas:GetBossName("Gothik the Harvester", 1608), 1608 },
		{ _RED..INDENT.."3) "..Atlas:GetBossName("The Four Horsemen", 1609), 1609 },
		{ _RED..INDENT..INDENT..Atlas:GetBossName("Baron Rivendare", 1609, 1) },
		{ _RED..INDENT..INDENT..Atlas:GetBossName("Thane Korth'azz", 1609, 2) },
		{ _RED..INDENT..INDENT..Atlas:GetBossName("Lady Blaumeux", 1609, 3) },
		{ _RED..INDENT..INDENT..Atlas:GetBossName("Sir Zeliek", 1609, 4) },
		{ GREN..INDENT..INDENT..Atlas:GetBossName("Four Horsemen Chest") },
		{ PURP..BZ["The Plague Quarter"] },
		{ PURP..INDENT.."1) "..Atlas:GetBossName("Noth the Plaguebringer", 1604), 1604 },
		{ PURP..INDENT.."2) "..Atlas:GetBossName("Heigan the Unclean", 1605), 1605 },
		{ PURP..INDENT.."3) "..Atlas:GetBossName("Loatheb", 1606), 1606 },
		{ GREN..L["Frostwyrm Lair"] },
		{ GREN..INDENT.."1) "..Atlas:GetBossName("Sapphiron", 1614), 1614 },
		{ GREN..INDENT.."2) "..Atlas:GetBossName("Kel'Thuzad", 1615), 1615 },
		{ "" },
		{ GREN.." 1') "..L["Teleporter to Middle"], 10017 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Arachnid Quarter (10 player)", "ac=562" },
		{ "The Arachnid Quarter (25 player)", "ac=563" },
		{ "The Construct Quarter (10 player)", "ac=564" },
		{ "The Construct Quarter (25 player)", "ac=565" },
		{ "The Plague Quarter (10 player)", "ac=566" },
		{ "The Plague Quarter (25 player)", "ac=567" },
		{ "The Military Quarter (10 player)", "ac=568" },
		{ "The Military Quarter (25 player)", "ac=569" },
		{ "Sapphiron's Demise (10 player)", "ac=572" },
		{ "Sapphiron's Demise (25 player)", "ac=573" },
		{ "Kel'Thuzad's Defeat (10 player)", "ac=574" },
		{ "Kel'Thuzad's Defeat (25 player)", "ac=575" },
		{ "The Fall of Naxxramas (10 player)", "ac=576" },
		{ "The Fall of Naxxramas (25 player)", "ac=577" },
		{ "The Dedicated Few (10 player)", "ac=578" },
		{ "The Dedicated Few (25 player)", "ac=579" },
		{ "Arachnophobia (10 player)", "ac=1858" },
		{ "Arachnophobia (25 player)", "ac=1859" },
		{ "Make Quick Werk of Him (10 player)", "ac=1856" },
		{ "Make Quick Werk of Him (25 player)", "ac=1857" },
		{ "The Safety Dance (10 player)", "ac=1996" },
		{ "The Safety Dance (25 player)", "ac=2139" },
		{ "Momma Said Knock You Out (10 player)", "ac=1997" },
		{ "Momma Said Knock You Out (25 player)", "ac=2140" },
		{ "Shocking! (10 player)", "ac=2178" },
		{ "Shocking! (25 player)", "ac=2179" },
		{ "Subtraction (10 player)", "ac=2180" },
		{ "Subtraction (25 player)", "ac=2181" },
		{ "Spore Loser (10 player)", "ac=2182" },
		{ "Spore Loser (25 player)", "ac=2183" },
		{ "And They Would All Go Down Together (10 player)", "ac=2176" },
		{ "And They Would All Go Down Together (25 player)", "ac=2177" },
		{ "The Hundred Club (10 player)", "ac=2146" },
		{ "The Hundred Club (25 player)", "ac=2147" },
		{ "Just Can't Get Enough (10 player)", "ac=2184" },
		{ "Just Can't Get Enough (25 player)", "ac=2185" },
		{ "Just Can't Get Enough - Guild Edition", "ac=5016" },
		{ "Atiesh, Greatstaff of the Guardian", "ac=425" },
		{ "The Undying", "ac=2187" },
		{ "The Immortal", "ac=2186" },
		{ "Realm First! Conqueror of Naxxramas", "ac=1402" },
	},
	ObsidianSanctum = {
		ZoneName = { BZ["Wyrmrest Temple"]..ALC["Colon"]..BZ["The Obsidian Sanctum"] },
		Location = { BZ["Dragonblight"] },
		DungeonID = "224",
		DungeonHeroicID = "238",
		Acronym = L["OS"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "531",
		JournalInstanceID = "755",
		Module = "Atlas_WrathoftheLichKing",
		{ ORNG..ALC["AKA"]..ALC["Colon"]..L["Black Dragonflight Chamber"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Tenebron", 1616, 2), 10002 },
		{ WHIT.." 2) "..Atlas:GetBossName("Shadron", 1616, 3), 10003 },
		{ WHIT.." 3) "..Atlas:GetBossName("Vesperon", 1616, 4), 10004 },
		{ WHIT.." 4) "..Atlas:GetBossName("Sartharion", 1616), 1616 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Besting the Black Dragonflight (10 player)", "ac=1876" },
		{ "Besting the Black Dragonflight (25 player)", "ac=625" },
		{ "Less Is More (10 player)", "ac=624" },
		{ "Less Is More (25 player)", "ac=1877" },
		{ "Gonna Go When the Volcano Blows (10 player)", "ac=2047" },
		{ "Gonna Go When the Volcano Blows (25 player)", "ac=2048" },
		{ "Twilight Assist (10 player)", "ac=2049" },
		{ "Twilight Duo (10 player)", "ac=2050" },
		{ "The Twilight Zone (10 player)", "ac=2051" },
		{ "Twilight Assist (25 player)", "ac=2052" },
		{ "Twilight Duo (25 player)", "ac=2053" },
		{ "The Twilight Zone (25 player)", "ac=2054" },
		{ "The Twilight Zone - Guild Edition", "ac=5017" },
		{ "Realm First! Obsidian Slayer", "ac=456" },
	},
	OnyxiasLair = {
		ZoneName = { BZ["Onyxia's Lair"] },
		Location = { BZ["Dustwallow Marsh"] },
		DungeonID = "46",
		DungeonHeroicID = "257",
		Acronym = L["Ony"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "718",
		JournalInstanceID = "760",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Onyxia", 1651), 1651 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "More Dots! (10 player)", "ac=4402" },
		{ "More Dots! (25 player)", "ac=4405" },
		{ "Many Whelps! Handle It! (10 player)", "ac=4403" },
		{ "Many Whelps! Handle It! (25 player)", "ac=4406" },
		{ "She Deep Breaths More (10 player)", "ac=4404" },
		{ "She Deep Breaths More (25 player)", "ac=4407" },
		{ "Onyxia's Lair (Level 60)", "ac=684" },
		{ "Onyxia's Lair (10 player)", "ac=4396" },
		{ "Onyxia's Lair (25 player)", "ac=4397" },
	},
	RubySanctum = {
		ZoneName = { BZ["Wyrmrest Temple"]..ALC["Colon"]..BZ["The Ruby Sanctum"] },
		Location = { BZ["Dragonblight"] },
		DungeonID = "293",
		DungeonHeroicID = "294",
		Acronym = L["RS"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "609",
		JournalInstanceID = "761",
		Module = "Atlas_WrathoftheLichKing",
		{ ORNG..ALC["AKA"]..ALC["Colon"]..L["Red Dragonflight Chamber"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Baltharus the Warborn"), 10002 },
		{ WHIT.." 2) "..Atlas:GetBossName("Saviana Ragefire"), 10003 },
		{ WHIT.." 3) "..Atlas:GetBossName("General Zarithrian"), 10004 },
		{ WHIT.." 4) "..Atlas:GetBossName("Halion", 1652), 1652 },		
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Twilight Destroyer (10 player)", "ac=4817" },
		{ "The Twilight Destroyer (25 player)", "ac=4815" },
		{ "The Twilight Destroyer - Guild Edition", "ac=5022" },
		{ "Heroic: The Twilight Destroyer (10 player)", "ac=4818" },
		{ "Heroic: The Twilight Destroyer (25 player)", "ac=4816" },
	},
	TheEyeOfEternity = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Eye of Eternity"] },
		Location = { BZ["Borean Tundra"] },
		DungeonID = "223",
		DungeonHeroicID = "237",
		Acronym = L["TEoE"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "527",
		JournalInstanceID = "756",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"]..ALC["Slash"]..ALC["Exit"]..ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Malygos", 1617), 1617 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Spellweaver's Downfall (10 player)", "ac=622" },
		{ "The Spellweaver's Downfall (25 player)", "ac=623" },
		{ "You Don't Have an Eternity (10 player)", "ac=1874" },
		{ "You Don't Have an Eternity (25 player)", "ac=1875" },
		{ "A Poke in the Eye (10 player)", "ac=1869" },
		{ "A Poke in the Eye (25 player)", "ac=1870" },
		{ "Denyin' the Scion (10 player)", "ac=2148" },
		{ "Denyin' the Scion (25 player)", "ac=2149" },
		{ "You Don't Have an Eternity - Guild Edition", "ac=5018" },
		{ "Realm First! Magic Seeker", "ac=1400" },
	},
	TheNexus = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Nexus"] },
		Location = { BZ["Borean Tundra"] },
		DungeonID = "225",
		DungeonHeroicID = "226",
		Acronym = L["Nex, Nexus"],
		WorldMapID = "520",
		JournalInstanceID = "281",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Warmage Kaitlyn"] },
		{ WHIT.." 1) "..Atlas:GetBossName("Commander Kolurg", 833)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["Comma"]..ALC["Heroic"]..ALC["R-Parenthesis"], 833 },
		{ WHIT..INDENT..Atlas:GetBossName("Commander Stoutbeard", 617)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["Comma"]..ALC["Heroic"]..ALC["R-Parenthesis"], 617 },
		{ GREN..INDENT..L["Berinand's Research"] },
		{ WHIT.." 2) "..Atlas:GetBossName("Grand Magus Telestra", 618), 618 },
		{ WHIT.." 3) "..Atlas:GetBossName("Anomalus", 619), 619 },
		{ WHIT.." 4) "..Atlas:GetBossName("Ormorok the Tree-Shaper", 620), 620 },
		{ WHIT.." 5) "..Atlas:GetBossName("Keristrasza", 621), 621 },
		{ GREN.." 1') "..L["Elder Igasho"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Nexus", "ac=478" },
		{ "Split Personality", "ac=2150" },
		{ "Intense Cold", "ac=2036" },
		{ "Chaos Theory", "ac=2037" },
		{ "Heroic: The Nexus", "ac=490" },
		{ "Heroic: The Nexus Guild Run", "ac=5096" },
	},
	TheOculus = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Oculus"] },
		Location = { BZ["The Nexus"] },
		DungeonID = "206",
		DungeonHeroicID = "211",
		Acronym = L["Ocu"],
		WorldMapID = "528",
		JournalInstanceID = "282",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..ALC["Portal"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Drakos the Interrogator", 622)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"], 622 },
		{ GREN..INDENT..L["Belgaristrasz"] },
		{ GREN..INDENT..L["Eternos"] },
		{ GREN..INDENT..L["Verdisa"] },
		{ WHIT.." 2) "..Atlas:GetBossName("Varos Cloudstrider", 623), 623 },
		{ WHIT.." 3) "..Atlas:GetBossName("Mage-Lord Urom", 624)..ALC["L-Parenthesis"]..ALC["Middle"]..ALC["R-Parenthesis"], 624 },
		{ WHIT.." 4) "..Atlas:GetBossName("Ley-Guardian Eregos", 625)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 625 },
		{ GREN.." 1') "..L["Centrifuge Construct"], 10003 },
		{ GREN.." 2') "..L["Cache of Eregos"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 10004 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "The Oculus", "ac=487" },
		{ "Experienced Drake Rider", "ac=1871" },
		{ "Make It Count", "ac=1868" },
		{ "Ruby Void", "ac=2044" },
		{ "Emerald Void", "ac=2045" },
		{ "Amber Void", "ac=2046" },
		{ "Heroic: The Oculus", "ac=498" },
		{ "Heroic: The Oculus Guild Run", "ac=5104" },
	},
	TrialOfTheChampion = {
		ZoneName = { L["Crusaders' Coliseum"]..ALC["Colon"]..BZ["Trial of the Champion"] },
		Location = { BZ["Icecrown"] },
		DungeonID = "245",
		DungeonHeroicID = "249",
		Acronym = L["Champ"],
		WorldMapID = "542",
		JournalInstanceID = "284",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Grand Champions", 834), 834 },
		{ ORNG..INDENT..Atlas:GetBossName("Grand Champions", 834)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 834 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Marshal Jacob Alerius", 834, 1), 834 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Ambrose Boltspark", 834, 2), 834 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Colosos", 834, 5), 834 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Jaelyne Evensong", 834, 3), 834 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Lana Stouthammer", 834, 4), 834 },
		{ ORNG..INDENT..Atlas:GetBossName("Grand Champions", 634)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 634 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Mokra the Skullcrusher", 634, 1), 634 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Eressea Dawnsinger", 634, 2), 634 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Runok Wildmane", 634, 3), 634 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Zul'tore", 634, 4), 634 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Deathstalker Visceri", 634, 5), 634 },
		{ WHIT..INDENT..Atlas:GetBossName("Eadric the Pure", 635)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 635 },
		{ WHIT..INDENT..Atlas:GetBossName("Argent Confessor Paletress", 636)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 636 },
		{ WHIT..INDENT..Atlas:GetBossName("The Black Knight", 637), 637 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Argent Confessor", "ac=3802" },
		{ "The Faceroller", "ac=3803" },
		{ "I've Had Worse", "ac=3804" },
		{ "Trial of the Champion", "ac=3778" },
		{ "Trial of the Champion", "ac=4296" },
		{ "Heroic: Trial of the Champion", "ac=4297" },
		{ "Heroic: Trial of the Champion", "ac=4298" },
		{ "Heroic: Trial of the Champion Guild Run", "ac=5110" },
		{ "Heroic: Trial of the Champion Guild Run", "ac=5111" },
	},
	TrialOfTheCrusader = {
		ZoneName = { L["Crusaders' Coliseum"]..ALC["Colon"]..BZ["Trial of the Crusader"] },
		Location = { BZ["Icecrown"] },
		DungeonID = "246",
		DungeonHeroicID = "248",
		Acronym = L["Crus"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "543",
		JournalInstanceID = "757",
		Module = "Atlas_WrathoftheLichKing",
		{ ORNG..L["Heroic: Trial of the Grand Crusader"] },
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..L["Cavern Entrance"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("The Northrend Beasts", 1618), 1618 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Gormok the Impaler", 1618, 1) },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Acidmaw and Dreadscale", 1618, 2) },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Icehowl", 1618, 3) },
		{ WHIT..INDENT..Atlas:GetBossName("Lord Jaraxxus", 1619), 1619 },
		{ WHIT..INDENT..Atlas:GetBossName("Faction Champions") },
		{ WHIT..INDENT..Atlas:GetBossName("Twin Val'kyr", 1622), 1622 },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Fjola Lightbane", 1622, 1) },
		{ WHIT..INDENT..INDENT..Atlas:GetBossName("Eydis Darkbane", 1622, 2) },
		{ WHIT.." 2) "..Atlas:GetBossName("Anub'arak", 1623), 1623 },
		-- Champion of the Alliance, 1620
		-- Champion of the Horde, 1621
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Call of the Crusade (10 player)", "ac=3917" },
		{ "Call of the Grand Crusade (10 player)", "ac=3918" },
		{ "Call of the Crusade (25 player)", "ac=3916" },
		{ "Call of the Grand Crusade (25 player)", "ac=3812" },
		{ "Upper Back Pain (10 player)", "ac=3797" },
		{ "Upper Back Pain (25 player)", "ac=3813" },
		{ "Not One, But Two Jormungars (10 player)", "ac=3936" },
		{ "Not One, But Two Jormungars (25 player)", "ac=3937" },
		{ "Three Sixty Pain Spike (10 player)", "ac=3996" },
		{ "Three Sixty Pain Spike (25 player)", "ac=3997" },
		{ "Resilience Will Fix It (10 player)", "ac=3798" },
		{ "Salt and Pepper (10 player)", "ac=3799" },
		{ "Salt and Pepper (25 player)", "ac=3815" },
		{ "The Traitor King (10 player)", "ac=3800" },
		{ "The Traitor King (25 player)", "ac=3816" },
		{ "A Tribute to Immortality", "ac=4079" },
		{ "A Tribute to Immortality", "ac=4156" },
		{ "A Tribute to Skill (10 player)", "ac=3808" },
		{ "A Tribute to Mad Skill (10 player)", "ac=3809" },
		{ "A Tribute to Insanity (10 player)", "ac=3810" },
		{ "A Tribute to Dedicated Insanity", "ac=4080" },
		{ "A Tribute to Skill (25 player)", "ac=3817" },
		{ "A Tribute to Mad Skill (25 player)", "ac=3818" },
		{ "A Tribute to Insanity (25 player)", "ac=3819" },
		{ "Realm First! Grand Crusader", "ac=4078" },
	},
	UlduarEnt = {
		ZoneName = { BZ["Ulduar"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		LevelRange = "77-83",
		MinLevel = "75",
		PlayerLimit = { 5, 10, 25 },
		Acronym = L["Uldu"],
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Stone"], 10001 },
		{ BLUE.." B) "..BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Lightning"], 10002 },
		{ BLUE.." C) "..BZ["Ulduar"], 10003 },
		{ GREN.." 1') "..ALC["Meeting Stone"], 10004 },
		{ GREN.." 2') "..ALC["Graveyard"], 10005 },
		{ GREN.." 3') "..L["Shavalius the Fancy <Flight Master>"], 10006 },
		{ GREN..INDENT..L["Chester Copperpot <General & Trade Supplies>"] },
		{ GREN..INDENT..L["Slosh <Food & Drink>"] },
	},
	UlduarA = {
		ZoneName = { BZ["Ulduar"]..ALC["MapA"]..ALC["L-Parenthesis"]..L["The Siege"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "243",
--		DungeonHeroicID = "244",
		Acronym = L["Uldu"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "529",
		DungeonLevel = "1",
		JournalInstanceID = "759",
		Module = "Atlas_WrathoftheLichKing",
		NextMap = "UlduarB",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ BLUE.." B) "..BZ["The Antechamber"], 10002 },
		{ ORNG.." A') "..L["Tower of Life"], 10003 },
		{ ORNG.." B') "..L["Tower of Flame"], 10004 },
		{ ORNG.." C') "..L["Tower of Frost"], 10005 },
		{ ORNG.." D') "..L["Tower of Storms"], 10006 },
		{ WHIT.." 1) "..Atlas:GetBossName("Flame Leviathan", 1637), 1637 },
		{ WHIT.." 2) "..Atlas:GetBossName("Razorscale", 1639)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1639 },
		{ WHIT.." 3) "..Atlas:GetBossName("Ignis the Furnace Master", 1638)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1638 },
		{ WHIT.." 4) "..Atlas:GetBossName("XT-002 Deconstructor", 1640), 1640 },
		{ GREN.." 1') "..BZ["Expedition Base Camp"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10011 },
		{ GREN.." 2') "..BZ["Formation Grounds"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10012 },
		{ GREN.." 3') "..BZ["The Colossal Forge"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10013 },
		{ GREN.." 4') "..BZ["The Scrapyard"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10014 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Realm First! Death's Demise", "ac=3117" },
		{ "Realm First! Celestial Defender", "ac=3259" },
		{ "The Siege of Ulduar", "ac=12297" },
		{ "The Antechamber of Ulduar", "ac=12302" },
		{ "The Keepers of Ulduar", "ac=12309" },
		{ "The Descent into Madness", "ac=12310" },
		{ "Dwarfageddon", "ac=12312" },
		{ "Unbroken", "ac=12313" },
		{ "Three Car Garage", "ac=12314" },
		{ "Take Out Those Turrets", "ac=12315" },
		{ "Shutout", "ac=12316" },
		{ "Orbital Bombardment", "ac=12317" },
		{ "Orbital Devastation", "ac=12318" },
		{ "Nuked from Orbit", "ac=12319" },
		{ "Orbit-uary", "ac=12320" },
		{ "A Quick Shave", "ac=12321" },
		{ "Iron Dwarf, Medium Rare", "ac=12322" },
		{ "Shattered", "ac=12323" },
		{ "Hot Pocket", "ac=12324" },
		{ "Stokin' the Furnace", "ac=12325" },
		{ "Nerf Engineering", "ac=12326" },
		{ "Nerf Scrapbots", "ac=12327" },
		{ "Nerf Gravity Bombs", "ac=12328" },
		{ "Must Deconstruct Faster", "ac=12329" },
		{ "Heartbreaker", "ac=12330" },
		{ "I Choose You, Runemaster Molgeim", "ac=12332" },
		{ "I Choose You, Stormcaller Brundir", "ac=12333" },
		{ "I Choose You, Steelbreaker", "ac=12334" },
		{ "But I'm On Your Side", "ac=12335" },
		{ "Can't Do That While Stunned", "ac=12336" },
		{ "With Open Arms", "ac=12337" },
		{ "Disarmed", "ac=12338" },
		{ "If Looks Could Kill", "ac=12339" },
		{ "Rubble and Roll", "ac=12340" },
		{ "Crazy Cat Lady", "ac=12341" },
		{ "Nine Lives", "ac=12342" },
		{ "Cheese the Freeze", "ac=12343" },
		{ "I Have the Coolest Friends", "ac=12344" },
		{ "Getting Cold in Here", "ac=12345" },
		{ "Staying Buffed All Winter", "ac=12346" },
		{ "I Could Say That This Cache Was Rare", "ac=12347" },
		{ "Don't Stand in the Lightning", "ac=12348" },
		{ "I'll Take You All On", "ac=12349" },
		{ "Who Needs Bloodlust?", "ac=12350" },
		{ "Siffed", "ac=12351" },
		{ "Lose Your Illusion", "ac=12352" },
		{ "Lumberjacked", "ac=12360" },
		{ "Con-speed-atory", "ac=12361" },
		{ "Deforestation", "ac=12362" },
		{ "Getting Back to Nature", "ac=12363" },
		{ "Knock on Wood", "ac=12364" },
		{ "Knock, Knock on Wood", "ac=12365" },
		{ "Knock, Knock, Knock on Wood", "ac=12366" },
		{ "Set Up Us the Bomb", "ac=12367" },
		{ "Not-So-Friendly Fire", "ac=12368" },
		{ "Firefighter", "ac=12369" },
		{ "Shadowdodger", "ac=12372" },
		{ "I Love the Smell of Saronite in the Morning", "ac=12373" },
		{ "Kiss and Make Up", "ac=12384" },
		{ "Three Lights in the Darkness", "ac=12385" },
		{ "Two Lights in the Darkness", "ac=12386" },
		{ "One Light in the Darkness", "ac=12387" },
		{ "Alone in the Darkness", "ac=12388" },
		{ "Drive Me Crazy", "ac=12395" },
		{ "He's Not Getting Any Older", "ac=12396" },
		{ "They're Coming Out of the Walls", "ac=12397" },
		{ "In His House He Waits Dreaming", "ac=12398" },
		{ "Observed", "ac=12399" },
		{ "Supermassive", "ac=12400" },
		{ "Alone in the Darkness - Guild Edition", "ac=5019" },
		{ "Observed - Guild Edition", "ac=5020" },
		{ "Val'anyr, Hammer of Ancient Kings", "ac=3142" },
		{ "Herald of the Titans", "ac=3316" },
		{ "Champion of Ulduar", "ac=2903" },
		{ "Conqueror of Ulduar", "ac=2904" },
		},
	UlduarB = {
		ZoneName = { BZ["Ulduar"]..ALC["MapB"]..ALC["L-Parenthesis"]..BZ["The Antechamber"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "243",
--		DungeonHeroicID = "244",
		Acronym = L["Uldu"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "529",
		DungeonLevel = "2",
		JournalInstanceID = "759",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "UlduarA",
		NextMap = "UlduarC",
		{ BLUE.." B) "..L["The Siege"], 10001 },
		{ BLUE.." C) "..L["The Keepers"], 10002 },
		{ WHIT.." 5) "..Atlas:GetBossName("The Assembly of Iron", 1641)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1641 },
		{ WHIT..INDENT..Atlas:GetBossName("Steelbreaker", 1641, 1) },
		{ WHIT..INDENT..Atlas:GetBossName("Runemaster Molgeim", 1641, 2) },
		{ WHIT..INDENT..Atlas:GetBossName("Stormcaller Brundir", 1641, 3) },
		{ WHIT.." 6) "..Atlas:GetBossName("Kologarn", 1642), 1642 },
		{ WHIT.." 7) "..Atlas:GetBossName("Algalon the Observer", 1650)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1650 },
		{ GREN.." 5') "..BZ["The Antechamber"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10006 },
		{ GREN.." 6') "..L["Prospector Doren"], 10007 },
		{ GREN..INDENT..L["Archivum Console"] },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Realm First! Death's Demise", "ac=3117" },
		{ "Realm First! Celestial Defender", "ac=3259" },
		{ "The Siege of Ulduar", "ac=12297" },
		{ "The Antechamber of Ulduar", "ac=12302" },
		{ "The Keepers of Ulduar", "ac=12309" },
		{ "The Descent into Madness", "ac=12310" },
		{ "Dwarfageddon", "ac=12312" },
		{ "Unbroken", "ac=12313" },
		{ "Three Car Garage", "ac=12314" },
		{ "Take Out Those Turrets", "ac=12315" },
		{ "Shutout", "ac=12316" },
		{ "Orbital Bombardment", "ac=12317" },
		{ "Orbital Devastation", "ac=12318" },
		{ "Nuked from Orbit", "ac=12319" },
		{ "Orbit-uary", "ac=12320" },
		{ "A Quick Shave", "ac=12321" },
		{ "Iron Dwarf, Medium Rare", "ac=12322" },
		{ "Shattered", "ac=12323" },
		{ "Hot Pocket", "ac=12324" },
		{ "Stokin' the Furnace", "ac=12325" },
		{ "Nerf Engineering", "ac=12326" },
		{ "Nerf Scrapbots", "ac=12327" },
		{ "Nerf Gravity Bombs", "ac=12328" },
		{ "Must Deconstruct Faster", "ac=12329" },
		{ "Heartbreaker", "ac=12330" },
		{ "I Choose You, Runemaster Molgeim", "ac=12332" },
		{ "I Choose You, Stormcaller Brundir", "ac=12333" },
		{ "I Choose You, Steelbreaker", "ac=12334" },
		{ "But I'm On Your Side", "ac=12335" },
		{ "Can't Do That While Stunned", "ac=12336" },
		{ "With Open Arms", "ac=12337" },
		{ "Disarmed", "ac=12338" },
		{ "If Looks Could Kill", "ac=12339" },
		{ "Rubble and Roll", "ac=12340" },
		{ "Crazy Cat Lady", "ac=12341" },
		{ "Nine Lives", "ac=12342" },
		{ "Cheese the Freeze", "ac=12343" },
		{ "I Have the Coolest Friends", "ac=12344" },
		{ "Getting Cold in Here", "ac=12345" },
		{ "Staying Buffed All Winter", "ac=12346" },
		{ "I Could Say That This Cache Was Rare", "ac=12347" },
		{ "Don't Stand in the Lightning", "ac=12348" },
		{ "I'll Take You All On", "ac=12349" },
		{ "Who Needs Bloodlust?", "ac=12350" },
		{ "Siffed", "ac=12351" },
		{ "Lose Your Illusion", "ac=12352" },
		{ "Lumberjacked", "ac=12360" },
		{ "Con-speed-atory", "ac=12361" },
		{ "Deforestation", "ac=12362" },
		{ "Getting Back to Nature", "ac=12363" },
		{ "Knock on Wood", "ac=12364" },
		{ "Knock, Knock on Wood", "ac=12365" },
		{ "Knock, Knock, Knock on Wood", "ac=12366" },
		{ "Set Up Us the Bomb", "ac=12367" },
		{ "Not-So-Friendly Fire", "ac=12368" },
		{ "Firefighter", "ac=12369" },
		{ "Shadowdodger", "ac=12372" },
		{ "I Love the Smell of Saronite in the Morning", "ac=12373" },
		{ "Kiss and Make Up", "ac=12384" },
		{ "Three Lights in the Darkness", "ac=12385" },
		{ "Two Lights in the Darkness", "ac=12386" },
		{ "One Light in the Darkness", "ac=12387" },
		{ "Alone in the Darkness", "ac=12388" },
		{ "Drive Me Crazy", "ac=12395" },
		{ "He's Not Getting Any Older", "ac=12396" },
		{ "They're Coming Out of the Walls", "ac=12397" },
		{ "In His House He Waits Dreaming", "ac=12398" },
		{ "Observed", "ac=12399" },
		{ "Supermassive", "ac=12400" },
		{ "Alone in the Darkness - Guild Edition", "ac=5019" },
		{ "Observed - Guild Edition", "ac=5020" },
		{ "Val'anyr, Hammer of Ancient Kings", "ac=3142" },
		{ "Herald of the Titans", "ac=3316" },
		{ "Champion of Ulduar", "ac=2903" },
		{ "Conqueror of Ulduar", "ac=2904" },
	},
	UlduarC = {
		ZoneName = { BZ["Ulduar"]..ALC["MapC"]..ALC["L-Parenthesis"]..L["The Keepers"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "243",
--		DungeonHeroicID = "244",
		Acronym = L["Uldu"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "529",
		DungeonLevel = "3",
		JournalInstanceID = "759",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "UlduarB",
		NextMap = "UlduarD",
		{ BLUE.." C) "..BZ["The Antechamber"], 10001 },
		{ BLUE.." D) "..BZ["The Spark of Imagination"], 10002 },
		{ BLUE.." E) "..BZ["The Descent into Madness"], 10003 },
		{ WHIT.." 8) "..Atlas:GetBossName("Auriaya", 1643)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1643 },
		{ WHIT.." 9) "..Atlas:GetBossName("Hodir", 1644), 1644 },
		{ WHIT.."10) "..Atlas:GetBossName("Thorim", 1645), 1645 },
		{ ORNG..INDENT..L["Sif"] },
		{ WHIT.."11) "..Atlas:GetBossName("Freya", 1646), 1646 },
		{ WHIT.."12) "..Atlas:GetBossName("Elder Brightleaf", 1646, 2), 10008 },
		{ WHIT.."13) "..Atlas:GetBossName("Elder Ironbranch", 1646, 3), 10009 },
		{ WHIT.."14) "..Atlas:GetBossName("Elder Stonebark", 1646, 4), 10010 },
		{ GREN.." 7') "..BZ["The Shattered Walkway"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10011 },
		{ GREN.." 8') "..BZ["The Conservatory of Life"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10012 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Realm First! Death's Demise", "ac=3117" },
		{ "Realm First! Celestial Defender", "ac=3259" },
		{ "The Siege of Ulduar", "ac=12297" },
		{ "The Antechamber of Ulduar", "ac=12302" },
		{ "The Keepers of Ulduar", "ac=12309" },
		{ "The Descent into Madness", "ac=12310" },
		{ "Dwarfageddon", "ac=12312" },
		{ "Unbroken", "ac=12313" },
		{ "Three Car Garage", "ac=12314" },
		{ "Take Out Those Turrets", "ac=12315" },
		{ "Shutout", "ac=12316" },
		{ "Orbital Bombardment", "ac=12317" },
		{ "Orbital Devastation", "ac=12318" },
		{ "Nuked from Orbit", "ac=12319" },
		{ "Orbit-uary", "ac=12320" },
		{ "A Quick Shave", "ac=12321" },
		{ "Iron Dwarf, Medium Rare", "ac=12322" },
		{ "Shattered", "ac=12323" },
		{ "Hot Pocket", "ac=12324" },
		{ "Stokin' the Furnace", "ac=12325" },
		{ "Nerf Engineering", "ac=12326" },
		{ "Nerf Scrapbots", "ac=12327" },
		{ "Nerf Gravity Bombs", "ac=12328" },
		{ "Must Deconstruct Faster", "ac=12329" },
		{ "Heartbreaker", "ac=12330" },
		{ "I Choose You, Runemaster Molgeim", "ac=12332" },
		{ "I Choose You, Stormcaller Brundir", "ac=12333" },
		{ "I Choose You, Steelbreaker", "ac=12334" },
		{ "But I'm On Your Side", "ac=12335" },
		{ "Can't Do That While Stunned", "ac=12336" },
		{ "With Open Arms", "ac=12337" },
		{ "Disarmed", "ac=12338" },
		{ "If Looks Could Kill", "ac=12339" },
		{ "Rubble and Roll", "ac=12340" },
		{ "Crazy Cat Lady", "ac=12341" },
		{ "Nine Lives", "ac=12342" },
		{ "Cheese the Freeze", "ac=12343" },
		{ "I Have the Coolest Friends", "ac=12344" },
		{ "Getting Cold in Here", "ac=12345" },
		{ "Staying Buffed All Winter", "ac=12346" },
		{ "I Could Say That This Cache Was Rare", "ac=12347" },
		{ "Don't Stand in the Lightning", "ac=12348" },
		{ "I'll Take You All On", "ac=12349" },
		{ "Who Needs Bloodlust?", "ac=12350" },
		{ "Siffed", "ac=12351" },
		{ "Lose Your Illusion", "ac=12352" },
		{ "Lumberjacked", "ac=12360" },
		{ "Con-speed-atory", "ac=12361" },
		{ "Deforestation", "ac=12362" },
		{ "Getting Back to Nature", "ac=12363" },
		{ "Knock on Wood", "ac=12364" },
		{ "Knock, Knock on Wood", "ac=12365" },
		{ "Knock, Knock, Knock on Wood", "ac=12366" },
		{ "Set Up Us the Bomb", "ac=12367" },
		{ "Not-So-Friendly Fire", "ac=12368" },
		{ "Firefighter", "ac=12369" },
		{ "Shadowdodger", "ac=12372" },
		{ "I Love the Smell of Saronite in the Morning", "ac=12373" },
		{ "Kiss and Make Up", "ac=12384" },
		{ "Three Lights in the Darkness", "ac=12385" },
		{ "Two Lights in the Darkness", "ac=12386" },
		{ "One Light in the Darkness", "ac=12387" },
		{ "Alone in the Darkness", "ac=12388" },
		{ "Drive Me Crazy", "ac=12395" },
		{ "He's Not Getting Any Older", "ac=12396" },
		{ "They're Coming Out of the Walls", "ac=12397" },
		{ "In His House He Waits Dreaming", "ac=12398" },
		{ "Observed", "ac=12399" },
		{ "Supermassive", "ac=12400" },
		{ "Alone in the Darkness - Guild Edition", "ac=5019" },
		{ "Observed - Guild Edition", "ac=5020" },
		{ "Val'anyr, Hammer of Ancient Kings", "ac=3142" },
		{ "Herald of the Titans", "ac=3316" },
		{ "Champion of Ulduar", "ac=2903" },
		{ "Conqueror of Ulduar", "ac=2904" },
	},
	UlduarD = {
		ZoneName = { BZ["Ulduar"]..ALC["MapD"]..ALC["L-Parenthesis"]..BZ["The Spark of Imagination"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "243",
--		DungeonHeroicID = "244",
		Acronym = L["Uldu"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "529",
		DungeonLevel = "5",
		JournalInstanceID = "759",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "UlduarC",
		NextMap = "UlduarE",
		{ BLUE.." D) "..L["The Keepers"], 10001 },
		{ WHIT.."15) "..Atlas:GetBossName("Mimiron", 1647), 1647 },
		{ GREN.." 9') "..BZ["The Spark of Imagination"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10003 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Realm First! Death's Demise", "ac=3117" },
		{ "Realm First! Celestial Defender", "ac=3259" },
		{ "The Siege of Ulduar", "ac=12297" },
		{ "The Antechamber of Ulduar", "ac=12302" },
		{ "The Keepers of Ulduar", "ac=12309" },
		{ "The Descent into Madness", "ac=12310" },
		{ "Dwarfageddon", "ac=12312" },
		{ "Unbroken", "ac=12313" },
		{ "Three Car Garage", "ac=12314" },
		{ "Take Out Those Turrets", "ac=12315" },
		{ "Shutout", "ac=12316" },
		{ "Orbital Bombardment", "ac=12317" },
		{ "Orbital Devastation", "ac=12318" },
		{ "Nuked from Orbit", "ac=12319" },
		{ "Orbit-uary", "ac=12320" },
		{ "A Quick Shave", "ac=12321" },
		{ "Iron Dwarf, Medium Rare", "ac=12322" },
		{ "Shattered", "ac=12323" },
		{ "Hot Pocket", "ac=12324" },
		{ "Stokin' the Furnace", "ac=12325" },
		{ "Nerf Engineering", "ac=12326" },
		{ "Nerf Scrapbots", "ac=12327" },
		{ "Nerf Gravity Bombs", "ac=12328" },
		{ "Must Deconstruct Faster", "ac=12329" },
		{ "Heartbreaker", "ac=12330" },
		{ "I Choose You, Runemaster Molgeim", "ac=12332" },
		{ "I Choose You, Stormcaller Brundir", "ac=12333" },
		{ "I Choose You, Steelbreaker", "ac=12334" },
		{ "But I'm On Your Side", "ac=12335" },
		{ "Can't Do That While Stunned", "ac=12336" },
		{ "With Open Arms", "ac=12337" },
		{ "Disarmed", "ac=12338" },
		{ "If Looks Could Kill", "ac=12339" },
		{ "Rubble and Roll", "ac=12340" },
		{ "Crazy Cat Lady", "ac=12341" },
		{ "Nine Lives", "ac=12342" },
		{ "Cheese the Freeze", "ac=12343" },
		{ "I Have the Coolest Friends", "ac=12344" },
		{ "Getting Cold in Here", "ac=12345" },
		{ "Staying Buffed All Winter", "ac=12346" },
		{ "I Could Say That This Cache Was Rare", "ac=12347" },
		{ "Don't Stand in the Lightning", "ac=12348" },
		{ "I'll Take You All On", "ac=12349" },
		{ "Who Needs Bloodlust?", "ac=12350" },
		{ "Siffed", "ac=12351" },
		{ "Lose Your Illusion", "ac=12352" },
		{ "Lumberjacked", "ac=12360" },
		{ "Con-speed-atory", "ac=12361" },
		{ "Deforestation", "ac=12362" },
		{ "Getting Back to Nature", "ac=12363" },
		{ "Knock on Wood", "ac=12364" },
		{ "Knock, Knock on Wood", "ac=12365" },
		{ "Knock, Knock, Knock on Wood", "ac=12366" },
		{ "Set Up Us the Bomb", "ac=12367" },
		{ "Not-So-Friendly Fire", "ac=12368" },
		{ "Firefighter", "ac=12369" },
		{ "Shadowdodger", "ac=12372" },
		{ "I Love the Smell of Saronite in the Morning", "ac=12373" },
		{ "Kiss and Make Up", "ac=12384" },
		{ "Three Lights in the Darkness", "ac=12385" },
		{ "Two Lights in the Darkness", "ac=12386" },
		{ "One Light in the Darkness", "ac=12387" },
		{ "Alone in the Darkness", "ac=12388" },
		{ "Drive Me Crazy", "ac=12395" },
		{ "He's Not Getting Any Older", "ac=12396" },
		{ "They're Coming Out of the Walls", "ac=12397" },
		{ "In His House He Waits Dreaming", "ac=12398" },
		{ "Observed", "ac=12399" },
		{ "Supermassive", "ac=12400" },
		{ "Alone in the Darkness - Guild Edition", "ac=5019" },
		{ "Observed - Guild Edition", "ac=5020" },
		{ "Val'anyr, Hammer of Ancient Kings", "ac=3142" },
		{ "Herald of the Titans", "ac=3316" },
		{ "Champion of Ulduar", "ac=2903" },
		{ "Conqueror of Ulduar", "ac=2904" },
	},
	UlduarE = {
		ZoneName = { BZ["Ulduar"]..ALC["MapE"]..ALC["L-Parenthesis"]..BZ["The Descent into Madness"]..ALC["R-Parenthesis"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "243",
--		DungeonHeroicID = "244",
		Acronym = L["Uldu"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "529",
		DungeonLevel = "4",
		JournalInstanceID = "759",
		Module = "Atlas_WrathoftheLichKing",
		PrevMap = "UlduarD",
		{ BLUE.." E) "..L["The Keepers"], 10001 },
		{ WHIT.."16) "..Atlas:GetBossName("General Vezax", 1648), 1648 },
		{ WHIT.."17) "..Atlas:GetBossName("Yogg-Saron", 1649), 1649 },
		{ GREN..INDENT..Atlas:GetBossName("Sara") },
		{ GREN.."10') "..BZ["The Prison of Yogg-Saron"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10004 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Realm First! Death's Demise", "ac=3117" },
		{ "Realm First! Celestial Defender", "ac=3259" },
		{ "The Siege of Ulduar", "ac=12297" },
		{ "The Antechamber of Ulduar", "ac=12302" },
		{ "The Keepers of Ulduar", "ac=12309" },
		{ "The Descent into Madness", "ac=12310" },
		{ "Dwarfageddon", "ac=12312" },
		{ "Unbroken", "ac=12313" },
		{ "Three Car Garage", "ac=12314" },
		{ "Take Out Those Turrets", "ac=12315" },
		{ "Shutout", "ac=12316" },
		{ "Orbital Bombardment", "ac=12317" },
		{ "Orbital Devastation", "ac=12318" },
		{ "Nuked from Orbit", "ac=12319" },
		{ "Orbit-uary", "ac=12320" },
		{ "A Quick Shave", "ac=12321" },
		{ "Iron Dwarf, Medium Rare", "ac=12322" },
		{ "Shattered", "ac=12323" },
		{ "Hot Pocket", "ac=12324" },
		{ "Stokin' the Furnace", "ac=12325" },
		{ "Nerf Engineering", "ac=12326" },
		{ "Nerf Scrapbots", "ac=12327" },
		{ "Nerf Gravity Bombs", "ac=12328" },
		{ "Must Deconstruct Faster", "ac=12329" },
		{ "Heartbreaker", "ac=12330" },
		{ "I Choose You, Runemaster Molgeim", "ac=12332" },
		{ "I Choose You, Stormcaller Brundir", "ac=12333" },
		{ "I Choose You, Steelbreaker", "ac=12334" },
		{ "But I'm On Your Side", "ac=12335" },
		{ "Can't Do That While Stunned", "ac=12336" },
		{ "With Open Arms", "ac=12337" },
		{ "Disarmed", "ac=12338" },
		{ "If Looks Could Kill", "ac=12339" },
		{ "Rubble and Roll", "ac=12340" },
		{ "Crazy Cat Lady", "ac=12341" },
		{ "Nine Lives", "ac=12342" },
		{ "Cheese the Freeze", "ac=12343" },
		{ "I Have the Coolest Friends", "ac=12344" },
		{ "Getting Cold in Here", "ac=12345" },
		{ "Staying Buffed All Winter", "ac=12346" },
		{ "I Could Say That This Cache Was Rare", "ac=12347" },
		{ "Don't Stand in the Lightning", "ac=12348" },
		{ "I'll Take You All On", "ac=12349" },
		{ "Who Needs Bloodlust?", "ac=12350" },
		{ "Siffed", "ac=12351" },
		{ "Lose Your Illusion", "ac=12352" },
		{ "Lumberjacked", "ac=12360" },
		{ "Con-speed-atory", "ac=12361" },
		{ "Deforestation", "ac=12362" },
		{ "Getting Back to Nature", "ac=12363" },
		{ "Knock on Wood", "ac=12364" },
		{ "Knock, Knock on Wood", "ac=12365" },
		{ "Knock, Knock, Knock on Wood", "ac=12366" },
		{ "Set Up Us the Bomb", "ac=12367" },
		{ "Not-So-Friendly Fire", "ac=12368" },
		{ "Firefighter", "ac=12369" },
		{ "Shadowdodger", "ac=12372" },
		{ "I Love the Smell of Saronite in the Morning", "ac=12373" },
		{ "Kiss and Make Up", "ac=12384" },
		{ "Three Lights in the Darkness", "ac=12385" },
		{ "Two Lights in the Darkness", "ac=12386" },
		{ "One Light in the Darkness", "ac=12387" },
		{ "Alone in the Darkness", "ac=12388" },
		{ "Drive Me Crazy", "ac=12395" },
		{ "He's Not Getting Any Older", "ac=12396" },
		{ "They're Coming Out of the Walls", "ac=12397" },
		{ "In His House He Waits Dreaming", "ac=12398" },
		{ "Observed", "ac=12399" },
		{ "Supermassive", "ac=12400" },
		{ "Alone in the Darkness - Guild Edition", "ac=5019" },
		{ "Observed - Guild Edition", "ac=5020" },
		{ "Val'anyr, Hammer of Ancient Kings", "ac=3142" },
		{ "Herald of the Titans", "ac=3316" },
		{ "Champion of Ulduar", "ac=2903" },
		{ "Conqueror of Ulduar", "ac=2904" },
	},
	UlduarHallsofLightning = {
		ZoneName = { BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Lightning"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "207",
		DungeonHeroicID = "212",
		Acronym = L["HoL"],
		WorldMapID = "525",
		JournalInstanceID = "275",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Stormherald Eljrrin"] },
		{ WHIT.." 1) "..Atlas:GetBossName("General Bjarngrim", 597)..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"], 597 },
		{ WHIT.." 2) "..Atlas:GetBossName("Volkhan", 598), 598 },
		{ WHIT.." 3) "..Atlas:GetBossName("Ionar", 599), 599 },
		{ WHIT.." 4) "..Atlas:GetBossName("Loken", 600), 600 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Timely Death", "ac=1867" },
		{ "Lightning Struck", "ac=1834" },
		{ "Shatter Resistant", "ac=2042" },
		{ "Halls of Lightning", "ac=486" },
		{ "Heroic: Halls of Lightning", "ac=497" },
		{ "Heroic: Halls of Lightning Guild Run", "ac=5103" },
	},
	UlduarHallsofStone = {
		ZoneName = { BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Stone"] },
		Location = { BZ["The Storm Peaks"] },
		DungeonID = "208",
		DungeonHeroicID = "213",
		Acronym = L["HoS"],
		WorldMapID = "526",
		JournalInstanceID = "277",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Kaldir Ironbane"] },
		{ WHIT.." 1) "..Atlas:GetBossName("Krystallus", 604), 604 },
		{ WHIT.." 2) "..Atlas:GetBossName("Maiden of Grief", 605), 605 },
		{ WHIT.." 3) "..Atlas:GetBossName("Tribunal of Ages", 606)..ALC["L-Parenthesis"]..ALC["Event"]..ALC["R-Parenthesis"], 606 },
		{ GREN..INDENT..L["Tribunal Chest"] },
		{ WHIT.." 4) "..Atlas:GetBossName("Sjonnir The Ironshaper", 607), 607 },
		{ GREN.." 1') "..L["Elder Yurauk"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 },
		{ GREN.." 2') "..L["Brann Bronzebeard"], 10003 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Good Grief", "ac=1866" },
		{ "Abuse the Ooze", "ac=2155" },
		{ "Brann Spankin' New", "ac=2154" },
		{ "Halls of Stone", "ac=485" },
		{ "Heroic: Halls of Stone", "ac=496" },
		{ "Heroic: Halls of Stone Guild Run", "ac=5102" },
	},
	UtgardeKeep = {
		ZoneName = { BZ["Utgarde Keep"]..ALC["Colon"]..BZ["Utgarde Keep"] },
		Location = { BZ["Howling Fjord"] },
		DungeonID = "202",
		DungeonHeroicID = "242",
		Acronym = L["UK, Keep"],
		WorldMapID = "523",
		JournalInstanceID = "285",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Defender Mordun"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ GREN..INDENT..L["Dark Ranger Marrah"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ BLUE.." B-C) "..ALC["Connection"], 10002 },
		{ WHIT.." 1) "..Atlas:GetBossName("Prince Keleseth", 638), 638 },
		{ WHIT.." 2) "..Atlas:GetBossName("Skarvold & Dalronn", 639), 639 },
		{ WHIT.." 3) "..Atlas:GetBossName("Ingvar the Plunderer", 640), 640 },
		{ GREN.." 1') "..L["Elder Jarten"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["Comma"]..ALC["Lower"]..ALC["R-Parenthesis"], 10003 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "On The Rocks", "ac=1919" },
		{ "Utgarde Keep", "ac=477" },
		{ "Heroic: Utgarde Keep", "ac=489" },
		{ "Heroic: Utgarde Keep Guild Run", "ac=5095" },
	},
	UtgardePinnacle = {
		ZoneName = { BZ["Utgarde Keep"]..ALC["Colon"]..BZ["Utgarde Pinnacle"] },
		Location = { BZ["Utgarde Keep"] },
		DungeonID = "203",
		DungeonHeroicID = "205",
		Acronym = L["UP, Pinn"],
		WorldMapID = "524",
		JournalInstanceID = "286",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ GREN..INDENT..L["Brigg Smallshanks"] },
		{ GREN..INDENT..L["Image of Argent Confessor Paletress"] },
		{ WHIT.." 1) "..Atlas:GetBossName("Svala Sorrowgrave", 641), 641 },
		{ WHIT.." 2) "..Atlas:GetBossName("Gortok Palehoof", 642), 642 },
		{ WHIT.." 3) "..Atlas:GetBossName("Skadi the Ruthless", 643), 643 },
		{ WHIT.." 4) "..Atlas:GetBossName("King Ymiron", 644), 644 },
		{ GREN.." 1') "..L["Elder Chogan'gada"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Hail To The King, Baby", "ac=1790" },
		{ "The Incredible Hulk", "ac=2043" },
		{ "Lodi Dodi We Loves the Skadi", "ac=1873" },
		{ "My Girl Loves to Skadi All the Time", "ac=2156" },
		{ "King's Bane", "ac=2157" },
		{ "Utgarde Pinnacle", "ac=488" },
		{ "Heroic: Utgarde Pinnacle", "ac=499" },
		{ "Heroic: Utgarde Pinnacle Guild Run", "ac=5105" },
	},
	VaultOfArchavon = {
		ZoneName = { BZ["Vault of Archavon"] },
		Location = { BZ["Wintergrasp"] },
		DungeonID = "239",
		DungeonHeroicID = "240",
		Acronym = L["VoA"],
		PlayerLimit = { 10, 25 },
		WorldMapID = "532",
		JournalInstanceID = "753",
		Module = "Atlas_WrathoftheLichKing",
		{ BLUE.." A) "..ALC["Entrance"], 10001 },
		{ WHIT.." 1) "..Atlas:GetBossName("Archavon the Stone Watcher", 1597), 1597 },
		{ WHIT.." 2) "..Atlas:GetBossName("Emalon the Storm Watcher", 1598), 1598 },
		{ WHIT.." 3) "..Atlas:GetBossName("Koralon the Flame Watcher", 1599), 1599 },
		{ WHIT.." 4) "..Atlas:GetBossName("Toravon the Ice Watcher", 1600), 1600 },
		{ "" },
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] },
		{ "Archavon the Stone Watcher (10 player)", "ac=1722" },
		{ "Archavon the Stone Watcher (25 player)", "ac=1721" },
		{ "Emalon the Storm Watcher (10 player)", "ac=3136" },
		{ "Emalon the Storm Watcher (25 player)", "ac=3137" },
		{ "Koralon the Flame Watcher (10 player)", "ac=3836" },
		{ "Koralon the Flame Watcher (25 player)", "ac=3837" },
		{ "Toravon the Ice Watcher (10 player)", "ac=4585" },
		{ "Toravon the Ice Watcher (25 player)", "ac=4586" },
		{ "Earth, Wind & Fire (10 player)", "ac=4016" },
		{ "Earth, Wind & Fire (25 player)", "ac=4017" },
	},
	VioletHold = {
		ZoneName = { BZ["The Violet Hold"] };
		Location = { BZ["Dalaran (Northrend)"] };
		DungeonID = "220";
		DungeonHeroicID = "221";
		Acronym = L["VH"];
		WorldMapID = "536";
		JournalInstanceID = "283";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Lieutenant Sinclari"] };
		{ WHIT.." 1) "..Atlas:GetBossName("Erekem", 626)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 626 };
		{ WHIT.." 2) "..Atlas:GetBossName("Zuramat the Obliterator", 631)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["Comma"]..ALC["Random"]..ALC["R-Parenthesis"], 631 };
		{ WHIT..INDENT..Atlas:GetBossName("Xevozz", 629)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["Comma"]..ALC["Random"]..ALC["R-Parenthesis"], 629 };
		{ WHIT.." 3) "..Atlas:GetBossName("Ichoron", 628)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 628 };
		{ WHIT.." 4) "..Atlas:GetBossName("Moragg", 627)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 627 };
		{ WHIT.." 5) "..Atlas:GetBossName("Lavanthor", 630)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 630 };
		{ WHIT.." 6) "..Atlas:GetBossName("Cyanigosa", 632)..ALC["L-Parenthesis"]..ALC["Wave 18"]..ALC["R-Parenthesis"], 632 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ "Defenseless", "ac=1816" };
		{ "Lockdown!", "ac=1865" };
		{ "Dehydration", "ac=2041" };
		{ "A Void Dance", "ac=2153" };
		{ "The Violet Hold", "ac=483" };
		{ "Heroic: The Violet Hold", "ac=494" };
		{ "Heroic: The Violet Hold Guild Run", "ac=5100" };
	};
}

-- Atlas Map NPC Description Data
db.AtlasMaps_NPC_DB = {
	AhnKahet = {
		{ 1, 580, 340, 192 }, -- Elder Nadox
		{ 2, 581, 312, 258 }, -- Prince Taldaram
		{ 3, 583, 320, 333 }, -- Amanitar
		{ 4, 582, 244, 335 }, -- Jedoga Shadowseeker
		{ 5, 584, 125, 263 }, -- Herald Volazj
		{ "A", 10001, 431, 341 },
		{ "B", 10002, 56, 263 }, 
		{ "1'", 10003, 87, 263 },
	},
	AzjolNerub = {
		{ 1, 585, 180, 120 }, -- Krik'thir the Gatewatcher
		{ 2, 586, 301, 118 }, -- Hadronox
		{ 3, 587, 308, 352 }, -- Anub'arak
		{ "A", 10001, 11, 238 },
		{ "B", 10002, 92, 367 },
		{ "B", 10002, 276, 118 },
		{ "C", 10003, 468, 444 },
		{ "1'", 10004, 90, 345 },		
	},
	CavernsOfTimeEnt = {
		{ "A", 10001, 405, 170 }, -- Entrance
		{ "B", 10002, 140, 79 }, -- Hyjal Summit
		{ "C", 10003, 18, 156 }, -- Old Hillsbrad Foothills
		{ "D", 10004, 65, 442 }, -- The Black Morass
		{ "E", 10005, 263, 411 }, -- The Culling of Stratholme
		{ "F", 10006, 291, 170 }, -- Dragon Soul
		{ "G", 10007, 261, 201 }, -- End Time
		{ "H", 10008, 28, 298 }, -- Well of Eternity
		{ "I", 10009, 329, 210 }, -- Hour of Twilight
		{ "1'", 10010, 426, 170 }, -- Steward of Time <Keepers of Time>
		{ "2'", 10011, 461, 159 }, -- Alexston Chrome <Tavern of Time>
		{ "3'", 10012, 355, 148 }, -- Graveyard
		{ "4'", 10013, 323, 303 }, -- Yarley <Armorer>
		{ "5'", 10014, 313, 329 }, -- Bortega <Reagents & Poison Supplies>
		{ "6'", 10015, 196, 293 }, -- Zaladormu
		{ "7'", 10016, 198, 157 }, -- Moonwell
		{ "8'", 10017, 161, 216 }, -- Andormu <Keepers of Time>
		{ "9'", 10018, 146, 263 }, -- Anachronos <Keepers of Time>
		{ "10'", 10019, 115, 317 }, -- Andormu <Keepers of Time>
	},
	CoTOldStratholme = {
		{ 3, 613, 312, 80 }, -- Chrono-Lord Epoch
		{ 4, 10004, 232, 150 }, -- Infinite Corruptor
		{ 5, 614, 117, 161 }, -- Mal'Ganis
		{ "A", 10001, 391, 476 },
		{ "B", 10002, 125, 207 },
		{ "X", 10003, 282, 143 },
		{ "X", 10003, 286, 191 },
		{ "X", 10003, 205, 213 },
		{ "X", 10003, 247, 226 },
		{ "X", 10003, 196, 249 },
		{ "1'", 10005, 229, 357 },
		{ "1'", 10005, 386, 419 },
	},
	DrakTharonKeep = {
		{ 1, 588, 170, 50 }, -- Trollgore
		{ 2, 589, 236, 155 }, -- Novos the Summoner
		{ 3, 590, 415, 441 }, -- King Dred
		{ 4, 591, 418, 174 }, -- The Prophet Tharon'ja
		{ "A", 10001, 19, 275 },
		{ "B", 10002, 169, 214 },
		{ "B", 10002, 395, 374 },
		{ "C", 10002, 141, 47 },
		{ "C", 10002, 366, 200 },
		{ "1'", 10003, 457, 410 },
		{ "2'", 10004, 367, 174 },
	},
	FHHallsOfReflection = {
		{ 1, 601, 213, 375 }, -- Falric
		{ 2, 602, 273, 317 }, -- Marwyn
		{ 3, 603, 47, 153 }, -- Escape from Arthas
		{ "A", 10001, 318, 415 },
		{ "B", 10002, 492, 375 },
		{ "1'", 10003, 299, 395 },
	},
	FHPitOfSaron = {
		{ 1, 608, 397, 295 }, -- Forgemaster Garfrost
		{ 2, 609, 251, 226 }, -- Ick & Krick
		{ 3, 610, 224, 154 }, -- Scourgelord Tyrannus
		{ "A", 10001, 186, 425 },
		{ "B", 10002, 220, 120 },
		{ "1'", 10003, 194, 413 },
	},
	FHTheForgeOfSouls = {
		{ 1, 615, 212, 252 }, -- Bronjahm
		{ 2, 616, 230, 39 }, -- Devourer of Souls
		{ "A", 10001, 388, 480 },
		{ "B", 10002, 209, 24 },
		{ "1'", 10003, 363, 488 },
	},
	Gundrak = {
		{ 1, 592, 345, 244 }, -- Slad'ran
		{ 2, 593, 266, 340 }, -- Drakkari Colossus
		{ 3, 594, 198, 245 }, -- Moorabi
		{ 4, 595, 83, 367 }, -- Eck the Ferocious
		{ 5, 596, 267, 90}, -- Gal'darah
		{ "A", 10001, 165, 170 },
		{ "A", 10001, 373, 170 },
		{ "B", 10002, 172, 24 },
		{ "B", 10002, 371, 140 },
		{ "1'", 10003, 265, 325 },
	},
	IcecrownCitadelA = {
		{ "A", 10001, 168, 9 },
		{ "B", 10002, 168, 485 },
		{ "B", 10002, 365, 351 }, 
		{ "C", 10003, 365, 251 },
		{ 1, 1624, 168, 303 },
		{ 2, 1625, 168, 460 },
		{ 3, 1626, 272, 251 },
		{ 4, 1627, 458, 251 },
		{ 5, 1628, 364, 284 },
		{ "1'", 10009, 168, 61 },
		{ "3'", 10010, 170, 370 },
		{ "4'", 10011, 366, 334 },
		{ "2'", 10012, 128, 102 },
	},
	IcecrownCitadelB = {
		{ "C", 10001, 273, 428 },
		{ "D", 10002, 180, 157 },
		{ "D", 10002, 328, 160 },
		{ "E", 10002, 91, 153 },
		{ "E", 10002, 218, 159 },
		{ "F", 10002, 139, 159 },
		{ "F", 10002, 275, 200 },
		{ "G", 10002, 428, 210 },
		{ "G", 10002, 427, 455 },
		{ "H", 10002, 480, 76 },
		{ "H", 10002, 490, 290 },
		{ "I", 10003, 272, 291 },
		{ "6", 10004, 134, 310 },
		{ "7", 10005, 134, 268 },
		{ 8, 1629, 74, 339 },
		{ 9, 1630, 74, 243 },
		{ 10, 1631, 32, 291 },
		{ 11, 1632, 271, 130 },
		{ 12, 1633, 135, 87 },
		{ "13", 10011, 426, 291 },
		{ 14, 1634, 425, 372 },
		{ 15, 1635, 425, 38 },
		{ "4'", 10014, 272, 373 },
		{ "5'", 10015, 390, 74 },
	},
	IcecrownCitadelC = {
		{ "I", 10001, 250, 158 },
		{ 16, 1636, 246, 263 },
	},
	IcecrownEnt = {
		{ "A", 10001, 11, 180 }, -- Entrance
		{ "A", 10001, 412, 26 }, -- Entrance
		{ "B", 10002, 267, 243 }, -- The Forge of Souls
		{ "C", 10003, 246, 376 }, -- Pit of Saron
		{ "D", 10004, 333, 322 }, -- Halls of Reflection
		{ "E", 10005, 412, 219 }, -- Icecrown Citadel
		{ "1'", 10006, 221, 306 }, -- Meeting Stone
	},
	Naxxramas = {
		{ "A", 10001, 205, 199 },
		{ 1, 1610, 132, 94 }, -- White
		{ 2, 1611, 158, 117 },
		{ 3, 1612, 99, 93 },
		{ 4, 1613, 30, 25 },
		{ 1, 1601, 221, 104 }, -- Orange
		{ 2, 1602, 274, 74 },
		{ 3, 1603, 372, 23 },
		{ 1, 1607, 83, 286 }, -- Red
		{ 2, 1608, 191, 323 },
		{ 3, 1609, 30, 377 },
		{ 1, 1604, 229, 318 }, -- Purple
		{ 2, 1605, 296, 286 },
		{ 3, 1606, 405, 233 },
		{ 1, 1614, 443, 456 }, -- Green
		{ 2, 1615, 382, 391 },
		{ "1'", 10017, 18, 391 },
		{ "1'", 10017, 432, 236 },
		{ "1'", 10017, 391, 37 },
		{ "1'", 10017, 33, 8 },
	},
	ObsidianSanctum = {
		{ "A", 10001, 325, 250 },
		{ "1", 10002, 196, 242 },
		{ "2", 10003, 254, 189 },
		{ "3", 10004, 250, 301 },
		{ 4, 1616, 255, 241 },
	},
	OnyxiasLair = {
		{ "A", 10001, 48, 54 },
		{ 1, 1651, 332, 104 },
	},
	RubySanctum = {
		{ "A", 10001, 241, 190 }, 
		{ "1", 10002, 298, 251 },
		{ "2", 10003, 193, 251 },
		{ "3", 10004, 245, 303 },
		{ 4, 1652, 242, 250 },
	},
	TheEyeOfEternity = {
		{ "A", 10001, 250, 285 },
		{ 1, 1617, 250, 249 },
	},
	TheNexus = {
		{ 1, 617, 30, 268 }, -- Frozen Commander
		{ 2, 618, 110, 192 }, -- Grand Magus Telestra
		{ 3, 619, 430, 79 }, -- Anomalus
		{ 4, 620, 369, 407 }, -- Ormorok the Tree-Shaper
		{ 5, 621, 189, 363 }, -- Keristrasza
		{ "A", 10001, 198, 494 },
		{ "1", 10002, 378, 348 },
	},
	TheOculus = {
		{ 1, 622, 259, 434 }, -- Drakos the Interrogator
		{ 2, 623, 229, 83 }, -- Varos Cloudstrider
		{ 3, 624, 258, 416 }, -- Mage-Lord Urom
		{ 3, 624, 368, 201 }, -- Mage-Lord Urom
		{ 3, 624, 121, 215 }, -- Mage-Lord Urom
		{ 3, 624, 250, 262 }, -- Mage-Lord Urom
		{ 4, 625, 250, 287 }, -- Ley-Guardian Eregos
		{ "A", 10001, 306, 342 },
		{ "B", 10002, 187, 331 },
		{ "B", 10002, 260, 392 },
		{ "1'", 10003, 188, 255 },
		{ "1'", 10003, 191, 308 },
		{ "1'", 10003, 91, 364 },
		{ "1'", 10003, 312, 250 },
		{ "1'", 10003, 314, 304 },
		{ "1'", 10003, 416, 344 },
		{ "2'", 10004, 252, 359 },
	},
	TrialOfTheChampion = {
		{ "A", 10001, 115, 251 },
		{   1, 834, 266, 249 },
	},
	TrialOfTheCrusader = {
		{ "A", 10001, 277, 314 },
		{ "B", 10002, 375, 425 },
		{ 1, 1618, 159, 315 },
		{ 2, 1623, 382, 209 },
	},
	UlduarA = {
		{ "A", 10001, 281, 494 },
		{ "B", 10002, 250, 6 },
		{ "A'", 10003, 318, 308 },
		{ "B'", 10004, 223, 274 },
		{ "C'", 10005, 344, 235 },
		{ "D'", 10006, 169, 173 },
		{ 1, 1637, 255, 191 },
		{ 2, 1639, 291, 115 },
		{ 3, 1638, 170, 114 },
		{ 4, 1640, 249, 52 },
		{ "1'", 10011, 270, 427 },
		{ "2'", 10012, 254, 224 },
		{ "3'", 10013, 251, 124 },
		{ "4'", 10014, 249, 27 },
	},
	UlduarB = {
		{ "B", 10001, 174, 385},
		{ "C", 10002, 176, 64 },
		{ 5, 1641, 59, 292 },
		{ 6, 1642, 174, 110 },
		{ 7, 1650, 406, 255 },
		{ "5'", 10006, 174, 363 },
		{ "6'", 10007, 59, 410 },
	},
	UlduarC = {
		{ "C", 10001, 242, 453 },
		{ "D", 10002, 53, 174 },
		{ "E", 10003, 24, 419 },
		{ 8, 1643, 240, 309 },
		{ 9, 1644, 363, 342 },
		{ 10, 1645, 412, 263 },
		{ 11, 1646, 251, 126 },
		{ "12", 10008, 136, 119 },
		{ "13", 10009, 335, 114 },
		{ "14", 10010, 275, 220 },
		{ "7'", 10011, 242, 432 },
		{ "8'", 10012, 240, 292 },
	},
	UlduarD = {
		{ "D", 10001, 410, 421 },
		{ 15, 1647, 249, 179 },
		{ "9'", 10003, 251, 299 },
	},
	UlduarE = {
		{ "E", 10001, 57, 262 },
		{ 16, 1648, 250, 288 },
		{ 17, 1649, 397, 164 },
		{ "10'", 10004, 396, 282 },
	},
	UlduarEnt = {
		{ "A", 10001, 177, 373 }, -- Ulduar: Halls of Stone
		{ "B", 10002, 364, 244 }, -- Ulduar: Halls of Lightning
		{ "C", 10003, 230, 157 }, -- Ulduar
		{ "1'", 10004, 312, 353 }, -- Meeting Stone
		{ "2'", 10005, 256, 316 }, -- Graveyard
		{ "3'", 10006, 352, 395 }, -- Shavalius the Fancy <Flight Master>
	},
	UlduarHallsofLightning = {
		{ 1, 597, 247, 142 }, -- General Bjarngrim
		{ 2, 598, 320, 145 }, -- Volkhan
		{ 3, 599, 435, 352 }, -- Ionar
		{ 4, 600, 199, 250 }, -- Loken
		{ "A", 10001, 6, 146 },
	},
	UlduarHallsofStone = {
		{ 1, 604, 138, 313 }, -- Krystallus
		{ 2, 605, 209, 434 }, -- Maiden of Grief
		{ 3, 606, 463, 387 }, -- Tribunal of Ages
		{ 4, 607, 211, 83 }, -- Sjonnir The Ironshaper
		{ "A", 10001, 84, 194 },
		{ "1'", 10002, 63, 314 },
		{ "2'", 10003, 363, 262 },
	},
	UtgardeKeep = {
		{ 1, 638, 157, 131 }, -- Prince Keleseth
		{ 2, 639, 217, 419 }, -- Skarvold & Dalronn
		{ 3, 640, 444, 383 }, -- Ingvar the Plunderer
		{ "A", 10001, 327, 254 },
		{ "B", 10002, 52, 388 },
		{ "B", 10002, 189, 231 },
		{ "C", 10002, 320, 398 },
		{ "C", 10002, 395, 265 },
		{ "1'", 10003, 133, 323 },
	},
	UtgardePinnacle = {
		{ 1, 641, 215, 390 }, -- Svala Sorrowgrave
		{ 2, 642, 347, 364 }, -- Gortok Palehoof
		{ 3, 643, 426, 215 }, -- Skadi the Ruthless
		{ 4, 644, 144, 263 }, -- King Ymiron
		{ "A", 10001, 180, 5 },
		{ "1'", 10002, 298, 161 },
	},
	VaultOfArchavon = {
		{ "A", 10001, 250, 482 }, -- Entrance
		{ 1, 1597, 250, 39 }, -- Archavon the Stone Watcher
		{ 2, 1598, 360, 256 }, -- Emalon the Storm Watcher
		{ 3, 1599, 138, 256 }, -- Koralon the Flame Watcher
		{ 4, 1600, 363, 149 }, -- Toravon the Ice Watcher
	},
	VioletHold = {
		{ 1, 626, 74, 266 }; -- Erekem
		{ 2, 631, 106, 132 }; -- Zuramat the Obliterator
		{ 3, 628, 345, 117 }; -- Ichoron
		{ 4, 627, 383, 216 }; -- Moragg
		{ 5, 630, 338, 323 }; -- Lavanthor
		{ 6, 632, 229, 227 }; -- Cyanigosa
		{ "A", 10001, 230, 467 };
	};
};

--[[
	AssocDefaults{}

	Default map to be auto-selected when no SubZone data is available.

	For example, "Dire Maul" has a subzone called "Warpwood Quarter" located in East Dirl Maul, however, there are also 
	some areas which have not been named with any subzone, and we would like to pick a proper default map in this condition.

	Define this table entries only when the instance has multiple maps.

	Table index is zone name, it need to be localized value, but we will handle the localization with BabbleSubZone library.
	The table value is map's key-name.
]]
db.AssocDefaults = {
	[BZ["Icecrown Citadel"]] =		"IcecrownCitadelA",
	[BZ["Ulduar"]] =			"UlduarA",
}

--[[
	SubZoneData{}

	Define SubZone data for default map to be selected for instance which has multiple maps.
	Subzone data should be able to be pulled out from WMOAreaTable for indoor areas, or from AreaTable for outdoor areas.

	Array Syntax: 
	["localized zone name"] = {
		["atlas map name"] = {
			["localized subzone name 1"],
			["localized subzone name 2"],
		},
	},
]]
db.SubZoneData = {
	-- Icecrown Citadell
	[BZ["Icecrown Citadel"]] = {
		-- Icecrown Citadell, Lower
		["IcecrownCitadelA"] = {
			BZ["Light's Hammer"],	
			BZ["Oratory of the Damned"],
			BZ["Rampart of Skulls"],
			BZ["Deathbringer's Rise"],
		},
		-- Icecrown Citadell, Upper
		["IcecrownCitadelB"] = {
			BZ["The Plagueworks"],
			BZ["Putricide's Laboratory of Alchemical Horrors and Fun"],
			BZ["The Crimson Hall"],
			BZ["The Sanctum of Blood"],
			BZ["The Frostwing Halls"],
			BZ["The Frost Queen's Lair"],
		},
		-- Icecrown Citadell, Frozen Throne
		["IcecrownCitadelC"] = {
			BZ["The Frozen Throne"],
			BZ["Frostmourne"],
		},
	},
	-- Ulduar
	[BZ["Ulduar"]] = {
		-- Ulduar, The Siege
		["UlduarA"] = {
			BZ["Expedition Base Camp"],
			BZ["Iron Concourse"],
			BZ["Formation Grounds"],
			BZ["Razorscale's Aerie"],
			BZ["The Colossal Forge"],
			BZ["The Scrapyard"],
		},
		-- Ulduar, The Antechamber
		["UlduarB"] = {
			BZ["The Antechamber"],
			BZ["The Assembly of Iron"],
			BZ["The Archivum"],
			BZ["The Celestial Planetarium"],
			BZ["The Shattered Walkway"],
		},
		-- Ulduar, The Keepers
		["UlduarC"] = {
			BZ["The Observation Ring"],
			BZ["The Halls of Winter"],
			BZ["The Clash of Thunder"],
			BZ["The Conservatory of Life"],
			BZ["The Corridors of Ingenuity"],
			BZ["Hall of Memories"],
		},
		-- Ulduar, Spark of Imagination
		["UlduarD"] = {
			BZ["The LMS Mark II"],
			BZ["The Spark of Imagination"],
		},
		-- Ulduar, Descent into Madness
		["UlduarE"] = {
			BZ["The Descent into Madness"],
			BZ["The Prison of Yogg-Saron"],
			BZ["The Mind's Eye"],
		},
	},
}

--[[
	OutdoorZoneToAtlas{}

	Maps to auto-select to from outdoor zones.

	Table index is sub-zone name, it need to be localized value, but we will handle
	the localization with BabbleSubZone library.
	The table value is map's key-name.

	Duplicates are commented out.
	Not for localization.
]]
db.OutdoorZoneToAtlas = {
	[BZ["Tanaris"]] = 			"CavernsOfTimeEnt",	-- Burning Crusade, WoLTK, Catalysm
	[BZ["Icecrown"]] = 			"IcecrownEnt",
	[BZ["Dragonblight"]] = 			"RubySanctum",
	[BZ["Borean Tundra"]] = 		"TheEyeOfEternity",
	[BZ["The Storm Peaks"]] = 		"UlduarEnt",
	[BZ["Dalaran"]] = 			"VioletHold",
	[BZ["Howling Fjord"]] = 		"UtgardeKeep",
	[BZ["Zul'Drak"]] = 			"Gundrak",
	[BZ["The Storm Peaks"]] = 		"UlduarEnt",
}

-- Entrance maps to instance maps
db.EntToInstMatches = {
	["CavernsOfTimeEnt"] =			{"CoTOldStratholme"},
	["IcecrownEnt"] =			{"FHHallsOfReflection", "FHPitOfSaron", "FHTheForgeOfSouls", "IcecrownCitadelA", "IcecrownCitadelB", "IcecrownCitadelC"},
	["UlduarEnt"] = 			{"UlduarHallsofStone", "UlduarHallsofLightning", "UlduarA", "UlduarB", "UlduarC", "UlduarD", "UlduarE"},
}

-- Instance maps to entrance maps
db.InstToEntMatches = {
	["CoTOldStratholme"] =			{"CavernsOfTimeEnt"},
	["FHHallsOfReflection"] =		{"IcecrownEnt"},
	["FHPitOfSaron"] =			{"IcecrownEnt"},
	["FHTheForgeOfSouls"] =			{"IcecrownEnt"},
	["IcecrownCitadelA"] =			{"IcecrownEnt"},
	["IcecrownCitadelB"] =			{"IcecrownEnt"},
	["IcecrownCitadelC"] =			{"IcecrownEnt"},
	["UlduarHallsofStone"] = 		{"UlduarEnt"}, 
	["UlduarHallsofLightning"] = 		{"UlduarEnt"},
	["UlduarA"] = 				{"UlduarEnt"},
	["UlduarB"] = 				{"UlduarEnt"},
	["UlduarC"] = 				{"UlduarEnt"},
	["UlduarD"] = 				{"UlduarEnt"},
	["UlduarE"] = 				{"UlduarEnt"},
}

-- Links maps together that are part of the same instance
db.SubZoneAssoc = {
	["IcecrownCitadelA"] =			BZ["Icecrown Citadel"],
	["IcecrownCitadelB"] =			BZ["Icecrown Citadel"],
	["IcecrownCitadelC"] =			BZ["Icecrown Citadel"],
	["IcecrownEnt"] =			BZ["Icecrown Citadel"],
	["UlduarA"] =				BZ["Ulduar"],
	["UlduarB"] =				BZ["Ulduar"],
	["UlduarC"] =				BZ["Ulduar"],
	["UlduarD"] =				BZ["Ulduar"],
	["UlduarE"] =				BZ["Ulduar"],
}

db.DropDownLayouts_Order = {
	[ATLAS_DDL_CONTINENT] = {
		ATLAS_DDL_CONTINENT_NORTHREND,
	},
	[ATLAS_DDL_LEVEL] = {
		ATLAS_DDL_LEVEL_70TO80,
		ATLAS_DDL_LEVEL_80TO85,
	},
	[ATLAS_DDL_EXPANSION] = {
		ATLAS_DDL_EXPANSION_WOTLK,
	},
}

db.DropDownLayouts = {
	[ATLAS_DDL_CONTINENT] = {
		[ATLAS_DDL_CONTINENT_KALIMDOR] = {
			"CavernsOfTimeEnt",		-- Burning Crusade, WoLTK, Catalysm
			"CoTOldStratholme",
			"OnyxiasLair",			-- WrathoftheLichKing
		},
		[ATLAS_DDL_CONTINENT_NORTHREND] = {
			"AhnKahet",
			"AzjolNerub",
			"DrakTharonKeep",
			"FHHallsOfReflection",
			"FHTheForgeOfSouls",
			"FHPitOfSaron",
			"Gundrak",
			"IcecrownCitadelA",
			"IcecrownCitadelB",
			"IcecrownCitadelC",
			"IcecrownEnt",
			"Naxxramas",
			"UlduarEnt",
			"UlduarHallsofStone",
			"UlduarHallsofLightning",
			"UlduarA",
			"UlduarB",
			"UlduarC",
			"UlduarD",
			"UlduarE",
			"ObsidianSanctum",
			"RubySanctum",
			"UtgardeKeep",
			"UtgardePinnacle",
			"TheEyeOfEternity",
			"TheNexus",
			"TheOculus",
			"TrialOfTheChampion",
			"TrialOfTheCrusader",
			"VaultOfArchavon",
			"VioletHold",
		},
	},
	[ATLAS_DDL_EXPANSION] = {
		[ATLAS_DDL_EXPANSION_WOTLK] = {
			"AhnKahet",
			"AzjolNerub",
			"CavernsOfTimeEnt",
			"CoTOldStratholme",
			"DrakTharonKeep",
			"FHHallsOfReflection",
			"FHTheForgeOfSouls",
			"FHPitOfSaron",
			"Gundrak",
			"IcecrownCitadelA",
			"IcecrownCitadelB",
			"IcecrownCitadelC",
			"IcecrownEnt",
			"Naxxramas",
			"ObsidianSanctum",
			"OnyxiasLair",
			"RubySanctum",
			"TheEyeOfEternity",
			"TheNexus",
			"TheOculus",
			"TrialOfTheChampion",
			"TrialOfTheCrusader",
			"UlduarEnt",
			"UlduarHallsofLightning",
			"UlduarHallsofStone",
			"UlduarA",
			"UlduarB",
			"UlduarC",
			"UlduarD",
			"UlduarE",
			"UtgardeKeep",
			"UtgardePinnacle",
			"VaultOfArchavon",
			"VioletHold",
		},
	},
	[ATLAS_DDL_LEVEL] = {
		[ATLAS_DDL_LEVEL_70TO80] = {
			"AhnKahet",			-- WrathoftheLichKing
			"AzjolNerub",			-- WrathoftheLichKing
			"CavernsOfTimeEnt",		
			"CoTOldStratholme",		-- WrathoftheLichKing
			"DrakTharonKeep",		-- WrathoftheLichKing
			"FHHallsOfReflection",		-- WrathoftheLichKing
			"FHPitOfSaron",			-- WrathoftheLichKing
			"FHTheForgeOfSouls",		-- WrathoftheLichKing
			"GruulsLair",			-- WrathoftheLichKing
			"Gundrak",			-- WrathoftheLichKing
			"HellfireCitadelEnt",		-- WrathoftheLichKing
			"HCMagtheridonsLair",		-- WrathoftheLichKing
			"SunwellPlateau",		-- WrathoftheLichKing
			"TempestKeepTheEye",		-- WrathoftheLichKing
			"TheNexus",			-- WrathoftheLichKing
			"TheOculus",			-- WrathoftheLichKing
			"TrialOfTheChampion",		-- WrathoftheLichKing
			"UlduarEnt",			-- WrathoftheLichKing
			"UlduarHallsofStone",		-- WrathoftheLichKing
			"UlduarHallsofLightning",	-- WrathoftheLichKing
			"UtgardeKeep",			-- WrathoftheLichKing
			"UtgardePinnacle",		-- WrathoftheLichKing
			"VioletHold",			-- WrathoftheLichKing
		},
		[ATLAS_DDL_LEVEL_80TO85] = {
			"IcecrownCitadelA",		-- WrathoftheLichKing
			"IcecrownCitadelB",		-- WrathoftheLichKing
			"IcecrownCitadelC",		-- WrathoftheLichKing
			"IcecrownEnt",			-- WrathoftheLichKing
			"Naxxramas",			-- WrathoftheLichKing
			"ObsidianSanctum",		-- WrathoftheLichKing
			"OnyxiasLair",			-- WrathoftheLichKing
			"RubySanctum",			-- WrathoftheLichKing
			"TheEyeOfEternity",		-- WrathoftheLichKing
			"TrialOfTheCrusader",		-- WrathoftheLichKing
			"UlduarA",			-- WrathoftheLichKing
			"UlduarB",			-- WrathoftheLichKing
			"UlduarC",			-- WrathoftheLichKing
			"UlduarD",			-- WrathoftheLichKing
			"UlduarE",			-- WrathoftheLichKing
			"VaultOfArchavon",		-- WrathoftheLichKing
		},
	},
	[ATLAS_DDL_PARTYSIZE] = {
		[ATLAS_DDL_PARTYSIZE_5] = {
			"AhnKahet",			-- WrathoftheLichKing
			"AzjolNerub",			-- WrathoftheLichKing
			"CavernsOfTimeEnt",		-- WrathoftheLichKing
			"CoTOldStratholme",		-- WrathoftheLichKing
			"DrakTharonKeep",		-- WrathoftheLichKing
			"FHHallsOfReflection",		-- WrathoftheLichKing
			"FHPitOfSaron",			-- WrathoftheLichKing
			"FHTheForgeOfSouls",		-- WrathoftheLichKing
			"Gundrak",			-- WrathoftheLichKing
			"IcecrownEnt",			-- WrathoftheLichKing
			"TheNexus",			-- WrathoftheLichKing
			"TheOculus",			-- WrathoftheLichKing
			"TrialOfTheChampion",		-- WrathoftheLichKing
			"UlduarEnt",			-- WrathoftheLichKing
			"UlduarHallsofLightning",	-- WrathoftheLichKing
			"UlduarHallsofStone",		-- WrathoftheLichKing
			"UtgardeKeep",			-- WrathoftheLichKing
			"UtgardePinnacle",		-- WrathoftheLichKing
			"VioletHold",			-- WrathoftheLichKing
		},
		[ATLAS_DDL_PARTYSIZE_10] = {
			"TheEyeOfEternity",		-- WrathoftheLichKing
			"IcecrownCitadelA",		-- WrathoftheLichKing
			"IcecrownCitadelB",		-- WrathoftheLichKing
			"IcecrownCitadelC",		-- WrathoftheLichKing
			"IcecrownEnt",			-- WrathoftheLichKing
			"Naxxramas",			-- WrathoftheLichKing
			"ObsidianSanctum",		-- WrathoftheLichKing
			"OnyxiasLair",			-- WrathoftheLichKing
			"RubySanctum",			-- WrathoftheLichKing
			"TrialOfTheCrusader",		-- WrathoftheLichKing
			"UlduarA",			-- WrathoftheLichKing
			"UlduarB",			-- WrathoftheLichKing
			"UlduarC",			-- WrathoftheLichKing
			"UlduarD",			-- WrathoftheLichKing
			"UlduarE",			-- WrathoftheLichKing
			"VaultOfArchavon",		-- WrathoftheLichKing
		},
		[ATLAS_DDL_PARTYSIZE_20TO40] = {
			"TheEyeOfEternity",		-- WrathoftheLichKing
			"IcecrownCitadelA",		-- WrathoftheLichKing
			"IcecrownCitadelB",		-- WrathoftheLichKing
			"IcecrownCitadelC",		-- WrathoftheLichKing
			"IcecrownEnt",			-- WrathoftheLichKing
			"Naxxramas",			-- WrathoftheLichKing
			"ObsidianSanctum",		-- WrathoftheLichKing
			"OnyxiasLair",			-- WrathoftheLichKing
			"RubySanctum",			-- WrathoftheLichKing
			"TrialOfTheCrusader",		-- WrathoftheLichKing
			"UlduarA",			-- WrathoftheLichKing
			"UlduarB",			-- WrathoftheLichKing
			"UlduarC",			-- WrathoftheLichKing
			"UlduarD",			-- WrathoftheLichKing
			"UlduarE",			-- WrathoftheLichKing
			"VaultOfArchavon",		-- WrathoftheLichKing
		},
	},
	[ATLAS_DDL_TYPE] = {
		[ATLAS_DDL_TYPE_INSTANCE] = {
			"AhnKahet",			-- WrathoftheLichKing
			"AzjolNerub",			-- WrathoftheLichKing
			"CoTOldStratholme",		-- WrathoftheLichKing
			"DrakTharonKeep",		-- WrathoftheLichKing
			"TheEyeOfEternity",		-- WrathoftheLichKing
			"FHHallsOfReflection",		-- WrathoftheLichKing
			"FHTheForgeOfSouls",		-- WrathoftheLichKing
			"FHPitOfSaron",			-- WrathoftheLichKing
			"Gundrak",			-- WrathoftheLichKing
			"IcecrownCitadelA",		-- WrathoftheLichKing
			"IcecrownCitadelB",		-- WrathoftheLichKing
			"IcecrownCitadelC",		-- WrathoftheLichKing
			"Naxxramas",			-- WrathoftheLichKing
			"ObsidianSanctum",		-- WrathoftheLichKing
			"OnyxiasLair",			-- WrathoftheLichKing
			"RubySanctum",			-- WrathoftheLichKing
			"TheNexus",			-- WrathoftheLichKing
			"TheOculus",			-- WrathoftheLichKing
			"UlduarHallsofStone",		-- WrathoftheLichKing
			"UlduarHallsofLightning",	-- WrathoftheLichKing
			"UlduarA",			-- WrathoftheLichKing
			"UlduarB",			-- WrathoftheLichKing
			"UlduarC",			-- WrathoftheLichKing
			"UlduarD",			-- WrathoftheLichKing
			"UlduarE",			-- WrathoftheLichKing
			"UtgardeKeep",			-- WrathoftheLichKing
			"UtgardePinnacle",		-- WrathoftheLichKing
			"VaultOfArchavon",		-- WrathoftheLichKing
			"TrialOfTheChampion",		-- WrathoftheLichKing
			"TrialOfTheCrusader",		-- WrathoftheLichKing
			"VioletHold",			-- WrathoftheLichKing
		},
		[ATLAS_DDL_TYPE_ENTRANCE] = {
			"CavernsOfTimeEnt",		-- WrathoftheLichKing
			"IcecrownEnt",			-- WrathoftheLichKing
			"UlduarEnt",			-- WrathoftheLichKing
		},
	},
}
