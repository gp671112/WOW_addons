﻿-- $Id: Atlas_ClassicWoW-ptBR.lua 13 2016-09-05 14:36:53Z arith $
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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_ClassicWoW", "ptBR", false);

if L then
-- L["Abandonded Mole Machine"] = ""
-- L["Acride <Scarshield Legion>"] = ""
-- L["Altar of Blood"] = ""
-- L["\"Ambassador\" Dagg'thol"] = ""
-- L["Amnennar's Phylactery"] = ""
-- L["Ancient Equine Spirit"] = ""
-- L["Ancient Treasure"] = ""
-- L["Andorgos <Brood of Malygos>"] = ""
-- L["Aoren Sunglow <The Reliquary>"] = ""
-- L["AQ"] = ""
-- L["AQ10"] = ""
-- L["AQ40"] = ""
-- L["Archmage Angela Dosantos <Brotherhood of the Light>"] = ""
-- L["Arygos"] = ""
-- L["Auld Stonespire"] = ""
-- L["Baelog's Chest"] = ""
-- L["B.E Barechus <S.A.F.E.>"] = ""
-- L["BFD"] = ""
-- L["Blastmaster Emi Shortfuse"] = ""
-- L["BRD"] = ""
-- L["BRM"] = ""
-- L["BWL"] = ""
-- L["Caelestrasz"] = ""
-- L["Captain Drenn"] = ""
-- L["Captain Qeez"] = ""
-- L["Captain Tuubid"] = ""
-- L["Captain Wyrmak"] = ""
-- L["Captain Xurrem"] = ""
-- L["Celebras the Redeemed"] = ""
-- L["Chase Begins"] = ""
-- L["Chase Ends"] = ""
-- L["Chief Engineer Bilgewhizzle <Gadgetzan Water Co.>"] = ""
-- L["Chomper"] = ""
-- L["Colonel Zerran"] = ""
-- L["Commander Bagran"] = ""
-- L["Core Fragment"] = ""
-- L["Crusade Commander Eligor Dawnbringer <Brotherhood of the Light>"] = ""
-- L["Crusade Commander Korfax <Brotherhood of the Light>"] = ""
-- L["Cursed Centaur"] = ""
-- L["Dire Maul Arena"] = ""
-- L["Dire Pool"] = ""
-- L["DM"] = ""
-- L["Druid of the Talon"] = ""
-- L["Ebru <Disciple of Naralex>"] = ""
-- L["Elder Farwhisper"] = ""
-- L["Elder Mistwalker"] = ""
-- L["Elder Morndeep"] = ""
-- L["Elder Splitrock"] = ""
-- L["Elders' Square Postbox"] = ""
-- L["Elder Starsong"] = ""
-- L["Elder Stonefort"] = ""
-- L["Elder Wildmane"] = ""
-- L["Estulan <The Highborne>"] = ""
-- L["Face <S.A.F.E.>"] = ""
-- L["Falrin Treeshaper"] = ""
-- L["Ferra"] = ""
-- L["Festival Lane Postbox"] = ""
-- L["Fire of Aku'mai"] = ""
-- L["Four Kaldorei Elites"] = ""
-- L["Fras Siabi's Postbox"] = ""
-- L["Furgus Warpwood"] = ""
-- L["Galamav the Marksman <Kargath Expeditionary Force>"] = ""
-- L["Gnome"] = ""
-- L["Gomora the Bloodletter"] = ""
-- L["Hann Ibal <S.A.F.E.>"] = ""
-- L["Hierophant Theodora Mulvadania <Kargath Expeditionary Force>"] = ""
-- L["High Examiner Tae'thelan Bloodwatcher <The Reliquary>"] = ""
-- L["Invoker Xorenth"] = ""
-- L["Ironbark the Redeemed"] = ""
-- L["Jalinda Sprig <Morgan's Militia>"] = ""
-- L["Je'neu Sancrea <The Earthen Ring>"] = ""
-- L["Kandrostrasz <Brood of Alexstrasza>"] = ""
-- L["Kand Sandseeker <Explorer's League>"] = ""
-- L["Kevin Dawson <Morgan's Militia>"] = ""
-- L["Kherrah"] = ""
-- L["King's Square Postbox"] = ""
-- L["Knot Thimblejack"] = ""
-- L["Koristrasza"] = ""
-- L["LBRS"] = ""
-- L["Lead Prospector Durdin <Explorer's League>"] = ""
-- L["Lexlort <Kargath Expeditionary Force>"] = ""
-- L["Lidia Sunglow <The Reliquary>"] = ""
-- L["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = ""
-- L["Lord Itharius"] = ""
-- L["Lorekeeper Javon"] = ""
-- L["Lorekeeper Kildrath"] = ""
-- L["Lorekeeper Lydros"] = ""
-- L["Lorekeeper Mykos"] = ""
-- L["Mail Box"] = ""
-- L["Major Pakkon"] = ""
-- L["Major Yeggeth"] = ""
-- L["Mara"] = ""
-- L["Market Row Postbox"] = ""
-- L["Marshal Maxwell <Morgan's Militia>"] = ""
-- L["Master Craftsman Wilhelm <Brotherhood of the Light>"] = ""
-- L["Master Elemental Shaper Krixix"] = ""
-- L["Maxwort Uberglint"] = ""
-- L["Mayara Brightwing <Morgan's Militia>"] = ""
-- L["Mazoga's Spirit"] = ""
-- L["MC"] = ""
-- L["Merithra of the Dream"] = ""
-- L["Mistress Nagmara"] = ""
-- L["Mountaineer Orfus <Morgan's Militia>"] = ""
-- L["Murd Doc <S.A.F.E.>"] = ""
-- L["Muyoh <Disciple of Naralex>"] = ""
-- L["Nalpak <Disciple of Naralex>"] = ""
-- L["Naralex"] = ""
-- L["Nurse Lillian"] = ""
-- L["Old Ironbark"] = ""
-- L["Olga Runesworn <Explorer's League>"] = ""
-- L["Oralius <Morgan's Militia>"] = ""
-- L["Orb of Domination"] = ""
-- L["Packmaster Stonebruiser <Brotherhood of the Light>"] = ""
-- L["Priestess Udum'bra"] = ""
-- L["Private Rocknot"] = ""
-- L["Prospector Seymour <Morgan's Militia>"] = ""
-- L["Pylons"] = ""
-- L["Raven"] = ""
-- L["Razal'blade <Kargath Expeditionary Force>"] = ""
-- L["RFC"] = ""
-- L["RFD"] = ""
-- L["RFK"] = ""
-- L["Rifle Commander Coe"] = ""
-- L["Roughshod Pike"] = ""
-- L["Safe Room"] = ""
-- L["Schematic: Field Repair Bot 74A"] = ""
-- L["Scout Cage"] = ""
-- L["Sentinel Aluwyn"] = ""
-- L["Shadowforge Brazier"] = ""
-- L["Shen'dralar Ancient"] = ""
-- L["Shen'dralar Provisioner"] = ""
-- L["Shen'dralar Watcher"] = ""
-- L["Spirit of Agamaggan <Ancient>"] = ""
-- L["Spoils of Blackfathom"] = ""
-- L["ST"] = ""
-- L["Stocks"] = ""
-- L["Stonemaul Ogre"] = ""
-- L["Strat"] = ""
-- L["Stratholme Courier"] = ""
-- L["Thal'trak Proudtusk <Kargath Expeditionary Force>"] = ""
-- L["The Black Anvil"] = ""
-- L["The Black Forge"] = ""
-- L["The Discs of Norgannon"] = ""
-- L["The Nameless Prophet"] = ""
-- L["The Shadowforge Lock"] = ""
-- L["The Sparklematic 5200"] = ""
-- L["The Vault"] = ""
-- L["Thunderheart <Kargath Expeditionary Force>"] = ""
-- L["Tinkee Steamboil"] = ""
-- L["Tink Sprocketwhistle <Engineering Supplies>"] = ""
-- L["Torben Zapblast <Teleportation Specialist>"] = ""
-- L["Tran'rek"] = ""
-- L["Ulda"] = ""
-- L["Urok's Tribute Pile"] = ""
-- L["Vethsera <Brood of Ysera>"] = ""
-- L["Warden Thelwater"] = ""
-- L["Warlord Goretooth <Kargath Expeditionary Force>"] = ""
-- L["Watchman Doomgrip"] = ""
-- L["WC"] = ""
-- L["Weegli Blastfuse"] = ""
-- L["Yuka Screwspigot <Engineering Supplies>"] = ""
-- L["Zeya"] = ""
-- L["ZF"] = ""
-- L["ToC/Description"] = ""
-- L["ToC/Title"] = ""

end