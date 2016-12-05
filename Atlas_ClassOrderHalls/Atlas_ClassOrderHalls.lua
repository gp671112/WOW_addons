-- $Id: Atlas_ClassOrderHalls.lua 62 2016-11-29 05:21:07Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
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
local L = LibStub("AceLocale-3.0"):GetLocale("Atlas_ClassOrderHalls");
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas");

local BLUE = "|cff6666ff";
local GREN = "|cff66cc33";
local _RED = "|cffcc3333";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local WHIT = "|cffffffff";
local CYAN = "|cff00ffff";
local GREY = "|cff999999";
local ALAN = "|cff7babe0"; -- Alliance's taxi node
local HRDE = "|cffda6955"; -- Horde's taxi node
local NUTL = "|cfffee570"; -- Nutral taxi node
local INDENT = "      ";

-- Icons
local I_REPAIR = "\124TInterface\\MINIMAP\\TRACKING\\Repair:0:0\124t";
local I_CLASS = "\124TInterface\\MINIMAP\\TRACKING\\Class:0:0\124t";
local I_PROFF = "\124TInterface\\MINIMAP\\TRACKING\\Profession:0:0\124t";
local I_FLIGHT = "\124TInterface\\MINIMAP\\TRACKING\\FlightMaster:0:0\124t";
local I_WORKORDER = "\124TInterface\\GossipFrame\\WorkOrderGossipIcon:0:0\124t";
local I_CMISSION = "\124TInterface\\GossipFrame\\AvailableLegendaryQuestIcon:0:0\124t";

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

local myCategory = L["Class Order Hall Maps"];

