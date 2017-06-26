-- $Id: Atlas_ClassOrderHalls_DB.lua 110 2017-06-22 04:52:28Z arith $
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


local myDB = {
	CH_DeathKnightLower = {
		{ "A", 10101,  75, 177 }; -- Portal to Dalaran
		{ "B", 10102, 147, 190 }; -- Portal to another floor
		{ "C", 10103, 285, 150 }; -- Portal to the roof 
		{  1, 10001,  84, 152 }; -- Flight Master
		{  2, 10002, 249, 248 }; -- Siouxsie the Banshee <Mission Specialist>
		{  3, 97111, 244, 275 }; -- Illanna Dreadmoore <Ebon Blade Archivist>
		{  4, 97485, 233, 262 }; -- Archivist Zubashi <Class Hall Upgrades>
		{  5, 97134, 341, 326 }; -- Lord Thorval
		{  6, 106435, 191, 346 }; -- Dark Summoner Marogh <Risen Horde Recruiter>
		{  7, 93555, 303, 159 }; -- Amal'thazad
		{  8, 111634,  82, 117 }; -- Winter Payne
		{  9, 120135,  48, 168 }; -- Eran Droll <Ebon Knight Frostreavers Recruiter>
	};
	CH_DeathKnightUpper = {
		{ "B", 10102, 140, 187 }; -- Portal to another floor
		{ 10, 10010, 251, 252 }; -- Training Dummies
		{ 11, 93550, 212, 194 }; -- Quartermaster Ozorg <Rare Goods Vendor>
		{ 12, 93509, 319, 232 }; -- Lady Alistra <Death Knight Trainer>
		{ 13, 10011, 316, 288 }; -- Grand Master Siegesmith Corvus
		{ 14, 106436, 274, 328 }; -- Korgaz Deadaxe <Ebon Soldier Recruiter>
		{ 15, 111480, 164, 271 }; -- Salanar the Horseman
		{ 16, 110410, 253, 167 }; -- Dead Collector Bane <Champion Armaments>
	};
	CH_DemonHunter = {
		{ "A", 10101, 125, 422 }; -- Illidari Gateway
		{ "A", 10101, 125,  78 }; -- Illidari Gateway
		{ "A", 10102, 53, 247 }; -- Ramp to lower floor
		{ "A", 10102, 193, 247 }; -- Ramp to lower floor
		{ "B", 10103, 307, 247 }; -- Ramp to top floor
		{ "B", 10103, 444, 247 }; -- Ramp to top floor
		{   1, 10001, 122, 269 }; -- Kayn Sunfury <Illidari>
		{   2, 103025, 100, 248 }; -- Battlelord Gaardoun <Ashtongue Captain>
		{   3, 10003, 122, 248 }; -- Scouting Map
		{   4, 98624, 148, 248 }; -- Lady S'theno <Coilskar Captain>
		{   5, 108782, 112, 239 }; -- Belath Dawnblade <Illidari>
		{   6, 98632, 123, 224 }; -- Matron Mother Malevolence <Shivarra Captain>
		{   7, 112407, 113, 195 }; -- Falara Nightsong <Illidari Provisioner>
		{   8, 110433, 133, 196 }; -- Slitesh <Armaments Requisitioner>
		{   9, 108326, 103, 175 }; -- Asha Ravensong
		{  10, 103760, 123, 179 }; -- Ariana Fireheart <Illidari>
		{  11, 109965, 140, 172 }; -- Izal Whitemoon
		{  12, 10012, 100, 94 }; -- Training Dummies
		{  13, 120140, 104, 346 }; -- Tormented Shivarra <Shivarra Recruiter>
		{  14, 111775, 118, 323 }; -- Evelune Soulreaver <Wrath of the Order>
		{  15, 98646, 375, 355 }; -- Jace Darkweaver <Illidari>
		{  16, 111736, 395, 350 }; -- Vahu the Weathered <Illidari Researcher>
		{  17, 110599, 347, 294 }; -- Loramus Thalipedes <Class Hall Upgrades>
		{  18, 10016, 375, 249 }; -- Empowered Nether Crucible
		{  19, 10017, 374, 119 }; -- Cursed Forge of the Nathrezim
		{  20, 109596, 357, 129 }; -- Seer Akalu
		{  21, 112992, 339, 275 }; -- Seer Aleis
	};
	CH_Druid = {
		{  "A", 10101, 337, 82 }; -- Portal to Emerald Dreamway
		{  "B", 10102, 346, 204 }; -- Portal to Dalaran
		{  "A", 10103, 260, 123 }; -- Tel'Andu Barrow Den
		{    1, 10001, 391, 150 }; -- Flight Master
		{    2, 112323, 207, 108 }; -- Amurra Thistledew <Proprietor>
		{    3, 108393, 177, 111 }; -- Sister Lilith <Recruiter>
		{    4, 97989, 145, 127 }; -- Leafbeard the Storied <Ancient of Lore>
		{    5, 111737, 153, 145 }; -- Celadine the Fatekeeper <Dreamgrove Researcher>
		{    6, 106442, 191, 156 }; -- Yaris Darkclaw <Recruiter>
		{    7, 10007, 130, 264 }; -- Seed of Ages
		{    8, 101195, 244, 257 }; -- Rensar Greathoof <Archdruid of the Grove>
		{    9, 103832, 244, 244 }; -- Keeper Remulos
		{   10, 104577, 255, 254 }; -- Lyessa Bloomwatcher <Guardian of G'Hanir>
		{   11, 10011, 312, 256 }; -- Scouting Map, Skylord Omnuron <Mission Specialist>, Mylune
		{   12, 98784, 377, 259 }; -- Zen'kiki
		{   13, 10013, 474, 282 }; -- Training Dummies
		{   14, 110810, 215, 131 };-- Almenis
		{   15, 108391, 126, 209 }; -- Shalorn Star
		{   16, 111786, 228, 318 }; -- Treant Sapling
	};
	CH_Hunter = {
		{ "A", 10101, 256, 219 }; -- Portal to Dalaran
		{ 1, 10001, 153, 151 }; -- Flight Master
		{ 2, 108552, 178, 156 }; -- Great Eagle
		{ 3, 107317, 214, 145 }; -- Emmarel Shadewarden <Unseen Path>
		{ 3, 107317, 198, 384 }; -- Emmarel Shadewarden <Unseen Path>
		{ 4, 10004, 246, 294 }; -- Altar Keeper Biehn
		{ 5, 103693, 228, 261 }; -- Outfitter Reynolds <Unseen Path>
		{ 6, 10006, 207, 248 }; -- Tactician Tinderfell <Unseen Path>
		{ 7, 110424, 223, 235 }; -- Image of Mimiron
		{ 8, 98737, 275, 282 }; -- Holt Thunderhorn <Lore and Legends>
		{ 9, 10009, 218, 222 }; -- Training Dummies
		{ 9, 10009, 196, 247 }; -- Training Dummies
		{ 9, 10009, 303, 261 }; -- Training Dummies
		{ 10, 106444, 210, 203 }; -- Lenara <Recruiter>
		{ 11, 108050, 324, 272 }; -- Survivalist Bahn <Class Hall Upgrades>
		{ 12, 106446, 314, 177 }; -- Sampson <Recruiter>
		{ 13, 113688, 373, 455 }; -- Ogdrul <The Seeker>
		{ 14, 110412, 324, 260 }; -- Berger the Steadfast <Champion Armaments>
		{ 15, 106445, 273, 170 }; -- Nighthuntress Silus
		{ 16, 110816, 212, 260 }; -- Tu'Las the Gifted
	};
	CH_Mage = {
		{  1, 10001, 408, 129 }; -- Forge of the Guardian
		{  2, 110624, 436, 147 }; -- Edirah <Tirisgarde Researcher>
		{  3, 109642, 422, 108 }; -- Magister Varenthas
		{  4, 102700, 388, 116 }; -- Meryl Felstorm
		{  5, 107452, 377, 128 }; -- Old Fillmaff <Tirisgarde Librarian>
		{  6, 112440, 337, 187 }; -- Jackson Watkins <Tirisgarde Quartermaster> 
		{  7, 108380, 485, 176} ; -- Esara Verrinde
		{  8, 108377, 466, 161 }; -- Ravandwyr
		{  "A", 10200, 406, 225 }; -- Connection
		{  "B", 10200, 347, 231 }; -- Connection
		{  "B", 10200, 467, 231 }; -- Connection
		{  "A", 10101, 162, 476 }; -- Portal to Dalaran
		{  "B", 10102, 131, 286 }; -- Azsuna
		{  "C", 10103, 131, 303 }; -- Highmountain
		{  "D", 10104, 197, 286 }; -- Stormheim
		{  "E", 10105, 197, 303 }; -- Val'sharah
		{  "F", 10106, 162, 324 }; -- Suramar
		{  9, 108331, 239, 231 }; -- Chronicler Elrianne <Class Hall Upgrades> 
		{ 10, 106377, 307, 296 }; -- Archmage Omniara <Recruiter> 
		{ 11, 10011, 284, 349 }; -- Scouting map
		{ 12, 108515, 286, 362 }; -- Archmage Melis <Mistress of Flame>
		{ 13, 110427, 296, 330 }; -- Minuette <Armament Summoner>
		{ 14, 111734, 263, 323 }; -- Conjurer Awlyn
		{ 15, 10015,  58, 343 }; -- Training Dummies
		{ 16, 106433,  77, 259 }; -- Grand Conjurer Mimic
		{ 17, 112982,  52, 227 }; -- Researcher Tulius <Seal of Broken Fate Shipment>
		{ 18, 106434, 273, 224 }; -- Guardian Alar <Kirin Tor Guardians Recruiter>
		{  "A", 10200, 164, 350 }; -- Connection
		{  "B", 10200, 104, 353 }; -- Connection
		{  "B", 10200, 224, 353 }; -- Connection
	};
	CH_Monk = {
		{ "A", 10101, 270, 332 }; -- Portal to Dalaran
		{ "B", 10102, 226, 301 }; -- Portal to Peak of Serenity
		{ "C", 10103, 281, 204 }; -- Transportation Mandala
		{ "C", 10103, 220, 204 }; -- Transportation Mandala
		{ 1, 112338, 224, 362 }; -- Caydori Brightstar <Purveyor of Rare Goods>
		{ 2, 10002, 278, 377 }; -- Master Hsu <Mission Master>
		{ 3, 105015, 284, 367 }; -- Tianji <Ox Troop Trainer>
		{ 4, 104744, 273, 344 }; -- High Elder Cloudfall
		{ 5, 105019, 308, 334 }; -- Gin Lai <Tiger Troop Trainer>
		{ 6, 101749, 319, 327 }; -- Elder Xang <Monk Trainer>
		{ 7, 106538, 310, 356 }; -- Tianili <Celestial Trainer>
		{ 8, 110817, 291, 343 }; -- Yushi <Seal of Broken Fate Shipment>
		{ 9, 120145, 262, 315 }; -- Master Swoo <Masters of Serenity Recruiter>
		{ 10, 10010, 296, 324 }; -- Training Dummies
		{ 10, 10010, 286, 256 }; -- Training Dummies
		{ 10, 10010, 222, 258 }; -- Training Dummies
		{ 11, 10011, 250, 211 }; -- Iron-Body Ponshu <Senior Master Ox>
		{ 12, 106942, 160, 203 }; -- Lorewalker Cho <Head Archivist>
	};
	CH_Paladin = {
		{ "A", 10101, 128, 444 }; -- Entrance
		{ "A", 10102, 75, 327 }; -- Portal to Dalaran
		{ 1, 91190,  75, 293 }; -- Sister Elda <Keeper of the Ancient Tomes>
		{ 2, 109901,  96, 289 }; -- Sir Alamande Graythorn <Class Hall Upgrades>
		{ 3, 100196, 106, 315 }; -- Eadric the Pure <Quartermaster>
		{ 4, 99947, 121, 341 };-- Lord Irulon Trueblade
		{ 5, 90259, 172, 370 }; -- Lord Maxwell Tyrosus
		{ 6, 10006, 192, 397 }; -- Lord Grayson Shadowbreaker <Mission Specialist>
		{ 7, 106447, 199, 291 }; -- Commander Ansela <Silver Hand Recruiter>
		{ 8, 92313, 183, 245 }; -- Katherine the Pure <Paladin Trainer>
		{ 9, 110434, 205, 251 }; -- Kristoff <Armaments Requisitioner>
		{ 10, 92316, 229, 294 }; -- Vindicator Baatun <Paladin Trainer>
		{ 11, 106448, 246, 200 }; -- Commander Born <Silver Hand Officer Recruiter>
		{ 12, 90261, 342, 140 }; -- Valgar Highforge <Grand Smith of the Order>
		{ 13, 10013, 353, 114 }; -- Altar of Ancient Kings
		{ 14, 111772, 377, 176 }; -- Terric the Illuminator
		{ 15, 120146, 269, 221 }; -- Crusader Kern <Silver Hand Crusader Recruiter>
		{ 16, 112986, 165, 397 }; -- Librarian Lightmorne <Seal of Broken Fate Shipment>
	};
	CH_Priest = {
		{ "A", 10101, 250, 374 }; -- Portal to Dalaran
		{ 1, 10001, 252, 108 }; -- Betild Deepanvil <Master Artificer>
		{ 2, 111738, 324, 130 }; -- Juvess the Duskwhisperer <Keeper of Scrolls>
		{ 3, 106450, 188, 132 }; -- Grand Anchorite Gesslar <Recruiter>
		{ 4, 112401, 177, 117 }; -- Meridelle Lightspark <Logistics>
		{ 5, 10005, 248, 221 }; -- Command Map
		{ 6, 110564, 263, 223 }; -- Alonsus Faol <Bishop of Secrets>
		{ 7, 109776, 258, 211 }; -- Moira Thaurissan <Queen of the Dark Iron>
		{ 8, 110557, 239, 221 }; -- Prophet Velen
		{ 9, 110571, 243, 232 }; -- Delas Moonfang <Priestess of the Moon>
		{ 10, 110725, 288, 193 }; -- Archon Torias <Class Hall Upgrades>
		{ 11, 106451, 188, 253 }; -- Vicar Eliza <Recruiter>
		{ 12, 112576, 173, 248 }; -- Dark Cleric Cecille <Priest Trainer>
		{ 13, 10013, 170, 268 }; -- Training Dummies
		{ 14, 110595, 221, 132 }; -- Lilith <Armament Supplier>
	};
	CH_Rogue = {
		{ "A", 10101, 416, 365 }; -- Glorious Goods
		{ "B", 10102, 189,  99 }; -- One More Glass
		{ "C", 10103, 120, 114 }; -- Tanks for Everything
		{ "D", 10104, 130, 196 }; -- Tunnel of Woe
		{ 1, 103791, 294, 218 }; -- Madam Gosu <Black Market Liaison>
		{ 2, 99863, 268, 190 }; -- Jenri <Spymaster>
		{ 3, 113362, 184, 343 }; -- Lord Jorach Ravenholdt
		{ 4, 98102, 177, 327 }; -- Valeera Sanguinar
		{ 5, 94141, 192, 319 }; -- Garona Halforcen
		{ 6, 102641, 168, 303 }; -- Filius Sparkstache <Archivist>
		{ 7, 105998, 212, 308 }; -- Winstone Wolfe <The Wolf>
		{ 8, 102594, 124, 310 }; -- Marin Noggenfogger <Baron of Gadgetzan>
		{ 9, 10009, 104, 274 }; -- Crucible of the Uncrowned
		{ 10, 109609, 121, 248 }; -- Lorena Belle <Master Smuggler>
		{ 11, 10011, 162, 212 }; -- Nikki the Gossip <Tales fo Adventure and Profit>
		{ 12, 105979, 134, 136 }; -- Lonika Stillblade <Rogue Academy Proprietor>
		{ 13, 105989,  74, 121 }; -- Loren the Fence <Rogue Trainer>
		{ 14, 10014,  90, 139 }; -- Training Dummies
		{ 15, 105986, 108, 174 }; -- Kelsey Steelspark <Quartermaster>
		{ 16, 106083, 229, 195 }; -- Yancey Grillsen <Bloodsail Recruiter>
		{ 17, 110348, 393, 256 }; -- Mal <Weapons Smuggler>
	};
	CH_Shaman = {
		{ "A", 10101, 240, 233 }; -- Portal to Dalaran
		{ "B", 10102, 217, 175 }; -- Vortex Pinnacle Portal (Mistral Essence)
		{ 1, 10001, 298, 349 }; -- Training Dummies
		{ 2, 99531, 291, 369 }; -- Aggra <Shaman Trainer>
		{ 3, 10003, 244, 361 }; -- Elementalist Janai <Earthen Ring>
		{ 4, 10004, 272, 271 }; -- Advisor Sevel <The Earthen Ring>
		{ 5, 112199, 268, 259 }; -- Journeyman Goldmine <Class Hall Upgrades>
		{ 6, 112318, 248, 278 }; -- Flamesmith Lanying <Earthen Ring Quartermaster>
		{ 7, 106457, 250, 263 }; -- Summoner Morn <Elemental Summoner>
		{ 8, 103004, 204, 224 }; -- Puzzlemaster Lo <The Earthen Ring>
		{ 9, 111739, 262, 218 }; -- Gorma Windspeaker <Keeper of Legends>
		{ 10, 10010, 293, 200 }; -- Ancient Elemental Altar
		{ 11, 112262, 273, 184 }; -- Gavan Grayfeather <Ears of the Maelstrom>
		{ 12, 112208, 236, 182 }; -- Felinda Frye <Earthwarden Recruiter>
-- 		{ 12, 96758, 228, 176 }; -- Mackay Firebeard <The Earthen Ring>
		{ 13, 96745, 221, 190 }; -- Orono <The Earthen Ring>
		{ 14, 96747, 254, 148 }; -- Bath'rah the Windwatcher <The Earthen Ring>
		{ 15, 111922, 254, 120 }; -- Tribemother Torra <Shaman Trainer>
		{ 16, 112438, 259, 104 }; -- Morgl the Oracle <The Earthen Ring>
		{ 17, 106291, 293, 124 }; -- Neptulon
	};
	CH_Warlock = {
		{ "A", 10101, 482, 273 }; -- Portal to Dalaran
		{ "B", 10102, 371, 224 }; -- Demonic Gateway
		{ "B", 10102, 82, 48 }; -- Demonic Gateway
		{ 1, 10001, 292, 245 }; -- Felblood Altar
		{ 2, 109686, 301, 260 }; -- Unjari Feltongue <The Heartbearer>
		{ 3, 101097, 307, 246 }; -- Calydus
		{ 4, 10004, 392, 315 }; -- Lurr <Dreadscar Blacksmith>
		{ 5, 106217, 410, 311 }; -- Jared <Recruiter>
		{ 6, 10006, 428, 294 }; -- Gakin the Darkbinder <Mission Strategist>
		{ 7, 108018, 381, 279 }; -- Archivist Melinda <Class Hall Upgrades>
		{ 8, 111740, 393, 279 }; -- Mile Raitheborne <Head Archivist>
		{ 9, 112434, 399, 255 }; -- Gigi Gigavoid <Black Harvest Quartermaster>
		{ 10, 106216, 432, 251 }; -- Imp Mother Dyala <Recruiter>
		{ 11, 10011, 250, 336 }; -- Training Dummies
		{ 11, 10011, 274, 365 }; -- Training Dummies
		{ 11, 10011, 303, 376 }; -- Training Dummies
		{ 11, 10011, 326, 341 }; -- Training Dummies
	};
	CH_Warrior = {
		{ "A", 96679, 245, 115 }; -- Aerylia <Stormflight Master>
		{ 1, 10001, 252, 58 }; -- Skyseer Ghrent
		{ 2, 106459, 277, 68 }; -- Captain Hjalmar Stahlstrom <Recruiter>
		{ 3, 106460, 227, 68 }; -- Savyn Valorborn <Recruiter>
		{ 4, 112392, 224, 124 }; -- Quartermaster Durnolf
		{ 5, 110437, 275, 123 }; -- Haklang Ulfsson <Armaments Requisitioner>
		{ 6, 111741, 147, 135 }; -- Fjornson Stonecarver <Keeper of Legends>
		{ 7, 107994, 156, 139 }; -- Einar the Runecaster <Class Hall Upgrades>
		{ 8, 10008, 108, 173 }; -- Master Smith Helgar
		{ 9, 112577, 356, 179 }; -- Weaponmaster Asvard <Warrior Trainer>
		{ 10, 10010, 390, 179 }; -- Arena of Glory
		{ 11, 10011, 436, 179 }; -- Training Dummies
		{ 12, 107987, 226, 422 }; -- Hymdall
		{ 13, 96469, 245, 432 }; -- Odyn
		{ 14, 111774, 354, 146 };-- Matilda Skoptidottir
		{ 15, 10015, 217,  81 }; -- Sharak Tor / Matthew Glensorrow
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
