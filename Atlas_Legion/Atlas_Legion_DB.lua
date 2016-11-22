-- $Id: Atlas_Legion_DB.lua 81 2016-11-09 14:17:42Z arith $
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
		{ "A", 10001, 115, 49, 280, 42, "Blue" }; -- Entrance
		{ "B", 10002, 429, 415, 644, 568, "Blue" }; -- Connection
		{   1,  1518, 219, 314, 383, 411 }; -- The Amalgam of Souls
		{   1, 10003, 50, 211, 174, 250, "Orange" }; -- Lady Velandras Ravencrest
		{   2, 10004, 462, 400, 699, 559, "Orange" }; -- Ancient Widow
	};
	BlackRookHoldB = {
		{ "B", 10001, 69, 337, 107, 351, "Blue" }; -- Connection
		{ "C", 10001, 201, 477, 309, 612, "Blue" }; -- Connection
		{ "C", 10001, 294, 478, 467, 623, "Blue" }; -- Connection
		{ "D", 10001, 186, 320, 298, 325, "Blue" }; -- Connection
		{ "D", 10001, 428, 319, 870, 512, "Blue" }; -- Connection
		{ "E", 10001, 324, 292, 686, 445, "Blue" }; -- Connection
		{ "E", 10001, 130, 142, 413, 222, "Blue" }; -- Connection
		{ "F", 10001, 243,  26, 629, 36, "Blue" }; -- Connection
		{ "G", 10001, 172, 162, 483, 261, "Blue" }; -- Connection
		{  2, 1653, 251, 413, 394, 496 }; -- Illysanna Ravencrest
		{  3, 10002, 139, 445, 192, 545, "Orange" }; -- Archmage Galeorn
		{  4, 10003, 379, 194, 798, 277, "Orange" }; -- Kalyndras <Rook's Quartermaster>
		{  5, 10004, 92, 156, 341, 244, "Orange" };-- Braxas the Fleshcarver
	};
	BlackRookHoldC = {
		{ "F", 10001, 300, 107 }; -- Connection
		{ "G", 10001, 203, 191 }; -- Connection
		{  3, 1664, 351, 60 }; -- Smashspite the Hateful
		{  4, 1672, 158, 171 }; -- Lord Kur'talos Ravencrest
	};
	CourtofStarsA = {
		{ "A", 10001, 198, 377 }; -- Entrance
		{ "B", 10002, 300, 319 }; -- Connection
		{ "C", 10002, 411, 429 }; -- Connection
		{  1, 1718, 109, 152 }; -- Patrol Captain Gerdo
		{  2, 1719, 283, 299 }; -- Talixae Flamewreath
		{  3, 1720, 429, 446 }; -- Advisor Melandrus
		{ "1", 10003, 292, 310 }; -- Ly'leth Lunastre
		{  1, 10004, 186, 200 }; -- Arcanist Malrodi
		{  2, 10005, 286, 392 }; -- Velimar
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
		{   1, 10003, 70, 111, 171, 126, "Orange" }; -- Rage Rot
		{   2, 10004, 179, 349, 378, 569, "Orange" };-- Kudzilla
	};
	EyeofAzshara = {
		{ "A", 10001, 247, 491 }; -- Entrance
		{   1,  1480, 296, 379 }; -- Warlord Parjesh
		{   2,  1490, 220, 279 }; -- Lady Hatecoil
		{   3,  1491, 405, 287 }; -- King Deepbeard
		{   4,  1479, 307, 200 }; -- Serpentrix
		{   5,  1492, 307, 301 }; -- Wrath of Azshara
		{ "1'", 10002, 360, 324 }; -- Crate of Corks, Alchemy quest - Put a Cork in It (39331)
		{   1, 10003, 138, 258 }; -- Shellmaw
		{   2, 10004, 172, 166 }; -- Gom Crabbar
	};
	HallsofValorA = { 
		{ "A", 10001, 249, 12 }; -- Entrance
		{ "B", 10002, 178, 239 }; -- Portal
		{ "C", 10003, 249, 489 }; -- Connection
		{  1, 1485, 249, 87 }; -- Hymdall
		{  2, 1486, 343, 272 }; -- Hyrja
		{  1, 10004, 248, 209 }; -- Volynd Stormbringer
	};
	HallsofValorB = { 
		{ "B", 10002, 435, 104 }; -- Portal
		{  3, 1487, 109, 345 }; -- Fenryr
		{ "3'",  10003, 175, 144 }; -- Fenryr's western spawn point
		{ "3''", 10004, 344, 287 }; -- Fenryr's eastern spawn point
		{  2, 10005, 372, 271 };-- Arthfael
		{  3, 10006, 71, 309 }; -- Earlnoc the Beastbreaker
	};
	HallsofValorC = { 
		{ "C", 10003, 250, 36 }; -- Connection
		{  4, 1488, 251, 300 }; -- God-King Skovald
		{  5, 1489, 251, 425 }; -- Odyn
		{ "1", 10004, 201, 275 }; -- King Tor
		{ "2", 10005, 220, 309 }; -- King Bjorn
		{ "3", 10006, 282, 308 }; -- King Haldor
		{ "4", 10007, 299, 276 }; -- King Ranulf
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
	TheArcwayEnt = {
		{ " A", 10001, 280, 107 }; -- The Grand Promenade
		{ " B", 10002, 492, 348 }; -- Terrace of Order
		{ " C", 10003, 113, 377 }; -- The Arcway
		{ " D", 10004, 263, 201 }; -- The Nighthold
		{ " A", 10005, 356,  51 }; -- Transport
		{ " A", 10005, 356, 165 }; -- Transport
		{ " A", 10005, 356, 293 }; -- Transport
		{ " A", 10005, 356, 408 }; -- Transport
		{ " B", 10006, 236, 267 }; -- Portal to Shal'Aran
		{ " 1", 10007, 197, 337 }; -- Meeting Stone
	};
	TheArcway = {
		{ "A", 10001, 267, 81 }; -- Entrance
		{  1, 1497, 61, 350 }; -- Ivanyr
		{  2, 1498, 211, 360 }; -- Corstilax
		{  3, 1499, 455, 234 }; -- General Xakal
		{  4, 1500, 363, 349 }; -- Nal'tira
		{  5, 1501, 270, 178 }; -- Advisor Vandros
		{  1, 10002, 203, 232 }; -- The Rat King
		{  2, 10003, 270, 395 }; -- Sludge Face
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
		{ "1'", 10010, 366, 202 }; -- Malfurion Stormrage
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
		{ " A", 10001, 280, 107 }; -- The Grand Promenade
		{ " B", 10002, 492, 348 }; -- Terrace of Order
		{ " C", 10003, 113, 377 }; -- The Arcway
		{ " D", 10004, 263, 201 }; -- The Nighthold
		{ " A", 10005, 356,  51 }; -- Transport
		{ " A", 10005, 356, 165 }; -- Transport
		{ " A", 10005, 356, 293 }; -- Transport
		{ " A", 10005, 356, 408 }; -- Transport
		{ " B", 10006, 236, 267 }; -- Portal to Shal'Aran
		{ " 1", 10007, 197, 337 }; -- Meeting Stone
	};
	TheNightholdA = {
		{ "A", 10001, 155, 376 }; -- Entrance
		{ "B", 10002, 427, 57 }; -- Connection
		{  1, 1706, 245, 71 }; -- Skorpyron
		{ "1'", 10003, 130, 350 }; -- Palace Watcher
	};
	TheNightholdB = {
		{ "B", 10001, 158, 466 }; -- Connection
		{ "C", 10001, 99, 199 }; -- Connection
		{ "C", 10001, 327, 130 }; -- Connection
		{ "D", 10001, 467, 9 }; -- Connection
		{  2, 1725, 271, 338 }; -- Chronomatic Anomaly
		{  3, 1731, 105, 114 }; -- Trilliax
	};
	TheNightholdC = {
		{  4, 1751, 197, 229 }; -- Spellblade Aluriel
		{  6, 1713, 407, 466 }; -- Krosus
		{  7, 1761, 416, 83 }; -- High Botanist Tel'arn
		{ "D", 10001, 210, 129 }; -- Connection
		{ "E", 10001, 118, 277 }; -- Connection
		{ "F", 10001, 223, 153 }; -- Connection
		{ "G", 10001, 216, 175 }; -- Connection
		{ "H", 10001, 261, 134 }; -- Connection
	};
	TheNightholdD = {
		{   5, 1762, 175, 320 }; -- Tichondrius
		{ "E", 10001, 199, 165 }; -- Connection
	};
	TheNightholdE = {
		{   8, 1732, 152, 95 }; -- Star Augur Etraeus
		{ "F", 10001, 186, 295 }; -- Connection
		{ "G", 10001, 169, 466 }; -- Connection
		{ "H", 10001, 412, 221 }; -- Connection
	};
	TheNightholdF = {
		{   9, 1743, 251, 249 }; -- Grand Magistrix Elisande
		{ "I", 10001, 349, 154 }; -- Connection
	};
	TheNightholdG = {
		{  10, 1737, 250, 250 }; -- Gul'dan
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
		{ "1'", 10005, 306, 150 }; -- Fel-Ravaged Tome
		{ "2'", 10006, 228, 441 }; -- Drelanim Whisperwind
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end

