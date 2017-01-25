 -- $Id: Atlas_WrathoftheLichKing_DB.lua 20 2017-01-16 10:23:29Z arith $
--[[

	Atlas, a World of Warcraft instance map browser
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


-- Atlas Map NPC Description Data
--************************************************
-- Wrath of the Lich King Instances
--************************************************
local myDB = {
	AhnKahet = {
		{ 1, 580, 340, 192 }; -- Elder Nadox
		{ 2, 581, 312, 258 }; -- Prince Taldaram
		{ 3, 583, 320, 333 }; -- Amanitar
		{ 4, 582, 244, 335 }; -- Jedoga Shadowseeker
		{ 5, 584, 125, 263 }; -- Herald Volazj
		{ "A", 10001, 431, 341 };
		{ "B", 10002, 56, 263 }; 
		{ "1'", 10003, 87, 263 };
	};
	AzjolNerub = {
		{ 1, 585, 180, 120 }; -- Krik'thir the Gatewatcher
		{ 2, 586, 301, 118 }; -- Hadronox
		{ 3, 587, 308, 352 }; -- Anub'arak
		{ "A", 10001, 11, 238 };
		{ "B", 10002, 92, 367 };
		{ "B", 10002, 276, 118 };
		{ "C", 10003, 468, 444 };
		{ "1'", 10004, 90, 345 };		
	};
	CoTOldStratholme = {
		{ 3, 613, 312, 80 }; -- Chrono-Lord Epoch
		{ 4, 10004, 232, 150 }; -- Infinite Corruptor
		{ 5, 614, 117, 161 }; -- Mal'Ganis
		{ "A", 10001, 391, 476 };
		{ "B", 10002, 125, 207 };
		{ "X", 10003, 282, 143 };
		{ "X", 10003, 286, 191 };
		{ "X", 10003, 205, 213 };
		{ "X", 10003, 247, 226 };
		{ "X", 10003, 196, 249 };
		{ "1'", 10005, 229, 357 };
		{ "1'", 10005, 386, 419 };
	};
	DrakTharonKeep = {
		{ 1, 588, 170, 50 }; -- Trollgore
		{ 2, 589, 236, 155 }; -- Novos the Summoner
		{ 3, 590, 415, 441 }; -- King Dred
		{ 4, 591, 418, 174 }; -- The Prophet Tharon'ja
		{ "A", 10001, 19, 275 };
		{ "B", 10002, 169, 214 };
		{ "B", 10002, 395, 374 };
		{ "C", 10002, 141, 47 };
		{ "C", 10002, 366, 200 };
		{ "1'", 10003, 457, 410 };
		{ "2'", 10004, 367, 174 };
	};
	FHHallsOfReflection = {
		{ 1, 601, 213, 375 }; -- Falric
		{ 2, 602, 273, 317 }; -- Marwyn
		{ 3, 603, 47, 153 }; -- Escape from Arthas
		{ "A", 10001, 318, 415 };
		{ "B", 10002, 492, 375 };
		{ "1'", 10003, 299, 395 };
	};
	FHPitOfSaron = {
		{ 1, 608, 397, 295 }; -- Forgemaster Garfrost
		{ 2, 609, 251, 226 }; -- Ick & Krick
		{ 3, 610, 224, 154 }; -- Scourgelord Tyrannus
		{ "A", 10001, 186, 425 };
		{ "B", 10002, 220, 120 };
		{ "1'", 10003, 194, 413 };
	};
	FHTheForgeOfSouls = {
		{ 1, 615, 212, 252 }; -- Bronjahm
		{ 2, 616, 230, 39 }; -- Devourer of Souls
		{ "A", 10001, 388, 480 };
		{ "B", 10002, 209, 24 };
		{ "1'", 10003, 363, 488 };
	};
	Gundrak = {
		{ 1, 592, 345, 244 }; -- Slad'ran
		{ 2, 593, 266, 340 }; -- Drakkari Colossus
		{ 3, 594, 198, 245 }; -- Moorabi
		{ 4, 595, 83, 367 }; -- Eck the Ferocious
		{ 5, 596, 267, 90}; -- Gal'darah
		{ "A", 10001, 165, 170 };
		{ "A", 10001, 373, 170 };
		{ "B", 10002, 172, 24 };
		{ "B", 10002, 371, 140 };
		{ "1'", 10003, 265, 325 };
	};
	IcecrownCitadelA = {
		{ "A", 10001, 168, 9 };
		{ "B", 10002, 168, 485 };
		{ "B", 10002, 365, 351 }; 
		{ "C", 10003, 365, 251 };
		{ 1, 1624, 168, 303 };
		{ 2, 1625, 168, 460 };
		{ 3, 1626, 272, 251 };
		{ 4, 1627, 458, 251 };
		{ 5, 1628, 364, 284 };
		{ "1'", 10009, 168, 61 };
		{ "3'", 10010, 170, 370 };
		{ "4'", 10011, 366, 334 };
		{ "2'", 10012, 128, 102 };
	};
	IcecrownCitadelB = {
		{ "C", 10001, 273, 428 };
		{ "D", 10002, 180, 157 };
		{ "D", 10002, 328, 160 };
		{ "E", 10002, 91, 153 };
		{ "E", 10002, 218, 159 };
		{ "F", 10002, 139, 159 };
		{ "F", 10002, 275, 200 };
		{ "G", 10002, 428, 210 };
		{ "G", 10002, 427, 455 };
		{ "H", 10002, 480, 76 };
		{ "H", 10002, 490, 290 };
		{ "I", 10003, 272, 291 };
		{ "6", 10004, 134, 310 };
		{ "7", 10005, 134, 268 };
		{ 8, 1629, 74, 339 };
		{ 9, 1630, 74, 243 };
		{ 10, 1631, 32, 291 };
		{ 11, 1632, 271, 130 };
		{ 12, 1633, 135, 87 };
		{ "13", 10011, 426, 291 };
		{ 14, 1634, 425, 372 };
		{ 15, 1635, 425, 38 };
		{ "4'", 10014, 272, 373 };
		{ "5'", 10015, 390, 74 };
	};
	IcecrownCitadelC = {
		{ "I", 10001, 250, 158 };
		{ 16, 1636, 246, 263 };
	};
	IcecrownEnt = {
		{ "A", 10001, 11, 180 }; -- Entrance
		{ "A", 10001, 412, 26 }; -- Entrance
		{ "B", 10002, 267, 243 }; -- The Forge of Souls
		{ "C", 10003, 246, 376 }; -- Pit of Saron
		{ "D", 10004, 333, 322 }; -- Halls of Reflection
		{ "E", 10005, 412, 219 }; -- Icecrown Citadel
		{ "1'", 10006, 221, 306 }; -- Meeting Stone
	};
	Naxxramas = {
		{ "A", 10001, 205, 199 };
		{ 1, 1610, 132, 94 }; -- White
		{ 2, 1611, 158, 117 };
		{ 3, 1612, 99, 93 };
		{ 4, 1613, 30, 25 };
		{ 1, 1601, 221, 104 }; -- Orange
		{ 2, 1602, 274, 74 };
		{ 3, 1603, 372, 23 };
		{ 1, 1607, 83, 286 }; -- Red
		{ 2, 1608, 191, 323 };
		{ 3, 1609, 30, 377 };
		{ 1, 1604, 229, 318 }; -- Purple
		{ 2, 1605, 296, 286 };
		{ 3, 1606, 405, 233 };
		{ 1, 1614, 443, 456 }; -- Green
		{ 2, 1615, 382, 391 };
		{ "1'", 10017, 18, 391 };
		{ "1'", 10017, 432, 236 };
		{ "1'", 10017, 391, 37 };
		{ "1'", 10017, 33, 8 };
	};
	ObsidianSanctum = {
		{ "A", 10001, 325, 250 };
		{ "1", 10002, 196, 242 };
		{ "2", 10003, 254, 189 };
		{ "3", 10004, 250, 301 };
		{ 4, 1616, 255, 241 };
	};
	OnyxiasLair = {
		{ "A", 10001, 48, 54 };
		{ 1, 1651, 332, 104 };
	};
	RubySanctum = {
		{ "A", 10001, 241, 190 }; 
		{ "1", 10002, 298, 251 };
		{ "2", 10003, 193, 251 };
		{ "3", 10004, 245, 303 };
		{ 4, 1652, 242, 250 };
	};
	TheEyeOfEternity = {
		{ "A", 10001, 250, 285 };
		{ 1, 1617, 250, 249 };
	};
	TheNexus = {
		{ 1, 617, 30, 268 }; -- Frozen Commander
		{ 2, 618, 110, 192 }; -- Grand Magus Telestra
		{ 3, 619, 430, 79 }; -- Anomalus
		{ 4, 620, 369, 407 }; -- Ormorok the Tree-Shaper
		{ 5, 621, 189, 363 }; -- Keristrasza
		{ "A", 10001, 198, 494 };
		{ "1", 10002, 378, 348 };
	};
	TheOculus = {
		{ 1, 622, 259, 434 }; -- Drakos the Interrogator
		{ 2, 623, 229, 83 }; -- Varos Cloudstrider
		{ 3, 624, 258, 416 }; -- Mage-Lord Urom
		{ 3, 624, 368, 201 }; -- Mage-Lord Urom
		{ 3, 624, 121, 215 }; -- Mage-Lord Urom
		{ 3, 624, 250, 262 }; -- Mage-Lord Urom
		{ 4, 625, 250, 287 }; -- Ley-Guardian Eregos
		{ "A", 10001, 306, 342 };
		{ "B", 10002, 187, 331 };
		{ "B", 10002, 260, 392 };
		{ "1'", 10003, 188, 255 };
		{ "1'", 10003, 191, 308 };
		{ "1'", 10003, 91, 364 };
		{ "1'", 10003, 312, 250 };
		{ "1'", 10003, 314, 304 };
		{ "1'", 10003, 416, 344 };
		{ "2'", 10004, 252, 359 };
	};
	TrialOfTheChampion = {
		{ "A", 10001, 115, 251 };
		{   1, 834, 266, 249 };
	};
	TrialOfTheCrusader = {
		{ "A", 10001, 277, 314 };
		{ "B", 10002, 375, 425 };
		{ 1, 1618, 159, 315 };
		{ 2, 1623, 382, 209 };
	};
	UlduarA = {
		{ "A", 10001, 281, 494 };
		{ "B", 10002, 250, 6 };
		{ "A'", 10003, 318, 308 };
		{ "B'", 10004, 223, 274 };
		{ "C'", 10005, 344, 235 };
		{ "D'", 10006, 169, 173 };
		{ 1, 1637, 255, 191 };
		{ 2, 1639, 291, 115 };
		{ 3, 1638, 170, 114 };
		{ 4, 1640, 249, 52 };
		{ "1'", 10011, 270, 427 };
		{ "2'", 10012, 254, 224 };
		{ "3'", 10013, 251, 124 };
		{ "4'", 10014, 249, 27 };
	};
	UlduarB = {
		{ "B", 10001, 174, 385};
		{ "C", 10002, 176, 64 };
		{ 5, 1641, 59, 292 };
		{ 6, 1642, 174, 110 };
		{ 7, 1650, 406, 255 };
		{ "5'", 10006, 174, 363 };
		{ "6'", 10007, 59, 410 };
	};
	UlduarC = {
		{ "C", 10001, 242, 453 };
		{ "D", 10002, 53, 174 };
		{ "E", 10003, 24, 419 };
		{ 8, 1643, 240, 309 };
		{ 9, 1644, 363, 342 };
		{ 10, 1645, 412, 263 };
		{ 11, 1646, 251, 126 };
		{ "12", 10008, 136, 119 };
		{ "13", 10009, 335, 114 };
		{ "14", 10010, 275, 220 };
		{ "7'", 10011, 242, 432 };
		{ "8'", 10012, 240, 292 };
	};
	UlduarD = {
		{ "D", 10001, 410, 421 };
		{ 15, 1647, 249, 179 };
		{ "9'", 10003, 251, 299 };
	};
	UlduarE = {
		{ "E", 10001, 57, 262 };
		{ 16, 1648, 250, 288 };
		{ 17, 1649, 397, 164 };
		{ "10'", 10004, 396, 282 };
	};
	UlduarEnt = {
		{ "A", 10001, 177, 373 }; -- Ulduar: Halls of Stone
		{ "B", 10002, 364, 244 }; -- Ulduar: Halls of Lightning
		{ "C", 10003, 230, 157 }; -- Ulduar
		{ "1'", 10004, 312, 353 }; -- Meeting Stone
		{ "2'", 10005, 256, 316 }; -- Graveyard
		{ "3'", 10006, 352, 395 }; -- Shavalius the Fancy <Flight Master>
	};
	UlduarHallsofLightning = {
		{ 1, 597, 247, 142 }; -- General Bjarngrim
		{ 2, 598, 320, 145 }; -- Volkhan
		{ 3, 599, 435, 352 }; -- Ionar
		{ 4, 600, 199, 250 }; -- Loken
		{ "A", 10001, 6, 146 };
	};
	UlduarHallsofStone = {
		{ 1, 604, 138, 313 }; -- Krystallus
		{ 2, 605, 209, 434 }; -- Maiden of Grief
		{ 3, 606, 463, 387 }; -- Tribunal of Ages
		{ 4, 607, 211, 83 }; -- Sjonnir The Ironshaper
		{ "A", 10001, 84, 194 };
		{ "1'", 10002, 63, 314 };
		{ "2'", 10003, 363, 262 };
	};
	UtgardeKeep = {
		{ 1, 638, 157, 131 }; -- Prince Keleseth
		{ 2, 639, 217, 419 }; -- Skarvold & Dalronn
		{ 3, 640, 444, 383 }; -- Ingvar the Plunderer
		{ "A", 10001, 327, 254 };
		{ "B", 10002, 52, 388 };
		{ "B", 10002, 189, 231 };
		{ "C", 10002, 320, 398 };
		{ "C", 10002, 395, 265 };
		{ "1'", 10003, 133, 323 };
	};
	UtgardePinnacle = {
		{ 1, 641, 215, 390 }; -- Svala Sorrowgrave
		{ 2, 642, 347, 364 }; -- Gortok Palehoof
		{ 3, 643, 426, 215 }; -- Skadi the Ruthless
		{ 4, 644, 144, 263 }; -- King Ymiron
		{ "A", 10001, 180, 5 };
		{ "1'", 10002, 298, 161 };
	};
	VaultOfArchavon = {
		{ "A", 10001, 250, 482 }; -- Entrance
		{ 1, 1597, 250, 39 }; -- Archavon the Stone Watcher
		{ 2, 1598, 360, 256 }; -- Emalon the Storm Watcher
		{ 3, 1599, 138, 256 }; -- Koralon the Flame Watcher
		{ 4, 1600, 363, 149 }; -- Toravon the Ice Watcher
	};
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

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end

