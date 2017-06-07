-- $Id: Atlas_ClassOrderHalls.lua 103 2017-05-23 09:33:51Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2016 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail dot com>

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
local _G = getfenv(0)
local pairs = _G.pairs
-- Libraries
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local FOLDER_NAME, private = ...
local LibStub = _G.LibStub

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_ClassOrderHalls");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local LBLU = "|cff33cccc";
local CYAN = "|cff00ffff";
local GREY = "|cff999999";
local ALAN = "|cff7babe0"; -- Alliance's taxi node
local HRDE = "|cffda6955"; -- Horde's taxi node
local NUTL = "|cfffee570"; -- Nutral taxi node
local INDENT = "      ";

-- Icons
local I_REPAIR = "|TInterface\\MINIMAP\\TRACKING\\Repair:0:0|t";
local I_CLASS = "|TInterface\\MINIMAP\\TRACKING\\Class:0:0|t";
local I_PROFF = "|TInterface\\MINIMAP\\TRACKING\\Profession:0:0|t";
local I_FLIGHT = "|TInterface\\MINIMAP\\TRACKING\\FlightMaster:0:0|t";
local I_WORKORDER = "|TInterface\\GossipFrame\\WorkOrderGossipIcon:0:0|t";
local I_CMISSION = "|TInterface\\GossipFrame\\AvailableLegendaryQuestIcon:0:0|t";
local I_RESEARCH = "|TInterface\\ICONS\\INV_Scroll_11:0:0|t";

local CL = {
	["DEATHKNIGHT"]	= "|cffc41f3b";
	["DEMONHUNTER"]	= "|cffa330c9";
	["DRUID"] 	= "|cffff7d0a";
	["HUNTER"] 	= "|cffabd473";
	["MAGE"] 	= "|cff3fc7eb";
	["MONK"] 	= "|cff00ff96";
	["PALADIN"] 	= "|cfff58cba";
	["PRIEST"] 	= "|cffffffff";
	["ROGUE"] 	= "|cfffff569";
	["SHAMAN"] 	= "|cff0070de";
	["WARLOCK"] 	= "|cff8788ee";
	["WARRIOR"] 	= "|cffc79c6e";
};

local function LC(creatureName, npcID)
	if ( (not creatureName) and (not npcID) ) then 
		return 
	end
	
	local lName = Atlas:GetCreatureName(creatureName, npcID)
	if lName == creatureName then
		return L[creatureName]
	else
		return lName
	end
end
local faction = UnitFactionGroup("player")

local myCategory = L["Class Order Hall Maps"];

