-- $Id: Atlas_Legion_DB.lua 130 2017-04-30 11:01:57Z arith $
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

--[[ /////////////////////////////////////////
 Atlas Map NPC Description Data
 zoneID = {
	{ ID or letter mark, encounterID or customizedID, x, y, x_largeMap, y_largeMap, color of the letter mark };
	{ "A", 10001, 241, 460 };
	{ 1, 1694, 373, 339 };
 };
/////////////////////////////////////////////]]
local myDB = {
	AssaultonVioletHold = {
		{ "A", 10001, 241, 460, 501, 627, "Blue" }; -- Entrance
		{   1, 1694, 373, 339, 676, 466 }; -- Shivermaw
		{   2, 1702, 105, 265, 283, 365 }; -- Blood-Princess Thal'ena
		{   3, 1693, 123, 141, 326, 178 }; -- Festerface
		{   4, 1688, 161, 194, 380, 270 }; -- Millificent Manastorm
		{   5, 1686, 408, 217, 728, 300   }; -- Mindflayer Kaahrj
		{   6, 1696, 356, 121, 664, 161 }; -- Anub'esset
		{   7, 1697, 206,  78, 448, 98 }; -- Sael'orn
		{   8, 1711, 244,  73, 500, 92  }; -- Fel Lord Betrug
	};
	BlackRookHoldA = {
		{ "A", 10001, 130,  34, 305,  24, "Blue" }; -- Entrance
		{ "B", 10002, 420, 448, 689, 592, "Blue" }; -- Connection
		{   1,  1518, 215, 326, 418, 424 }; -- The Amalgam of Souls
		{   1, 98538,  47, 201, 186, 252, "Orange" }; -- Lady Velandras Ravencrest
		{   2, 98521, 308, 188, 547, 235, "Orange" }; -- Lord Etheldrin Ravencrest
		{   3, 110993, 351, 423, 605, 556, "Orange" }; -- Lord Etheldrin Ravencrest
		{   4, 98637, 466, 439, 765, 577, "Orange" }; -- Ancient Widow
		{ "1'", 10003, 329, 447, 572, 586, "Green" }; -- Torn Page
	};
	BlackRookHoldB = {
		{ "B", 10001,  99, 190, 240, 219, "Blue" }; -- Connection
		{ "C", 10001, 279, 413, 534, 589, "Blue" }; -- Connection
		{ "C", 10001, 412, 423, 764, 608, "Blue" }; -- Connection
		{ "D", 10001, 275, 171, 530, 186, "Blue" }; -- Connection
		{   2,  1653, 351, 319, 659, 433 }; -- Illysanna Ravencrest
		{  5, 111068, 189, 351, 386, 485, "Orange" }; -- Archmage Galeorn
		{ "2'", 10002, 339, 242, 639, 306, "Green" }; -- Worn-Edged Page
		{ "3'", 10003, 151, 296, 329, 397, "Green" }; -- Dog-Eared Page
	};
	BlackRookHoldC = {
		{ "D", 10001, 356, 443, 862, 560, "Blue" }; -- Connection
		{ "E", 10001, 232, 386, 671, 479, "Blue" }; -- Connection
		{ "E", 10001, 315, 159, 442, 225, "Blue" }; -- Connection
		{ "F", 10001, 475,  25, 682,  30, "Blue" }; -- Connection
		{ "G", 10001, 289, 142, 408, 207, "Blue" }; -- Connection
		{ "G", 10001,  63, 142,  80, 202, "Blue" }; -- Connection
		{ "H", 10001, 123, 174, 170, 247, "Blue" }; -- Connection
		{  6, 112725, 304, 294, 784, 330, "Orange" }; -- Kalyndras <Rook's Quartermaster>
		{  7, 111290, 200, 429, 622, 539, "Orange" }; -- Braxas the Fleshcarver
		{  8, 111361, 180, 202, 253, 288, "Orange" }; -- Braxas the Fleshcarver
		{ "4'", 10002, 289, 379, 765, 466, "Green" }; -- Singed Page
		{ "5'", 136812, 132, 394, 523, 484, "Green" }; -- Dog-Eared Page
		{ "6'", 10003, 342, 176, 481, 263, "Green" }; -- Ink-splattered Page
		{ "7'", 10004, 198, 212, 286, 302, "Green" }; -- Hastily-Scrawled Page
	};
	BlackRookHoldD = {
		{ "F", 10001, 300, 107 }; -- Connection
		{ "H", 10001, 203, 191 }; -- Connection
		{  3, 1664, 351, 60 }; -- Smashspite the Hateful
		{  4, 1672, 158, 171 }; -- Lord Kur'talos Ravencrest
	};
	CathedralofEternalNightA = {
		{ "A", 10001, 249, 487, 456, 620, "Blue" }; -- Entrance
		{ "B", 10002, 249, 106, 456, 124, "Blue" }; -- Stairs
		{ "1", 120715, 358, 78, 600, 78, "Orange" }; -- Raga'yut
	};
	CathedralofEternalNightB = {
		{ "B", 10001, 249,  89, 456, 108, "Blue" }; -- Stairs
		{ "C", 10001, 249, 390, 456, 498, "Blue" }; -- Stairs
		{   1,  1905, 342, 250, 573, 313 }; -- Agronox
	};
	CathedralofEternalNightC = {
		{ "C", 10001, 130, 385, 278, 526, "Blue" }; -- Stairs
		{ "D", 10001, 130, 141, 278, 155, "Blue" }; -- Stairs
		{ "D", 10001, 372, 123, 691, 136, "Blue" }; -- Stairs
		{ "E", 10001, 372, 361, 691, 495, "Blue" }; -- Stairs
		{ 2, 1906, 130, 249, 277, 323 }; -- Thrashbite the Scornful
	};
	CathedralofEternalNightD = {
		{   "E", 10001, 250, 442, 491, 632, "Blue" }; -- Stairs
		{ "1'", 129207, 250, 251, 491, 324, "Green" }; -- Aegis of Aggramar
		{    3,   1904, 235, 205, 460, 256 }; -- Domatrax
		{    4,   1878, 264, 205, 534, 256 }; -- Mephistroth
	};
	CourtofStarsA = {
		{ "A", 10001, 198, 377 }; -- Entrance
		{ "B", 10002, 300, 319 }; -- Connection
		{ "C", 10002, 411, 429 }; -- Connection
		{  1, 1718, 109, 152 }; -- Patrol Captain Gerdo
		{  2, 1719, 277, 294 }; -- Talixae Flamewreath
		{  3, 1720, 429, 446 }; -- Advisor Melandrus
		{ "1", 106468, 292, 310 }; -- Ly'leth Lunastre
		{  1, 108796, 186, 200 }; -- Arcanist Malrodi
		{  2, 108740, 286, 392 }; -- Velimar
	};
	CourtofStarsB = {
		{ "B", 10002, 170, 157 }; -- Connection
		{ "C", 10002, 345, 366 }; -- Connection
	};
	DarkheartThicket = {
		{ "A", 10001, 171, 104, 357, 91, "Blue" }; -- Entrance
		{ "B", 10002, 309, 282, 565, 390, "Blue" }; -- Connection
		{ "B", 10002, 323, 297, 583, 419, "Blue" }; -- Connection
		{   1,  1654, 103, 256, 235, 399 }; -- Arch-Druid Glaidalis
		{   2,  1655, 209, 201, 427, 297 }; -- Oakheart
		{   3,  1656, 326, 196, 649, 299 }; -- Dresaron
		{   4,  1657, 418, 357, 802, 553 }; -- Shade of Xavius
		{   1, 101660, 70, 111, 171, 126, "Orange" }; -- Rage Rot
		{   2, 101641, 127, 175, 283, 248, "Orange" }; -- Mythana
		{   3, 99362, 179, 349, 378, 569, "Orange" }; -- Kudzilla
	};
	EyeofAzshara = {
		{ "A", 10001, 172, 432 }; -- Entrance
		{   1,  1480, 222, 322 }; -- Warlord Parjesh
		{   2,  1490, 148, 228 }; -- Lady Hatecoil
		{   3,  1479, 226, 153 }; -- Serpentrix
		{   4,  1491, 322, 236 }; -- King Deepbeard
		{   5,  1492, 232, 250 }; -- Wrath of Azshara
		{ "1'", 248930, 285, 270 }; -- Crate of Corks, Alchemy quest - Put a Cork in It (39331)
		{   1, 91788,   70, 220 }; -- Shellmaw
		{   2, 108543,  41, 190 }; -- Dread Captain Thedon
		{   3, 101411, 108, 120 }; -- Gom Crabbar
		{   4, 101467, 489, 150 }; -- Jaggen-Ra
	};
	HallsofValorA = { 
		{ "A", 10001, 249, 12 }; -- Entrance
		{ "B", 10002, 178, 239 }; -- Portal
		{ "C", 10003, 249, 489 }; -- Connection
		{  1, 1485, 249, 87 }; -- Hymdall
		{  2, 1486, 343, 272 }; -- Hyrja
		{  1, 106320, 248, 209 }; -- Volynd Stormbringer
	};
	HallsofValorB = { 
		{ "B", 10002, 435, 104 }; -- Portal
		{  3, 1487, 109, 345 }; -- Fenryr
		{ "3'",  10003, 175, 144 }; -- Fenryr's western spawn point
		{ "3''", 10004, 344, 287 }; -- Fenryr's eastern spawn point
		{  2, 99802, 372, 271 };-- Arthfael
		{  3, 96647, 71, 309 }; -- Earlnoc the Beastbreaker
	};
	HallsofValorC = { 
		{ "C", 10003, 250, 36 }; -- Connection
		{  4, 1488, 251, 300 }; -- God-King Skovald
		{  5, 1489, 251, 425 }; -- Odyn
		{ "1", 97084, 201, 275 }; -- King Tor
		{ "2", 97081, 220, 309 }; -- King Bjorn
		{ "3", 95843, 282, 308 }; -- King Haldor
		{ "4", 97083, 299, 276 }; -- King Ranulf
	};
	MawofSoulsA = {
		{ "A", 10001, 201, 233 }; -- Entrance
		{ "B", 10002, 234, 121 }; -- Transport
		{  1, 1502, 210, 141 }; -- Ymiron, the Fallen King
	};
	MawofSoulsB = {
		{ "B", 10001, 133, 400 }; -- Connection
		{ "C", 10001, 400, 400 }; -- Connection
		{ "C", 10001, 402, 250 }; -- Connection
		{  2, 1512, 340, 251 }; -- Harbaron
		{  3, 1663, 80, 245 }; -- Helya		
	};
	NeltharionsLair = {
		{ "A", 10001, 496, 255 }; -- Entrance
		{ "B", 10002, 13, 274 }; -- Exit
		{  1, 1662, 356, 232 }; -- Rokmora
		{  2, 1665, 227, 269 }; -- Ularogg Cragshaper
		{  3, 1673, 150, 200 }; -- Naraxas
		{  4, 1687, 48, 327 }; -- Dargrul the Underking
		{ "1'", 113526, 486, 224 }; -- Spiritwalker Ebonhorn
		{ "2'", 111746, 489, 201 }; -- Mushroom Merchant
		{  1, 103247, 374, 404 }; -- Ultanok
		{  2, 103597, 284, 381 }; -- Understone Lasher
		{  3, 103199, 165, 376 }; -- Ragoul
		{  4, 103271, 221,  89 }; -- Kraxa <Mother of Gnashers>
	};
	ReturntoKarazhanEnt = {
		{ "A", 10001, 279, 289 }; -- Karazhan, Front
		{ "B", 10002, 327, 192 }; -- Karazhan, Back
		{ "C", 10003, 266, 220 }; -- Return to Karazhan
		{ "1'", 18255, 290, 304 }; -- Archmage Leryda
		{ "2'", 10004, 300, 355 }; -- Stairs to The Master's Cellar
		{ "3'", 10005, 325, 365 }; -- Stairs to The Master's Cellar
		{ "4'", 10006, 226, 364 }; -- Charred Bone Fragment
		{ "5'", 10007, 274, 315 }; -- Meeting Stone
		{ "6'", 10008, 94, 288 }; -- Graveyard
		{ "7'", 66255, 93, 328 }; -- Lydia Accoste
	};
	ReturntoKarazhanA = {
		{ "A", 10001, 425, 321 }; -- Entrance
		{ "B", 10002, 228, 25 }; -- Connection
		{ "C", 10002, 462, 348 }; -- Connection
		{ "B", 10002, 231, 303 }; -- Connection
		{ "D", 10002, 306, 397 }; -- Connection
		{ 1, 1820, 80, 346 }; -- Opera Hall: Wikket
		{ 2, 1826, 74, 370 }; -- Opera Hall: Westfall Story
		{ 3, 1827, 70, 388 }; -- Opera Hall: Beautiful Beast
		{ "1'", 114339, 100, 369 }; -- Barnes
		{ "2'", 115105, 152, 373 }; -- Soul Fragment
	};
	ReturntoKarazhanB = {
		{ "D", 10001, 23, 216 }; -- Connection
		{ "E", 10001, 270, 268 }; -- Connection
		{ "F", 10001, 33, 152 }; -- Connection
		{ 4, 1825, 410, 289 }; -- Maiden of Virtue
		{ "3'", 115013, 397, 117 }; -- Soul Fragment
	};
	ReturntoKarazhanC = {
		{ "E", 10001, 352, 99 }; -- Connection
		{ "H", 10001, 278, 249 }; -- Connection
		{ "G", 10001, 170, 436 }; -- Connection
		{ 5, 1837, 142, 177 }; -- Moroes
		{ "4'", 115103, 118, 172 }; -- Soul Fragment
	};
	ReturntoKarazhanD = {
		{ "F", 10001, 116, 15 }; -- Connection
		{ "G", 10001, 111, 456 }; -- Connection
		{ "H", 10001, 231, 304 }; -- Connection
		{ "I", 10002, 431, 63 }; -- Connection
		{ 6, 1835, 158, 416 }; -- Attumen the Huntsman
		{ "5'", 114815, 154, 359 }; -- Koren
		{ "6'", 115101, 418, 58 }; -- Soul Fragment
	};
	ReturntoKarazhanE = {
		{ "C", 10001, 349, 162 }; -- Connection
		{ "J", 10003, 275, 398 }; -- Portal
		{ 7, 1836, 249, 363 }; -- The Curator
		{ "7'", 115113, 229, 401 }; -- Soul Fragment
	};
	ReturntoKarazhanF = {
		{ "J", 10001, 56, 102 }; -- Portal
		{ "K", 10002, 449, 342 }; -- Portal
		{ 8, 1817, 451, 250 }; -- Shade of Medivh
	};
	ReturntoKarazhanG = {
		{ "K", 10001, 22, 334 }; -- Entrance
		{ 9, 1818, 83, 107 }; -- Mana Devourer
		{ "8'", 266826, 27, 251 }; -- Medivh's Footlocker
	};
	ReturntoKarazhanH = {
		{ "L", 10001, 21, 41 }; -- Entrance
		{ "M", 10002, 192, 487 }; -- Connection
		{ "N", 10003, 29, 65 }; -- Portal
		{ "9'", 143537, 34, 43 }; -- Mana Focus
	};
	ReturntoKarazhanI = {
		{ "M", 10001, 282, 271 }; -- Connection
		{ 10, 1838, 248, 291 }; -- Viz'aduum the Watcher
		{ "9'", 115497, 196, 375 }; -- Archmage Khadgar
	};
	TombofSargerasA = {
		{ "A", 10001, 200, 492 }; -- Entrance
		{ "B", 10002, 283, 263 }; -- Connection
		{ 1, 1862, 202, 297 }; -- Goroth
		{ 2, 1867, 200, 26}; -- Demonic Inquisition
	};
	TombofSargerasB = {
		{ "B", 10001, 159, 323 }; -- Connection
		{ "C", 10001, 303, 492 }; -- Connection
		{ 4, 1903, 250, 288 }; -- Sisters of the Moon
		{ 6, 1896, 304, 100 }; -- The Desolate Host
	};
	TombofSargerasC = {
		{ "C", 10001, 313, 230 }; -- Connection
		{ "D", 10001, 373, 281 }; -- Connection
		{ 3, 1856, 195, 267 }; -- Harjatan
	};
	TombofSargerasD = {
		{ "D", 10001, 79, 101 }; -- Connection
		{ 5, 1861, 235, 231 }; -- Mistress Sassz'ine
	};
	TombofSargerasE = {
		{ 7, 1897, 250, 157 }; -- Maiden of Vigilance
	};
	TombofSargerasF = {
		{ 8, 1873, 250, 182 }; -- Fallen Avatar
	};
	TombofSargerasG = {
		{ 9, 1898, 378, 249 };
	};
	TheArcwayEnt = {
		{ " A", 10001, 382, 50 }; -- The Grand Promenade
		{ " B", 10002, 470, 460 }; -- Terrace of Order
		{ " C", 10003, 126, 297 }; -- The Arcway
		{ " D", 10004, 350, 219 }; -- The Nighthold
		{ " A", 10005, 471, 36 }; -- Transport
		{ " A", 10005, 415, 136 }; -- Transport
		{ " A", 10005, 383, 345 }; -- Transport
		{ " A", 10005, 325, 444 }; -- Transport
		{ " B", 10006, 292, 267 }; -- Portal to Shal'Aran
		{ " 1", 10007, 220, 295 }; -- Meeting Stone
		{ "1'", 115366, 348, 240 }; -- First Arcanist Thalyssra
	};
	TheArcway = {
		{ "A", 10001, 267,  81, 491, 71, "Blue" }; -- Entrance
		{  1, 1497,    61, 350, 156, 504 }; -- Ivanyr
		{  2, 1498,   211, 360, 404, 500 }; -- Corstilax
		{  3, 1499,   455, 234, 793, 319 }; -- General Xakal
		{  4, 1500,   363, 349, 643, 504 }; -- Nal'tira
		{  5, 1501,   270, 178, 491, 252 }; -- Advisor Vandros
		{ "1", 111057, 203, 232, 382, 317, "Orange" }; -- The Rat King
		{ "2", 111021, 270, 395, 491, 564, "Orange" }; -- Sludge Face
		{ "1'", 138394, 92, 304, 211, 425, "Green" }; -- Suramar Leyline Map
	};
	TheEmeraldNightmareA = {
		{ "A", 10001, 122, 344 }; -- Entrance
		{ "B", 10002, 50, 446 }; -- Entrance
		{  1, 1703, 284, 239 }; -- Nythendra
		{ "1'", 10003, 160, 281 }; -- Nightmare Watcher
	};
	TheEmeraldNightmareB = {
		{ "B",  10002, 55, 344 }; -- Connection
		{ "C",  10003, 348, 242 }; -- Un'Goro Crater
		{ "D",  10004, 399, 225 }; -- Mulgore
		{ "E",  10005, 343, 158 }; -- Grizzly Hills
		{ "F",  10006, 396, 159 }; -- The Emerald Dreamway
		{ "1'", 106482, 366, 202 }; -- Malfurion Stormrage
	};
	TheEmeraldNightmareC = {
		{ "C", 10003, 424, 464 }; -- Entrance
		{  2, 1738, 234, 206 }; -- Il'gynoth, Heart of Corruption
	};
	TheEmeraldNightmareD = {
		{ "D", 10004, 418, 327 }; -- Entrance
		{  3, 1744, 146, 251 }; -- Elerethe Renferal
	};
	TheEmeraldNightmareE = {
		{ "E", 10005, 96, 303 }; -- Entrance
		{  4, 1667, 253, 155 }; -- Ursoc
	};
	TheEmeraldNightmareF = {
		{ "F", 10006, 97, 382 }; -- Entrance
		{  5, 1704, 180, 252 }; -- Dragons of Nightmare
	};
	TheEmeraldNightmareG = {
		{ "G", 10007, 194, 407 }; -- Entrance
		{  6, 1750, 297, 228 }; -- Cenarius
	};
	TheEmeraldNightmareH = {
		{  7, 1726, 250, 250 }; -- Xavius
	};
	TheNightholdEnt = {
		{ " A", 10001, 382, 50 }; -- The Grand Promenade
		{ " B", 10002, 470, 460 }; -- Terrace of Order
		{ " C", 10003, 126, 297 }; -- The Arcway
		{ " D", 10004, 350, 219 }; -- The Nighthold
		{ " A", 10005, 471, 36 }; -- Transport
		{ " A", 10005, 415, 136 }; -- Transport
		{ " A", 10005, 383, 345 }; -- Transport
		{ " A", 10005, 325, 444 }; -- Transport
		{ " B", 10006, 292, 267 }; -- Portal to Shal'Aran
		{ " 1", 10007, 220, 295 }; -- Meeting Stone
		{ "1'", 115366, 348, 240 }; -- First Arcanist Thalyssra
	};
	TheNightholdA = {
		{ "A", 10001, 147, 442, 401, 579, "Blue" }; -- Portal
		{ "B", 10002, 228,  51, 499,  65, "Blue" }; -- Connection
		{ "B", 10002,  64,  91, 283, 124, "Blue" }; -- Connection
		{ "C", 10002, 160,  21, 406, 28, "Blue" }; -- Connection
		{   1,  1706, 188, 290, 446, 379 }; -- Skorpyron
		{   2,  1725, 356, 204, 668, 259 }; -- Chronomatic Anomaly
		{   3,  1731, 264,  70, 551,  93 }; -- Trilliax
		{ "1'", 110791, 136, 434, 381, 564 }; -- First Arcanist Thalyssra
	};
	TheNightholdB = {
		{   4,  1751, 155, 233, 460, 302 }; -- Spellblade Aluriel
		{   6,  1761, 408,  64, 781, 77 }; -- High Botanist Tel'arn
		{   8,  1713, 387, 487, 761, 637 }; -- Krosus
		{  10,  1737, 203, 279, 516, 358 }; -- Gul'dan
		{ "A", 10001,  50, 129, 311, 158, "Blue" }; -- Portal
		{ "C", 10002, 163, 150, 468, 179, "Blue" }; -- Connection
		{ "D", 10002, 180, 179, 487, 234, "Blue" }; -- Connection
		{ "E", 10002, 228, 128, 554, 165, "Blue" }; -- Connection
		{ "F", 10002, 215, 180, 537, 235, "Blue" }; -- Connection
		{ "G", 10002,  82, 267, 354, 341, "Blue" }; -- Connection
		{ "G", 10002,  94, 281, 376, 362, "Blue" }; -- Connection
		{ "H", 10002, 106, 290, 393, 382, "Blue" }; -- Connection
		{ "I", 10002, 177, 251, 474, 318, "Blue" }; -- Connection
		{ "J", 10002, 229, 300, 553, 397, "Blue" }; -- Connection
		{ "K", 10003, 147, 331, 442, 431, "Blue" }; -- Portal
		{ "K", 10003, 257, 221, 587, 284, "Blue" }; -- Portal
		{ "1", 112712,  89, 126, 369, 162, "Orange" }; -- Gilded Guardian
		{ "2", 116004,  47, 309, 315, 403, "Orange" }; -- Flightmaster Volnath
		{ "2'", 117085, 80, 280, 358, 360, "Green" }; -- Ly'leth Lunastre
	};
	TheNightholdC = {
		{   5,  1732, 152,  95, 345, 109 }; -- Star Augur Etraeus
		{ "D", 10001, 169, 466, 378, 620, "Blue" }; -- Connection
		{ "E", 10001, 412, 221, 708, 291, "Blue" }; -- Connection
		{ "F", 10002, 346, 453, 611, 607, "Blue" }; -- Connection
	};
	TheNightholdD = {
		{ "G", 10002, 146, 177, 341, 230, "Blue" }; -- Connection
		{ "G", 10002, 325, 353, 581, 472, "Blue" }; -- Connection
		{ "H", 10002, 406, 256, 695, 340, "Blue" }; -- Connection
		{   7, 1762, 175, 320 }; -- Tichondrius
	};
	TheNightholdE = {
		{ "I", 10001, 152, 150 }; -- Connection
		{ "J", 10001, 349, 348 }; -- Connection
		{ "K", 10002, 319, 181 }; -- Portal
		{ "K", 10002, 184, 318 }; -- Portal
	};
	TheNightholdF = {
		{ "K", 10002, 48, 446 }; -- Portal
		{ "K", 10002, 464, 48 }; -- Portal
		{ "K", 10002, 142, 144 }; -- Portal
		{   9, 1743, 251, 249, 486, 342 }; -- Grand Magistrix Elisande
	};
	TheNightholdG = {
		{ 10, 1737, 250, 251, 491, 346 }; -- Gul'dan
	};
	TrialofValorA = { 
		{ "A", 10101, 249, 39 }; -- Entrance
		{   1, 10001, 291, 321 }; -- Hymdall
		{   2, 10002, 212, 321 }; -- Hyrja
		{   3, 1819, 251, 427 }; -- Odyn
	};
	TrialofValorB = { 
		{ "A", 10101, 348, 244 }; -- Entrance
		{   4, 1830, 278, 196 }; -- Guarm
		{   5, 1829, 172, 190 }; -- Helya
	};
	VaultoftheWardensA = {
		{ "A", 10001, 480, 384 }; -- Entrance
		{ "B", 10002,  68, 206 }; -- Connection
		{ "B", 10002, 137, 206 }; -- Connection
		{ "C", 10003, 104, 116 }; -- Elevator
		{  1, 1467, 103, 283 }; -- Tirathon Saltheril
	};
	VaultoftheWardensB = {
		{ "C", 10003, 197, 241 }; -- Elevator
		{ "D", 10003,  91, 241 }; -- Elevator
		{  2, 1695, 139, 241 }; -- Inquisitor Tormentorum
		{  3, 1468, 191, 412 }; -- Ash'golm
		{  4, 1469, 373, 239 }; -- Glazer
		{ "1", 105824, 197, 73 }; -- Grimoira
	};
	VaultoftheWardensC = {
		{ "D", 10004, 271, 25 }; -- Connection
		{  5, 1470, 246, 426 }; -- Cordana Felsong
		{ "1'", 258979, 306, 150 }; -- Fel-Ravaged Tome
		{ "2'", 103860, 228, 441 }; -- Drelanim Whisperwind
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end

