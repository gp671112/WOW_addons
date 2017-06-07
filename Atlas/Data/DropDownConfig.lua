-- $Id: DropDownConfig.lua 232 2017-05-10 09:10:18Z arith $
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


Atlas_DropDownLayouts_Order = {
	[1] = ATLAS_DDL_CONTINENT,
	[2] = ATLAS_DDL_LEVEL,
	[3] = ATLAS_DDL_PARTYSIZE,
	[4] = ATLAS_DDL_EXPANSION,
	[5] = ATLAS_DDL_TYPE,
	[ATLAS_DDL_CONTINENT] = {
		[1] = ATLAS_DDL_CONTINENT_EASTERN1,
		[2] = ATLAS_DDL_CONTINENT_EASTERN2,
		[3] = ATLAS_DDL_CONTINENT_KALIMDOR,
		[4] = ATLAS_DDL_CONTINENT_OUTLAND,
		[5] = ATLAS_DDL_CONTINENT_NORTHREND,
		[6] = ATLAS_DDL_CONTINENT_DEEPHOLM,
		[7] = ATLAS_DDL_CONTINENT_PANDARIA,
		[8] = ATLAS_DDL_CONTINENT_DRAENOR,
		[9] = ATLAS_DDL_CONTINENT_BROKENISLES1,
		[10] = ATLAS_DDL_CONTINENT_BROKENISLES2,
	},
	[ATLAS_DDL_LEVEL] = {
		[1] = ATLAS_DDL_LEVEL_UNDER45,
		[2] = ATLAS_DDL_LEVEL_45TO60,
		[3] = ATLAS_DDL_LEVEL_60TO70,
		[4] = ATLAS_DDL_LEVEL_70TO80,
		[5] = ATLAS_DDL_LEVEL_80TO85,
		[6] = ATLAS_DDL_LEVEL_85TO90,
		[7] = ATLAS_DDL_LEVEL_90TO100,
		[8] = ATLAS_DDL_LEVEL_100TO110,
		[9] = ATLAS_DDL_LEVEL_110PLUS1,
		[10] = ATLAS_DDL_LEVEL_110PLUS2,
	},
	[ATLAS_DDL_PARTYSIZE] = {
		[1] = ATLAS_DDL_PARTYSIZE_5_1,
		[2] = ATLAS_DDL_PARTYSIZE_5_2,
		[3] = ATLAS_DDL_PARTYSIZE_5_3,
		[4] = ATLAS_DDL_PARTYSIZE_5_4,
		[5] = ATLAS_DDL_PARTYSIZE_10_1,
		[6] = ATLAS_DDL_PARTYSIZE_10_2,
		[7] = ATLAS_DDL_PARTYSIZE_10_3,
		[8] = ATLAS_DDL_PARTYSIZE_20TO40_1,
		[9] = ATLAS_DDL_PARTYSIZE_20TO40_2,
		[10] = ATLAS_DDL_PARTYSIZE_20TO40_3,
	},
	[ATLAS_DDL_EXPANSION] = {
		[1] = ATLAS_DDL_EXPANSION_OLD_AO,
		[2] = ATLAS_DDL_EXPANSION_OLD_PZ,
		[3] = ATLAS_DDL_EXPANSION_BC,
		[4] = ATLAS_DDL_EXPANSION_WOTLK,
		[5] = ATLAS_DDL_EXPANSION_CATA,
		[6] = ATLAS_DDL_EXPANSION_MOP,
		[7] = ATLAS_DDL_EXPANSION_WOD,
		[8] = ATLAS_DDL_EXPANSION_LEGION1,
		[9] = ATLAS_DDL_EXPANSION_LEGION2,
	},
	[ATLAS_DDL_TYPE] = {
		[1] = ATLAS_DDL_TYPE_INSTANCE_AB,
		[2] = ATLAS_DDL_TYPE_INSTANCE_CF,
		[3] = ATLAS_DDL_TYPE_INSTANCE_GM,
		[4] = ATLAS_DDL_TYPE_INSTANCE_NS,
		[5] = ATLAS_DDL_TYPE_INSTANCE_TZ,
		[6] = ATLAS_DDL_TYPE_ENTRANCE,
	},
};

