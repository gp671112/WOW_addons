-- $Id: Atlas_ClassOrderHalls_DB.lua 62 2016-11-29 05:21:07Z arith $
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


local myDB = {
	CH_DeathKnight = {
		{ "A", 10101, 4, 313 }; -- Portal to Dalaran
		{ "B", 10102, 49, 306 }; -- Portal to another floor
		{ "B", 10102, 217, 108 }; -- Portal to another floor
		{  1, 10001, 21, 288 }; -- Flight Master
		{  2, 10002, 152, 366 }; -- Siouxsie the Banshee <Mission Specialist>
		{  3, 10003, 147, 391 }; -- Illanna Dreadmoore <Ebon Blade Archivist>
		{  4, 10004, 243, 443 }; -- Lord Thorval
		{  5, 10005, 327, 177 }; -- Training Dummies
		{  6, 10006, 290, 115 }; -- Quartermaster Ozorg <Rare Goods Vendor>
		{  7, 10007, 393, 210 }; -- Grand Master Siegesmith Corvus
		{  8, 10008, 396, 153 }; -- Lady Alistra <Death Knight Trainer>
	};
	CH_DemonHunter = {
		{ "A", 10101, 122, 416 }; -- Illidari Gateway
		{ "A", 10102, 53, 247 }; -- Ramp to lower floor
		{ "A", 10102, 193, 247 }; -- Ramp to lower floor
		{ "B", 10103, 307, 247 }; -- Ramp to top floor
		{ "B", 10103, 444, 247 }; -- Ramp to top floor
		{   1, 10001, 122, 269 }; -- Kayn Sunfury <Illidari>
		{   2, 10002, 100, 248 }; -- Battlelord Gaardoun <Ashtongue Captain>
		{   3, 10003, 122, 248 }; -- Scouting Map
		{   4, 10004, 148, 248 }; -- Lady S'theno <Coilskar Captain>
		{   5, 10005, 112, 239 }; -- Belath Dawnblade <Illidari>
		{   6, 10006, 123, 224 }; -- Matron Mother Malevolence <Shivarra Captain>
		{   7, 10007, 113, 195 }; -- Falara Nightsong <Illidari Provisioner>
		{   8, 10008, 133, 196 }; -- Slitesh <Armaments Requisitioner>
		{   9, 10009, 103, 175 }; -- Asha Ravensong
		{  10, 10010, 123, 179 }; -- Ariana Fireheart <Illidari>
		{  11, 10011, 140, 172 }; -- Izal Whitemoon
		{  12, 10012, 100, 94 }; -- Training Dummies
		{  13, 10013, 375, 355 }; -- Jace Darkweaver <Illidari>
		{  14, 10014, 395, 350 }; -- Vahu the Weathered <Illidari Researcher>
		{  15, 10015, 347, 294 }; -- Loramus Thalipedes <Class Hall Upgrades>
		{  16, 10016, 375, 249 }; -- Empowered Nether Crucible
		{  17, 10017, 374, 119 }; -- Cursed Forge of the Nathrezim
		{  18, 10018, 357, 129 }; -- Seer Akalu
	};
	CH_Druid = {
		{  "A", 10101, 337, 82 }; -- Portal to Emerald Dreamway
		{  "B", 10102, 346, 204 }; -- Portal to Dalaran
		{  "A", 10103, 260, 123 }; -- Tel'Andu Barrow Den
		{    1, 10001, 391, 150 }; -- Flight Master
		{    2, 10002, 207, 108 }; -- Amurra Thistledew <Proprietor>
		{    3, 10003, 177, 111 }; -- Sister Lilith <Recruiter>
		{    4, 10004, 145, 127 }; -- Leafbeard the Storied <Ancient of Lore>
		{    5, 10005, 153, 145 }; -- Celadine the Fatekeeper <Dreamgrove Researcher>
		{    6, 10006, 191, 156 }; -- Yaris Darkclaw <Recruiter>
		{    7, 10007, 130, 264 }; -- Seed of Ages
		{    8, 10008, 244, 257 }; -- Rensar Greathoof <Archdruid of the Grove>
		{    9, 10009, 244, 244 }; -- Keeper Remulos
		{   10, 10010, 255, 254 }; -- Lyessa Bloomwatcher <Guardian of G'Hanir>
		{   11, 10011, 312, 256 }; -- Scouting Map, Skylord Omnuron <Mission Specialist>, Mylune
		{   12, 10012, 377, 259 }; -- Zen'kiki
		{   13, 10013, 474, 282 }; -- Training Dummies
	};
	CH_Hunter = {
		{ "A", 10101, 234, 289 }; -- Portal to Dalaran
		{ 1, 10001, 163, 238 }; -- Flight Master
		{ 2, 10002, 182, 241 }; -- Great Eagle
		{ 3, 10003, 209, 230 }; -- Emmarel Shadewarden <Unseen Path>
		{ 3, 10003, 193, 414 }; -- Emmarel Shadewarden <Unseen Path>
		{ 4, 10004, 228, 343 }; -- Altar Keeper Biehn
		{ 5, 10005, 210, 318 }; -- Outfitter Reynolds <Unseen Path>
		{ 6, 10006, 199, 308 }; -- Tactician Tinderfell <Unseen Path>
		{ 7, 10007, 208, 302 }; -- Image of Mimiron
		{ 8, 10009, 252, 338 }; -- Holt Thunderhorn <Lore and Legends>
		{ 8, 10009, 273, 318 }; -- Training Dummies
		{ 9, 10009, 207, 291 }; -- Training Dummies
		{ 9, 10009, 188, 306 }; -- Training Dummies
		{ 10, 10010, 202, 277 }; -- Lenara <Recruiter>
		{ 11, 10011, 289, 322 }; -- Survivalist Bahn <Class Hall Upgrades>
		{ 12, 10012, 283, 257 }; -- Sampson <Recruiter>
		{ 13, 10013, 324, 471 }; -- Ogdrul <The Seeker>
	};
	CH_Mage = {
		{  1, 10001, 408, 129 }; -- Forge of the Guardian
		{  2, 10002, 436, 147 }; -- Edirah <Tirisgarde Researcher>
		{  3, 10003, 422, 108 }; -- Magister Varenthas
		{  4, 10004, 388, 116 }; -- Meryl Felstorm
		{  5, 10005, 377, 128 }; -- Old Fillmaff <Tirisgarde Librarian>
		{  6, 10006, 337, 187 }; -- Jackson Watkins <Tirisgarde Quartermaster> 
		{  7, 10007, 485, 176} ; -- Esara Verrinde
		{  8, 10008, 466, 161 }; -- Ravandwyr
		{  "A", 10200, 406, 225 }; -- Connection
		{  "B", 10200, 347, 231 }; -- Connection
		{  "B", 10200, 467, 231 }; -- Connection
		{  "A", 10101, 162, 476 }; -- Portal to Dalaran
		{  "B", 10102, 131, 286 }; -- Azsuna
		{  "C", 10103, 131, 303 }; -- Highmountain
		{  "D", 10104, 197, 286 }; -- Stormheim
		{  "E", 10105, 197, 303 }; -- Val'sharah
		{  "F", 10106, 162, 324 }; -- Suramar
		{  9, 10009, 239, 231 }; -- Chronicler Elrianne <Class Hall Upgrades> 
		{ 10, 10010, 307, 296 }; -- Archmage Omniara <Recruiter> 
		{ 11, 10011, 284, 349 }; -- Scouting map
		{ 12, 10012, 286, 362 }; -- Archmage Melis <Mistress of Flame>
		{ 13, 10013,  58, 343 }; -- Training Dummies
		{ 14, 10014,  77, 259 }; -- Grand Conjurer Mimic
		{  "A", 10200, 164, 350 }; -- Connection
		{  "B", 10200, 104, 353 }; -- Connection
		{  "B", 10200, 224, 353 }; -- Connection
	};
	CH_Monk = {
		{ "A", 10101, 264, 332 }; -- Portal to Dalaran
		{ "B", 10102, 233, 310 }; -- Portal to Peak of Serenity
		{ "C", 10103, 272, 243 }; -- Transportation Mandala
		{ "C", 10103, 228, 243 }; -- Transportation Mandala
		{ 1, 10001, 237, 346 }; -- Caydori Brightstar <Purveyor of Rare Goods>
		{ 2, 10002, 268, 358 }; -- Master Hsu <Mission Master>
		{ 3, 10003, 291, 333 }; -- Elder Xang <Monk Trainer>
		{ 4, 10004, 250, 253 }; -- Iron-Body Ponshu <Senior Master Ox>
		{ 5, 10005, 189, 247 }; -- Lorewalker Cho <Head Archivist>
		{ 6, 10006, 283, 321 }; -- Training Dummies
		{ 6, 10006, 278, 282 }; -- Training Dummies
		{ 6, 10006, 229, 283 }; -- Training Dummies
	};
	CH_Paladin = {
		{ "A", 10101, 102, 472 }; -- Entrance
		{ "A", 10102, 75, 327 }; -- Portal to Dalaran
		{ 1, 10001, 75, 293 }; -- Sister Elda <Keeper of the Ancient Tomes>
		{ 2, 10002, 106, 315 }; -- Eadric the Pure <Quartermaster>
		{ 3, 10003, 192, 397 }; -- Lord Grayson Shadowbreaker <Mission Specialist>
		{ 4, 10004, 183, 245 }; -- Katherine the Pure <Paladin Trainer>
		{ 5, 10005, 229, 294 }; -- Vindicator Baatun <Paladin Trainer>
		{ 6, 10006, 353, 114 }; -- Altar of Ancient Kings
	};
	CH_Priest = {
		{ "A", 10101, 250, 374 }; -- Portal to Dalaran
		{ 1, 10001, 252, 108 }; -- Betild Deepanvil <Master Artificer>
		{ 2, 10002, 324, 130 }; -- Juvess the Duskwhisperer <Keeper of Scrolls>
		{ 3, 10003, 188, 132 }; -- Grand Anchorite Gesslar <Recruiter>
		{ 4, 10004, 177, 117 }; -- Meridelle Lightspark <Logistics>
		{ 5, 10005, 248, 221 }; -- Command Map
		{ 6, 10006, 263, 223 }; -- Alonsus Faol <Bishop of Secrets>
		{ 7, 10007, 258, 211 }; -- Moira Thaurissan <Queen of the Dark Iron>
		{ 8, 10008, 239, 221 }; -- Prophet Velen
		{ 9, 10009, 243, 232 }; -- Delas Moonfang <Priestess of the Moon>
		{ 10, 10010, 288, 193 }; -- Archon Torias <Class Hall Upgrades>
		{ 11, 10011, 188, 253 }; -- Vicar Eliza <Recruiter>
		{ 12, 10012, 173, 248 }; -- Dark Cleric Cecille <Priest Trainer>
		{ 13, 10013, 170, 268 }; -- Training Dummies
		{ 14, 10014, 221, 132 }; -- Lilith <Armament Supplier>
	};
	CH_Rogue = {
		{ "A", 10101, 416, 365 }; -- Glorious Goods
		{ "B", 10102, 189,  99 }; -- One More Glass
		{ "C", 10103, 120, 114 }; -- Tanks for Everything
		{ "D", 10104, 130, 196 }; -- Tunnel of Woe
		{ 1, 10001, 294, 218 }; -- Madam Gosu <Black Market Liaison>
		{ 2, 10002, 184, 343 }; -- Lord Jorach Ravenholdt
		{ 3, 10003, 168, 303 }; -- Filius Sparkstache <Archivist>
		{ 4, 10004, 212, 308 }; -- Winstone Wolfe <The Wolf>
		{ 5, 10005, 124, 310 }; -- Marin Noggenfogger <Baron of Gadgetzan>
		{ 6, 10006, 104, 274 }; -- Crucible of the Uncrowned
		{ 7, 10007, 121, 248 }; -- Lorena Belle <Master Smuggler>
		{ 8, 10008, 162, 212 }; -- Nikki the Gossip <Tales fo Adventure and Profit>
		{ 9, 10009, 134, 136 }; -- Lonika Stillblade <Rogue Academy Proprietor>
		{ 10, 10010,  97, 116 }; -- Rouge Trainers
		{ 11, 10011,  90, 139 }; -- Training Dummies
		{ 12, 10012, 108, 174 }; -- Kelsey Steelspark <Quartermaster>
		{ 13, 10013, 229, 195 }; -- Yancey Grillsen <Bloodsail Recruiter>
	};
	CH_Shaman = {
		{ "A", 10101, 240, 233 }; -- Portal to Dalaran
		{ 1, 10001, 298, 349 }; -- Training Dummies
		{ 2, 10002, 291, 369 }; -- Aggra <Shaman Trainer>
		{ 3, 10003, 244, 361 }; -- Elementalist Janai <Earthen Ring>
		{ 4, 10004, 204, 224 }; -- Puzzlemaster Lo <The Earthen Ring>
		{ 5, 10005, 249, 275 }; -- Flamesmith Lanying <Earthen Ring Quartermaster>
		{ 6, 10006, 272, 271 }; -- Advisor Sevel <The Earthen Ring>
		{ 7, 10007, 262, 218 }; -- Gorma Windspeaker <Keeper of Legends>
		{ 8, 10008, 254, 120 }; -- Tribemother Torra <Shaman Trainer>
	};
	CH_Warlock = {
		{ "A", 10101, 482, 273 }; -- Portal to Dalaran
		{ "B", 10102, 371, 224 }; -- Demonic Gateway
		{ "B", 10102, 82, 48 }; -- Demonic Gateway
		{ 1, 10001, 292, 245 }; -- Felblood Altar
		{ 2, 10002, 301, 260 }; -- Unjari Feltongue <The Heartbearer>
		{ 3, 10003, 307, 246 }; -- Calydus
		{ 4, 10004, 392, 315 }; -- Lurr <Dreadscar Blacksmith>
		{ 5, 10005, 410, 311 }; -- Jared <Recruiter>
		{ 6, 10006, 428, 294 }; -- Gakin the Darkbinder <Mission Strategist>
		{ 7, 10007, 381, 279 }; -- Archivist Melinda <Class Hall Upgrades>
		{ 8, 10008, 393, 279 }; -- Mile Raitheborne <Head Archivist>
		{ 9, 10009, 399, 255 }; -- Gigi Gigavoid <Black Harvest Quartermaster>
		{ 10, 10010, 432, 251 }; -- Imp Mother Dyala <Recruiter>
		{ 11, 10011, 250, 336 }; -- Training Dummies
		{ 11, 10011, 274, 365 }; -- Training Dummies
		{ 11, 10011, 303, 376 }; -- Training Dummies
		{ 11, 10011, 326, 341 }; -- Training Dummies
	};
	CH_Warrior = {
		{ "A", 10101, 245, 115 }; -- Aerylia <Stormflight Master>
		{ 1, 10001, 252, 58 }; -- Skyseer Ghrent
		{ 2, 10002, 277, 68 }; -- Captain Hjalmar Stahlstrom <Recruiter>
		{ 3, 10003, 227, 68 }; -- Savyn Valorborn <Recruiter>
		{ 4, 10004, 224, 124 }; -- Quartermaster Durnolf
		{ 5, 10005, 275, 123 }; -- Haklang Ulfsson <Armaments Requisitioner>
		{ 6, 10006, 147, 135 }; -- Fjornson Stonecarver <Keeper of Legends>
		{ 7, 10007, 156, 139 }; -- Einar the Runecaster <Class Hall Upgrades>
		{ 8, 10008, 108, 173 }; -- Master Smith Helgar
		{ 9, 10009, 356, 179 }; -- Weaponmaster Asvard <Warrior Trainer>
		{ 10, 10010, 390, 179 }; -- Arena of Glory
		{ 11, 10011, 436, 179 }; -- Training Dummies
		{ 12, 10012, 226, 422 }; -- Hymdall
		{ 13, 10013, 245, 432 }; -- Odyn
	};
};

for k, v in pairs(myDB) do
	AtlasMaps_NPC_DB[k] = v;
end
