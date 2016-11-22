-- $Id: Atlas_Legion.lua 82 2016-11-14 08:58:45Z arith $
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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_Legion");
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
--************************************************
-- Legion
--************************************************
	AssaultonVioletHold = {
		ZoneName = { BZ["Assault on Violet Hold"] };
		Location = { BZ["Dalaran"] };
		DungeonID = "1208";
		DungeonHeroicID = "1209";
		--Acronym = "";
		WorldMapID = "1066";
		JournalInstanceID = "777";
		Module = "Atlas_Legion";
		LargeMap = "AssaultonVioletHold1_";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Shivermaw", 1694), 1694 };
		{ WHIT.." 2) "..Atlas_GetBossName("Blood-Princess Thal'ena", 1702), 1702 };
		{ WHIT.." 3) "..Atlas_GetBossName("Festerface", 1693), 1693 };
		{ WHIT.." 4) "..Atlas_GetBossName("Millificent Manastorm", 1688), 1688 };
		{ WHIT.." 5) "..Atlas_GetBossName("Mindflayer Kaahrj", 1686), 1686 };
		{ WHIT.." 6) "..Atlas_GetBossName("Anub'esset", 1696), 1696 };
		{ WHIT.." 7) "..Atlas_GetBossName("Sael'orn", 1697), 1697 };
		{ WHIT.." 8) "..Atlas_GetBossName("Fel Lord Betrug", 1711), 1711 };
		
	};
	BlackRookHoldA = {
		ZoneName = { BZ["Black Rook Hold"]..ALC["MapA"] };
		Location = { BZ["Val'sharah"] };
		DungeonID = "1204";
		DungeonHeroicID = "1205";
		--Acronym = "";
		WorldMapID = "1081";
		DungeonLevel = "1";
		JournalInstanceID = "740";
		Module = "Atlas_Legion";
		LargeMap = "BlackRookHold1_";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("The Amalgam of Souls", 1518), 1518 };
		{ ORNG.." 1) "..L["Lady Velandras Ravencrest"], 10003 };
		{ ORNG.." 2) "..L["Ancient Widow"], 10004 };
	};
	BlackRookHoldB = {
		ZoneName = { BZ["Black Rook Hold"]..ALC["MapB"] };
		Location = { BZ["Val'sharah"] };
		DungeonID = "1204";
		DungeonHeroicID = "1205";
		--Acronym = "";
		WorldMapID = "1081";
		DungeonLevel = "2";
		JournalInstanceID = "740";
		Module = "Atlas_Legion";
		LargeMap = "BlackRookHold2_";
		{ BLUE.." B-G) "..ALC["Connection"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Illysanna Ravencrest", 1653), 1653 };
		{ ORNG.." 3) "..L["Archmage Galeorn"], 10002 };
		{ ORNG.." 4) "..L["Kalyndras <Rook's Quartermaster>"], 10003 };
		{ ORNG.." 5) "..L["Braxas the Fleshcarver"], 10004 };
	};
	BlackRookHoldC = {
		ZoneName = { BZ["Black Rook Hold"]..ALC["MapC"] };
		Location = { BZ["Val'sharah"] };
		DungeonID = "1204";
		DungeonHeroicID = "1205";
		--Acronym = "";
		WorldMapID = "1081";
		DungeonLevel = "4";
		JournalInstanceID = "740";
		Module = "Atlas_Legion";
		{ BLUE.." F-G) "..ALC["Connection"], 10001 };
		{ WHIT.." 3) "..Atlas_GetBossName("Smashspite the Hateful", 1664), 1664 };
		{ WHIT.." 4) "..Atlas_GetBossName("Lord Kur'talos Ravencrest", 1672), 1672 };
		{ INDENT..WHIT..L["Dantalionax"] };
	};
	CourtofStarsA = {
		ZoneName = { BZ["Court of Stars"]..ALC["MapA"] };
		Location = { BZ["Suramar"] };
		--DungeonID = "1319";
		DungeonMythicID = "1318";
		--Acronym = "";
		WorldMapID = "1087";
		DungeonLevel = "1";
		JournalInstanceID = "800";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Patrol Captain Gerdo", 1718), 1718 };
		{ WHIT.." 2) "..Atlas_GetBossName("Talixae Flamewreath", 1719), 1719 };
		{ WHIT.." 3) "..Atlas_GetBossName("Advisor Melandrus", 1720), 1720 };
		{ GREN.." 1) "..L["Ly'leth Lunastre"], 10003 };
		{ ORNG.." 1) "..L["Arcanist Malrodi"], 10004 };
		{ ORNG.." 2) "..L["Velimar"], 10005 };
	};
	CourtofStarsB = {
		ZoneName = { BZ["Court of Stars"]..ALC["MapB"] };
		Location = { BZ["Suramar"] };
		--DungeonID = "1319";
		DungeonMythicID = "1318";
		--Acronym = "";
		WorldMapID = "1087";
		DungeonLevel = "2";
		JournalInstanceID = "800";
		Module = "Atlas_Legion";
		{ BLUE.." B-C) "..ALC["Connection"], 10002 };
	};
	DarkheartThicket = {
		ZoneName = { BZ["Darkheart Thicket"] };
		Location = { BZ["Val'sharah"] };
		DungeonID = "1201";
		DungeonHeroicID = "1202";
		--Acronym = "";
		WorldMapID = "1067";
		JournalInstanceID = "762";
		Module = "Atlas_Legion"; 
		LargeMap = "DarkheartThicket";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Arch-Druid Glaidalis", 1654), 1654 };
		{ WHIT.." 2) "..Atlas_GetBossName("Oakheart", 1655), 1655 };
		{ WHIT.." 3) "..Atlas_GetBossName("Dresaron", 1656), 1656 };
		{ WHIT.." 4) "..Atlas_GetBossName("Shade of Xavius", 1657), 1657 };
		{ ORNG.." 1) "..L["Rage Rot"], 10003 };
		{ ORNG.." 2) "..L["Kudzilla"], 10004 };
	};
	EyeofAzshara = {
		ZoneName = { BZ["Eye of Azshara"] };
		Location = { BZ["Azsuna"] };
		DungeonID = "1174";
		DungeonHeroicID = "1175";
		--Acronym = "";
		WorldMapID = "1046";
		JournalInstanceID = "716";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Warlord Parjesh", 1480), 1480 };
		{ WHIT.." 2) "..Atlas_GetBossName("Lady Hatecoil", 1490), 1490 };
		{ WHIT.." 3) "..Atlas_GetBossName("King Deepbeard", 1491), 1491 };
		{ WHIT.." 4) "..Atlas_GetBossName("Serpentrix", 1479), 1479 };
		{ WHIT.." 5) "..Atlas_GetBossName("Wrath of Azshara", 1492), 1492 };
		{ GREN.."1') "..L["Crate of Corks"], 10002 };
		{ INDENT..GREY..QUESTS_COLON..L["Put a Cork in It"] };
		{ ORNG.." 1) "..L["Shellmaw"], 10003 };
		{ ORNG.." 2) "..L["Gom Crabbar"], 10004 };
	};
	HallsofValorA = { 
		ZoneName = { BZ["Halls of Valor"]..ALC["MapA"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1193";
		DungeonHeroicID = "1194";
		--Acronym = "";
		WorldMapID = "1041";
		DungeonLevel = "2";
		JournalInstanceID = "721";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Portal"], 10002 };
		{ BLUE.." C) "..ALC["Connection"], 10003 };
		{ WHIT.." 1) "..Atlas_GetBossName("Hymdall", 1485), 1485 };
		{ WHIT.." 2) "..Atlas_GetBossName("Hyrja", 1486), 1486 };
		{ ORNG.." 1) "..L["Volynd Stormbringer"], 10004 };
	};
	HallsofValorB = { 
		ZoneName = { BZ["Halls of Valor"]..ALC["MapB"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1193";
		DungeonHeroicID = "1194";
		--Acronym = "";
		WorldMapID = "1041";
		DungeonLevel = "1";
		JournalInstanceID = "721";
		Module = "Atlas_Legion";
		{ BLUE.." B) "..ALC["Portal"], 10002 };
		{ WHIT.." 3) "..Atlas_GetBossName("Fenryr", 1487), 1487 };
		{ INDENT..WHIT.." 3') "..L["Fenryr's western spawn point"], 10003 };
		{ INDENT..WHIT.." 3'') "..L["Fenryr's eastern spawn point"], 10004 };
		{ ORNG.." 2) "..L["Arthfael"], 10005 };
		{ ORNG.." 3) "..L["Earlnoc the Beastbreaker"], 10006 };
	};
	HallsofValorC = { 
		ZoneName = { BZ["Halls of Valor"]..ALC["MapC"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1193";
		DungeonHeroicID = "1194";
		--Acronym = "";
		WorldMapID = "1041";
		DungeonLevel = "3";
		JournalInstanceID = "721";
		Module = "Atlas_Legion";
		{ BLUE.." C) "..ALC["Connection"], 10003 };
		{ WHIT.." 4) "..Atlas_GetBossName("God-King Skovald", 1488), 1488 };
		{ WHIT.." 5) "..Atlas_GetBossName("Odyn", 1489), 1489 };
		{ ORNG.." 1) "..L["King Tor"], 10004 };
		{ ORNG.." 2) "..L["King Bjorn"], 10005 };
		{ ORNG.." 3) "..L["King Haldor"], 10006 };
		{ ORNG.." 4) "..L["King Ranulf"], 10007 };
	};
	MawofSoulsA = {
		ZoneName = { BZ["Maw of Souls"]..ALC["MapA"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1191";
		DungeonHeroicID = "1192";
		--Acronym = "";
		WorldMapID = "1042";
		DungeonLevel = "1";
		JournalInstanceID = "727";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Transport"]..ALC["Hyphen"]..L["Echoing Horn of the Damned"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Ymiron, the Fallen King", 1502), 1502 };
	};
	MawofSoulsB = {
		ZoneName = { BZ["Maw of Souls"]..ALC["MapB"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1191";
		DungeonHeroicID = "1192";
		--Acronym = "";
		WorldMapID = "1042";
		DungeonLevel = "3";
		JournalInstanceID = "727";
		Module = "Atlas_Legion";
		{ BLUE.." B-C) "..ALC["Connection"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Harbaron", 1512), 1512 };
		{ WHIT.." 3) "..Atlas_GetBossName("Helya", 1663), 1663 };		
	};
	NeltharionsLair = {
		ZoneName = { BZ["Neltharion's Lair"] };
		Location = { BZ["Highmountain"] };
		DungeonID = "1206";
		DungeonHeroicID = "1207";
		--Acronym = "";
		WorldMapID = "1065";
		JournalInstanceID = "767";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Exit"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Rokmora", 1662), 1662 };
		{ WHIT.." 2) "..Atlas_GetBossName("Ularogg Cragshaper", 1665), 1665 };
		{ WHIT.." 3) "..Atlas_GetBossName("Naraxas", 1673), 1673 };
		{ WHIT.." 4) "..Atlas_GetBossName("Dargrul the Underking", 1687), 1687 };
		{ GREN.." 1') "..L["Spiritwalker Ebonhorn"], 113526 };
		{ GREN.." 2') "..L["Mushroom Merchant"], 111746 };
		{ ORNG.." 1) "..L["Ultanok"], 103247 };
		{ ORNG.." 2) "..L["Understone Lasher"], 103597 };
		{ ORNG.." 3) "..L["Ragoul"], 103199 };
		{ ORNG.." 4) "..L["Kraxa <Mother of Gnashers>"], 103271 };
	};
--[[
	ReturntoKarazhan = {
		ZoneName = { BZ["Return to Karazhan"] };
		Location = { BZ["Deadwind Pass"] };
		DungeonID = "";
		DungeonHeroicID = "";
		--Acronym = "";
		WorldMapID = "1115";
		JournalInstanceID = "860";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Opera Hall: Wikket", 1820), 1820 };
		{ WHIT.." 2) "..Atlas_GetBossName("Opera Hall: Westfall Story", 1826), 1826 };
		{ WHIT.." 3) "..Atlas_GetBossName("Opera Hall: Beautiful Beast", 1827), 1827 };
		{ WHIT.." 4) "..Atlas_GetBossName("Maiden of Virtue", 1825), 1825 };
		{ WHIT.." 5) "..Atlas_GetBossName("Attumen the Huntsman", 1835), 1835 };
		{ WHIT.." 5) "..Atlas_GetBossName("Moroes", 1837), 1837 };
		{ WHIT.." 6) "..Atlas_GetBossName("The Curator", 1836), 1836 };
		{ WHIT.." 8) "..Atlas_GetBossName("Shade of Medivh", 1817), 1817 };
		{ WHIT.." 9) "..Atlas_GetBossName("Mana Devourer", 1818), 1818 };
		{ WHIT.."10) "..Atlas_GetBossName("Viz'aduum the Watcher", 1838), 1838 };
	};
]]
	TheArcwayEnt = {
		ZoneName = { BZ["The Arcway"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["Sanctum of Order"] };
		DungeonID = "1189";
		DungeonHeroicID = "1190";
		--Acronym = "";
		JournalInstanceID = "726";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..BZ["The Grand Promenade"], 10001 };
		{ BLUE.." B) "..BZ["Terrace of Order"], 10002 };
		{ BLUE.." C) "..BZ["The Arcway"], 10003 };
		{ BLUE.." D) "..BZ["The Nighthold"], 10004 };
		{ PURP.." A) "..ALC["Transport"], 10005 };
		{ PURP.." B) "..L["Portal to Shal'Aran"], 10006 };
		{ WHIT.." 1) "..ALC["Meeting Stone"], 10007 };
	};
	TheArcway = {
		ZoneName = { BZ["The Arcway"] };
		Location = { BZ["Suramar"] };
		--DungeonID = "1189";
		DungeonMythicID = "1190";
		--Acronym = "";
		WorldMapID = "1079";
		JournalInstanceID = "726";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ WHIT.." 1) "..Atlas_GetBossName("Ivanyr", 1497), 1497 };
		{ WHIT.." 2) "..Atlas_GetBossName("Corstilax", 1498), 1498 };
		{ WHIT.." 3) "..Atlas_GetBossName("General Xakal", 1499), 1499 };
		{ WHIT.." 4) "..Atlas_GetBossName("Nal'tira", 1500), 1500 };
		{ WHIT.." 5) "..Atlas_GetBossName("Advisor Vandros", 1501), 1501 };
		{ ORNG.." 1) "..L["The Rat King"], 10002 };
		{ ORNG.." 2) "..L["Sludge Face"], 10003 };
	};
	TheEmeraldNightmareA = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapA"] };
		Location = { BZ["Val'sharah"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "1";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Nythendra", 1703), 1703 };
		{ GREN.." 1') "..L["Nightmare Watcher"], 10003 };
	};
	TheEmeraldNightmareB = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapB"] };
		Location = { BZ["Core of the Nightmare"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "2";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ BLUE.." C) "..ALC["Portal"]..ALC["Colon"]..BZ["Un'Goro Crater"], 10003 };
		{ BLUE.." D) "..ALC["Portal"]..ALC["Colon"]..BZ["Mulgore"], 10004 };
		{ BLUE.." E) "..ALC["Portal"]..ALC["Colon"]..BZ["Grizzly Hills"], 10005 };
		{ BLUE.." F) "..ALC["Portal"]..ALC["Colon"]..BZ["The Emerald Dreamway"], 10006 };
		{ GREN.." 1') "..L["Malfurion Stormrage"], 10010 };
		{ INDENT..GREY..L["Teleport to Moonglade"] };
	};
	TheEmeraldNightmareC = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapC"] };
		Location = { BZ["Un'Goro Crater"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "4";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." C) "..ALC["Portal"], 10003 };
		{ WHIT.." 2) "..Atlas_GetBossName("Il'gynoth, Heart of Corruption", 1738), 1738 };
	};
	TheEmeraldNightmareD = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapD"] };
		Location = { BZ["Mulgore"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "3";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." D) "..ALC["Portal"], 10004 };
		{ WHIT.." 3) "..Atlas_GetBossName("Elerethe Renferal", 1744), 1744 };
	};
	TheEmeraldNightmareE = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapE"] };
		Location = { BZ["Grizzly Hills"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "10";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." E) "..ALC["Portal"], 10005 };
		{ WHIT.." 4) "..Atlas_GetBossName("Ursoc", 1667), 1667 };
	};
	TheEmeraldNightmareF = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapF"] };
		Location = { BZ["The Emerald Dreamway"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "5";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." F) "..ALC["Portal"], 10006 };
		{ WHIT.." 5) "..Atlas_GetBossName("Dragons of Nightmare", 1704), 1704 };
	};
	TheEmeraldNightmareG = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapG"] };
		Location = { BZ["Moonglade"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "11";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ BLUE.." G) "..ALC["Portal"], 10007 };
		{ WHIT.." 6) "..Atlas_GetBossName("Cenarius", 1750), 1750 };
	};
	TheEmeraldNightmareH = {
		ZoneName = { BZ["The Emerald Nightmare"]..ALC["MapH"] };
		Location = { BZ["Rift of Aln"] };
		DungeonID = "1348";
		DungeonHeroicID = "1349";
		DungeonMythicID = "1350";
		--Acronym = "";
		WorldMapID = "1094";
		DungeonLevel = "12";
		JournalInstanceID = "768";
		PlayerLimit = "10-30";
		MinGearLevel = "825";
		Module = "Atlas_Legion";
		{ WHIT.." 7) "..Atlas_GetBossName("Xavius", 1726), 1726 };
	};
	TheNightholdEnt = {
		ZoneName = { BZ["The Nighthold"]..ALC["L-Parenthesis"]..ALC["Entrance"]..ALC["R-Parenthesis"] };
		Location = { BZ["Sanctum of Order"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..BZ["The Grand Promenade"], 10001 };
		{ BLUE.." B) "..BZ["Terrace of Order"], 10002 };
		{ BLUE.." C) "..BZ["The Arcway"], 10003 };
		{ BLUE.." D) "..BZ["The Nighthold"], 10004 };
		{ PURP.." A) "..ALC["Transport"], 10005 };
		{ PURP.." B) "..L["Portal to Shal'Aran"], 10006 };
		{ WHIT.." 1) "..ALC["Meeting Stone"], 10007 };
	};
	TheNightholdA = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapA"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "1";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ WHIT.." 1) "..Atlas_GetBossName("Skorpyron", 1706), 1706 };
		{ GREN.." 1') "..L["Palace Watcher"], 10003 }; 
		{ GREY..INDENT..L["Teleport to Tichondrius / Grand Magistrix Elisande"] };
	};
	TheNightholdB = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapB"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "1";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." B-D) "..ALC["Connection"], 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Chronomatic Anomaly", 1725)..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"], 1725 };
		{ WHIT.." 3) "..Atlas_GetBossName("Trilliax", 1731), 1731 };
	};
	TheNightholdC = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapC"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "3";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." D-H) "..ALC["Connection"], 10001 };
		{ WHIT.." 4) "..Atlas_GetBossName("Spellblade Aluriel", 1751)..ALC["L-Parenthesis"]..ALC["Wanders"]..ALC["R-Parenthesis"], 1751 };
		{ WHIT.." 6) "..Atlas_GetBossName("Krosus", 1713), 1713 };
		{ WHIT.." 7) "..Atlas_GetBossName("High Botanist Tel'arn", 1761), 1761 };
	};
	TheNightholdD = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapD"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "5";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." E) "..ALC["Connection"], 10001 };
		{ WHIT.." 5) "..Atlas_GetBossName("Tichondrius", 1762), 1762 };
	};
	TheNightholdE = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapE"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "6";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." E-G) "..ALC["Connection"], 10001 };
		{ WHIT.." 8) "..Atlas_GetBossName("Star Augur Etraeus", 1732), 1732 };
	};
	TheNightholdF = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapF"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "7";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ BLUE.." H) "..ALC["Portal"], 10001 };
		{ WHIT.." 9) "..Atlas_GetBossName("Grand Magistrix Elisande", 1743), 1743 };
	};
	TheNightholdG = {
		ZoneName = { BZ["The Nighthold"]..ALC["MapG"] };
		Location = { BZ["Suramar"] };
		DungeonID = "1351";
		DungeonHeroicID = "1352";
		DungeonMythicID = "1353";
		--Acronym = "";
		WorldMapID = "1088";
		DungeonLevel = "9";
		JournalInstanceID = "786";
		PlayerLimit = "10-30";
		MinGearLevel = "835";
		Module = "Atlas_Legion";
		{ WHIT.." 10) "..Atlas_GetBossName("Gul'dan", 1737), 1737 };
	};
	TrialofValorA = { 
		ZoneName = { BZ["Trial of Valor"]..ALC["MapA"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1411";
		--Acronym = "";
		WorldMapID = "1114";
		DungeonLevel = "2";
		JournalInstanceID = "861";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10101 };
		{ WHIT.." 1) "..Atlas_GetBossName("Hymdall", 1485), 10001 };
		{ WHIT.." 2) "..Atlas_GetBossName("Hyrja", 1486), 10002 };
		{ WHIT.." 3) "..Atlas_GetBossName("Odyn", 1819), 1819 };
	};
	TrialofValorB = { 
		ZoneName = { BZ["Trial of Valor"]..ALC["MapB"] };
		Location = { BZ["Stormheim"] };
		DungeonID = "1411";
		--Acronym = "";
		WorldMapID = "1114";
		DungeonLevel = "3";
		JournalInstanceID = "861";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10101 };
		{ WHIT.." 4) "..Atlas_GetBossName("Guarm", 1830), 1830 };
		{ WHIT.." 5) "..Atlas_GetBossName("Helya", 1829), 1829 };
	};
	VaultoftheWardensA = {
		ZoneName = { BZ["Vault of the Wardens"]..ALC["MapA"] };
		Location = { BZ["Azsuna"] };
		DungeonID = "1043";
		DungeonHeroicID = "1044";
		--Acronym = "";
		WorldMapID = "1045";
		DungeonLevel = "1";
		JournalInstanceID = "707";
		Module = "Atlas_Legion";
		{ BLUE.." A) "..ALC["Entrance"], 10001 };
		{ BLUE.." B) "..ALC["Connection"], 10002 };
		{ BLUE.." C) "..ALC["Elevator"], 10003 };
		{ WHIT.." 1) "..Atlas_GetBossName("Tirathon Saltheril", 1467), 1467 };
	};
	VaultoftheWardensB = {
		ZoneName = { BZ["Vault of the Wardens"]..ALC["MapB"] };
		Location = { BZ["Azsuna"] };
		DungeonID = "1043";
		DungeonHeroicID = "1044";
		--Acronym = "";
		WorldMapID = "1045";
		DungeonLevel = "2";
		JournalInstanceID = "707";
		Module = "Atlas_Legion";
		{ BLUE.." C-D) "..ALC["Elevator"], 10003 };
		{ WHIT.." 2) "..Atlas_GetBossName("Inquisitor Tormentorum", 1695), 1695 };
		{ WHIT.." 3) "..Atlas_GetBossName("Ash'golm", 1468), 1468 };
		{ WHIT.." 4) "..Atlas_GetBossName("Glazer", 1469), 1469 };
		{ ORNG.." 1) "..L["Grimoira"], 105824 };
		{ INDENT..GREY..ALC["L-Parenthesis"]..L["Requires Skaggldrynk"]..ALC["R-Parenthesis"] };
	};
	VaultoftheWardensC = {
		ZoneName = { BZ["Vault of the Wardens"]..ALC["MapC"] };
		Location = { BZ["Azsuna"] };
		DungeonID = "1043";
		DungeonHeroicID = "1044";
		--Acronym = "";
		WorldMapID = "1045";
		DungeonLevel = "3";
		JournalInstanceID = "707";
		Module = "Atlas_Legion";
		{ BLUE.." D) "..ALC["Elevator"], 10004 };
		{ WHIT.." 5) "..Atlas_GetBossName("Cordana Felsong", 1470), 1470 };
		{ GREN.." 1') "..L["Fel-Ravaged Tome"], 10005};
		{ GREN.." 2') "..L["Drelanim Whisperwind"], 10006 };
	};
};

for k, v in pairs(myMaps) do
	AtlasMaps[k] = v;
end
