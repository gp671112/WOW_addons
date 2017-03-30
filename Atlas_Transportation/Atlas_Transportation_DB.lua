-- $Id: Atlas_Transportation_DB.lua 81 2017-03-28 09:47:09Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail.com>

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


local myDB = {
	TransAllianceCosmos = {
		{  1, 10001, 424, 395 }; -- Stormwind City
		{  2, 10002, 436, 356 }; -- Ironforge
		{  3, 10003, 441, 337 }; -- Menethil Harbor
		{  4, 10004, 496, 351 }; -- Highbank
		{  5, 10005, 467, 410 }; -- Shattered Beachhead
		{  6, 10006, 448, 423 }; -- Karazhan
		{  7, 10007, 420, 451 }; -- Booty Bay
		{  8, 10008, 424, 300 }; -- Dalaran Crater
		{  9, 10009, 474, 193 }; -- Shattered Sun Staging Area
		{ 10, 10010,  60, 219 }; -- Darnassus
		{ 11, 10011,  77, 232 }; -- Rut'theran Village
		{ 12, 10012,  24, 256 }; -- The Exodar
		{ 13, 10013, 131, 268 }; -- Nordrassil
		{ 14, 10014, 130, 342 }; -- Ratchet
		{ 15, 10015, 140, 374 }; -- Theramore
		{ 16, 10016, 136, 422 }; -- Caverns of Time
		{ 17, 10017,  98, 441 }; -- Ramkahen
		{ 18, 10018, 464,  91 }; -- The Stair of Destiny
		{ 19, 10019, 409, 116 }; -- Shattrath City
		{ 20, 10020, 221, 167 }; -- Valiance Keep
		{ 21, 10021, 331, 181 }; -- Valgarde
		{ 22, 10022, 275, 130 }; -- Dalaran (Northrend)
		{ 23, 10023, 274, 151 }; -- Wyrmrest Temple
		{ 24, 10024, 296, 466 }; -- Paw'Don Village
		{ 25, 10025, 262, 452 }; -- Shrine of Seven Stars
		{ 26, 10026, 190,  84 }; -- Stormshield
		{ 27, 10027, 130, 117 }; -- Lunarfall
		{ 28, 10028, 314, 299 }; -- Dalaran
	};
	TransHordeCosmos = {
		{  1, 10001, 135, 307 }; -- Orgrimmar
		{  2, 10002,  89, 344 }; -- Thunder Bluff
		{  3, 10003, 128, 267 }; -- Nordrassil
		{  4, 10004, 127, 343 }; -- Ratchet
		{  5, 10005, 133, 424 }; -- Caverns of Time
		{  6, 10006,  95, 441 }; -- Ramkahen
		{  7, 10007, 473, 191 }; -- Shattered Sun Staging Area
		{  8, 10008, 478, 228 }; -- Silvermoon City
		{  9, 10009, 417, 278 }; -- Brill
		{ 10, 10010, 427, 285 }; -- Undercity
		{ 11, 10011, 425, 300 }; -- Dalaran Crater
		{ 12, 10012, 497, 342 }; -- Dragonmaw Port
		{ 13, 10013, 468, 415 }; -- Shattered Landing
		{ 14, 10014, 453, 422 }; -- Karazhan
		{ 15, 10015, 427, 431 }; -- Grom'gol Base Camp
		{ 16, 10016, 426, 451 }; -- Booty Bay
		{ 17, 10017, 463,  90 }; -- The Stair of Destiny
		{ 18, 10018, 409, 114 }; -- Shattrath City
		{ 19, 10019, 214, 160 }; -- Warsong Hold
		{ 20, 10020, 341, 173 }; -- Vengeance Landing
		{ 21, 10021, 274, 130 }; -- Dalaran (Northrend)
		{ 22, 10022, 276, 152 }; -- Wyrmrest Temple
		{ 23, 10023, 279, 422 }; -- Honeydew Village
		{ 24, 10024, 262, 446 }; -- Shrine of Two Moons
		{ 25, 10025, 190,  73 }; -- Warspear
		{ 26, 10026,  66,  66 }; -- Frostwall Garrison
		{ 27, 10027, 313, 299 }; -- Dalaran
	};
	TransAllianceStormwindCity = {
		{ "A", 10001,  54, 273, 248, 372, "Orange" }; -- Rut'theran Village
		{ "B", 10002,  24, 140, 216, 203, "Orange" }; -- Valiance Keep
		{ "A", 10003, 228, 418, 466, 553, "Purple" }; -- The Stair of Destiny
		{ "B", 10004, 237, 406, 477, 540, "Purple" }; -- Fuselight-by-the-Sea
		{ "C", 10005, 358, 103, 635, 155, "Purple" }; -- Paw'Don Village
		{ "D", 10006, 389, 111, 671, 163, "Purple" }; -- Baradin Base Camp
		{ "E", 10007, 395,  99, 677, 149, "Purple" }; -- Darkbreak Cove
		{ "F", 10008, 408,  96, 691, 151, "Purple" }; -- Highbank
		{ "G", 10009, 415, 109, 704, 163, "Purple" }; -- Nordrassil
		{ "H", 10010, 411, 119, 699, 181, "Purple" }; -- Ramkahen
		{ "I", 10011, 399, 120, 686, 182, "Purple" }; -- Temple of Earth
		{ "J", 10012, 487, 182, 794, 260, "Purple" }; -- Stormshield
		{ "K", 10013, 441, 169, 736, 240, "Purple" }; -- Dalaran
		{ "1", 10014, 353, 178, 624, 250, "White" }; -- Ironforge
		{ "2", 10015, 374, 346, 656, 464, "White" }; -- Stormwind City
	};
	TransHordeOrgrimmar = {
		{ "A", 10001, 198, 321, 462, 414, "Purple"}; -- Shattered Landing
		{ "B", 10002, 177, 308, 436, 396, "Purple"}; -- The Stair of Destiny
		{ "B", 10002, 117, 352, 361, 445, "Purple"}; -- The Stair of Destiny
		{ "C", 10003, 201, 224, 462, 288, "Purple"}; -- Hellscream's Grasp
		{ "D", 10004, 209, 215, 475, 280, "Purple"}; -- Ramkahen
		{ "E", 10005, 211, 202, 476, 264, "Purple"}; -- Vashj'ir
		{ "F", 10006, 221, 200, 493, 264, "Purple"}; -- Temple of Earth
		{ "G", 10007, 227, 211, 497, 278, "Purple"}; -- Nordrassil
		{ "H", 10008, 219, 222, 486, 283, "Purple"}; -- Dragonmaw Port
		{ "I", 10009, 341, 224, 643, 293, "Purple"}; -- Honeydew Village
		{ "J", 10010, 198, 362, 463, 461, "Purple"}; -- Warspear
		{ "K", 10016, 188, 326, 451, 424, "Purple"}; -- Dalaran
		{ "A", 10011, 170, 329, 426, 424, "Orange" }; -- Thunder Bluff
		{ "B", 10012, 182, 322, 440, 410, "Orange" }; -- Warsong Hold
		{ "C", 10013, 224, 292, 492, 375, "Orange" }; -- Undercity
		{ "D", 10014, 232, 279, 506, 355, "Orange" }; -- Grom'gol Base Camp
		{ "1", 10015, 212, 308, 481, 393, "White" }; -- Wind Rider Master
		{ "A", 10017,  17, 362, 226, 463, "Blue" }; -- Northern Barrens
		{ "B", 10018, 221, 471, 486, 604, "Blue" }; -- Durota
		{ "C", 10019, 399,  27, 711,  44, "Blue" }; -- Azshara
	};
	TransAllianceDraenor = {
		{ "A", 10052, 278, 259 }; -- Khadgar's Tower
		{ "A'", 10053, 450, 10 }; -- Darnassus
		{ "B'", 10054, 494, 60 }; -- Ironforge
		{ "C'", 10055, 493, 136 }; -- Stormwind City
		{ "1", 10001, 307, 302 }; -- Lunarfall
		{ "2", 10002, 337, 314 }; -- Exile's Rise
		{ "3", 10003, 338, 331 }; -- Embaari Village
		{ "4", 10004, 367, 339 }; -- Path of Light
		{ "5", 10005, 365, 320 }; -- Elodor
		{ "6", 10006, 389, 345 }; -- Tranquil Court
		{ "7", 10007, 365, 356 }; -- The Draakorium
		{ "8", 10008, 328, 355 }; -- Twilight Glade
		{ "9", 10009, 337, 382 }; -- Socrethar's Rise
		{ "10", 10010, 367, 393 }; -- Darktide Roost
		{ "11", 10011, 288, 337 }; -- Akeeta's Hovel
		{ "12", 10012, 283, 288 }; -- Anchorite's Sojourn
		{ "13", 10013, 260, 292 }; -- Terokkar Refuge
		{ "14", 10014, 229, 305 }; -- Exarch's Refuge
		{ "15", 10015, 210, 316 }; -- Retribution Point
		{ "16", 10016, 224, 274 }; -- Shattrath City
		{ "17", 10017, 245, 251 }; -- Redemption Rise
		{ "18", 10018, 260, 245 }; -- Fort Wrynn
		{ "19", 10019, 275, 248 }; -- Zangarra
		{ "20", 10020, 271, 218 }; -- Bastion Rise
		{ "21", 10021, 273, 190 }; -- Deeproot
		{ "22", 10022, 290, 165 }; -- Highpass
		{ "23", 10023, 317, 155 }; -- Wildwood Wash
		{ "24", 10024, 299, 139 }; -- Everbloom Wilds
		{ "25", 10025, 331, 109 }; -- Everbloom Overlook
		{ "26", 10026, 273, 152 }; -- Breaker's Crown
		{ "27", 10027, 259, 120 }; -- Skysea Point
		{ "28", 10028, 266, 95 }; -- Iron Docks
		{ "29", 10029, 237, 349 }; -- Apexis Excavation
		{ "30", 10030, 245, 395 }; -- Southport
		{ "31", 10031, 254, 372 }; -- Veil Terokk
		{ "32", 10032, 261, 355 }; -- Crow's Crook
		{ "33", 10033, 284, 370 }; -- Talon Watch
		{ "34", 10034, 281, 412 }; -- Pinchwhistle Gearworks
		{ "35", 10035, 171, 258 }; -- The Ring of Trials
		{ "36", 10036, 136, 278 }; -- Telaari Station
		{ "37", 10037, 111, 293 }; -- Nivek's Overlook
		{ "38", 10038, 138, 254 }; -- Yrel's Watch
		{ "39", 10039, 117, 240 }; -- Rilzit's Holdfast
		{ "40", 10040, 134, 239 }; -- Joz's Rylaks
		{ "41", 10041, 155, 237 }; -- Throne of the Elements
		{ "42", 10042, 243, 187 }; -- Iron Siegeworks
		{ "43", 10043, 177, 128 }; -- Bloodmaul Slag Mines
		{ "44", 10044, 431, 242 }; -- Stormshield
		{ "45", 10045, 279, 233 }; -- The Iron Front
		{ "46", 10046, 301, 244 }; -- Sha'naari Refuge
		{ "47", 10047, 335, 249 }; -- Malo's Lookout
		{ "48", 10048, 353, 240 }; -- Lion's Watch
		{ "49", 10049, 300, 221 }; -- Aktar's Post
		{ "50", 10050, 330, 223 }; -- Vault of the Earth
		{ "51", 10051, 352, 207 }; -- Throne of Kil'jaeden
	};
	TransHordeDraenor = {
		{ "A", 10051, 283, 260 }; -- Khadgar's Tower
		{ "A'", 10052, 488, 118 }; -- Orgrimmar
		{ "B'", 10053, 489, 245 }; -- Thunder Bluff
		{ "C'", 10054, 378, 4 }; -- Undercity
		{ "1", 10001, 171, 185 }; -- Frostwall Garrison
		{ "2", 10002, 120, 170 }; -- Wor'gol
		{ "3", 10003, 132, 148 }; -- Bladespire Fortress
		{ "4", 10004, 152, 165 }; -- Stonefang Outpost
		{ "5", 10005, 138, 116 }; -- Throm'Var
		{ "6", 10006, 177, 150 }; -- Darkspear's Edge
		{ "7", 10007, 178, 126 }; -- Bloodmaul Slag Mines
		{ "8", 10008, 219, 175 }; -- Wolf's Stand
		{ "9", 10009, 238, 173 }; -- Thunder Pass
		{ "10", 10010, 259, 208 }; -- Evermorn Springs
		{ "11", 10011, 274, 219 }; -- Bastion Rise
		{ "12", 10012, 277, 176 }; -- Beastwatch
		{ "13", 10013, 272, 151 }; -- Breaker's Crown
		{ "14", 10014, 259, 119 }; -- Skysea Point
		{ "15", 10015, 267, 91 }; -- Iron Docks
		{ "16", 10016, 308, 144 }; -- Everbloom Wilds
		{ "17", 10017, 331, 107 }; -- Everbloom Overlook
		{ "18", 10018, 277, 249 }; -- Zangarra
		{ "19", 10019, 262, 256 }; -- Vol'jin's Pride
		{ "20", 10020, 250, 233 }; -- Frostwolf Overlook
		{ "21", 10021, 235, 273 }; -- Durotan's Grasp
		{ "22", 10022, 219, 275 }; -- Shattrath City
		{ "23", 10023, 261, 293 }; -- Terokkar Refuge
		{ "24", 10024, 227, 306 }; -- Exarch's Refuge
		{ "25", 10025, 212, 315 }; -- Retribution Point
		{ "26", 10026, 245, 349 }; -- Apexis Excavation
		{ "27", 10027, 269, 360 }; -- Crow's Crook
		{ "28", 10028, 242, 375 }; -- Axefall
		{ "29", 10029, 262, 373 }; -- Veil Terokk
		{ "30", 10030, 284, 369 }; -- Talon Watch
		{ "31", 10031, 281, 409 }; -- Pinchwhistle Gearworks
		{ "32", 10032, 173, 258 }; -- Wor'var
		{ "33", 10033, 161, 268 }; -- The Ring of Trials
		{ "34", 10034, 156, 235 }; -- Throne of the Elements
		{ "35", 10035, 135, 242 }; -- Joz's Rylaks
		{ "36", 10036, 119, 240 }; -- Rilzit's Holdfast
		{ "37", 10037, 114, 266 }; -- Riverside Post
		{ "38", 10038, 113, 294 }; -- Nivek's Overlook
		{ "39", 10039, 288, 336 }; -- Akeeta's Hovel
		{ "40", 10040, 343, 312 }; -- Exile's Rise
		{ "41", 10041, 332, 382 }; -- Socrethar's Rise
		{ "42", 10042, 366, 392 }; -- Darktide Roost
		{ "43", 10043, 436, 196 }; -- Warspear
		{ "44", 10044, 279, 238 }; -- The Iron Front
		{ "45", 10045, 302, 244 }; -- Sha'naari Refuge
		{ "46", 10046, 334, 249 }; -- Vault of the Earth
		{ "47", 10047, 361, 227 }; -- Vol'mar
		{ "48", 10048, 300, 222 }; -- Aktar's Post
		{ "49", 10049, 331, 224 }; -- Malo's Lookout
		{ "50", 10001, 349, 207 }; -- Throne of Kil'jaeden
	};
	TransAllianceAshran = {
		{ "A", 10001, 153, 331 };
		{ "B", 10002, 187, 305 };
		{ "C", 10003, 258, 333 };
		{ "D", 10004, 306, 299 };
		{ "E", 10005, 328, 379 };
	};
	TransHordeAshran = {
		{ "A", 10001, 205, 135 };
		{ "B", 10002, 252, 169 };
		{ "C", 10003, 240, 98 };
		{ "D", 10004, 313, 91 };
		{ "E", 10005, 289, 202 };
	};
	TransAllianceBrokenIsles = {
		{  "A", 10040, 230, 357, 432, 463, "Purple" }; -- Greyfang Enclave
		{  "B", 10041, 237, 349, 441, 452, "Purple" }; -- Chamber of the Guardian
		{  "C", 10042, 290, 133, 512, 170, "Purple" }; -- Portal to Dalaran
		{  "1", 10001, 249, 341, 454, 447, "TaxiNeutral" }; -- Krasus' Landing
		{  "2", 10002, 151, 378, 324, 497, "TaxiNeutral" }; -- Watchers' Aerie
		{  "3", 10003, 144, 363, 319, 477, "TaxiNeutral" }; -- Wardens' Redoubt
		{  "4", 10004, 165, 336, 348, 439, "TaxiNeutral" }; -- Shackle's Den
		{  "5", 10005, 130, 303, 297, 398, "TaxiNeutral" }; -- Illidari Stand
		{  "6", 10006,  98, 314, 255, 413, "TaxiNeutral" }; -- Illidari Perch
		{  "7", 10007, 191, 275, 380, 358, "TaxiNeutral" }; -- Felblaze Ingress
		{  "8", 10008, 138, 266, 307, 349, "TaxiNeutral" }; -- Azurewing Repose
		{  "9", 10009, 116, 238, 279, 307, "TaxiNeutral" }; -- Challiane's Terrace
		{ "10", 10010, 222, 450, 419, 587, "TaxiNeutral" }; -- Eye of Azshara
		{ "11", 10011, 147, 197, 327, 260, "TaxiNeutral" }; -- Lorlathil
		{ "12", 10012,  75, 185, 223, 240, "TaxiNeutral" }; -- Gloaming Reef
		{ "13", 10013, 117, 175, 280, 226, "TaxiNeutral" }; -- Bradensbrook
		{ "14", 10014, 149, 177, 327, 226, "TaxiNeutral" }; -- Garden of the Moon
		{ "15", 10015, 183, 163, 368, 209, "TaxiNeutral" }; -- Starsong Refuge
		{ "16", 10016, 246, 164, 453, 209, "TaxiNeutral" }; -- Obsidian Overlook
		{ "17", 10017, 277, 164, 503, 211, "TaxiNeutral" }; -- Ironhorn Enclave
		{ "18", 10018, 210, 126, 408, 162, "TaxiNeutral" }; -- Sylvan Falls
		{ "19", 10019, 244, 116, 449, 145, "TaxiNeutral" }; -- Thunder Totem
		{ "20", 10020, 283, 121, 504, 158, "TaxiNeutral" }; -- Stonehoof Watch
		{ "21", 10021, 224,  97, 421, 119, "TaxiNeutral" }; -- Nesingwary
		{ "22", 10022, 263,  84, 479, 106, "TaxiNeutral" }; -- Skyhorn
		{ "23", 10023, 191,  68, 379,  81, "TaxiNeutral" }; -- Felbane Camp
		{ "24", 10024, 217,  67, 414,  81, "TaxiNeutral" }; -- The Witchwood
		{ "25", 10025, 279,  51, 496,  57, "TaxiNeutral" }; -- Prepfoot
		{ "26", 10026, 228,  12, 429,  17, "TaxiNeutral" }; -- Shipwreck Cove
		{ "27", 10027, 297, 152, 522, 194, "TaxiAlliance" }; -- Skyfire Triage Camp (A)
		{ "28", 10028, 318, 176, 542, 227, "TaxiAlliance" }; -- Lorna's Watch (A)
		{ "29", 10029, 344, 127, 588, 163, "TaxiNeutral" }; -- Stormtorn Foothills
		{ "30", 10030, 369, 154, 620, 198, "TaxiNeutral" }; -- Valdisdall
		{ "31", 10031, 404, 171, 664, 219, "TaxiAlliance" }; -- Greywatch (A)
		{ "32", 10032, 442,  83, 717, 107, "TaxiNeutral" }; -- Shield's Rest
		{ "33", 10033, 353, 223, 600, 289, "TaxiNeutral" }; -- Hafr Fjall
		{ "34", 10034, 205, 198, 405, 255, "TaxiNeutral" }; -- Irongrove Retreat
		{ "35", 10035, 225, 227, 433, 284, "TaxiNeutral" }; -- Meredil
		{ "36", 10036, 291, 212, 521, 282, "TaxiNeutral" }; -- Crimson Thicket
		{ "37", 10037, 295, 368, 523, 481, "TaxiNeutral" }; -- Deliverance Point
		{ "38", 10038, 341, 351, 577, 458, "TaxiNeutral" }; -- Aalgen Point
		{ "39", 10039, 304, 322, 533, 424, "TaxiNeutral" }; -- Vengeance Point
		{  "1", 10100, 110, 112, 276, 146, "DRUID" }; -- The Dreamgrove
		{  "2", 10101, 193,  91, 400, 119, "HUNTER" }; -- Trueshot Lodge
		{  "3", 10102, 387, 365, 646, 483, "DEATHKNIGHT" }; -- Acherus: The Ebon Hold
		{  "1", 10201, 169, 245, 350, 321, "MAGE" }; -- Ley-Ruins of Zarkhenar
		{  "2", 10202, 193, 118, 387, 151, "MAGE" }; -- Sylvan Falls
		{  "3", 10203, 298, 170, 522, 220, "MAGE" }; -- Weeping Bluffs
		{  "4", 10204, 139, 172, 313, 219, "MAGE" }; -- Temple of Elune
		{  "5", 10205, 226, 238, 433, 291, "MAGE" }; -- Meredil
		{  "1", 10301, 123, 104, 288, 127, "HUNTER" }; -- The Dreamgrove
		{  "2", 10302,  77, 301, 228, 394, "HUNTER" }; -- Faronaar
		{  "3", 10303, 156, 371, 332, 484, "HUNTER" }; -- Isle of the Watchers
		{  "4", 10304, 247, 282, 451, 363, "HUNTER" }; -- Western Suramar
		{  "5", 10305, 316, 260, 545, 340, "HUNTER" }; -- Eastern Suramar
		{  "6", 10306, 312, 204, 538, 263, "HUNTER" }; -- Thorim's Peak
		{  "7", 10307, 333, 131, 572, 165, "HUNTER" }; -- Nastrondir
		{  "8", 10308, 275, 130, 489, 168, "HUNTER" }; -- Eastern Highmountain
	};
	TransHordeBrokenIsles = {
		{ "A", 10040, 239, 336, 445, 442, "Purple" }; -- Windrunner's Sanctuary
		{ "B", 10041, 237, 348, 442, 458, "Purple" }; -- Chamber of the Guardian
		{  "C", 10042, 290, 133, 512, 170, "Purple" }; -- Portal to Dalaran
		{  "1", 10001, 249, 341, 454, 447, "TaxiNeutral" }; -- Krasus' Landing
		{  "2", 10002, 151, 378, 324, 497, "TaxiNeutral" }; -- Watchers' Aerie
		{  "3", 10003, 144, 363, 319, 477, "TaxiNeutral" }; -- Wardens' Redoubt
		{  "4", 10004, 165, 336, 348, 439, "TaxiNeutral" }; -- Shackle's Den
		{  "5", 10005, 130, 303, 297, 398, "TaxiNeutral" }; -- Illidari Stand
		{  "6", 10006,  98, 314, 255, 413, "TaxiNeutral" }; -- Illidari Perch
		{  "7", 10007, 191, 275, 380, 358, "TaxiNeutral" }; -- Felblaze Ingress
		{  "8", 10008, 138, 266, 307, 349, "TaxiNeutral" }; -- Azurewing Repose
		{  "9", 10009, 116, 238, 279, 307, "TaxiNeutral" }; -- Challiane's Terrace
		{ "10", 10010, 222, 450, 419, 587, "TaxiNeutral" }; -- Eye of Azshara
		{ "11", 10011, 147, 197, 327, 260, "TaxiNeutral" }; -- Lorlathil
		{ "12", 10012,  75, 185, 223, 240, "TaxiNeutral" }; -- Gloaming Reef
		{ "13", 10013, 117, 175, 280, 226, "TaxiNeutral" }; -- Bradensbrook
		{ "14", 10014, 149, 177, 327, 226, "TaxiNeutral" }; -- Garden of the Moon
		{ "15", 10015, 183, 163, 368, 209, "TaxiNeutral" }; -- Starsong Refuge
		{ "16", 10016, 246, 164, 453, 209, "TaxiNeutral" }; -- Obsidian Overlook
		{ "17", 10017, 277, 164, 503, 211, "TaxiNeutral" }; -- Ironhorn Enclave
		{ "18", 10018, 210, 126, 408, 162, "TaxiNeutral" }; -- Sylvan Falls
		{ "19", 10019, 244, 116, 449, 145, "TaxiNeutral" }; -- Thunder Totem
		{ "20", 10020, 283, 121, 504, 158, "TaxiNeutral" }; -- Stonehoof Watch
		{ "21", 10021, 224,  97, 421, 119, "TaxiNeutral" }; -- Nesingwary
		{ "22", 10022, 263,  84, 479, 106, "TaxiNeutral" }; -- Skyhorn
		{ "23", 10023, 191,  68, 379,  81, "TaxiNeutral" }; -- Felbane Camp
		{ "24", 10024, 217,  67, 414,  81, "TaxiNeutral" }; -- The Witchwood
		{ "25", 10025, 279,  51, 496,  57, "TaxiNeutral" }; -- Prepfoot
		{ "26", 10026, 228,  12, 429,  17, "TaxiNeutral" }; -- Shipwreck Cove
		{ "27", 10027, 311, 122, 535, 153, "TaxiHorde" }; -- Forsaken Foothold (H)
		{ "28", 10028, 327, 169, 560, 219, "TaxiHorde" }; -- Cullen's Post (H)
		{ "29", 10029, 344, 127, 588, 163, "TaxiNeutral" }; -- Stormtorn Foothills
		{ "30", 10030, 369, 154, 620, 198, "TaxiNeutral" }; -- Valdisdall
		{ "31", 10031, 355, 191, 599, 249, "TaxiHorde" }; -- Dreadwake's Landing (H)
		{ "32", 10032, 442,  83, 717, 107, "TaxiNeutral" }; -- Shield's Rest
		{ "33", 10033, 353, 223, 600, 289, "TaxiNeutral" }; -- Hafr Fjall
		{ "34", 10034, 205, 198, 405, 255, "TaxiNeutral" }; -- Irongrove Retreat
		{ "35", 10035, 225, 227, 433, 284, "TaxiNeutral" }; -- Meredil
		{ "36", 10036, 291, 212, 521, 282, "TaxiNeutral" }; -- Crimson Thicket
		{ "37", 10037, 295, 368, 523, 481, "TaxiNeutral" }; -- Deliverance Point
		{ "38", 10038, 341, 351, 577, 458, "TaxiNeutral" }; -- Aalgen Point
		{ "39", 10039, 304, 322, 533, 424, "TaxiNeutral" }; -- Vengeance Point
		{  "1", 10100, 110, 112, 276, 146, "DRUID" }; -- The Dreamgrove
		{  "2", 10101, 193,  91, 400, 119, "HUNTER" }; -- Trueshot Lodge
		{  "3", 10102, 387, 365, 646, 483, "DEATHKNIGHT" }; -- Acherus: The Ebon Hold
		{  "1", 10201, 169, 245, 350, 321, "MAGE" }; -- Ley-Ruins of Zarkhenar
		{  "2", 10202, 193, 118, 387, 151, "MAGE" }; -- Sylvan Falls
		{  "3", 10203, 298, 170, 522, 220, "MAGE" }; -- Weeping Bluffs
		{  "4", 10204, 139, 172, 313, 219, "MAGE" }; -- Temple of Elune
		{  "5", 10205, 226, 238, 433, 291, "MAGE" }; -- Meredil
		{  "1", 10301, 123, 104, 288, 127, "HUNTER" }; -- The Dreamgrove
		{  "2", 10302,  77, 301, 228, 394, "HUNTER" }; -- Faronaar
		{  "3", 10303, 156, 371, 332, 484, "HUNTER" }; -- Isle of the Watchers
		{  "4", 10304, 247, 282, 451, 363, "HUNTER" }; -- Western Suramar
		{  "5", 10305, 316, 260, 545, 340, "HUNTER" }; -- Eastern Suramar
		{  "6", 10306, 312, 204, 538, 263, "HUNTER" }; -- Thorim's Peak
		{  "7", 10307, 333, 131, 572, 165, "HUNTER" }; -- Nastrondir
		{  "8", 10308, 275, 130, 489, 168, "HUNTER" }; -- Eastern Highmountain
	};
	TransSuramar = {
		{ "A", 10001, 155, 248, 288, 292, "Purple" }; -- Ruins of Elune'eth
		{ "B", 10002, 209, 175, 351, 209, "Purple" }; -- Tel'anor
		{ "C", 10003,  24, 142, 142, 177, "Purple" }; -- Falanaar
		{ "D", 10004, 103,  23, 231,  34, "Purple" }; -- Moonfall Overlook
		{ "E", 10005, 182, 428, 319, 499, "Purple" }; -- Felsoul Hold
		{ "F", 10006, 242, 357, 387, 412, "Purple" }; -- Sanctum of Order
		{ "G", 10007, 220, 450, 362, 515, "Purple" }; -- Lunastre Estate
		{ "H", 10008, 263, 464, 412, 535, "Purple" }; -- The Waning Crescent
		{ "I", 10009, 414, 329, 588, 389, "Purple" }; -- Twilight Vineyards
		{ "J", 10010, 301, 445, 458, 517, "Purple" }; -- Evermoon Terrace
		{ "K", 10011, 326, 388, 482, 453, "Purple" }; -- Astravar Harbor
		{ "1", 10101,  58, 156, 179, 184, "TaxiNeutral" }; -- Irongrove Retreat
		{ "2", 10102, 134, 263, 264, 308, "TaxiNeutral" }; -- Meredil
		{ "3", 10103, 414, 216, 583, 252, "TaxiNeutral" }; -- Crimson Thicket
		{ "4", 10104, 472, 401, 648, 462, "TaxiNeutral" }; -- Eastern Suramar
		{ "5", 10105, 200, 474, 349, 543, "TaxiNeutral" }; -- Western Suramar
	};
	TransDalaran = {
		{ "A", 10014, 184, 279 }; -- Greyfang Enclave
		{ "B", 10015, 262, 145 }; -- Windrunner's Sanctuary
		{ "C", 10016, 234, 221 }; -- Chamber of the Guardian
		{ "1", 10013, 335, 232 }; -- Aludane Whitecloud <Flight Master>
		{ "A", 10001, 463, 288 }; -- Illidari Gateway
		{ "A", 10002, 345, 200 }; -- Talua <Eagle Keeper>
		{ "A", 10003, 288, 113 }; -- Portal to Sanctum of Light
		{ "B", 10004, 152, 294 }; -- Portal to Sanctum of Light
		{ "A", 10005, 296, 125 }; -- Portal to Netherlight Temple
		{ "B", 10006, 188, 254 }; -- Portal to Netherlight Temple
		{ "A", 10007, 242, 292 }; -- Glorious Goods
		{ "B", 10008, 256, 174 }; -- One More Glass
		{ "C", 10009, 210, 162 }; -- Tanks for Everything
		{ "A", 10010, 319, 222 }; -- Portal to the Maelstrom
		{ "A", 10011, 155, 204 }; -- Portal to Dreadscar Rift
		{ "A", 10012, 354, 217 }; -- Jump to Skyhold
	};
	TransEmeraldDreamway = {
		{ "A", 10001, 234, 147 }; -- The Dreamgrove
		{ "B", 10002, 145, 175 }; -- Grizzly Hills
		{ "C", 10003, 79, 217 }; -- Dream Bough
		{ "D", 10004, 93, 410 }; -- Stormrage Barrow Dens
		{ "E", 10005, 196, 359 }; -- Twilight Grove
		{ "F", 10006, 276, 347 }; -- Seradane
		{ "G", 10007, 299, 285 }; -- Nordrassil
	
	};
};


for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
