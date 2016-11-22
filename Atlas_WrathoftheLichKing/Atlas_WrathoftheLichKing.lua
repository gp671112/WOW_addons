 -- $Id: Atlas_WrathoftheLichKing.lua 15 2016-09-05 14:46:17Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2011 ~ 2016 - Arith Hsu, Atlas Team <atlas.addon@gmail.com>

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

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_WrathoftheLichKing");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");

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

local myMaps = {
	AhnKahet = {
		ZoneName = { BZ["Ahn'kahet: The Old Kingdom"] };
		Location = { BZ["Dragonblight"] };
		DungeonID = "218";
		DungeonHeroicID = "219";
		Acronym = L["AK, Kahet"];
		WorldMapID = "522";
		JournalInstanceID = "271";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Seer Ixit"] };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Elder Nadox", 580), 580 };
		{ WHIT.." 2) "..Atlas_GetBossName("Prince Taldaram", 581), 581 };
		{ WHIT.." 3) "..Atlas_GetBossName("Amanitar", 583)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 583 };
		{ WHIT.." 4) "..Atlas_GetBossName("Jedoga Shadowseeker", 582), 582 };
		{ WHIT.." 5) "..Atlas_GetBossName("Herald Volazj", 584), 584 };
		{ GREN.." 1') "..L["Ahn'kahet Brazier"], 10003 };
	};
	AzjolNerub = {
		ZoneName = { BZ["Azjol-Nerub"] };
		Location = { BZ["Dragonblight"] };
		DungeonID = "204";
		DungeonHeroicID = "241";
		Acronym = L["AN, Nerub"];
		WorldMapID = "533";
		JournalInstanceID = "272";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Reclaimer A'zak"] };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ BLUE.." C) "..ALC["Exit"], 10003 };
		{ WHIT.." 1) "..Atlas_GetBossName("Krik'thir the Gatewatcher", 585), 585 };
		{ WHIT..INDENT..L["Watcher Gashra"] };
		{ WHIT..INDENT..L["Watcher Narjil"] };
		{ WHIT..INDENT..L["Watcher Silthik"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Hadronox", 586), 586 };
		{ WHIT.." 3) "..Atlas_GetBossName("Anub'arak", 587), 587 };
		{ GREN.." 1') "..L["Elder Nurgen"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10004 };
	};
	CoTOldStratholme = {
		ZoneName = { BZ["Caverns of Time"]..ALC["Colon"]..BZ["The Culling of Stratholme"] };
		Location = { BZ["Tanaris"] };
		DungeonID = "209";
		DungeonHeroicID = "210";
		Acronym = L["CoT-Strat"];
		WorldMapID = "521";
		JournalInstanceID = "279";
		Module = "Atlas_WrathoftheLichKing";
		{ PURP..ALC["Event"]..ALC["Colon"]..L["The Culling of Stratholme"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Exit"]..ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10002 };
		{ ORNG.." X) "..L["Scourge Invasion Points"], 10003 };
		{ WHIT..INDENT..ALC["Wave 5"]..ALC["Colon"]..Atlas_GetBossName("Meathook", 611), 611 };
		{ WHIT..INDENT..ALC["Wave 10"]..ALC["Colon"]..Atlas_GetBossName("Salramm the Fleshcrafter", 612), 612 };
		{ WHIT.." 3) "..Atlas_GetBossName("Chrono-Lord Epoch", 613), 613 };
		{ WHIT.." 4) "..Atlas_GetBossName("Infinite Corruptor")..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["R-Parenthesis"], 10004 };
		{ GREN..INDENT..L["Guardian of Time"] };
		{ WHIT.." 5) "..Atlas_GetBossName("Mal'Ganis", 614), 614 };
		{ GREN..INDENT..L["Chromie"] };
		{ GREN.." 1') "..L["Chromie"], 10005 };
	};
	DrakTharonKeep = {
		ZoneName = { BZ["Drak'Tharon Keep"] };
		Location = { BZ["Grizzly Hills"] };
		DungeonID = "214";
		DungeonHeroicID = "215";
		Acronym = L["DTK"];
		WorldMapID = "534";
		JournalInstanceID = "273";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Image of Drakuru"] };
		{ GREN..INDENT..L["Kurzel"] };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Trollgore", 588), 588 };
		{ WHIT.." 2) "..Atlas_GetBossName("Novos the Summoner", 589), 589 };
		{ WHIT.." 3) "..Atlas_GetBossName("King Dred", 590), 590 };
		{ WHIT.." 4) "..Atlas_GetBossName("The Prophet Tharon'ja", 591), 591 };
		{ GREN.." 1') "..L["Elder Kilias"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10003 };
		{ GREN.." 2') "..L["Drakuru's Brazier"], 10004 };
	};
	FHHallsOfReflection = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["Halls of Reflection"] };
		Location = { BZ["Icecrown Citadel"] };
		DungeonID = "255";
		DungeonHeroicID = "256";
		Acronym = L["HoR"]..ALC["Comma"]..L["FH3"];
		WorldMapID = "603";
		JournalInstanceID = "276";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..ALC["Attunement Required"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Dalaran"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Falric", 601)..ALC["L-Parenthesis"]..ALC["Wave 5"]..ALC["R-Parenthesis"], 601 };
		{ WHIT.." 2) "..Atlas_GetBossName("Marwyn", 602)..ALC["L-Parenthesis"]..ALC["Wave 10"]..ALC["R-Parenthesis"], 602 };
		{ WHIT.." 3) "..Atlas_GetBossName("Escape from Arthas", 603)..ALC["L-Parenthesis"]..ALC["Event"]..ALC["R-Parenthesis"], 603 };
		{ GREN..INDENT..L["The Captain's Chest"] };
		{ GREN.." 1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 };
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
	};
	FHPitOfSaron = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["Pit of Saron"] };
		Location = { BZ["Icecrown Citadel"] };
		DungeonID = "253";
		DungeonHeroicID = "254";
		Acronym = L["PoS"]..ALC["Comma"]..L["FH2"];
		WorldMapID = "602";
		JournalInstanceID = "278";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..ALC["Attunement Required"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Halls of Reflection"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Forgemaster Garfrost", 608), 608 };
		{ GREN..INDENT..L["Martin Victus"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Gorkun Ironskull"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Ick & Krick", 609), 609 };
		{ WHIT.." 3) "..Atlas_GetBossName("Scourgelord Tyrannus", 610), 610 };
		{ WHIT..INDENT..L["Rimefang"] };
		{ GREN.."1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 };
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Archmage Elandra <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Kalira"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
	};
	FHTheForgeOfSouls = {
		ZoneName = { BZ["The Frozen Halls"]..ALC["Colon"]..BZ["The Forge of Souls"] };
		Location = { BZ["Icecrown Citadel"] };
		DungeonID = "251";
		DungeonHeroicID = "252";
		Acronym = L["FoS"]..ALC["Comma"]..L["FH1"];
		WorldMapID = "601";
		JournalInstanceID = "280";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Pit of Saron"]..ALC["R-Parenthesis"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Bronjahm", 615), 615 };
		{ WHIT.." 2) "..Atlas_GetBossName("Devourer of Souls", 616), 616 };
		{ GREN.." 1') "..L["Lady Jaina Proudmoore"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 10003 };
		{ GREN..INDENT..L["Archmage Koreln <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Archmage Elandra <Kirin Tor>"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Lady Sylvanas Windrunner <Banshee Queen>"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Loralen"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Kalira"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
	};
	Gundrak = {
		ZoneName = { BZ["Gundrak"] };
		Location = { BZ["Zul'Drak"] };
		DungeonID = "216";
		DungeonHeroicID = "217";
		Acronym = L["Gun"];
		WorldMapID = "530";
		JournalInstanceID = "274";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Chronicler Bah'Kini"]..ALC["Slash"]..L["Tol'mar"] };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Slad'ran", 592), 592 };
		{ WHIT.." 2) "..Atlas_GetBossName("Drakkari Colossus", 593), 593 };
		{ WHIT.." 3) "..Atlas_GetBossName("Moorabi", 594), 594 };
		{ WHIT.." 4) "..Atlas_GetBossName("Eck the Ferocious", 595)..ALC["L-Parenthesis"]..ALC["Heroic"]..ALC["Comma"]..ALC["Summon"]..ALC["R-Parenthesis"], 595 };
		{ WHIT.." 5) "..Atlas_GetBossName("Gal'darah", 596), 596 };
		{ GREN.." 1') "..L["Elder Ohanzee"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10003 };
	};
	IcecrownEnt = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["Icecrown"] };
		LevelRange = "80-83";
		MinLevel = "75";
		PlayerLimit = "5/10/25";
		Acronym = L["IC"];
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..BZ["The Forge of Souls"], 10002 };
		{ BLUE.." C) "..BZ["Pit of Saron"], 10003 };
		{ BLUE.." D) "..BZ["Halls of Reflection"], 10004 };
		{ BLUE.." E) "..BZ["Icecrown Citadel"], 10005 };
		{ GREN.." 1') "..ALC["Meeting Stone"], 10006 };
	};
	IcecrownCitadelA = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapA"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
		Location = { BZ["Icecrown"] };
		DungeonID = "279";
		DungeonHeroicID = "280";
		Acronym = L["IC"];
		PlayerLimit = "10/25";
		WorldMapID = "604";
		JournalInstanceID = "758";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Elevator"], 10002 };
		{ BLUE.." C) "..L["To next map"], 10003 };
		{ WHIT.." 1) "..Atlas_GetBossName("Lord Marrowgar", 1624), 1624 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lady Deathwhisper", 1625), 1625 };
		{ WHIT.." 3) "..Atlas_GetBossName("Icecrown Gunship Battle", 1626)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 1626 };
		{ WHIT.." 4) "..Atlas_GetBossName("Icecrown Gunship Battle", 1627)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 1627 };
		{ WHIT.." 5) "..Atlas_GetBossName("Deathbringer Saurfang", 1628), 1628 };
		{ GREN.." 1') "..BZ["Light's Hammer"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10009 };
		{ GREN.." 2') "..ALC["Portal"]..ALC["L-Parenthesis"]..BZ["Dalaran"]..ALC["R-Parenthesis"], 10012 };
		{ GREN.." 3') "..BZ["Oratory of the Damned"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10010 };
		{ GREN.." 4') "..BZ["Rampart of Skulls"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["Comma"]..ALC["Lower"]..ALC["R-Parenthesis"], 10011 };
		{ GREN..INDENT..BZ["Deathbringer's Rise"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["Comma"]..ALC["Upper"]..ALC["R-Parenthesis"] };
	};
	IcecrownCitadelB = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapB"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"] };
		Location = { BZ["Icecrown"] };
		DungeonID = "279";
		DungeonHeroicID = "280";
		Acronym = L["IC"];
		PlayerLimit = "10/25";
		WorldMapID = "604";
		JournalInstanceID = "758";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] };
		{ BLUE.." C) "..L["From previous map"], 10001 };
		{ BLUE.." D-H) "..ALC["Connection"], 10002 };
		{ BLUE.." I) "..L["To next map"], 10003 };
		{ WHIT.." 6) "..L["Stinky"], 10004 };
		{ WHIT.." 7) "..L["Precious"], 10005 };
		{ WHIT.." 8) "..Atlas_GetBossName("Festergut", 1629), 1629 };
		{ WHIT.." 9) "..Atlas_GetBossName("Rotface", 1630), 1630 };
		{ WHIT.."10) "..Atlas_GetBossName("Professor Putricide", 1631), 1631 };
		{ WHIT.."11) "..Atlas_GetBossName("Blood Prince Council", 1632), 1632 };
		{ WHIT..INDENT..Atlas_GetBossName("Prince Keleseth") };
		{ WHIT..INDENT..Atlas_GetBossName("Prince Taldaram") };
		{ WHIT..INDENT..Atlas_GetBossName("Prince Valanar") };
		{ WHIT.."12) "..Atlas_GetBossName("Blood-Queen Lana'thel", 1633), 1633 };
		{ WHIT.."13) "..L["Sister Svalna"], 10011 };
		{ WHIT.."14) "..Atlas_GetBossName("Valithria Dreamwalker", 1634), 1634 };
		{ WHIT.."15) "..Atlas_GetBossName("Sindragosa", 1635), 1635 };
		{ WHIT..INDENT..L["Rimefang"] };
		{ WHIT..INDENT..L["Spinestalker"] };
		{ GREN.." 4') "..L["Upper Spire"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10014 };
		{ GREN.." 5') "..L["Sindragosa's Lair"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10015 };
	};
	IcecrownCitadelC = {
		ZoneName = { BZ["Icecrown Citadel"]..ALC["MapC"]..ALC["L-Parenthesis"]..BZ["The Frozen Throne"]..ALC["R-Parenthesis"] };
		Location = { BZ["Icecrown"] };
		DungeonID = "279";
		DungeonHeroicID = "280";
		Acronym = L["IC"];
		PlayerLimit = "10/25";
		WorldMapID = "604";
		JournalInstanceID = "758";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..REPUTATION..ALC["Colon"]..BF["The Ashen Verdict"] };
		{ BLUE.." I) "..L["From previous map"], 10001 };
		{ WHIT.."16) "..Atlas_GetBossName("The Lich King", 1636), 1636 };
	};
	Naxxramas = {
		ZoneName = { BZ["Naxxramas"] };
		Location = { BZ["Dragonblight"] };
		DungeonID = "159";
		DungeonHeroicID = "227";
		Acronym = L["Nax"];
		PlayerLimit = "10/25";
		WorldMapID = "535";
		JournalInstanceID = "754";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Mr. Bigglesworth"]..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"] };
		{ WHIT..BZ["The Construct Quarter"] };
		{ WHIT..INDENT.."1) "..Atlas_GetBossName("Patchwerk", 1610), 1610 };
		{ WHIT..INDENT.."2) "..Atlas_GetBossName("Grobbulus", 1611), 1611 };
		{ WHIT..INDENT.."3) "..Atlas_GetBossName("Gluth", 1612), 1612 };
		{ WHIT..INDENT.."4) "..Atlas_GetBossName("Thaddius", 1613), 1613 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Stalagg") };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Feugen") };
		{ ORNG..BZ["The Arachnid Quarter"] };
		{ ORNG..INDENT.."1) "..Atlas_GetBossName("Anub'Rekhan", 1601), 1601 };
		{ ORNG..INDENT.."2) "..Atlas_GetBossName("Grand Widow Faerlina", 1602), 1602 };
		{ ORNG..INDENT.."3) "..Atlas_GetBossName("Maexxna", 1603), 1603 };
		{ _RED..BZ["The Military Quarter"] };
		{ _RED..INDENT.."1) "..Atlas_GetBossName("Instructor Razuvious", 1607), 1607 };
		{ _RED..INDENT.."2) "..Atlas_GetBossName("Gothik the Harvester", 1608), 1608 };
		{ _RED..INDENT.."3) "..Atlas_GetBossName("The Four Horsemen", 1609), 1609 };
		{ _RED..INDENT..INDENT..Atlas_GetBossName("Thane Korth'azz") };
		{ _RED..INDENT..INDENT..Atlas_GetBossName("Lady Blaumeux") };
		{ _RED..INDENT..INDENT..Atlas_GetBossName("Baron Rivendare") };
		{ _RED..INDENT..INDENT..Atlas_GetBossName("Sir Zeliek") };
		{ GREN..INDENT..INDENT..Atlas_GetBossName("Four Horsemen Chest") };
		{ PURP..BZ["The Plague Quarter"] };
		{ PURP..INDENT.."1) "..Atlas_GetBossName("Noth the Plaguebringer", 1604), 1604 };
		{ PURP..INDENT.."2) "..Atlas_GetBossName("Heigan the Unclean", 1605), 1605 };
		{ PURP..INDENT.."3) "..Atlas_GetBossName("Loatheb", 1606), 1606 };
		{ GREN..L["Frostwyrm Lair"] };
		{ GREN..INDENT.."1) "..Atlas_GetBossName("Sapphiron", 1614), 1614 };
		{ GREN..INDENT.."2) "..Atlas_GetBossName("Kel'Thuzad", 1615), 1615 };
		{ "" };
		{ GREN.." 1') "..L["Teleporter to Middle"], 10017 };
	};
	ObsidianSanctum = {
		ZoneName = { BZ["Wyrmrest Temple"]..ALC["Colon"]..BZ["The Obsidian Sanctum"] };
		Location = { BZ["Dragonblight"] };
		DungeonID = "224";
		DungeonHeroicID = "238";
		Acronym = L["OS"];
		PlayerLimit = "10/25";
		WorldMapID = "531";
		JournalInstanceID = "755";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..ALC["AKA"]..ALC["Colon"]..L["Black Dragonflight Chamber"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Tenebron"), 10002 };
		{ WHIT.." 2) "..Atlas_GetBossName("Shadron"), 10003 };
		{ WHIT.." 3) "..Atlas_GetBossName("Vesperon"), 10004 };
		{ WHIT.." 4) "..Atlas_GetBossName("Sartharion", 1616), 1616 };
	};
	OnyxiasLair = {
		ZoneName = { BZ["Onyxia's Lair"] };
		Location = { BZ["Dustwallow Marsh"] };
		DungeonID = "46";
		DungeonHeroicID = "257";
		Acronym = L["Ony"];
		PlayerLimit = "10/25";
		WorldMapID = "718";
		JournalInstanceID = "760";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Onyxia", 1651), 1651 };
	};
	RubySanctum = {
		ZoneName = { BZ["Wyrmrest Temple"]..ALC["Colon"]..BZ["The Ruby Sanctum"] };
		Location = { BZ["Dragonblight"] };
		DungeonID = "293";
		DungeonHeroicID = "294";
		Acronym = L["RS"];
		PlayerLimit = "10/25";
		WorldMapID = "609";
		JournalInstanceID = "761";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..ALC["AKA"]..ALC["Colon"]..L["Red Dragonflight Chamber"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Baltharus the Warborn"), 10002 };
		{ WHIT.." 2) "..Atlas_GetBossName("Saviana Ragefire"), 10003 };
		{ WHIT.." 3) "..Atlas_GetBossName("General Zarithrian"), 10004 };
		{ WHIT.." 4) "..Atlas_GetBossName("Halion", 1652), 1652 };		
	};
	TheEyeOfEternity = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Eye of Eternity"] };
		Location = { BZ["Borean Tundra"] };
		DungeonID = "223";
		DungeonHeroicID = "237";
		Acronym = L["TEoE"];
		PlayerLimit = "10/25";
		WorldMapID = "527";
		JournalInstanceID = "756";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"]..ALC["Slash"]..ALC["Exit"]..ALC["L-Parenthesis"]..ALC["Portal"]..ALC["R-Parenthesis"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Malygos", 1617), 1617 };
	};
	TheNexus = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Nexus"] };
		Location = { BZ["Borean Tundra"] };
		DungeonID = "225";
		DungeonHeroicID = "226";
		Acronym = L["Nex, Nexus"];
		WorldMapID = "520";
		JournalInstanceID = "281";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Warmage Kaitlyn"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Commander Kolurg", 833)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["Comma"]..ALC["Heroic"]..ALC["R-Parenthesis"], 833 };
		{ WHIT..INDENT..Atlas_GetBossName("Commander Stoutbeard", 617)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["Comma"]..ALC["Heroic"]..ALC["R-Parenthesis"], 617 };
		{ GREN..INDENT..L["Berinand's Research"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Grand Magus Telestra", 618), 618 };
		{ WHIT.." 3) "..Atlas_GetBossName("Anomalus", 619), 619 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ormorok the Tree-Shaper", 620), 620 };
		{ WHIT.." 5) "..Atlas_GetBossName("Keristrasza", 621), 621 };
		{ GREN.." 1') "..L["Elder Igasho"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 };
	};
	TheOculus = {
		ZoneName = { BZ["The Nexus"]..ALC["Colon"]..BZ["The Oculus"] };
		Location = { BZ["The Nexus"] };
		DungeonID = "206";
		DungeonHeroicID = "211";
		Acronym = L["Ocu"];
		WorldMapID = "528";
		JournalInstanceID = "282";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Drakos the Interrogator", 622)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"], 622 };
		{ GREN..INDENT..L["Belgaristrasz"] };
		{ GREN..INDENT..L["Eternos"] };
		{ GREN..INDENT..L["Verdisa"] };
		{ WHIT.." 2) "..Atlas_GetBossName("Varos Cloudstrider", 623), 623 };
		{ WHIT.." 3) "..Atlas_GetBossName("Mage-Lord Urom", 624)..ALC["L-Parenthesis"]..ALC["Middle"]..ALC["R-Parenthesis"], 624 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ley-Guardian Eregos", 625)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 625 };
		{ GREN.." 1') "..L["Centrifuge Construct"], 10003 };
		{ GREN.." 2') "..L["Cache of Eregos"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"], 10004 };
	};
	TrialOfTheChampion = {
		ZoneName = { L["Crusaders' Coliseum"]..ALC["Colon"]..BZ["Trial of the Champion"] };
		Location = { BZ["Icecrown"] };
		DungeonID = "245";
		DungeonHeroicID = "249";
		Acronym = L["Champ"];
		WorldMapID = "542";
		JournalInstanceID = "284";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Grand Champions", 834), 834 };
		{ ORNG..INDENT..Atlas_GetBossName("Grand Champions", 834)..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"], 834 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Marshal Jacob Alerius", 834, 1), 834 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Ambrose Boltspark", 834, 2), 834 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Colosos", 834, 5), 834 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Jaelyne Evensong", 834, 3), 834 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Lana Stouthammer", 834, 4), 834 };
		{ ORNG..INDENT..Atlas_GetBossName("Grand Champions", 634)..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"], 634 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Mokra the Skullcrusher", 634, 1), 634 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Eressea Dawnsinger", 634, 2), 634 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Runok Wildmane", 634, 3), 634 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Zul'tore", 634, 4), 634 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Deathstalker Visceri", 634, 5), 634 };
		{ WHIT..INDENT..Atlas_GetBossName("Eadric the Pure", 635)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 635 };
		{ WHIT..INDENT..Atlas_GetBossName("Argent Confessor Paletress", 636)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 636 };
		{ WHIT..INDENT..Atlas_GetBossName("The Black Knight", 637), 637 };
	};
	TrialOfTheCrusader = {
		ZoneName = { L["Crusaders' Coliseum"]..ALC["Colon"]..BZ["Trial of the Crusader"] };
		Location = { BZ["Icecrown"] };
		DungeonID = "246";
		DungeonHeroicID = "248";
		Acronym = L["Crus"];
		PlayerLimit = "10/25";
		WorldMapID = "543";
		JournalInstanceID = "757";
		Module = "Atlas_WrathoftheLichKing";
		{ ORNG..L["Heroic: Trial of the Grand Crusader"] };
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..L["Cavern Entrance"], 10002 };
		--{ WHIT.." 1) "..Atlas_GetBossName("The Beasts of Northrend"), 10003 };
		{ WHIT.." 1) "..Atlas_GetBossName("The Northrend Beasts", 1618), 1618 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Gormok the Impaler") };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Acidmaw") };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Dreadscale") };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Icehowl") };
		{ WHIT..INDENT..Atlas_GetBossName("Lord Jaraxxus", 1619), 1619 };
		{ WHIT..INDENT..Atlas_GetBossName("Faction Champions") };
		--{ WHIT..INDENT..Atlas_GetBossName("The Twin Val'kyr") };
		{ WHIT..INDENT..Atlas_GetBossName("Twin Val'kyr", 1622), 1622 };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Fjola Lightbane") };
		{ WHIT..INDENT..INDENT..Atlas_GetBossName("Eydis Darkbane") };
		{ WHIT.." 2) "..Atlas_GetBossName("Anub'arak", 1623), 1623 };
		-- Champion of the Alliance, 1620
		-- Champion of the Horde, 1621
	};
	UlduarEnt = {
		ZoneName = { BZ["Ulduar"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		LevelRange = "77-83";
		MinLevel = "75";
		PlayerLimit = "5/10/25";
		Acronym = L["Uldu"];
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Stone"], 10001 };
		{ BLUE.." B) "..BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Lightning"], 10002 };
		{ BLUE.." C) "..BZ["Ulduar"], 10003 };
		{ GREN.." 1') "..ALC["Meeting Stone"], 10004 };
		{ GREN.." 2') "..ALC["Graveyard"], 10005 };
		{ GREN.." 3') "..L["Shavalius the Fancy <Flight Master>"], 10006 };
		{ GREN..INDENT..L["Chester Copperpot <General & Trade Supplies>"] };
		{ GREN..INDENT..L["Slosh <Food & Drink>"] };
	};
	UlduarA = {
		ZoneName = { BZ["Ulduar"]..ALC["MapA"]..ALC["L-Parenthesis"]..L["The Siege"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "243";
		DungeonHeroicID = "244";
		Acronym = L["Uldu"];
		PlayerLimit = "10/25";
		WorldMapID = "529";
		JournalInstanceID = "759";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..BZ["The Antechamber"], 10002 };
		{ ORNG.." A') "..L["Tower of Life"], 10003 };
		{ ORNG.." B') "..L["Tower of Flame"], 10004 };
		{ ORNG.." C') "..L["Tower of Frost"], 10005 };
		{ ORNG.." D') "..L["Tower of Storms"], 10006 };
		{ WHIT.." 1) "..Atlas_GetBossName("Flame Leviathan", 1637), 1637 };
		{ WHIT.." 2) "..Atlas_GetBossName("Razorscale", 1639)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1639 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ignis the Furnace Master", 1638)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1638 };
		{ WHIT.." 4) "..Atlas_GetBossName("XT-002 Deconstructor", 1640), 1640 };
		{ GREN.." 1') "..BZ["Expedition Base Camp"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10011 };
		{ GREN.." 2') "..BZ["Formation Grounds"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10012 };
		{ GREN.." 3') "..BZ["The Colossal Forge"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10013 };
		{ GREN.." 4') "..BZ["The Scrapyard"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10014 };
	};
	UlduarB = {
		ZoneName = { BZ["Ulduar"]..ALC["MapB"]..ALC["L-Parenthesis"]..BZ["The Antechamber"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "243";
		DungeonHeroicID = "244";
		Acronym = L["Uldu"];
		PlayerLimit = "10/25";
		WorldMapID = "529";
		JournalInstanceID = "759";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." B) "..L["The Siege"], 10001 };
		{ BLUE.." C) "..L["The Keepers"], 10002 };
		--{ WHIT.." 5) "..Atlas_GetBossName("Assembly of Iron")..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 10003 };
		{ WHIT.." 5) "..Atlas_GetBossName("The Assembly of Iron", 1641)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1641 };
		{ WHIT..INDENT..Atlas_GetBossName("Steelbreaker") };
		{ WHIT..INDENT..Atlas_GetBossName("Runemaster Molgeim") };
		{ WHIT..INDENT..Atlas_GetBossName("Stormcaller Brundir") };
		{ WHIT.." 6) "..Atlas_GetBossName("Kologarn", 1642), 1642 };
		{ WHIT.." 7) "..Atlas_GetBossName("Algalon the Observer", 1650)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1650 };
		{ GREN.." 5') "..BZ["The Antechamber"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10006 };
		{ GREN.." 6') "..L["Prospector Doren"], 10007 };
		{ GREN..INDENT..L["Archivum Console"] };
	};
	UlduarC = {
		ZoneName = { BZ["Ulduar"]..ALC["MapC"]..ALC["L-Parenthesis"]..L["The Keepers"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "243";
		DungeonHeroicID = "244";
		Acronym = L["Uldu"];
		PlayerLimit = "10/25";
		WorldMapID = "529";
		JournalInstanceID = "759";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." C) "..BZ["The Antechamber"], 10001 };
		{ BLUE.." D) "..BZ["The Spark of Imagination"], 10002 };
		{ BLUE.." E) "..BZ["The Descent into Madness"], 10003 };
		{ WHIT.." 8) "..Atlas_GetBossName("Auriaya", 1643)..ALC["L-Parenthesis"]..ALC["Optional"]..ALC["R-Parenthesis"], 1643 };
		{ WHIT.." 9) "..Atlas_GetBossName("Hodir", 1644), 1644 };
		{ WHIT.."10) "..Atlas_GetBossName("Thorim", 1645), 1645 };
		{ ORNG..INDENT..L["Sif"] };
		{ WHIT.."11) "..Atlas_GetBossName("Freya", 1646), 1646 };
		{ WHIT.."12) "..Atlas_GetBossName("Elder Brightleaf"), 10008 };
		{ WHIT.."13) "..Atlas_GetBossName("Elder Ironbranch"), 10009 };
		{ WHIT.."14) "..Atlas_GetBossName("Elder Stonebark"), 10010 };
		{ GREN.." 7') "..BZ["The Shattered Walkway"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10011 };
		{ GREN.." 8') "..BZ["The Conservatory of Life"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10012 };
	};
	UlduarD = {
		ZoneName = { BZ["Ulduar"]..ALC["MapD"]..ALC["L-Parenthesis"]..BZ["The Spark of Imagination"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "243";
		DungeonHeroicID = "244";
		Acronym = L["Uldu"];
		PlayerLimit = "10/25";
		WorldMapID = "529";
		JournalInstanceID = "759";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." D) "..L["The Keepers"], 10001 };
		{ WHIT.."15) "..Atlas_GetBossName("Mimiron", 1647), 1647 };
		{ GREN.." 9') "..BZ["The Spark of Imagination"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10003 };
	};
	UlduarE = {
		ZoneName = { BZ["Ulduar"]..ALC["MapE"]..ALC["L-Parenthesis"]..BZ["The Descent into Madness"]..ALC["R-Parenthesis"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "243";
		DungeonHeroicID = "244";
		Acronym = L["Uldu"];
		PlayerLimit = "10/25";
		WorldMapID = "529";
		JournalInstanceID = "759";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." E) "..L["The Keepers"], 10001 };
		{ WHIT.."16) "..Atlas_GetBossName("General Vezax", 1648), 1648 };
		{ WHIT.."17) "..Atlas_GetBossName("Yogg-Saron", 1649), 1649 };
		{ GREN..INDENT..Atlas_GetBossName("Sara") };
		{ GREN.."10') "..BZ["The Prison of Yogg-Saron"]..ALC["L-Parenthesis"]..ALC["Teleporter"]..ALC["R-Parenthesis"], 10004 };
	};
	UlduarHallsofLightning = {
		ZoneName = { BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Lightning"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "207";
		DungeonHeroicID = "212";
		Acronym = L["HoL"];
		WorldMapID = "525";
		JournalInstanceID = "275";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Stormherald Eljrrin"] };
		{ WHIT.." 1) "..Atlas_GetBossName("General Bjarngrim", 597)..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"], 597 };
		{ WHIT.." 2) "..Atlas_GetBossName("Volkhan", 598), 598 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ionar", 599), 599 };
		{ WHIT.." 4) "..Atlas_GetBossName("Loken", 600), 600 };
	};
	UlduarHallsofStone = {
		ZoneName = { BZ["Ulduar"]..ALC["Colon"]..BZ["Halls of Stone"] };
		Location = { BZ["The Storm Peaks"] };
		DungeonID = "208";
		DungeonHeroicID = "213";
		Acronym = L["HoS"];
		WorldMapID = "526";
		JournalInstanceID = "277";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Kaldir Ironbane"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Krystallus", 604), 604 };
		{ WHIT.." 2) "..Atlas_GetBossName("Maiden of Grief", 605), 605 };
		{ WHIT.." 3) "..Atlas_GetBossName("Tribunal of Ages", 606)..ALC["L-Parenthesis"]..ALC["Event"]..ALC["R-Parenthesis"], 606 };
		{ GREN..INDENT..L["Tribunal Chest"] };
		{ WHIT.." 4) "..Atlas_GetBossName("Sjonnir The Ironshaper", 607), 607 };
		{ GREN.." 1') "..L["Elder Yurauk"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 };
		{ GREN.." 2') "..L["Brann Bronzebeard"], 10003 };
	};
	UtgardeKeep = {
		ZoneName = { BZ["Utgarde Keep"]..ALC["Colon"]..BZ["Utgarde Keep"] };
		Location = { BZ["Howling Fjord"] };
		DungeonID = "202";
		DungeonHeroicID = "242";
		Acronym = L["UK, Keep"];
		WorldMapID = "523";
		JournalInstanceID = "285";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Defender Mordun"]..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] };
		{ GREN..INDENT..L["Dark Ranger Marrah"]..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Prince Keleseth", 638), 638 };
		{ WHIT.." 2) "..Atlas_GetBossName("Skarvold & Dalronn", 639), 639 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ingvar the Plunderer", 640), 640 };
		{ GREN.." 1') "..L["Elder Jarten"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["Comma"]..ALC["Lower"]..ALC["R-Parenthesis"], 10003 };
	};
	UtgardePinnacle = {
		ZoneName = { BZ["Utgarde Keep"]..ALC["Colon"]..BZ["Utgarde Pinnacle"] };
		Location = { BZ["Utgarde Keep"] };
		DungeonID = "203";
		DungeonHeroicID = "205";
		Acronym = L["UP, Pinn"];
		WorldMapID = "524";
		JournalInstanceID = "286";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ GREN..INDENT..L["Brigg Smallshanks"] };
		{ GREN..INDENT..L["Image of Argent Confessor Paletress"] };
		{ WHIT.." 1) "..Atlas_GetBossName("Svala Sorrowgrave", 641), 641 };
		{ WHIT.." 2) "..Atlas_GetBossName("Gortok Palehoof", 642), 642 };
		{ WHIT.." 3) "..Atlas_GetBossName("Skadi the Ruthless", 643), 643 };
		{ WHIT.." 4) "..Atlas_GetBossName("King Ymiron", 644), 644 };
		{ GREN.." 1') "..L["Elder Chogan'gada"]..ALC["L-Parenthesis"]..ALC["Lunar Festival"]..ALC["R-Parenthesis"], 10002 };
	};
	VaultOfArchavon = {
		ZoneName = { BZ["Vault of Archavon"] };
		Location = { BZ["Wintergrasp"] };
		DungeonID = "239";
		DungeonHeroicID = "240";
		Acronym = L["VoA"];
		PlayerLimit = "10/25";
		WorldMapID = "532";
		JournalInstanceID = "753";
		Module = "Atlas_WrathoftheLichKing";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Archavon the Stone Watcher", 1597), 1597 };
		{ WHIT.." 2) "..Atlas_GetBossName("Emalon the Storm Watcher", 1598), 1598 };
		{ WHIT.." 3) "..Atlas_GetBossName("Koralon the Flame Watcher", 1599), 1599 };
		{ WHIT.." 4) "..Atlas_GetBossName("Toravon the Ice Watcher", 1600), 1600 };
	};
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
		{ WHIT.." 1) "..Atlas_GetBossName("Erekem", 626)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 626 };
		{ WHIT.." 2) "..Atlas_GetBossName("Zuramat the Obliterator", 631)..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["Comma"]..ALC["Random"]..ALC["R-Parenthesis"], 631 };
		{ WHIT..INDENT..Atlas_GetBossName("Xevozz", 629)..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["Comma"]..ALC["Random"]..ALC["R-Parenthesis"], 629 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ichoron", 628)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 628 };
		{ WHIT.." 4) "..Atlas_GetBossName("Moragg", 627)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 627 };
		{ WHIT.." 5) "..Atlas_GetBossName("Lavanthor", 630)..ALC["L-Parenthesis"]..ALC["Random"]..ALC["R-Parenthesis"], 630 };
		{ WHIT.." 6) "..Atlas_GetBossName("Cyanigosa", 632)..ALC["L-Parenthesis"]..ALC["Wave 18"]..ALC["R-Parenthesis"], 632 };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end