local myData = {
	CH_DeathKnightLower = {
		ZoneName = { CL["DEATHKNIGHT"]..Atlas_GetClassName("DEATHKNIGHT")..ALC["Hyphen"]..BZ["Acherus: The Ebon Hold"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
		Location = { BZ["Acherus: The Ebon Hold"]..ALC["Comma"]..BZ["Broken Shore"] };
		WorldMapID = "1021";
		DungeonLevel = "2";
		{ ORNG..ALC["Lower"]..ALC["Hyphen"]..BZ["Hall of Command"] };
		{ INDENT..PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10101 };
		{ INDENT..PURP.." B) "..L["Portal to another floor"], 10102 };
		{ INDENT..PURP.." B) "..L["Portal to the roof"], 10103 };
		{ INDENT..WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ INDENT..WHIT.." 2) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..Atlas:GetBossName(L["Siouxsie the Banshee <Mission Specialist>"], 93568).."\n"..WHIT..Atlas:GetBossName(L["Highlord Darion Mograine"], 93437), 10002 };
		{ INDENT..INDENT..WHIT..LC("Siouxsie the Banshee <Mission Specialist>", 93568), 93568 };
		{ INDENT..INDENT..WHIT..LC("Highlord Darion Mograine", 93437), 93437 };
		{ INDENT..WHIT.." 3) "..I_RESEARCH..LC("Illanna Dreadmoore <Ebon Blade Archivist>", 97111), 97111 };
		{ INDENT..WHIT.." 4) "..I_CLASS..LC("Archivist Zubashi <Class Hall Upgrades>", 97485), 97485 };
		{ INDENT..WHIT.." 5) "..LC("Lord Thorval", 97134), 97134 };
		{ INDENT..WHIT.." 6) "..I_WORKORDER..LC("Dark Summoner Marogh <Risen Horde Recruiter>", 106435), 106435 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.." 7) "..LC("Amal'thazad", 93555).."\n"..WHIT..LC("Thassarian", 93456).."\n"..WHIT..LC("King Thoras Trollbane", 113419), 93555 };
		{ INDENT..INDENT..WHIT..LC("Thassarian", 93456), 93456 };
		{ INDENT..INDENT..WHIT..LC("King Thoras Trollbane", 113419), 113419 };
		{ INDENT..WHIT.." 8) "..I_WORKORDER..LC("Winter Payne", 111634), 111634 };
		{ INDENT..INDENT..GREY..L["Frost Crux"]..ALC["Hyphen"]..L["Requires Frost Wyrm work order advancement"] };
		{ INDENT..WHIT.." 9) "..I_WORKORDER..LC("Eran Droll <Ebon Knight Frostreavers Recruiter>", 120135), 120135 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT..ALC["Hyphen"]..L["Requires Frost and Death order advancement"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_DeathKnightUpper = {
		ZoneName = { CL["DEATHKNIGHT"]..Atlas_GetClassName("DEATHKNIGHT")..ALC["Hyphen"]..BZ["Acherus: The Ebon Hold"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"] };
		Location = { BZ["Acherus: The Ebon Hold"]..ALC["Comma"]..BZ["Broken Shore"] };
		WorldMapID = "1021";
		DungeonLevel = "1";
		{ ORNG..ALC["Upper"]..ALC["Hyphen"]..BZ["The Heart of Acherus"] };
		{ INDENT..PURP.." B) "..L["Portal to another floor"], 10102 };
		{ INDENT..WHIT.."10) "..L["Training Dummies"], 10010 };
		{ INDENT..WHIT.."11) "..I_REPAIR..LC("Quartermaster Ozorg <Rare Goods Vendor>", 93550), 93550 };
		{ INDENT..WHIT.."12) "..LC("Lady Alistra <Death Knight Trainer>", 93509), 93509 };
		{ INDENT..WHIT.."13) "..I_PROFF..L["Soul Forge"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Grand Master Siegesmith Corvus", 97072), 10011 };
		{ INDENT..INDENT..WHIT..LC("Grand Master Siegesmith Corvus", 97072), 97072 };
		{ INDENT..WHIT.."14) "..I_WORKORDER..LC("Korgaz Deadaxe <Ebon Soldier Recruiter>", 106436), 106436 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."15) "..LC("Salanar the Horseman", 111480), 111480 };
		{ INDENT..WHIT.."16) "..I_WORKORDER..LC("Dead Collector Bane <Champion Armaments>", 110410), 110410 };
		{ INDENT..INDENT..GREY..L["Champion Armaments"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_DemonHunter = {
		ZoneName = { CL["DEMONHUNTER"]..Atlas_GetClassName("DEMONHUNTER")..ALC["Hyphen"]..BZ["The Fel Hammer"] };
		Location = { BZ["The Fel Hammer"]..ALC["Comma"]..BZ["Mardum, the Shattered Abyss"] };
		WorldMapID = "1052";
		{ ORNG..ALC["Upper"] };
		{ INDENT..PURP.." A) "..L["Illidari Gateway"], 10101 };
		{ INDENT..INDENT..GREY..L["Travel to Dalaran"] };
		{ INDENT..BLUE.." A) "..L["Ramp to lower floor"], 10102 };
		{ INDENT..WHIT.." 1) "..LC("Kayn Sunfury <Illidari>", 95240).."\n"..WHIT..LC("Kor'vas Bloodthorn <Illidari>", 103761), 10001 };
		{ INDENT..INDENT..WHIT..LC("Kor'vas Bloodthorn <Illidari>", 103761), 103761 };
		{ INDENT..WHIT.." 2) "..I_WORKORDER..LC("Battlelord Gaardoun <Ashtongue Captain>", 103025), 103025 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.." 3) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"], 10003 };
		{ INDENT..WHIT.." 4) "..LC("Lady S'theno <Coilskar Captain>", 98624), 98624 };
		{ INDENT..WHIT.." 5) "..LC("Belath Dawnblade <Illidari>", 108782), 108782 };
		{ INDENT..WHIT.." 6) "..LC("Matron Mother Malevolence <Shivarra Captain>", 98632), 98632 };
		{ INDENT..WHIT.." 7) "..I_REPAIR..LC("Falara Nightsong <Illidari Provisioner>", 112407), 112407 };
		{ INDENT..WHIT.." 8) "..I_WORKORDER..LC("Slitesh <Armaments Requisitioner>", 110433), 110433 };
		{ INDENT..INDENT..GREY..L["Champion Armaments"] };
		{ INDENT..WHIT.." 9) "..LC("Asha Ravensong <Illidari>", 108326), 108326 };
		{ INDENT..WHIT.."10) "..I_WORKORDER..LC("Ariana Fireheart <Illidari>", 103760), 103760 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."11) "..LC("Izal Whitemoon <Illidari Trainer>", 109965), 109965 };
		{ INDENT..WHIT.."12) "..L["Training Dummies"], 10012 };
		{ INDENT..WHIT.."13) "..I_WORKORDER..LC("Tormented Shivarra <Shivarra Recruiter>", 120140), 120140 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT..ALC["Hyphen"]..L["Requires Blades of Death order advancement"] };
		{ INDENT..WHIT.."14) "..I_WORKORDER..LC("Evelune Soulreaver <Wrath of the Order>", 111775), 111775 };
		{ INDENT..INDENT..GREY..L["Empowered Rift Core"]..ALC["Hyphen"]..L["Requires Fel Hammer's Wrath order advancement"] };
		{ ORNG..ALC["Lower"] };
		{ INDENT..BLUE.." B) "..L["Ramp to top floor"], 10103 };
		{ INDENT..WHIT.."15) "..LC("Jace Darkweaver <Illidari>", 98646), 98646 };
		{ INDENT..WHIT.."16) "..I_RESEARCH..LC("Vahu the Weathered <Illidari Researcher>", 111736), 111736 };
		{ INDENT..WHIT.."17) "..I_CLASS..LC("Loramus Thalipedes <Class Hall Upgrades>", 110599), 110599 };
		{ INDENT..INDENT..GREY..ORDER_HALL_TALENT_TITLE };
		{ INDENT..WHIT.."18) "..L["Empowered Nether Crucible"], 10016 };
		{ INDENT..WHIT.."19) "..I_PROFF..L["Cursed Forge of the Nathrezim"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10017 };
		{ INDENT..WHIT.."20) "..LC("Seer Akalu <Nathrezim Scholar>", 109596), 109596 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Druid = {
		ZoneName = { CL["DRUID"]..Atlas_GetClassName("DRUID")..ALC["Hyphen"]..BZ["The Dreamgrove"] };
		Location = { BZ["The Dreamgrove"]..ALC["Comma"]..BZ["Val'sharah"] };
		WorldMapID = "1077";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Emerald Dreamway"]), 10101 };
		{ PURP.." B) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10102 };
		{ BLUE.." A) "..BZ["Tel'Andu Barrow Den"], 10103 };
		{ WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ WHIT.." 2) "..I_REPAIR..LC("Amurra Thistledew <Proprietor>", 112323), 112323 };
		{ WHIT.." 3) "..I_WORKORDER..LC("Sister Lilith <Recruiter>", 108393), 108393 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_CLASS..LC("Leafbeard the Storied <Ancient of Lore>", 97989), 97989 };
		{ INDENT..GREY..ORDER_HALL_TALENT_TITLE };
		{ WHIT.." 5) "..I_RESEARCH..LC("Celadine the Fatekeeper <Dreamgrove Researcher>", 111737), 111737 };
		{ WHIT.." 6) "..I_WORKORDER..LC("Yaris Darkclaw <Recruiter>", 106442), 106442 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 7) "..I_PROFF..L["Seed of Ages"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Tender Daranelle", 109612), 10007 };
		{ INDENT..WHIT..LC("Tender Daranelle", 109612) };
		{ WHIT.." 8) "..LC("Rensar Greathoof <Archdruid of the Grove>", 101195), 101195 };
		{ WHIT.." 9) "..LC("Keeper Remulos", 103832), 103832 };
		{ WHIT.."10) "..LC("Lyessa Bloomwatcher <Guardian of G'Hanir>", 104577), 104577 };
		{ WHIT.."11) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Skylord Omnuron <Mission Specialist>", 98002).."\n"..WHIT..LC("Mylune", 113525), 10011 };
		{ INDENT..WHIT..LC("Skylord Omnuron <Mission Specialist>", 98002) };
		{ INDENT..WHIT..LC("Mylune", 113525) };
		{ WHIT.."12) "..LC("Zen'kiki", 98784), 98784 };
		{ WHIT.."13) "..L["Training Dummies"], 10013 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Hunter = {
		ZoneName = { CL["HUNTER"]..Atlas_GetClassName("HUNTER")..ALC["Hyphen"]..BZ["Trueshot Lodge"] };
		Location = { BZ["Trueshot Lodge"]..ALC["Comma"]..BZ["Highmountain"] };
		WorldMapID = "1072";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10101 };
		{ WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ WHIT.." 2) "..I_FLIGHT..LC("Great Eagle", 108552), 108552 };
		{ WHIT.." 3) "..LC("Emmarel Shadewarden <Unseen Path>", 107317), 107317 };
		{ WHIT.." 4) "..I_PROFF..L["Altar of the Eternal Hunt"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Altar Keeper Biehn", 102940), 10004 };
		{ INDENT..WHIT..LC("Altar Keeper Biehn", 102940) };
		{ WHIT.." 5) "..I_REPAIR..LC("Outfitter Reynolds <Unseen Path>", 103693), 103693 };
		{ WHIT.." 6) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Tactician Tinderfell <Unseen Path>", 103023), 10006 };
		{ INDENT..WHIT..LC("Tactician Tinderfell <Unseen Path>", 103023), 103023 };
		{ WHIT.." 7) "..LC("Image of Mimiron", 110424), 110424 };
		{ WHIT.." 8) "..I_RESEARCH..LC("Holt Thunderhorn <Lore and Legends>", 98737), 98737 };
		{ INDENT..GREY..L["Tales of the Hunt"] };
		{ INDENT..WHIT..LC("Loren Stormhoof <Skyhorn Emissary>", 107315), 107315 };
		{ WHIT.." 9) "..L["Training Dummies"], 10009 };
		{ WHIT.."10) "..I_WORKORDER..LC("Lenara <Recruiter>", 106444), 106444 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."11) "..I_CLASS..LC("Survivalist Bahn <Class Hall Upgrades>", 108050), 108050 };
		{ WHIT.."12) "..I_WORKORDER..LC("Sampson <Recruiter>", 106446).."\n"..WHIT..LC("Pan the Kind Hand <Stable Master>", 100661), 106446 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT..LC("Pan the Kind Hand <Stable Master>", 100661) };
		{ WHIT.."13) "..LC("Ogdrul <The Seeker>", 113688), 113688 };
		{ WHIT.."14) "..I_WORKORDER..LC("Berger the Steadfast <Champion Armaments>", 110412), 110412 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Mage = {
		ZoneName = { CL["MAGE"]..Atlas_GetClassName("MAGE")..ALC["Hyphen"]..BZ["Hall of the Guardian"] };
		Location = { BZ["Hall of the Guardian"]..ALC["Comma"]..BZ["Dalaran"] };
		WorldMapID = "1068";
		{ BLUE.." A-B) "..ALC["Connection"], 10200 };
		{ ORNG..BZ["Guardian's Library"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"] };
		{ INDENT..WHIT.." 1) "..I_PROFF..L["Forge of the Guardian"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10001 };
		{ INDENT..WHIT.." 2) "..I_RESEARCH..LC("Edirah <Tirisgarde Researcher>", 110624), 110624 };
		{ INDENT..WHIT.." 3) "..LC("Magister Varenthas <High Forgeguard>", 109642), 109642 };
		{ INDENT..WHIT.." 4) "..LC("Meryl Felstorm", 102700).."\n"..LC("Archmage Kalec <Kirin Tor>", 108247).."\n"..LC("Archmage Modera <Kirin Tor>", 108248), 102700 };
		{ INDENT..INDENT..WHIT..LC("Archmage Kalec <Kirin Tor>", 108247), 108247 };
		{ INDENT..INDENT..WHIT..LC("Archmage Modera <Kirin Tor>", 108248), 108248 };
		{ INDENT..WHIT.." 5) "..LC("Old Fillmaff <Tirisgarde Librarian>", 107452), 107452 };
		{ INDENT..WHIT.." 6) "..I_REPAIR..LC("Jackson Watkins <Tirisgarde Quartermaster>", 112440), 112440 };
		{ INDENT..WHIT.." 7) "..LC("Esara Verrinde <Magisters>", 108380), 108380 };
		{ INDENT..WHIT.." 8) "..LC("Ravandwyr <Senior Kirin Tor Apprentice>", 108377), 108377 };
		{ ORNG..BZ["Hall of the Guardian"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
		{ INDENT..PURP..ALC["Portal"] };
		{ INDENT..INDENT..PURP.." A) "..BZ["Dalaran"], 10101 };
		{ INDENT..INDENT..PURP.." B) "..BZ["Ley-Ruins of Zarkhenar"]..ALC["Comma"]..BZ["Azsuna"], 10102 };
		{ INDENT..INDENT..PURP.." C) "..BZ["Sylvan Falls"]..ALC["Comma"]..BZ["Highmountain"], 10103 };
		{ INDENT..INDENT..PURP.." D) "..BZ["Weeping Bluffs"]..ALC["Comma"]..BZ["Stormheim"], 10104 };
		{ INDENT..INDENT..PURP.." E) "..BZ["Temple of Elune"]..ALC["Comma"]..BZ["Val'sharah"], 10105 };
		{ INDENT..INDENT..PURP.." F) "..BZ["Meredil"]..ALC["Comma"]..BZ["Suramar"], 10106 };
		{ INDENT..WHIT.." 9) "..I_CLASS..LC("Chronicler Elrianne <Class Hall Upgrades>", 108331), 108331 };
		{ INDENT..WHIT.."10) "..I_WORKORDER..LC("Archmage Omniara <Recruiter>", 106377), 106377 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."11) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("The Great Akazamzarak", 103092), 10011 };
		{ INDENT..INDENT..WHIT..LC("The Great Akazamzarak", 103092), 103092 };
		{ INDENT..WHIT.."12) "..LC("Archmage Melis <Mistress of Flame>", 108515), 108515 };
		{ INDENT..WHIT.."13) "..L["Training Dummies"], 10013 };
		{ INDENT..WHIT.."14) "..I_WORKORDER..LC("Grand Conjurer Mimic <Mage Recruiter Extraordinaire>", 106433), 106433 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."15) "..I_WORKORDER..LC("Minuette <Armament Summoner>", 110427), 110427 };
		{ INDENT..INDENT..GREY..L["Champion Armaments"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Monk = {
		ZoneName = { CL["MONK"]..Atlas_GetClassName("MONK")..ALC["Hyphen"]..BZ["Temple of Five Dawns"] };
		Location = { BZ["Temple of Five Dawns"]..ALC["Comma"]..BZ["The Wandering Isle"] };
		WorldMapID = "1044";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10101 };
		{ PURP.." B) "..format(ALC["Portal to %s"], BZ["Peak of Serenity"]), 10102 };
		{ PURP.." C) "..L["Transportation Mandala"], 10103 };
		{ INDENT..GREY..ALC["L-Parenthesis"]..BZ["Terrace of Clear Thought"]..ALC["Slash"]..BZ["Hall of the Twin Brothers"]..ALC["R-Parenthesis"] };
		{ WHIT.." 1) "..I_REPAIR..LC("Caydori Brightstar <Purveyor of Rare Goods>", 112338), 112338 };
		{ WHIT.." 2) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Master Hsu <Mission Master>", 99179).."\n"..WHIT..I_CLASS..LC("Number Nine Jia <Class Hall Upgrades>", 98939), 10002 };
		{ INDENT..WHIT..LC("Master Hsu <Mission Master>", 99179), 99179 };
		{ INDENT..WHIT..I_CLASS..LC("Number Nine Jia <Class Hall Upgrades>", 98939), 98939 };
		{ WHIT.." 3) "..I_WORKORDER..LC("Tianji <Ox Troop Trainer>", 105015), 105015 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..LC("High Elder Cloudfall", 104744), 104744 };
		{ WHIT.." 5) "..I_WORKORDER..LC("Gin Lai <Tiger Troop Trainer>", 105019), 105019 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 6) "..LC("Elder Xang <Monk Trainer>", 101749), 101749 };
		{ WHIT.." 7) "..L["Training Dummies"], 10007 };
		{ WHIT.." 8) "..I_PROFF..L["Forge of the Roaring Mountain"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Iron-Body Ponshu <Senior Master Ox>", 100438) , 10008 };
		{ INDENT..WHIT..LC("Iron-Body Ponshu <Senior Master Ox>", 100438), 100438 };
		{ INDENT..WHIT..LC("Lao Li the Quiet <Monk Trainer>", 101757)..GREY..ALC["L-Parenthesis"]..BZ["Terrace of Clear Thought"]..ALC["R-Parenthesis"] };
		{ INDENT..WHIT..LC("Wise Scholar Lianji <Senior Master Serpent>", 97776)..GREY..ALC["L-Parenthesis"]..BZ["Hall of the Twin Brothers"]..ALC["R-Parenthesis"] };
		{ WHIT.." 9) "..I_RESEARCH..LC("Lorewalker Cho <Head Archivist>", 106942), 106942 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Paladin = {
		ZoneName = { CL["PALADIN"]..Atlas_GetClassName("PALADIN")..ALC["Hyphen"]..BZ["Sanctum of Light"] };
		Location = { BZ["Sanctum of Light"]..ALC["Comma"]..BZ["Light's Hope Chapel"] };
		--WorldMapID = "23";
		{ BLUE.." A) "..L["Entrance"], 10101 };
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10102 };
		{ WHIT.." 1) "..I_RESEARCH..LC("Sister Elda <Keeper of the Ancient Tomes>", 91190), 91190 };
		{ WHIT.." 2) "..I_CLASS..LC("Sir Alamande Graythorn <Class Hall Upgrades>", 109901), 109901 };
		{ WHIT.." 3) "..I_REPAIR..LC("Eadric the Pure <Quartermaster>", 100196), 100196 };
		{ WHIT.." 4) "..LC("Lord Irulon Trueblade", 99947), 99947 };
		{ WHIT.." 5) "..LC("Lord Maxwell Tyrosus", 90259), 90259 };
		{ WHIT.." 6) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Lord Grayson Shadowbreaker <Mission Specialist>", 90250), 10006 };
		{ INDENT..WHIT..LC("Lord Grayson Shadowbreaker <Mission Specialist>", 90250), 90250 };
		{ WHIT.." 7) "..I_WORKORDER..LC("Commander Ansela <Silver Hand Recruiter>", 106447), 106447 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 8) "..LC("Katherine the Pure <Paladin Trainer>", 92313), 92313 };
		{ INDENT..WHIT..L["Training Dummies"] };
		{ WHIT.." 9) "..I_WORKORDER..LC("Kristoff <Armaments Requisitioner>", 110434), 110434 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ WHIT.."10) "..LC("Vindicator Baatun <Paladin Trainer>", 92316), 92316 };
		{ INDENT..WHIT..LC("Brandur Ironhammer <Paladin Trainer>", 92314), 92314 };
		{ INDENT..WHIT..L["Training Dummies"] };
		{ WHIT.."11) "..I_WORKORDER..LC("Commander Born <Silver Hand Officer Recruiter>", 106448), 106448 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."12) "..LC("Valgar Highforge <Grand Smith of the Order>", 90261), 90261 };
		{ WHIT.."13) "..I_PROFF..L["Altar of Ancient Kings"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10013 };
		{ WHIT.."14) "..I_WORKORDER..LC("Terric the Illuminator", 111772).."\n"..GREY..ALC["L-Parenthesis"]..L["Silver Hand Orders"]..ALC["R-Parenthesis"], 111772 };
		{ INDENT..GREY..L["Silver Hand Orders"]..ALC["Hyphen"]..L["Requires Grand Crusade order advancement"] };
		{ WHIT.."15) "..I_WORKORDER..LC("Crusader Kern <Silver Hand Crusader Recruiter>", 120146), 120146 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT..ALC["Hyphen"]..L["Requires Silver Hand Crusaders order advancement"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Priest = {
		ZoneName = { CL["PRIEST"]..Atlas_GetClassName("PRIEST")..ALC["Hyphen"]..BZ["Netherlight Temple"] };
		Location = { BZ["Netherlight Temple"]..ALC["Comma"]..BZ["Dalaran"] };
		WorldMapID = "1040";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10101 };
		{ WHIT.." 1) "..I_PROFF..L["Altar of Light and Shadow"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Betild Deepanvil <Master Artificer>", 102709), 10001 };
		{ INDENT..WHIT..LC("Betild Deepanvil <Master Artificer>", 102709), 102709 };
		{ WHIT.." 2) "..I_RESEARCH..LC("Juvess the Duskwhisperer <Keeper of Scrolls>", 111738), 111738 };
		{ WHIT.." 3) "..I_WORKORDER..LC("Grand Anchorite Gesslar <Recruiter>", 106450), 106450 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_REPAIR..LC("Meridelle Lightspark <Logistics>", 112401), 112401 };
		{ WHIT.." 5) "..I_CMISSION..L["Command Map"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"], 10005 };
		{ WHIT.." 6) "..LC("Alonsus Faol <Bishop of Secrets>", 110564), 110564 };
		{ WHIT.." 7) "..LC("Moira Thaurissan <Queen of the Dark Iron>", 109776), 109776 };
		{ WHIT.." 8) "..LC("Prophet Velen", 110557), 110557 };
		{ WHIT.." 9) "..LC("Delas Moonfang <Priestess of the Moon>", 110571), 110571 };
		{ WHIT.."10) "..I_CLASS..LC("Archon Torias <Class Hall Upgrades>", 110725), 110725 };
		{ WHIT.."11) "..I_WORKORDER..LC("Vicar Eliza <Recruiter>", 106451), 106451 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."12) "..LC("Dark Cleric Cecille <Priest Trainer>", 112576), 112576 };
		{ WHIT.."13) "..L["Training Dummies"], 10013 };
		{ WHIT.."14) "..I_WORKORDER..LC("Lilith <Armament Supplier>", 110595), 110595 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Rogue = {
		ZoneName = { CL["ROGUE"]..Atlas_GetClassName("ROGUE")..ALC["Hyphen"]..BZ["The Hall of Shadows"] };
		Location = { BZ["The Hall of Shadows"]..ALC["Comma"]..BZ["Dalaran"] };
		WorldMapID = "1014";
		DungeonLevel = "4";
		{ BLUE.." A) "..ALC["Connection"]..ALC["Hyphen"]..BZ["Glorious Goods"], 10101 };
		{ BLUE.." B) "..ALC["Connection"]..ALC["Hyphen"]..BZ["One More Glass"], 10102 };
		{ BLUE.." C) "..ALC["Connection"]..ALC["Hyphen"]..BZ["Tanks for Everything"], 10103 };
		{ BLUE.." D) "..ALC["Connection"]..ALC["Hyphen"]..BZ["Tunnel of Woe"], 10104 };
		{ WHIT.." 1) "..LC("Madam Gosu <Black Market Liaison>", 103791), 103791 };
		{ WHIT.." 2) "..LC("Jenri <Spymaster>", 99863), 99863 };
		{ WHIT.." 3) "..LC("Lord Jorach Ravenholdt", 113362), 113362 };
		{ WHIT.." 4) "..LC("Valeera Sanguinar", 98102), 98102 };
		{ WHIT.." 5) "..LC("Garona Halforcen", 94141), 94141 };
		{ WHIT.." 6) "..I_RESEARCH..LC("Filius Sparkstache <Archivist>", 102641), 102641 };
		{ WHIT.." 7) "..I_CLASS..LC("Winstone Wolfe <The Wolf>", 105998), 105998 };
		{ INDENT..GREY..ORDER_HALL_TALENT_TITLE };
		{ WHIT.." 8) "..LC("Marin Noggenfogger <Baron of Gadgetzan>", 102594), 102594 };
		{ WHIT.." 9) "..I_PROFF..L["Crucible of the Uncrowned"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10009 };
		{ WHIT.."10) "..LC("Lorena Belle <Master Smuggler>", 109609), 109609 };
		{ WHIT.."11) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Nikki the Gossip <Tales fo Adventure and Profit>", 98092), 10011 };
		{ INDENT..WHIT..LC("Nikki the Gossip <Tales fo Adventure and Profit>", 98092), 98092 };
		{ WHIT.."12) "..I_WORKORDER..LC("Lonika Stillblade <Rogue Academy Proprietor>", 105979), 105979 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT..LC("Night-Stalker Ku'nanji <Rogue Trainer>", 105991), 105991 };
		{ WHIT.."13) "..LC("Loren the Fence <Rogue Trainer>", 105989), 105989 };
		{ WHIT.."14) "..L["Training Dummies"], 10014 };
		{ WHIT.."15) "..I_REPAIR..LC("Kelsey Steelspark <Quartermaster>", 105986), 105986 };
		{ WHIT.."16) "..I_WORKORDER..LC("Yancey Grillsen <Bloodsail Recruiter>", 106083), 106083 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."17) "..I_WORKORDER..LC("Mal <Weapons Smuggler>", 110348), 110348 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Shaman = {
		ZoneName = { CL["SHAMAN"]..Atlas_GetClassName("SHAMAN")..ALC["Hyphen"]..BZ["The Heart of Azeroth"] };
		Location = { BZ["The Heart of Azeroth"]..ALC["Comma"]..BZ["The Maelstrom"] };
		WorldMapID = "1057";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]).."\n"..WHIT..L["Farseer Nobundo <The Earthen Ring>"], 10101 };
		{ INDENT..WHIT..LC("Farseer Nobundo <The Earthen Ring>", 96528), 96528 };
		{ PURP.." B) "..L["Vortex Pinnacle Portal"], 10102 };
		{ WHIT.." 1) "..L["Training Dummies"], 10001 };
		{ WHIT.." 2) "..LC("Aggra <Shaman Trainer>", 99531), 99531 };
		{ WHIT.." 3) "..L["Maelstrom Pillar"].."\n"..WHIT..LC("Elementalist Janai <Earthen Ring>", 109464), 10003 };  
		{ INDENT..WHIT..LC("Elementalist Janai <Earthen Ring>", 109464), 109464 };
		{ WHIT.." 4) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Advisor Sevel <The Earthen Ring>", 96746), 10004 };
		{ INDENT..WHIT..LC("Advisor Sevel <The Earthen Ring>", 96746), 96746 };
		{ WHIT.." 5) "..I_CLASS..LC("Journeyman Goldmine <Class Hall Upgrades>", 112199), 112199 };
		{ WHIT.." 6) "..I_REPAIR..LC("Flamesmith Lanying <Earthen Ring Quartermaster>", 112318), 112318 };
		{ WHIT.." 7) "..I_WORKORDER..LC("Summoner Morn <Elemental Summoner>", 106457), 106457 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 8) "..LC("Puzzlemaster Lo <The Earthen Ring>", 103004), 103004 };
		{ WHIT.." 9) "..I_RESEARCH..LC("Gorma Windspeaker <Keeper of Legends>", 111739), 111739 };
		{ WHIT.."10) "..I_PROFF..L["Ancient Elemental Altar"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10010 };
		{ WHIT.."11) "..LC("Gavan Grayfeather <Ears of the Maelstrom>", 112262), 112262 };
		{ WHIT.."12) "..I_WORKORDER..LC("Felinda Frye <Earthwarden Recruiter>", 112208), 112208 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
-- 		{ WHIT.."13) "..LC("Mackay Firebeard <The Earthen Ring>", 96758), 96758 }; -- We don't have enough room for this NPC, besides he seems to be less important
		{ WHIT.."13) "..LC("Orono <The Earthen Ring>", 96745), 96745 };
		{ WHIT.."14) "..LC("Bath'rah the Windwatcher <The Earthen Ring>", 96747), 96747 };
		{ WHIT.."15) "..LC("Tribemother Torra <Shaman Trainer>", 111922), 111922 };
		{ WHIT.."16) "..LC("Morgl the Oracle <The Earthen Ring>", 112438), 112438 };
		{ WHIT.."17) "..LC("Neptulon", 106291), 106291 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Warlock = {
		ZoneName = { CL["WARLOCK"]..Atlas_GetClassName("WARLOCK")..ALC["Hyphen"]..BZ["Dreadscar Rift"] };
		Location = { BZ["Dreadscar Rift"] };
		WorldMapID = "1050";
		{ PURP.." A) "..format(ALC["Portal to %s"], BZ["Dalaran"]), 10101 };
		{ PURP.." B) "..L["Demonic Gateway"], 10102 };
		{ WHIT.." 1) "..I_PROFF..L["Felblood Altar"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10001 };
		{ WHIT.." 2) "..LC("Unjari Feltongue <The Heartbearer>", 109686), 109686 };
		{ WHIT.." 3) "..LC("Calydus", 101097), 101097 };
		{ WHIT.." 4) "..I_WORKORDER..LC("Murr", 110408).."\n"..WHIT..LC("Lurr <Dreadscar Blacksmith>", 101913), 10004 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ INDENT..WHIT..LC("Lurr <Dreadscar Blacksmith>", 101913), 101913 };
		{ WHIT.." 5) "..I_WORKORDER..LC("Jared <Recruiter>", 106217), 106217 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 6) "..I_CMISSION..L["Dreadscar Battle Plans"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Gakin the Darkbinder <Mission Strategist>", 106199).."\n"..WHIT..LC("Ritssyn Flamescowl <Council of the Black Harvest>", 104795), 10006 };
		{ INDENT..WHIT..LC("Gakin the Darkbinder <Mission Strategist>", 106199), 106199 };
		{ INDENT..WHIT..LC("Ritssyn Flamescowl <Council of the Black Harvest>", 104795), 104795 };
		{ WHIT.." 7) "..I_CLASS..LC("Archivist Melinda <Class Hall Upgrades>", 108018), 108018 };
		{ WHIT.." 8) "..I_RESEARCH..LC("Mile Raitheborne <Head Archivist>", 111740), 111740 };
		{ WHIT.." 9) "..I_REPAIR..LC("Gigi Gigavoid <Black Harvest Quartermaster>", 112434), 112434 };
		{ WHIT.."10) "..I_WORKORDER..LC("Imp Mother Dyala <Recruiter>", 106216), 106216 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."11) "..L["Training Dummies"], 10011 };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
	CH_Warrior = {
		ZoneName = { CL["WARRIOR"]..Atlas_GetClassName("WARRIOR")..ALC["Hyphen"]..BZ["Skyhold"] };
		Location = { BZ["Skyhold"]..ALC["Comma"]..BZ["Halls of Valor"]..ALC["Comma"]..BZ["Stormheim"] };
		WorldMapID = "1035";
		{ PURP.." A) "..LC("Aerylia <Stormflight Master>", 96679), 96679 };
		{ INDENT..GREY..L["Travel to:"] };
		{ INDENT..INDENT..GREY..BZ["Dalaran"] };
		{ INDENT..INDENT..GREY..BZ["Azurewing Repose"]..ALC["Comma"]..BZ["Azsuna"] };
		{ INDENT..INDENT..GREY..BZ["Lorlathil"]..ALC["Comma"]..BZ["Val'sharah"] };
		{ INDENT..INDENT..GREY..BZ["Thunder Totem"]..ALC["Comma"]..BZ["Highmountain"] };
		{ INDENT..INDENT..GREY..BZ["Valdisdall"]..ALC["Comma"]..BZ["Stormheim"] };
		{ INDENT..INDENT..GREY..BZ["Meredil"]..ALC["Comma"]..BZ["Suramar"] };
		{ INDENT..INDENT..GREY..BZ["Deliverance Point"]..ALC["Comma"]..BZ["Broken Shore"] };
		{ WHIT.." 1) "..I_CMISSION..L["Eye of Odyn"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..LC("Skyseer Ghrent", 100635), 10001 };
		{ INDENT..WHIT..LC("Skyseer Ghrent", 100635), 100635 };
		{ WHIT.." 2) "..I_WORKORDER..LC("Captain Hjalmar Stahlstrom <Recruiter>", 106459), 106459 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 3) "..I_WORKORDER..LC("Savyn Valorborn <Recruiter>", 106460), 106460 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_REPAIR..LC("Quartermaster Durnolf", 112392), 112392 };
		{ WHIT.." 5) "..I_WORKORDER..LC("Haklang Ulfsson <Armaments Requisitioner>", 110437), 110437 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ WHIT.." 6) "..I_RESEARCH..LC("Fjornson Stonecarver <Keeper of Legends>", 111741), 111741 };
		{ WHIT.." 7) "..I_CLASS..LC("Einar the Runecaster <Class Hall Upgrades>", 107994), 107994 };
		{ WHIT.." 8) "..I_PROFF..L["Forge of Odyn"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..LC("Master Smith Helgar", 96586), 10008 };
		{ INDENT..WHIT..LC("Master Smith Helgar", 96586), 96586 };
		{ WHIT.." 9) "..LC("Weaponmaster Asvard <Warrior Trainer>", 112577), 112577 };
		{ WHIT.."10) "..BZ["Arena of Glory"], 10010 };
		{ WHIT.."11) "..L["Training Dummies"], 10011 };
		{ WHIT.."12) "..LC("Hymdall", 107987), 107987 };
		{ WHIT.."13) "..LC("Odyn", 96469), 96469 };
		{ WHIT.."14) "..I_WORKORDER..LC("Matilda Skoptidottir", 111774), 111774 };
		{ INDENT..GREY..L["Horn of War"]..ALC["Hyphen"]..L["Requires Val'kyr Call order advancement"] };
		{ WHIT.."15) "..I_WORKORDER..((faction == "Alliance") and LC("Matthew Glensorrow <Recruiter>", 120077) or LC("Sharak Tor <Recruiter>", 106461)), 10015 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT..ALC["Hyphen"]..L["Requires Strike Hard order advancement"] };
		{ "" };
		{ LBLU..ACHIEVEMENTS..ALC["Colon"] };
		{ LBLU..L["Class Hall"] };
		{ "A Classy Outfit", "ac=11298" };
		{ "A Glorious Campaign", "ac=10994" };
		{ "A Heroic Campaign", "ac=11135" };
		{ "An Epic Campaign", "ac=11136" };
		{ "Legendary Research", "ac=11223" };
		{ LBLU..ITEM_QUALITY6_DESC };
		{ "Arsenal of Power", "ac=11171" };
		{ "Artifact or Artifiction", "ac=10852" };
		{ "Fighting with Style: Classic", "ac=10461" };
		{ "Fighting with Style: Upgraded", "ac=10747" };
		{ "Fighting with Style: Valorous", "ac=10748" };
		{ "Fighting with Style: War-torn", "ac=10749" };
		{ "Fighting with Style: War-torn", "ac=11173" };
		{ "Forged for Battle", "ac=10746" };
		{ "Honoring the Past", "ac=11143" };
		{ "Improving on History", "ac=10459" };
		{ "Part of History", "ac=10853" };
		{ "Power Realized", "ac=11144" };
		{ "The Prestige", "ac=10745" }; -- Horde
		{ "The Prestige", "ac=10743" }; -- Alliance
		{ LBLU..ORDER_HALL_MISSIONS };
		{ "Champions of Power", "ac=11222" };
		{ "Champions Rise", "ac=11221" };
		{ "Lead a Legion", "ac=11213" };
		{ "Many Many Missions, Handle It!", "ac=11217" };
		{ "Many Missions", "ac=11214" };
		{ "Need Backup", "ac=11219" };
		{ "Quite a Few Missions", "ac=11215" };
		{ "Raise an Army", "ac=11212" };
		{ "Roster of Champions", "ac=11220" };
		{ "So Many Missions", "ac=11216" };
		{ "There's a Boss In There", "ac=11218" };
		{ "Training the Troops", "ac=10706" };
		{ "" };
	};
};

Atlas_RegisterPlugin("Atlas_ClassOrderHalls", myCategory, myData);