Atlas_DropDownLayouts = {
	[ATLAS_DDL_CONTINENT] = {
		[ATLAS_DDL_CONTINENT_EASTERN1] = {
			"BlackrockDepths",		-- Classic WoW
			"BlackrockMountainEnt",		-- Classic WoW, Catalysm, Draenor
			"BlackwingLair",		-- Classic WoW
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",		-- Classic WoW, Catalysm
			"Gnomeregan",			-- Classic WoW
			"GnomereganEnt",		-- Classic WoW
			"LowerBlackrockSpire",		-- Classic WoW
			"MoltenCore",			-- Classic WoW
			"KarazhanEnd",			-- Burning Crusade
			"KarazhanEnt",			-- Burning Crusade
			"KarazhanStart",		-- Burning Crusade
			"MagistersTerrace",		-- Burning Crusade
			"BaradinHold",			-- Catalysm
			"BlackrockCaverns",		-- Catalysm
			"BlackwingDescent",		-- Catalysm
			"GrimBatol",			-- Catalysm
			"UpperBlackrockSpire",		-- Draenor
		},
		[ATLAS_DDL_CONTINENT_EASTERN2] = {
			"ShadowfangKeep",		-- Classic WoW, Catalysm
			"StratholmeCrusader",		-- Classic WoW
			"StratholmeGauntlet",		-- Classic WoW
			"TheStockade",			-- Classic WoW
			"TheSunkenTemple",		-- Classic WoW
			"TheSunkenTempleEnt",		-- Classic WoW
			"Uldaman",			-- Classic WoW
			"UldamanEnt",			-- Classic WoW
			"SunwellPlateau",		-- Burning Crusade
			"TheBastionOfTwilight",		-- Catalysm
			"ThroneOfTheTides",		-- Catalysm
			"ZulAman",			-- Catalysm
			"ZulGurub",			-- Catalysm
			"Scholomance",			-- Mop, Classic WoW
			"ScarletMonasteryEnt",		-- Mop, Classic WoW
			"ScarletHalls",			-- Mop, Classic WoW
			"ScarletMonastery",		-- Mop, Classic WoW
			"ReturntoKarazhanEnt", 		-- Legion
			"ReturntoKarazhanA", 		-- Legion
			"ReturntoKarazhanB", 		-- Legion
			"ReturntoKarazhanC", 		-- Legion
			"ReturntoKarazhanD", 		-- Legion
			"ReturntoKarazhanE", 		-- Legion
			"ReturntoKarazhanF", 		-- Legion
			"ReturntoKarazhanG", 		-- Legion
			"ReturntoKarazhanH", 		-- Legion
			"ReturntoKarazhanI", 		-- Legion
		},
		[ATLAS_DDL_CONTINENT_KALIMDOR] = {
			"CavernsOfTimeEnt",		-- Catalysm, Burning Crusade
			"BlackfathomDeeps",		-- Classic WoW
			"BlackfathomDeepsEnt",		-- Classic WoW
			"DireMaulEast",			-- Classic WoW
			"DireMaulEnt",			-- Classic WoW
			"DireMaulNorth",		-- Classic WoW
			"DireMaulWest",			-- Classic WoW
			"Maraudon",			-- Classic WoW
			"MaraudonEnt",			-- Classic WoW
			"RagefireChasm",		-- Classic WoW
			"RazorfenDowns",		-- Classic WoW
			"RazorfenKraul",		-- Classic WoW
			"TheRuinsofAhnQiraj",		-- Classic WoW
			"TheTempleofAhnQiraj",		-- Classic WoW
			"WailingCaverns",		-- Classic WoW
			"WailingCavernsEnt",		-- Classic WoW
			"ZulFarrak",			-- Classic WoW
			"CoTBlackMorass",		-- Burning Crusade
			"CoTHyjal",			-- Burning Crusade
			"CoTHyjalEnt",			-- Burning Crusade
			"CoTOldHillsbrad",		-- Burning Crusade
			"CoTOldStratholme",		-- Burning Crusade
			"OnyxiasLair",			-- WrathoftheLichKing
			"CoTDragonSoulA",		-- Catalysm
			"CoTDragonSoulB",		-- Catalysm
			"CoTDragonSoulC",		-- Catalysm
			"CoTEndTime",			-- Catalysm
			"CoTHourOfTwilight",		-- Catalysm
			"CoTWellOfEternity",		-- Catalysm
			"Firelands",			-- Catalysm
			"HallsOfOrigination",		-- Catalysm
			"LostCityOfTolvir",		-- Catalysm
			"TheVortexPinnacle",		-- Catalysm
			"ThroneOfTheFourWinds",		-- Catalysm
		},
		[ATLAS_DDL_CONTINENT_OUTLAND] = {
			"AuchAuchenaiCrypts",
			"AuchindounEnt",
			"AuchManaTombs",
			"AuchSethekkHalls",
			"AuchShadowLabyrinth",
			"BlackTempleBasement",
			"BlackTempleStart",
			"BlackTempleTop",
			"CFRSerpentshrineCavern",
			"CFRTheSlavePens",
			"CFRTheSteamvault",
			"CFRTheUnderbog",
			"CoilfangReservoirEnt",
			"GruulsLair",
			"HellfireCitadelEnt",
			"HCBloodFurnace",
			"HCHellfireRamparts",
			"HCMagtheridonsLair",
			"HCTheShatteredHalls",
			"TempestKeepEnt",
			"TempestKeepArcatraz",
			"TempestKeepBotanica",
			"TempestKeepMechanar",
			"TempestKeepTheEye",
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
		[ATLAS_DDL_CONTINENT_DEEPHOLM] = {
			"TheStonecore",
		},
		[ATLAS_DDL_CONTINENT_PANDARIA] = {
			"GateoftheSettingSun",
			"HeartofFear",
			"MoguShanPalace",
			"MoguShanVaults",
			"ShadoPanMonasteryA",
			"ShadoPanMonasteryB",
			"SiegeofNiuzaoTempleA",
			"SiegeofNiuzaoTempleB",
			"SiegeofOrgrimmarA",
			"SiegeofOrgrimmarB",
			"SiegeofOrgrimmarC",
			"SiegeofOrgrimmarD",
			"StormstoutBrewery",
			"TempleOfTheJadeSerpent",
			"TerraceofEndlessSpring",
			"ThroneofThunderA",
			"ThroneofThunderB",
			"ThroneofThunderC",
			"ThroneofThunderD",
		},
		[ATLAS_DDL_CONTINENT_DRAENOR] = {
			"Auchindoun",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BloodmaulSlagMines",
			"TheEverbloomA",
			"TheEverbloomB",
			"GrimrailDepot",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IronDocks",
			"ShadowmoonBurialGrounds",
			"Skyreach",
		},
		[ATLAS_DDL_CONTINENT_BROKENISLES1] = { -- dungeons
			"TheArcwayEnt",
			"TheArcway",
			"AssaultonVioletHold",
			"BlackRookHoldA",
			"BlackRookHoldB",
			"BlackRookHoldC",
			"BlackRookHoldD",
			"CathedralofEternalNightA",
			"CathedralofEternalNightB",
			"CathedralofEternalNightC",
			"CathedralofEternalNightD",
			"CourtofStarsA",
			"CourtofStarsB",
			"DarkheartThicket",
			"EyeofAzshara",
			"HallsofValorA",
			"HallsofValorB",
			"HallsofValorC",
			"MawofSoulsA",
			"MawofSoulsB",
			"NeltharionsLair",
			"VaultoftheWardensA",
			"VaultoftheWardensB",
			"VaultoftheWardensC",
		},
		[ATLAS_DDL_CONTINENT_BROKENISLES2] = { -- raids
			"TheEmeraldNightmareA",
			"TheEmeraldNightmareB",
			"TheEmeraldNightmareC",
			"TheEmeraldNightmareD",
			"TheEmeraldNightmareE",
			"TheEmeraldNightmareF",
			"TheEmeraldNightmareG",
			"TheEmeraldNightmareH",
			"TheNightholdEnt",
			"TheNightholdA",
			"TheNightholdB",
			"TheNightholdC",
			"TheNightholdD",
			"TheNightholdE",
			"TheNightholdF",
			"TheNightholdG",
			"TrialofValorA",
			"TrialofValorB",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
		},
	},
	[ATLAS_DDL_LEVEL] = {
		[ATLAS_DDL_LEVEL_UNDER45] = {
			"BlackfathomDeeps",		-- Classic WoW
			"BlackfathomDeepsEnt",		-- Classic WoW
			"Gnomeregan",			-- Classic WoW
			"GnomereganEnt",		-- Classic WoW
			"RagefireChasm",		-- Classic WoW
			"RazorfenDowns",		-- Classic WoW
			"RazorfenKraul",		-- Classic WoW
			"ShadowfangKeep",		-- Classic WoW
			"ScarletMonasteryEnt",		-- Classic WoW
			"ScarletHalls",			-- Classic WoW
			"ScarletMonastery",		-- Classic WoW
			"Scholomance",			-- Classic WoW
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",		-- Classic WoW
			"TheStockade",			-- Classic WoW
			"Uldaman",			-- Classic WoW
			"UldamanEnt",			-- Classic WoW
			"WailingCaverns",		-- Classic WoW
			"WailingCavernsEnt",		-- Classic WoW
		},
		[ATLAS_DDL_LEVEL_45TO60] = {
			"BlackrockDepths",		-- Classic WoW
			"BlackrockMountainEnt",		-- Classic WoW
			"DireMaulEast",			-- Classic WoW
			"DireMaulEnt",			-- Classic WoW
			"DireMaulNorth",		-- Classic WoW
			"DireMaulWest",			-- Classic WoW
			"LowerBlackrockSpire",		-- Classic WoW
			"Maraudon",			-- Classic WoW
			"MaraudonEnt",			-- Classic WoW
			"StratholmeCrusader",		-- Classic WoW
			"StratholmeGauntlet",		-- Classic WoW
			"TheSunkenTemple",		-- Classic WoW
			"TheSunkenTempleEnt",		-- Classic WoW
			"ZulFarrak",			-- Classic WoW
		},
		[ATLAS_DDL_LEVEL_60TO70] = {
			"BlackrockMountainEnt",		-- Classic WoW
			"BlackwingLair",		-- Classic WoW
			"MoltenCore",			-- Classic WoW
			"TheRuinsofAhnQiraj",		-- Classic WoW
			"TheTempleofAhnQiraj",		-- Classic WoW
			"AuchAuchenaiCrypts",		-- Burning Crusade
			"AuchindounEnt",		-- Burning Crusade
			"AuchManaTombs",		-- Burning Crusade
			"AuchSethekkHalls",		-- Burning Crusade
			"AuchShadowLabyrinth",		-- Burning Crusade
			"CFRTheSlavePens",		-- Burning Crusade
			"CFRTheSteamvault",		-- Burning Crusade
			"CFRTheUnderbog",		-- Burning Crusade
			"CoilfangReservoirEnt",		-- Burning Crusade
			"CoTBlackMorass",		-- Burning Crusade
			"CavernsOfTimeEnt",		-- Burning Crusade
			"CoTOldHillsbrad",		-- Burning Crusade
			"HellfireCitadelEnt",		-- Burning Crusade
			"HCBloodFurnace",		-- Burning Crusade
			"HCHellfireRamparts",		-- Burning Crusade
			"HCTheShatteredHalls",		-- Burning Crusade
			"MagistersTerrace",		-- Burning Crusade
			"TempestKeepEnt",		-- Burning Crusade
			"TempestKeepArcatraz",		-- Burning Crusade
			"TempestKeepBotanica",		-- Burning Crusade
			"TempestKeepMechanar",		-- Burning Crusade
		},
		[ATLAS_DDL_LEVEL_70TO80] = {
			"CavernsOfTimeEnt",		-- Burning Crusade
			"BlackTempleBasement",		-- Burning Crusade
			"BlackTempleStart",		-- Burning Crusade
			"BlackTempleTop",		-- Burning Crusade
			"CFRSerpentshrineCavern",	-- Burning Crusade
			"CoTHyjal",			-- Burning Crusade
			"CoTHyjalEnt",			-- Burning Crusade
			"CoTOldStratholme",		-- Burning Crusade
			"KarazhanEnd",			-- Burning Crusade
			"KarazhanEnt",			-- Burning Crusade
			"KarazhanStart",		-- Burning Crusade
			"AhnKahet",			-- WrathoftheLichKing
			"AzjolNerub",			-- WrathoftheLichKing
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
			"BlackrockMountainEnt",		-- Catalysm
			"BlackrockCaverns",		-- Catalysm
			"GrimBatol",			-- Catalysm
			"HallsOfOrigination",		-- Catalysm
			"LostCityOfTolvir",		-- Catalysm
			"TheStonecore",			-- Catalysm
			"TheVortexPinnacle",		-- Catalysm
			"ThroneOfTheTides",		-- Catalysm
		},
		[ATLAS_DDL_LEVEL_85TO90] = {
			"BaradinHold",			-- Catalysm
			"BlackrockMountainEnt",		-- Catalysm
			"BlackwingDescent",		-- Catalysm
			"CavernsOfTimeEnt",		-- Catalysm
			"CoTDragonSoulA",		-- Catalysm
			"CoTDragonSoulB",		-- Catalysm
			"CoTDragonSoulC",		-- Catalysm
			"CoTEndTime",			-- Catalysm
			"CoTHourOfTwilight",		-- Catalysm
			"CoTWellOfEternity",		-- Catalysm
			"Firelands",			-- Catalysm
			"TheBastionOfTwilight",		-- Catalysm
			"ThroneOfTheFourWinds",		-- Catalysm
			"ShadowfangKeep",		-- Catalysm
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",		-- Catalysm
			"ZulAman",			-- Catalysm
			"ZulGurub",			-- Catalysm
			"GateoftheSettingSun",		-- MoP
			"MoguShanPalace",		-- MoP
			"ShadoPanMonasteryA",		-- MoP
			"ShadoPanMonasteryB",		-- MoP
			"StormstoutBrewery",		-- MoP
			"TempleOfTheJadeSerpent",	-- MoP
		},
		[ATLAS_DDL_LEVEL_90TO100] = {
			"Scholomance",			-- MoP
			"ScarletMonasteryEnt",		-- MoP
			"ScarletHalls",			-- MoP
			"ScarletMonastery",		-- MoP
			"HeartofFear",			-- MoP
			"MoguShanVaults",		-- MoP
			"SiegeofNiuzaoTempleA",		-- MoP
			"SiegeofNiuzaoTempleB",		-- MoP
			"SiegeofOrgrimmarA",		-- MoP
			"SiegeofOrgrimmarB",		-- MoP
			"SiegeofOrgrimmarC",		-- MoP
			"SiegeofOrgrimmarD",		-- MoP
			"TerraceofEndlessSpring",	-- MoP
			"ThroneofThunderA",		-- MoP
			"ThroneofThunderB",		-- MoP
			"ThroneofThunderC",		-- MoP
			"ThroneofThunderD",		-- MoP
			"Auchindoun",			-- Draenor
			"BloodmaulSlagMines",		-- Draenor
			"IronDocks",			-- Draenor
			"Skyreach",			-- Draenor
		},
		[ATLAS_DDL_LEVEL_100TO110] = {
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"TheEverbloomA",		-- Draenor
			"TheEverbloomB",		-- Draenor
			"GrimrailDepot",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
			"ShadowmoonBurialGrounds",	-- Draenor
			"UpperBlackrockSpire",		-- Draenor
			"AssaultonVioletHold",		-- Legion
			"DarkheartThicket",		-- Legion
			"EyeofAzshara",			-- Legion
			"HallsofValorA",		-- Legion
			"HallsofValorB",		-- Legion
			"HallsofValorC",		-- Legion
			"NeltharionsLair",		-- Legion
		},
		[ATLAS_DDL_LEVEL_110PLUS1] = {
			"BlackRookHoldA",
			"BlackRookHoldB",
			"BlackRookHoldC",
			"BlackRookHoldD",
			"VaultoftheWardensA",
			"VaultoftheWardensB",
			"VaultoftheWardensC",
			"MawofSoulsA",
			"MawofSoulsB",
			"TheArcwayEnt",
			"TheArcway",
			"CathedralofEternalNightA",
			"CathedralofEternalNightB",
			"CathedralofEternalNightC",
			"CathedralofEternalNightD",
			"CourtofStarsA",
			"CourtofStarsB",
			"TheEmeraldNightmareA",
			"TheEmeraldNightmareB",
			"TheEmeraldNightmareC",
			"TheEmeraldNightmareD",
			"TheEmeraldNightmareE",
			"TheEmeraldNightmareF",
			"TheEmeraldNightmareG",
			"TheEmeraldNightmareH",
		},
		[ATLAS_DDL_LEVEL_110PLUS2] = {
			"TheNightholdEnt",
			"TheNightholdA",
			"TheNightholdB",
			"TheNightholdC",
			"TheNightholdD",
			"TheNightholdE",
			"TheNightholdF",
			"TheNightholdG",
			"ReturntoKarazhanEnt", 		-- Legion
			"ReturntoKarazhanA", 		-- Legion
			"ReturntoKarazhanB", 		-- Legion
			"ReturntoKarazhanC", 		-- Legion
			"ReturntoKarazhanD", 		-- Legion
			"ReturntoKarazhanE", 		-- Legion
			"ReturntoKarazhanF", 		-- Legion
			"ReturntoKarazhanG", 		-- Legion
			"ReturntoKarazhanH", 		-- Legion
			"ReturntoKarazhanI", 		-- Legion
			"TrialofValorA",
			"TrialofValorB",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
		},
	},
	[ATLAS_DDL_PARTYSIZE] = {
		[ATLAS_DDL_PARTYSIZE_5_1] = {
			"AhnKahet",
			"TheArcway",
			"TheArcwayEnt",
			"AssaultonVioletHold",
			"AuchAuchenaiCrypts",
			"Auchindoun",
			"AuchindounEnt",
			"AuchManaTombs",
			"AuchSethekkHalls",
			"AuchShadowLabyrinth",
			"AzjolNerub",
			"BlackfathomDeeps",
			"BlackfathomDeepsEnt",
			"BlackrockCaverns",
			"BlackrockDepths",
			"BlackrockMountainEnt",
			"BlackRookHoldA",
			"BlackRookHoldB",
			"BlackRookHoldC",
			"BlackRookHoldD",
			"BloodmaulSlagMines",
			"LowerBlackrockSpire",
			"UpperBlackrockSpire",
			"CathedralofEternalNightA",
			"CathedralofEternalNightB",
			"CathedralofEternalNightC",
			"CathedralofEternalNightD",
			"CavernsOfTimeEnt",
			"CFRTheSlavePens",
			"CFRTheSteamvault",
			"CFRTheUnderbog",
			"CoilfangReservoirEnt",
			"CoTBlackMorass",
			"CoTEndTime",
			"CoTHourOfTwilight",
			"CoTOldHillsbrad",
			"CoTOldStratholme",
			"CoTWellOfEternity",
		},
		[ATLAS_DDL_PARTYSIZE_5_2] = {
			"CourtofStarsA",
			"CourtofStarsB",
			"DarkheartThicket",
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",
			"DireMaulEast",
			"DireMaulEnt",
			"DireMaulNorth",
			"DireMaulWest",
			"DrakTharonKeep",
			"TheEverbloomA",
			"TheEverbloomB",
			"EyeofAzshara",
			"FHHallsOfReflection",
			"FHPitOfSaron",
			"FHTheForgeOfSouls",
			"GateoftheSettingSun",
			"Gnomeregan",
			"GnomereganEnt",
			"GrimBatol",
			"GrimrailDepot",
			"Gundrak",
			"HallsOfOrigination",
			"HallsofValorA",
			"HallsofValorB",
			"HallsofValorC",
			"HCBloodFurnace",
			"HCHellfireRamparts",
			"HCTheShatteredHalls",
			"HellfireCitadelEnt",
			"IcecrownEnt",
			"IronDocks",
			"LostCityOfTolvir",
		},
		[ATLAS_DDL_PARTYSIZE_5_3] = {
			"MagistersTerrace",
			"Maraudon",
			"MaraudonEnt",
			"MawofSoulsA",
			"MawofSoulsB",
			"MoguShanPalace",
			"NeltharionsLair",
			"TheNexus",
			"TheOculus",
			"RagefireChasm",
			"RazorfenDowns",
			"RazorfenKraul",
			"ReturntoKarazhanEnt",
			"ReturntoKarazhanA",
			"ReturntoKarazhanB",
			"ReturntoKarazhanC",
			"ReturntoKarazhanD",
			"ReturntoKarazhanE",
			"ReturntoKarazhanF",
			"ReturntoKarazhanG",
			"ReturntoKarazhanH",
			"ReturntoKarazhanI",
			"ScarletHalls",
			"ScarletMonastery",
			"ScarletMonasteryEnt",
			"Scholomance",
			"ShadoPanMonasteryA",
			"ShadoPanMonasteryB",
			"ShadowfangKeep",
			"ShadowmoonBurialGrounds",
			"SiegeofNiuzaoTempleA",
			"SiegeofNiuzaoTempleB",
		},
		[ATLAS_DDL_PARTYSIZE_5_4] = {
			"Skyreach",
			"TheStockade",
			"TheStonecore",
			"StormstoutBrewery",
			"StratholmeCrusader",
			"StratholmeGauntlet",
			"TheSunkenTemple",
			"TheSunkenTempleEnt",
			"TempestKeepArcatraz",
			"TempestKeepBotanica",
			"TempestKeepEnt",
			"TempestKeepMechanar",
			"TempleOfTheJadeSerpent",
			"ThroneOfTheTides",
			"TrialOfTheChampion",
			"Uldaman",
			"UldamanEnt",
			"UlduarEnt",
			"UlduarHallsofLightning",
			"UlduarHallsofStone",
			"UtgardeKeep",
			"UtgardePinnacle",
			"VaultoftheWardensA",
			"VaultoftheWardensB",
			"VaultoftheWardensC",
			"VioletHold",
			"TheVortexPinnacle",
			"WailingCaverns",
			"WailingCavernsEnt",
			"ZulAman",
			"ZulFarrak",
			"ZulGurub",
		},
		[ATLAS_DDL_PARTYSIZE_10_1] = {
			"BaradinHold",
			"TheBastionOfTwilight",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BlackrockMountainEnt",
			"BlackwingDescent",
			"CavernsOfTimeEnt",
			"CoTDragonSoulA",
			"CoTDragonSoulB",
			"CoTDragonSoulC",
			"TheEmeraldNightmareA",
			"TheEmeraldNightmareB",
			"TheEmeraldNightmareC",
			"TheEmeraldNightmareD",
			"TheEmeraldNightmareE",
			"TheEmeraldNightmareF",
			"TheEmeraldNightmareG",
			"TheEmeraldNightmareH",
			"TheEyeOfEternity",
			"Firelands",
			"HeartofFear",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IcecrownCitadelA",
			"IcecrownCitadelB",
			"IcecrownCitadelC",
			"IcecrownEnt",
		},
		[ATLAS_DDL_PARTYSIZE_10_2] = {
			"KarazhanEnd",
			"KarazhanEnt",
			"KarazhanStart",
			"MoguShanVaults",
			"Naxxramas",
			"TheNightholdEnt",
			"TheNightholdA",
			"TheNightholdB",
			"TheNightholdC",
			"TheNightholdD",
			"TheNightholdE",
			"TheNightholdF",
			"TheNightholdG",
			"ObsidianSanctum",
			"OnyxiasLair",
			"RubySanctum",
			"TheRuinsofAhnQiraj",
			"SiegeofOrgrimmarA",
			"SiegeofOrgrimmarB",
			"SiegeofOrgrimmarC",
			"SiegeofOrgrimmarD",
		},
		[ATLAS_DDL_PARTYSIZE_10_3] = {
			"TerraceofEndlessSpring",
			"ThroneOfTheFourWinds",
			"ThroneofThunderA",
			"ThroneofThunderB",
			"ThroneofThunderC",
			"ThroneofThunderD",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
			"TrialOfTheCrusader",
			"UlduarA",
			"UlduarB",
			"UlduarC",
			"UlduarD",
			"UlduarE",
			"VaultOfArchavon",
		},
		[ATLAS_DDL_PARTYSIZE_20TO40_1] = {
			"BaradinHold",
			"TheBastionOfTwilight",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BlackrockMountainEnt",
			"BlackTempleBasement",
			"BlackTempleStart",
			"BlackTempleTop",
			"BlackwingDescent",
			"BlackwingLair",
			"CavernsOfTimeEnt",
			"CFRSerpentshrineCavern",
			"CoilfangReservoirEnt",
			"CoTDragonSoulA",
			"CoTDragonSoulB",
			"CoTDragonSoulC",
			"CoTHyjal",
			"CoTHyjalEnt",
			"TheEmeraldNightmareA",
			"TheEmeraldNightmareB",
			"TheEmeraldNightmareC",
			"TheEmeraldNightmareD",
			"TheEmeraldNightmareE",
			"TheEmeraldNightmareF",
			"TheEmeraldNightmareG",
			"TheEmeraldNightmareH",
			"TheEyeOfEternity",
			"Firelands",
			"GruulsLair",
		},
		[ATLAS_DDL_PARTYSIZE_20TO40_2] = {
			"HCMagtheridonsLair",
			"HeartofFear",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireCitadelEnt",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IcecrownCitadelA",
			"IcecrownCitadelB",
			"IcecrownCitadelC",
			"IcecrownEnt",
			"MoguShanVaults",
			"MoltenCore",
			"Naxxramas",
			"TheNightholdEnt",
			"TheNightholdA",
			"TheNightholdB",
			"TheNightholdC",
			"TheNightholdD",
			"TheNightholdE",
			"TheNightholdF",
			"TheNightholdG",
			"ObsidianSanctum",
			"OnyxiasLair",
			"RubySanctum",
		},
		[ATLAS_DDL_PARTYSIZE_20TO40_3] = {
			"SiegeofOrgrimmarA",
			"SiegeofOrgrimmarB",
			"SiegeofOrgrimmarC",
			"SiegeofOrgrimmarD",
			"SunwellPlateau",
			"TempestKeepEnt",
			"TempestKeepTheEye",
			"TheTempleofAhnQiraj",
			"TerraceofEndlessSpring",
			"ThroneOfTheFourWinds",
			"ThroneofThunderA",
			"ThroneofThunderB",
			"ThroneofThunderC",
			"ThroneofThunderD",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
			"TrialOfTheCrusader",
			"TrialofValorA",
			"TrialofValorB",
			"UlduarA",
			"UlduarB",
			"UlduarC",
			"UlduarD",
			"UlduarE",
			"VaultOfArchavon",
		},
	},
	[ATLAS_DDL_EXPANSION] = {
		[ATLAS_DDL_EXPANSION_OLD_AO] = {
			"BlackfathomDeeps",
			"BlackfathomDeepsEnt",
			"BlackrockDepths",
			"BlackrockMountainEnt",
			"BlackwingLair",
			"DireMaulEast",
			"DireMaulEnt",
			"DireMaulNorth",
			"DireMaulWest",
			"Gnomeregan",
			"GnomereganEnt",
			"LowerBlackrockSpire",
			"Maraudon",
			"MaraudonEnt",
			"MoltenCore",
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",
			"TheTempleofAhnQiraj",
			"TheRuinsofAhnQiraj",
		},
		[ATLAS_DDL_EXPANSION_OLD_PZ] = {
			"RagefireChasm",
			"RazorfenDowns",
			"RazorfenKraul",
			"Scholomance",
			"ShadowfangKeep",
			"ScarletMonasteryEnt",
			"ScarletHalls",
			"ScarletMonastery",
			"StratholmeCrusader",
			"StratholmeGauntlet",
			"TheStockade",
			"TheSunkenTemple",
			"TheSunkenTempleEnt",
			"Uldaman",
			"UldamanEnt",
			"WailingCaverns",
			"WailingCavernsEnt",
			"ZulFarrak",
		},
		[ATLAS_DDL_EXPANSION_BC] = {
			"AuchAuchenaiCrypts",
			"AuchindounEnt",
			"AuchManaTombs",
			"AuchSethekkHalls",
			"AuchShadowLabyrinth",
			"BlackTempleBasement",
			"BlackTempleStart",
			"BlackTempleTop",
			"CFRSerpentshrineCavern",
			"CFRTheSlavePens",
			"CFRTheSteamvault",
			"CFRTheUnderbog",
			"CoilfangReservoirEnt",
			"CavernsOfTimeEnt",
			"CoTBlackMorass",
			"CoTHyjal",
			"CoTHyjalEnt",
			"CoTOldHillsbrad",
			"GruulsLair",
			"HellfireCitadelEnt",
			"HCBloodFurnace",
			"HCHellfireRamparts",
			"HCMagtheridonsLair",
			"HCTheShatteredHalls",
			"KarazhanEnd",
			"KarazhanEnt",
			"KarazhanStart",
			"MagistersTerrace",
			"SunwellPlateau",
			"TempestKeepEnt",
			"TempestKeepArcatraz",
			"TempestKeepBotanica",
			"TempestKeepMechanar",
			"TempestKeepTheEye",
		},
		[ATLAS_DDL_EXPANSION_WOTLK] = {
			"AhnKahet",
			"AzjolNerub",
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
		[ATLAS_DDL_EXPANSION_CATA] = {
			"BaradinHold",
			"BlackrockCaverns",
			"BlackrockMountainEnt",
			"BlackwingDescent",
			"CavernsOfTimeEnt",
			"CoTDragonSoulA",
			"CoTDragonSoulB",
			"CoTDragonSoulC",
			"CoTEndTime",
			"CoTHourOfTwilight",
			"CoTWellOfEternity",
			"Firelands",
			"GrimBatol",
			"HallsOfOrigination",
			"LostCityOfTolvir",
			"ShadowfangKeep",
			"TheBastionOfTwilight",
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"TheDeadminesEnt",
			"TheStonecore",
			"TheVortexPinnacle",
			"ThroneOfTheFourWinds",
			"ThroneOfTheTides",
			"ZulAman",
			"ZulGurub",
		},
		[ATLAS_DDL_EXPANSION_MOP] = {
			"GateoftheSettingSun",
			"HeartofFear",
			"MoguShanPalace",
			"MoguShanVaults",
			"ScarletMonasteryEnt",
			"ScarletHalls",
			"ScarletMonastery",
			"Scholomance",
			"ShadoPanMonasteryA",
			"ShadoPanMonasteryB",
			"SiegeofNiuzaoTempleA",
			"SiegeofNiuzaoTempleB",
			"SiegeofOrgrimmarA",
			"SiegeofOrgrimmarB",
			"SiegeofOrgrimmarC",
			"SiegeofOrgrimmarD",
			"StormstoutBrewery",
			"TempleOfTheJadeSerpent",
			"TerraceofEndlessSpring",
			"ThroneofThunderA",
			"ThroneofThunderB",
			"ThroneofThunderC",
			"ThroneofThunderD",
		},
		[ATLAS_DDL_EXPANSION_WOD] = {
			"Auchindoun",
			"BlackrockFoundryA",
			"BlackrockFoundryB",
			"BlackrockMountainEnt",
			"BloodmaulSlagMines",
			"TheEverbloomA",
			"TheEverbloomB",
			"GrimrailDepot",
			"HellfireA",
			"HellfireB",
			"HellfireC",
			"HellfireD",
			"HellfireE",
			"HellfireF",
			"HighmaulA",
			"HighmaulB",
			"IronDocks",
			"ShadowmoonBurialGrounds",
			"Skyreach",
			"UpperBlackrockSpire",
		},
		[ATLAS_DDL_EXPANSION_LEGION1] = {
			"TheArcwayEnt",
			"TheArcway",
			"AssaultonVioletHold",
			"BlackRookHoldA",
			"BlackRookHoldB",
			"BlackRookHoldC",
			"BlackRookHoldD",
			"CathedralofEternalNightA",
			"CathedralofEternalNightB",
			"CathedralofEternalNightC",
			"CathedralofEternalNightD",
			"CourtofStarsA",
			"CourtofStarsB",
			"DarkheartThicket",
			"EyeofAzshara",
			"HallsofValorA",
			"HallsofValorB",
			"HallsofValorC",
			"MawofSoulsA",
			"MawofSoulsB",
			"NeltharionsLair",
			"ReturntoKarazhanEnt", 		-- Legion
			"ReturntoKarazhanA", 		-- Legion
			"ReturntoKarazhanB", 		-- Legion
			"ReturntoKarazhanC", 		-- Legion
			"ReturntoKarazhanD", 		-- Legion
			"ReturntoKarazhanE", 		-- Legion
			"ReturntoKarazhanF", 		-- Legion
			"ReturntoKarazhanG", 		-- Legion
			"ReturntoKarazhanH", 		-- Legion
			"ReturntoKarazhanI", 		-- Legion
			"VaultoftheWardensA",
			"VaultoftheWardensB",
			"VaultoftheWardensC",
		},
		[ATLAS_DDL_EXPANSION_LEGION2] = {
			"TheEmeraldNightmareA",
			"TheEmeraldNightmareB",
			"TheEmeraldNightmareC",
			"TheEmeraldNightmareD",
			"TheEmeraldNightmareE",
			"TheEmeraldNightmareF",
			"TheEmeraldNightmareG",
			"TheEmeraldNightmareH",
			"TheNightholdEnt",
			"TheNightholdA",
			"TheNightholdB",
			"TheNightholdC",
			"TheNightholdD",
			"TheNightholdE",
			"TheNightholdF",
			"TheNightholdG",
			"TrialofValorA",
			"TrialofValorB",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
		},
	},
	[ATLAS_DDL_TYPE] = {
		[ATLAS_DDL_TYPE_INSTANCE_AB] = {
			"BlackfathomDeeps",		-- Classic WoW
			"BlackrockDepths",		-- Classic WoW
			"BlackwingLair",		-- Classic WoW
			"LowerBlackrockSpire",		-- Classic WoW
			"TheRuinsofAhnQiraj",		-- Classic WoW
			"TheTempleofAhnQiraj",		-- Classic WoW
			"AuchAuchenaiCrypts",		-- Burning Crusade
			"AuchManaTombs",		-- Burning Crusade
			"AuchSethekkHalls",		-- Burning Crusade
			"AuchShadowLabyrinth",		-- Burning Crusade
			"BlackTempleBasement",		-- Burning Crusade
			"BlackTempleStart",		-- Burning Crusade
			"BlackTempleTop",		-- Burning Crusade
			"AhnKahet",			-- WrathoftheLichKing
			"AzjolNerub",			-- WrathoftheLichKing
			"BaradinHold",			-- Catalysm
			"BlackrockCaverns",		-- Catalysm
			"BlackwingDescent",		-- Catalysm
			"TheBastionOfTwilight",		-- Catalysm
			"Auchindoun",			-- Draenor
			"BlackrockFoundryA",		-- Draenor
			"BlackrockFoundryB",		-- Draenor
			"BloodmaulSlagMines",		-- Draenor
			"UpperBlackrockSpire",		-- Draenor
			"TheArcway",			-- Legion
			"AssaultonVioletHold",		-- Legion
			"BlackRookHoldA",		-- Legion
			"BlackRookHoldB",		-- Legion
			"BlackRookHoldC",		-- Legion
			"BlackRookHoldD",
		},
		[ATLAS_DDL_TYPE_INSTANCE_CF] = {
			"TheDeadminesA",		-- Classic WoW, Catalysm
			"TheDeadminesB",		-- Classic WoW, Catalysm
			"DireMaulEast",			-- Classic WoW
			"DireMaulNorth",		-- Classic WoW
			"DireMaulWest",			-- Classic WoW
			"CFRSerpentshrineCavern",	-- Burning Crusade
			"CFRTheSlavePens",		-- Burning Crusade
			"CFRTheSteamvault",		-- Burning Crusade
			"CFRTheUnderbog",		-- Burning Crusade
			"CoTBlackMorass",		-- Burning Crusade
			"CoTHyjal",			-- Burning Crusade
			"CoTHyjalEnt",			-- Burning Crusade
			"CoTOldHillsbrad",		-- Burning Crusade
			"CoTOldStratholme",		-- Burning Crusade
			"DrakTharonKeep",		-- WrathoftheLichKing
			"FHHallsOfReflection",		-- WrathoftheLichKing
			"FHTheForgeOfSouls",		-- WrathoftheLichKing
			"FHPitOfSaron",			-- WrathoftheLichKing
			"TrialOfTheChampion",		-- WrathoftheLichKing
			"TrialOfTheCrusader",		-- WrathoftheLichKing
			"CoTDragonSoulA",		-- Catalysm
			"CoTDragonSoulB",		-- Catalysm
			"CoTDragonSoulC",		-- Catalysm
			"CoTEndTime",			-- Catalysm
			"CoTHourOfTwilight",		-- Catalysm
			"CoTWellOfEternity",		-- Catalysm
			"Firelands",			-- Catalysm
			"TheEverbloomA",		-- Draenor
			"TheEverbloomB",		-- Draenor
			"CathedralofEternalNightA",
			"CathedralofEternalNightB",
			"CathedralofEternalNightC",
			"CathedralofEternalNightD",
			"CourtofStarsA",		-- Legion
			"CourtofStarsB",		-- Legion
			"DarkheartThicket",		-- Legion
			"TheEmeraldNightmareA",		-- Legion
			"TheEmeraldNightmareB",		-- Legion
			"TheEmeraldNightmareC",		-- Legion
			"TheEmeraldNightmareD",		-- Legion
			"TheEmeraldNightmareE",		-- Legion
			"TheEmeraldNightmareF",		-- Legion
			"TheEmeraldNightmareG",		-- Legion
			"TheEmeraldNightmareH",		-- Legion
			"EyeofAzshara",			-- Legion
		},
		[ATLAS_DDL_TYPE_INSTANCE_GM] = {
			"Gnomeregan",			-- Classic WoW
			"Maraudon",			-- Classic WoW
			"MoltenCore",			-- Classic WoW
			"GruulsLair",			-- Burning Crusade
			"HCBloodFurnace",		-- Burning Crusade
			"HCHellfireRamparts",		-- Burning Crusade
			"HCMagtheridonsLair",		-- Burning Crusade
			"HCTheShatteredHalls",		-- Burning Crusade
			"KarazhanEnd",			-- Burning Crusade
			"KarazhanStart",		-- Burning Crusade
			"MagistersTerrace",		-- Burning Crusade
			"Gundrak",			-- WrathoftheLichKing
			"IcecrownCitadelA",		-- WrathoftheLichKing
			"IcecrownCitadelB",		-- WrathoftheLichKing
			"IcecrownCitadelC",		-- WrathoftheLichKing
			"GrimBatol",			-- Catalysm
			"HallsOfOrigination",		-- Catalysm
			"LostCityOfTolvir",		-- Catalysm
			"GateoftheSettingSun",		-- MoP
			"HeartofFear",			-- MoP
			"MoguShanPalace",		-- MoP
			"MoguShanVaults",		-- MoP
			"GrimrailDepot",		-- Draenor
			"HellfireA",			-- Draenor
			"HellfireB",			-- Draenor
			"HellfireC",			-- Draenor
			"HellfireD",			-- Draenor
			"HellfireE",			-- Draenor
			"HellfireF",			-- Draenor
			"HighmaulA",			-- Draenor
			"HighmaulB",			-- Draenor
			"IronDocks",			-- Draenor
			"HallsofValorA",		-- Legion
			"HallsofValorB",		-- Legion
			"HallsofValorC",		-- Legion
			"MawofSoulsA",			-- Legion
			"MawofSoulsB",			-- Legion
		},
		[ATLAS_DDL_TYPE_INSTANCE_NS] = {
			"RagefireChasm",		-- Classic WoW
			"RazorfenDowns",		-- Classic WoW
			"RazorfenKraul",		-- Classic WoW
			"ScarletHalls",			-- Classic WoW, MoP
			"ScarletMonastery",		-- Classic WoW, MoP
			"ShadowfangKeep",		-- Classic WoW, Catalysm
			"StratholmeCrusader",		-- Classic WoW
			"StratholmeGauntlet",		-- Classic WoW
			"TheStockade",			-- Classic WoW
			"TheSunkenTemple",		-- Classic WoW
			"Naxxramas",			-- Burning Crusade
			"SunwellPlateau",		-- Burning Crusade
			"ObsidianSanctum",		-- WrathoftheLichKing
			"OnyxiasLair",			-- WrathoftheLichKing
			"RubySanctum",			-- WrathoftheLichKing
			"TheNexus",			-- WrathoftheLichKing
			"TheEyeOfEternity",		-- WrathoftheLichKing
			"TheOculus",			-- WrathoftheLichKing
			"TheStonecore",			-- Catalysm
			"Scholomance",			-- MoP
			"ShadoPanMonasteryA",		-- MoP
			"ShadoPanMonasteryB",		-- MoP
			"SiegeofNiuzaoTempleA",		-- MoP
			"SiegeofNiuzaoTempleB",		-- MoP
			"SiegeofOrgrimmarA",		-- MoP
			"SiegeofOrgrimmarB",		-- MoP
			"SiegeofOrgrimmarC",		-- MoP
			"SiegeofOrgrimmarD",		-- MoP
			"StormstoutBrewery",		-- MoP
			"ShadowmoonBurialGrounds",	-- Draenor
			"Skyreach",			-- Draenor
			"NeltharionsLair",		-- Legion
			"TheNightholdA",		-- Legion
			"TheNightholdB",		-- Legion
			"TheNightholdC",		-- Legion
			"TheNightholdD",		-- Legion
			"TheNightholdE",		-- Legion
			"TheNightholdF",
			"TheNightholdG",
			"ReturntoKarazhanEnt", 		-- Legion
			"ReturntoKarazhanA", 		-- Legion
			"ReturntoKarazhanB", 		-- Legion
			"ReturntoKarazhanC", 		-- Legion
			"ReturntoKarazhanD", 		-- Legion
			"ReturntoKarazhanE", 		-- Legion
			"ReturntoKarazhanF", 		-- Legion
			"ReturntoKarazhanG", 		-- Legion
			"ReturntoKarazhanH", 		-- Legion
			"ReturntoKarazhanI", 		-- Legion
		},
		[ATLAS_DDL_TYPE_INSTANCE_TZ] = {
			"Uldaman",			-- Classic WoW
			"WailingCaverns",		-- Classic WoW
			"ZulFarrak",			-- Classic WoW
			"TempestKeepArcatraz",		-- Burning Crusade
			"TempestKeepBotanica",		-- Burning Crusade
			"TempestKeepMechanar",		-- Burning Crusade
			"TempestKeepTheEye",		-- Burning Crusade
			"VioletHold",			-- Burning Crusade
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
			"TheVortexPinnacle",		-- Catalysm
			"ThroneOfTheFourWinds",		-- Catalysm
			"ThroneOfTheTides",		-- Catalysm
			"ZulAman",			-- Catalysm
			"ZulGurub",			-- Catalysm
			"TempleOfTheJadeSerpent",	-- MoP
			"TerraceofEndlessSpring",	-- MoP
			"ThroneofThunderA",		-- MoP
			"ThroneofThunderB",		-- MoP
			"ThroneofThunderC",		-- MoP
			"ThroneofThunderD",		-- MoP
			"VaultoftheWardensA",		-- Legion
			"VaultoftheWardensB",		-- Legion
			"VaultoftheWardensC",		-- Legion
			"TrialofValorA",
			"TrialofValorB",
			"TombofSargerasA",
			"TombofSargerasB",
			"TombofSargerasC",
			"TombofSargerasD",
			"TombofSargerasE",
			"TombofSargerasF",
			"TombofSargerasG",
		},
		[ATLAS_DDL_TYPE_ENTRANCE] = {
			"BlackrockMountainEnt",		-- Classic WoW, Catalysm, Draenor
			"CavernsOfTimeEnt",		-- Catalysm, Burning Crusade
			"TheDeadminesEnt",		-- Classic WoW, Catalysm
			"ScarletMonasteryEnt",		-- Classic WoW, MoP
			"BlackfathomDeepsEnt",		-- Classic WoW
			"DireMaulEnt",			-- Classic WoW
			"GnomereganEnt",		-- Classic WoW
			"MaraudonEnt",			-- Classic WoW
			"TheSunkenTempleEnt",		-- Classic WoW
			"UldamanEnt",			-- Classic WoW
			"WailingCavernsEnt",		-- Classic WoW
			"AuchindounEnt",		-- Burning Crusade
			"CoilfangReservoirEnt",		-- Burning Crusade
			"CoTHyjalEnt",			-- Burning Crusade
			"HellfireCitadelEnt",		-- Burning Crusade
			"KarazhanEnt",			-- Burning Crusade
			"TempestKeepEnt",		-- Burning Crusade
			"IcecrownEnt",			-- WrathoftheLichKing
			"UlduarEnt",			-- WrathoftheLichKing
			"TheArcwayEnt",			-- Legion
			"TheNightholdEnt",		-- Legion
			"ReturntoKarazhanEnt", 		-- Legion
		},
	},
};