local myData = {
	CH_DeathKnight = {
		ZoneName = { CL["DEATHKNIGHT"]..Atlas_GetClassName("DEATHKNIGHT")..ALC["Hyphen"]..BZ["Acherus: The Ebon Hold"] };
		Location = { BZ["Acherus: The Ebon Hold"]..ALC["Comma"]..BZ["Broken Shore"] };
		WorldMapID = "1021";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ PURP.." B) "..L["Portal to another floor"], 10102 };
		{ WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ WHIT.." 2) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Siouxsie the Banshee <Mission Specialist>"], 10002 };
		{ INDENT..WHIT..L["Siouxsie the Banshee <Mission Specialist>"] };
		{ INDENT..WHIT..L["Highlord Darion Mograine"] };
		{ WHIT.." 3) "..L["Illanna Dreadmoore <Ebon Blade Archivist>"], 10003 };
		{ WHIT.." 4) "..L["Lord Thorval"], 10004 };
		{ WHIT.." 5) "..L["Training Dummies"], 10005 };
		{ WHIT.." 6) "..L["Quartermaster Ozorg <Rare Goods Vendor>"], 10006 };
		{ WHIT.." 7) "..I_PROFF..L["Soul Forge"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Grand Master Siegesmith Corvus"], 10007 };
		{ INDENT..WHIT..L["Grand Master Siegesmith Corvus"] };
		{ WHIT.." 8) "..L["Lady Alistra <Death Knight Trainer>"], 10008 };
	};
	CH_DemonHunter = {
		ZoneName = { CL["DEMONHUNTER"]..Atlas_GetClassName("DEMONHUNTER")..ALC["Hyphen"]..BZ["The Fel Hammer"] };
		Location = { BZ["The Fel Hammer"]..ALC["Comma"]..BZ["Mardum, the Shattered Abyss"] };
		WorldMapID = "1052";
		{ ORNG..ALC["Upper"] };
		{ INDENT..PURP.." A) "..L["Illidari Gateway"], 10101 };
		{ INDENT..INDENT..GREY..L["Travel to Dalaran"] };
		{ INDENT..BLUE.." A) "..L["Ramp to lower floor"], 10102 };
		{ INDENT..WHIT.." 1) "..L["Kayn Sunfury <Illidari>"], 10001 };
		{ INDENT..INDENT..WHIT..L["Kor'vas Bloodthorn <Illidari>"] };
		{ INDENT..WHIT.." 2) "..I_WORKORDER..L["Battlelord Gaardoun <Ashtongue Captain>"], 10002 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.." 3) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"], 10003 };
		{ INDENT..WHIT.." 4) "..L["Lady S'theno <Coilskar Captain>"], 10004 };
		{ INDENT..WHIT.." 5) "..L["Belath Dawnblade <Illidari>"], 10005 };
		{ INDENT..WHIT.." 6) "..L["Matron Mother Malevolence <Shivarra Captain>"], 10006 };
		{ INDENT..WHIT.." 7) "..I_REPAIR..L["Falara Nightsong <Illidari Provisioner>"], 10007 };
		{ INDENT..WHIT.." 8) "..I_WORKORDER..L["Slitesh <Armaments Requisitioner>"], 10008 };
		{ INDENT..INDENT..GREY..L["Champion Armaments"] };
		{ INDENT..WHIT.." 9) "..L["Asha Ravensong <Illidari>"], 10009 };
		{ INDENT..WHIT.."10) "..I_WORKORDER..L["Ariana Fireheart <Illidari>"], 10010 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."11) "..L["Izal Whitemoon <Illidari Trainer>"], 10011 };
		{ INDENT..WHIT.."12) "..L["Training Dummies"], 10012 };
		{ ORNG..ALC["Lower"] };
		{ INDENT..BLUE.." B) "..L["Ramp to top floor"], 10103 };
		{ INDENT..WHIT.."13) "..L["Jace Darkweaver <Illidari>"], 10013 };
		{ INDENT..WHIT.."14) "..I_WORKORDER..L["Vahu the Weathered <Illidari Researcher>"], 10014 };
		{ INDENT..WHIT.."15) "..I_CLASS..L["Loramus Thalipedes <Class Hall Upgrades>"], 10015 };
		{ INDENT..WHIT.."16) "..L["Empowered Nether Crucible"], 10016 };
		{ INDENT..WHIT.."17) "..I_PROFF..L["Cursed Forge of the Nathrezim"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10017 };
		{ INDENT..WHIT.."18) "..L["Seer Akalu <Nathrezim Scholar>"], 10018 };
	};
	CH_Druid = {
		ZoneName = { CL["DRUID"]..Atlas_GetClassName("DRUID")..ALC["Hyphen"]..BZ["The Dreamgrove"] };
		Location = { BZ["The Dreamgrove"]..ALC["Comma"]..BZ["Val'sharah"] };
		WorldMapID = "1077";
		{ PURP.." A) "..L["Portal to Emerald Dreamway"], 10101 };
		{ PURP.." B) "..L["Portal to Dalaran"], 10102 };
		{ BLUE.." A) "..BZ["Tel'Andu Barrow Den"], 10103 };
		{ WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ WHIT.." 2) "..I_REPAIR..L["Amurra Thistledew <Proprietor>"], 10002 };
		{ WHIT.." 3) "..I_WORKORDER..L["Sister Lilith <Recruiter>"], 10003 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_CLASS..L["Leafbeard the Storied <Ancient of Lore>"], 10004 };
		{ INDENT..GREY..GARRISON_TALENT_ORDER_ADVANCEMENT };
		{ WHIT.." 5) "..L["Celadine the Fatekeeper <Dreamgrove Researcher>"], 10005 };
		{ WHIT.." 6) "..I_WORKORDER..L["Yaris Darkclaw <Recruiter>"], 10006 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 7) "..I_PROFF..L["Seed of Ages"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Tender Daranelle"], 10007 };
		{ INDENT..WHIT..L["Tender Daranelle"] };
		{ WHIT.." 8) "..L["Rensar Greathoof <Archdruid of the Grove>"], 10008 };
		{ WHIT.." 9) "..L["Keeper Remulos"], 10009 };
		{ WHIT.."10) "..L["Lyessa Bloomwatcher <Guardian of G'Hanir>"], 10010 };
		{ WHIT.."11) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Skylord Omnuron <Mission Specialist>"].."\n"..WHIT..L["Mylune"], 10011 };
		{ INDENT..WHIT..L["Skylord Omnuron <Mission Specialist>"] };
		{ INDENT..WHIT..L["Mylune"] };
		{ WHIT.."12) "..L["Zen'kiki"], 10012 };
		{ WHIT.."13) "..L["Training Dummies"], 10013 };
	};
	CH_Hunter = {
		ZoneName = { CL["HUNTER"]..Atlas_GetClassName("HUNTER")..ALC["Hyphen"]..BZ["Trueshot Lodge"] };
		Location = { BZ["Trueshot Lodge"]..ALC["Comma"]..BZ["Highmountain"] };
		WorldMapID = "1072";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ WHIT.." 1) "..I_FLIGHT..MINIMAP_TRACKING_FLIGHTMASTER, 10001 };
		{ WHIT.." 2) "..I_FLIGHT..L["Great Eagle"], 10002 };
		{ WHIT.." 3) "..L["Emmarel Shadewarden <Unseen Path>"], 10003 };
		{ WHIT.." 4) "..I_PROFF..L["Altar of the Eternal Hunt"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Altar Keeper Biehn"], 10004 };
		{ INDENT..WHIT..L["Altar Keeper Biehn"] };
		{ WHIT.." 5) "..I_REPAIR..L["Outfitter Reynolds <Unseen Path>"], 10005 };
		{ WHIT.." 6) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..L["Tactician Tinderfell <Unseen Path>"], 10006 };
		{ INDENT..WHIT..L["Tactician Tinderfell <Unseen Path>"] };
		{ WHIT.." 7) "..L["Image of Mimiron"], 10007 };
		{ WHIT.." 8) "..L["Holt Thunderhorn <Lore and Legends>"], 10008 };
		{ INDENT..GREY..L["Tales of the Hunt"] };
		{ INDENT..GREY..L["Loren Stormhoof <Skyhorn Emissary>"] };
		{ WHIT.." 9) "..L["Training Dummies"], 10009 };
		{ WHIT.."10) "..I_WORKORDER..L["Lenara <Recruiter>"], 10010 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."11) "..I_CLASS..L["Survivalist Bahn <Class Hall Upgrades>"], 10011 };
		{ WHIT.."12) "..I_WORKORDER..L["Sampson <Recruiter>"].."\n"..WHIT..L["Pan the Kind Hand <Stable Master>"], 10012 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT..L["Pan the Kind Hand <Stable Master>"] };
		{ WHIT.."13) "..L["Ogdrul <The Seeker>"], 10013 };
	};
	CH_Mage = {
		ZoneName = { CL["MAGE"]..Atlas_GetClassName("MAGE")..ALC["Hyphen"]..BZ["Hall of the Guardian"] };
		Location = { BZ["Hall of the Guardian"]..ALC["Comma"]..BZ["Dalaran"] };
		WorldMapID = "1068";
		{ BLUE.." A-B) "..ALC["Connection"], 10200 };
		{ ORNG..BZ["Guardian's Library"]..ALC["L-Parenthesis"]..ALC["Upper"]..ALC["R-Parenthesis"] };
		{ INDENT..WHIT.." 1) "..I_PROFF..L["Forge of the Guardian"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10001 };
		{ INDENT..WHIT.." 2) "..I_WORKORDER..L["Edirah <Tirisgarde Researcher>"], 10002 };
		{ INDENT..WHIT.." 3) "..L["Magister Varenthas <High Forgeguard>"], 10003 };
		{ INDENT..WHIT.." 4) "..L["Meryl Felstorm"], 10004 };
		{ INDENT..INDENT..WHIT..L["Archmage Kalec <Kirin Tor>"] };
		{ INDENT..INDENT..WHIT..L["Archmage Modera <Kirin Tor>"] };
		{ INDENT..WHIT.." 5) "..L["Old Fillmaff <Tirisgarde Librarian>"], 10005 };
		{ INDENT..WHIT.." 6) "..I_REPAIR..L["Jackson Watkins <Tirisgarde Quartermaster>"], 10006 };
		{ INDENT..WHIT.." 7) "..L["Esara Verrinde <Magisters>"], 10007 };
		{ INDENT..WHIT.." 8) "..L["Ravandwyr <Senior Kirin Tor Apprentice>"], 10008 };
		{ ORNG..BZ["Hall of the Guardian"]..ALC["L-Parenthesis"]..ALC["Lower"]..ALC["R-Parenthesis"] };
		{ INDENT..PURP..ALC["Portal"] };
		{ INDENT..INDENT..PURP.." A) "..BZ["Dalaran"], 10101 };
		{ INDENT..INDENT..PURP.." B) "..BZ["Ley-Ruins of Zarkhenar"]..ALC["Comma"]..BZ["Azsuna"], 10102 };
		{ INDENT..INDENT..PURP.." C) "..BZ["Sylvan Falls"]..ALC["Comma"]..BZ["Highmountain"], 10103 };
		{ INDENT..INDENT..PURP.." D) "..BZ["Weeping Bluffs"]..ALC["Comma"]..BZ["Stormheim"], 10104 };
		{ INDENT..INDENT..PURP.." E) "..BZ["Temple of Elune"]..ALC["Comma"]..BZ["Val'sharah"], 10105 };
		{ INDENT..INDENT..PURP.." F) "..BZ["Meredil"]..ALC["Comma"]..BZ["Suramar"], 10106 };
		{ INDENT..WHIT.." 9) "..I_CLASS..L["Chronicler Elrianne <Class Hall Upgrades>"], 10009 };
		{ INDENT..WHIT.."10) "..I_WORKORDER..L["Archmage Omniara <Recruiter>"], 10010 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT.."11) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["The Great Akazamzarak"], 10011 };
		{ INDENT..INDENT..WHIT..L["The Great Akazamzarak"] };
		{ INDENT..WHIT.."12) "..L["Archmage Melis <Mistress of Flame>"], 10012 };
		{ INDENT..WHIT.."13) "..L["Training Dummies"], 10013 };
		{ INDENT..WHIT.."14) "..I_WORKORDER..L["Grand Conjurer Mimic <Mage Recruiter Extraordinaire>"], 10014 };
		{ INDENT..INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
	};
	CH_Monk = {
		ZoneName = { CL["MONK"]..Atlas_GetClassName("MONK")..ALC["Hyphen"]..BZ["Temple of Five Dawns"] };
		Location = { BZ["Temple of Five Dawns"]..ALC["Comma"]..BZ["The Wandering Isle"] };
		WorldMapID = "1044";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ PURP.." B) "..L["Portal to Peak of Serenity"], 10102 };
		{ PURP.." C) "..L["Transportation Mandala"], 10103 };
		{ WHIT.." 1) "..L["Caydori Brightstar <Purveyor of Rare Goods>"], 10001 };
		{ WHIT.." 2) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Master Hsu <Mission Master>"], 10002 };
		{ INDENT..WHIT..L["Master Hsu <Mission Master>"] };
		{ INDENT..WHIT..I_CLASS..L["Number Nine Jia <Class Hall Upgrades>"] };
		{ WHIT.." 3) "..L["Elder Xang <Monk Trainer>"], 10003 };
		{ WHIT.." 4) "..I_PROFF..L["Forge of the Roaring Mountain"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Iron-Body Ponshu <Senior Master Ox>"] , 10004 };
		{ INDENT..WHIT..L["Iron-Body Ponshu <Senior Master Ox>"] };
		{ INDENT..WHIT..L["Lao Li the Quiet <Monk Trainer>"]..GREY..ALC["L-Parenthesis"]..BZ["Terrace of Clear Thought"]..ALC["R-Parenthesis"] };
		{ WHIT.." 5) "..L["Lorewalker Cho <Head Archivist>"], 10005 };
		{ WHIT.." 6) "..L["Training Dummies"], 10006 };
	};
	CH_Paladin = {
		ZoneName = { CL["PALADIN"]..Atlas_GetClassName("PALADIN")..ALC["Hyphen"]..BZ["Sanctum of Light"] };
		Location = { BZ["Sanctum of Light"]..ALC["Comma"]..BZ["Light's Hope Chapel"] };
		--WorldMapID = "23";
		{ BLUE.." A) "..L["Entrance"], 10101 };
		{ PURP.." A) "..L["Portal to Dalaran"], 10102 };
		{ WHIT.." 1) "..I_WORKORDER..L["Sister Elda <Keeper of the Ancient Tomes>"], 10001 };
		{ WHIT.." 2) "..I_REPAIR..L["Eadric the Pure <Quartermaster>"], 10002 };
		{ WHIT.." 3) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Lord Grayson Shadowbreaker <Mission Specialist>"], 10003 };
		{ INDENT..WHIT..L["Lord Grayson Shadowbreaker <Mission Specialist>"] };
		{ WHIT.." 4) "..L["Katherine the Pure <Paladin Trainer>"], 10004 };
		{ INDENT..WHIT..L["Training Dummies"] };
		{ WHIT.." 5) "..L["Vindicator Baatun <Paladin Trainer>"], 10005 };
		{ INDENT..WHIT..L["Brandur Ironhammer <Paladin Trainer>"] };
		{ INDENT..WHIT..L["Training Dummies"] };
		{ WHIT.." 6) "..I_PROFF..L["Altar of Ancient Kings"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10006 };
	};
	CH_Priest = {
		ZoneName = { CL["PRIEST"]..Atlas_GetClassName("PRIEST")..ALC["Hyphen"]..BZ["Netherlight Temple"] };
		Location = { BZ["Netherlight Temple"]..ALC["Comma"]..BZ["Dalaran"] };
		WorldMapID = "1040";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ WHIT.." 1) "..I_PROFF..L["Altar of Light and Shadow"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Betild Deepanvil <Master Artificer>"], 10001 };
		{ INDENT..WHIT..L["Betild Deepanvil <Master Artificer>"] };
		{ WHIT.." 2) "..I_WORKORDER..L["Juvess the Duskwhisperer <Keeper of Scrolls>"], 10002 };
		{ WHIT.." 3) "..I_WORKORDER..L["Grand Anchorite Gesslar <Recruiter>"], 10003 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_REPAIR..L["Meridelle Lightspark <Logistics>"], 10004 };
		{ WHIT.." 5) "..I_CMISSION..L["Command Map"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"], 10005 };
		{ WHIT.." 6) "..L["Alonsus Faol <Bishop of Secrets>"], 10006 };
		{ WHIT.." 7) "..L["Moira Thaurissan <Queen of the Dark Iron>"], 10007 };
		{ WHIT.." 8) "..L["Prophet Velen"], 10008 };
		{ WHIT.." 9) "..L["Delas Moonfang <Priestess of the Moon>"], 10009 };
		{ WHIT.."10) "..I_CLASS..L["Archon Torias <Class Hall Upgrades>"], 10010 };
		{ WHIT.."11) "..I_WORKORDER..L["Vicar Eliza <Recruiter>"], 10011 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."12) "..L["Dark Cleric Cecille <Priest Trainer>"], 10012 };
		{ WHIT.."13) "..L["Training Dummies"], 10013 };
		{ WHIT.."14) "..I_WORKORDER..L["Lilith <Armament Supplier>"], 10014 };
		{ INDENT..GREY..L["Champion Armaments"] };
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
		{ WHIT.." 1) "..L["Madam Gosu <Black Market Liaison>"], 10001 };
		{ WHIT.." 2) "..L["Lord Jorach Ravenholdt"], 10002 };
		{ WHIT.." 3) "..I_WORKORDER..L["Filius Sparkstache <Archivist>"], 10003 };
		{ WHIT.." 4) "..I_CLASS..L["Winstone Wolfe <The Wolf>"], 10004 };
		{ WHIT.." 5) "..L["Marin Noggenfogger <Baron of Gadgetzan>"], 10005 };
		{ WHIT.." 6) "..I_PROFF..L["Crucible of the Uncrowned"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10006 };
		{ WHIT.." 7) "..L["Lorena Belle <Master Smuggler>"], 10007 };
		{ WHIT.." 8) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Nikki the Gossip <Tales fo Adventure and Profit>"], 10008 };
		{ INDENT..WHIT..L["Nikki the Gossip <Tales fo Adventure and Profit>"] };
		{ WHIT.." 9) "..I_WORKORDER..L["Lonika Stillblade <Rogue Academy Proprietor>"], 10009 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ INDENT..WHIT..L["Night-Stalker Ku'nanji <Rogue Trainer>"] };
		{ WHIT.."10) "..L["Loren the Fence <Rogue Trainer>"], 10010 };
		{ WHIT.."11) "..L["Training Dummies"], 10011 };
		{ WHIT.."12) "..I_REPAIR..L["Kelsey Steelspark <Quartermaster>"], 10012 };
		{ WHIT.."13) "..I_WORKORDER..L["Yancey Grillsen <Bloodsail Recruiter>"], 10013 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
	};
	CH_Shaman = {
		ZoneName = { CL["SHAMAN"]..Atlas_GetClassName("SHAMAN")..ALC["Hyphen"]..BZ["The Heart of Azeroth"] };
		Location = { BZ["The Heart of Azeroth"]..ALC["Comma"]..BZ["The Maelstrom"] };
		WorldMapID = "1057";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ WHIT.." 1) "..L["Training Dummies"], 10001 };
		{ WHIT.." 2) "..L["Aggra <Shaman Trainer>"], 10002 };
		{ WHIT.." 3) "..I_PROFF..L["Maelstrom Pillar"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Elementalist Janai <Earthen Ring>"], 10003 };
		{ INDENT..WHIT..L["Elementalist Janai <Earthen Ring>"] };
		{ WHIT.." 4) "..L["Puzzlemaster Lo <The Earthen Ring>"], 10004 };
		{ WHIT.." 5) "..I_REPAIR..L["Flamesmith Lanying <Earthen Ring Quartermaster>"], 10005 };
		{ WHIT.." 6) "..I_CMISSION..ADVENTURE_MAP_TITLE..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Advisor Sevel <The Earthen Ring>"], 10006 };
		{ INDENT..WHIT..L["Advisor Sevel <The Earthen Ring>"] };
		{ WHIT.." 7) "..L["Gorma Windspeaker <Keeper of Legends>"], 10007 };
		{ WHIT.." 8) "..L["Tribemother Torra <Shaman Trainer>"], 10008 };
	};
	CH_Warlock = {
		ZoneName = { CL["WARLOCK"]..Atlas_GetClassName("WARLOCK")..ALC["Hyphen"]..BZ["Dreadscar Rift"] };
		Location = { BZ["Dreadscar Rift"] };
		WorldMapID = "1050";
		{ PURP.." A) "..L["Portal to Dalaran"], 10101 };
		{ PURP.." B) "..L["Demonic Gateway"], 10102 };
		{ WHIT.." 1) "..I_PROFF..L["Felblood Altar"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"], 10001 };
		{ WHIT.." 2) "..L["Unjari Feltongue <The Heartbearer>"], 10002 };
		{ WHIT.." 3) "..L["Calydus"], 10003 };
		{ WHIT.." 4) "..I_WORKORDER..L["Murr"].."\n"..WHIT..L["Lurr <Dreadscar Blacksmith>"], 10004 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ INDENT..WHIT..L["Lurr <Dreadscar Blacksmith>"] };
		{ WHIT.." 5) "..I_WORKORDER..L["Jared <Recruiter>"], 10005 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 6) "..I_CMISSION..L["Dreadscar Battle Plans"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Gakin the Darkbinder <Mission Strategist>"].."\n"..WHIT..L["Ritssyn Flamescowl <Council of the Black Harvest>"], 10006 };
		{ INDENT..WHIT..L["Gakin the Darkbinder <Mission Strategist>"] };
		{ INDENT..WHIT..L["Ritssyn Flamescowl <Council of the Black Harvest>"] };
		{ WHIT.." 7) "..I_CLASS..L["Archivist Melinda <Class Hall Upgrades>"], 10007 };
		{ WHIT.." 8) "..I_WORKORDER..L["Mile Raitheborne <Head Archivist>"], 10008 };
		{ WHIT.." 9) "..I_REPAIR..L["Gigi Gigavoid <Black Harvest Quartermaster>"], 10009 };
		{ WHIT.."10) "..I_WORKORDER..L["Imp Mother Dyala <Recruiter>"], 10010 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.."11) "..L["Training Dummies"], 10011 };
	};
	CH_Warrior = {
		ZoneName = { CL["WARRIOR"]..Atlas_GetClassName("WARRIOR")..ALC["Hyphen"]..BZ["Skyhold"] };
		Location = { BZ["Skyhold"]..ALC["Comma"]..BZ["Halls of Valor"]..ALC["Comma"]..BZ["Stormheim"] };
		WorldMapID = "1035";
		{ PURP.." A) "..L["Aerylia <Stormflight Master>"], 10101 };
		{ INDENT..GREY..L["Travel to:"] };
		{ INDENT..INDENT..GREY..BZ["Dalaran"] };
		{ INDENT..INDENT..GREY..BZ["Azurewing Repose"]..ALC["Comma"]..BZ["Azsuna"] };
		{ INDENT..INDENT..GREY..BZ["Lorlathil"]..ALC["Comma"]..BZ["Val'sharah"] };
		{ INDENT..INDENT..GREY..BZ["Thunder Totem"]..ALC["Comma"]..BZ["Highmountain"] };
		{ INDENT..INDENT..GREY..BZ["Valdisdall"]..ALC["Comma"]..BZ["Stormheim"] };
		{ INDENT..INDENT..GREY..BZ["Meredil"]..ALC["Comma"]..BZ["Suramar"] };
		{ WHIT.." 1) "..I_CMISSION..L["Eye of Odyn"]..GREY..ALC["L-Parenthesis"]..ORDER_HALL_MISSIONS..ALC["R-Parenthesis"].."\n"..WHIT..L["Skyseer Ghrent"], 10001 };
		{ INDENT..WHIT..L["Skyseer Ghrent"] };
		{ WHIT.." 2) "..I_WORKORDER..L["Captain Hjalmar Stahlstrom <Recruiter>"], 10002 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 3) "..I_WORKORDER..L["Savyn Valorborn <Recruiter>"], 10003 };
		{ INDENT..GREY..CAPACITANCE_START_RECRUITMENT };
		{ WHIT.." 4) "..I_REPAIR..L["Quartermaster Durnolf"], 10004 };
		{ WHIT.." 5) "..I_WORKORDER..L["Haklang Ulfsson <Armaments Requisitioner>"], 10005 };
		{ INDENT..GREY..L["Champion Armaments"] };
		{ WHIT.." 6) "..I_WORKORDER..L["Fjornson Stonecarver <Keeper of Legends>"], 10006 };
		{ WHIT.." 7) "..I_CLASS..L["Einar the Runecaster <Class Hall Upgrades>"], 10007 };
		{ WHIT.." 8) "..I_PROFF..L["Forge of Odyn"]..GREY..ALC["L-Parenthesis"]..ARTIFACT_POWER..ALC["R-Parenthesis"].."\n"..WHIT..L["Master Smith Helgar"], 10008 };
		{ INDENT..WHIT..L["Master Smith Helgar"] };
		{ WHIT.." 9) "..L["Weaponmaster Asvard <Warrior Trainer>"], 10009 };
		{ WHIT.."10) "..BZ["Arena of Glory"], 10010 };
		{ WHIT.."11) "..L["Training Dummies"], 10011 };
		{ WHIT.."12) "..Atlas_GetBossName("Hymdall", 1485), 10012 }; -- Note that here we should use customized NPC ID as Hymdall here isn't a boss from dungeon.
		{ WHIT.."13) "..Atlas_GetBossName("Odyn", 1489), 10013 }; -- Note that here we should use customized NPC ID as Odyn here isn't a boss from dungeon.
	};
};

Atlas_RegisterPlugin("Atlas_ClassOrderHalls", myCategory, myData);
