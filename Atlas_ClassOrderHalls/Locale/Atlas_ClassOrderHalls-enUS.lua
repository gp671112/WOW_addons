-- $Id: Atlas_ClassOrderHalls-enUS.lua 56 2016-10-25 16:39:31Z arith $
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
local L = AceLocale:NewLocale("Atlas_ClassOrderHalls", "enUS", true);

if L then
	-- //////////////////////////
	-- Common
	-- //////////////////////////
	L["Class Order Hall Maps"] = "Class Order Hall Maps";
	L["Portal to Dalaran"] = "Portal to Dalaran";
	L["Training Dummies"] = "Training Dummies";
	L["Travel to Dalaran"] = "Travel to Dalaran";
	L["Entrance"] = "Entrance";
	L["Ramp to lower floor"] = "Ramp to lower floor";
	L["Ramp to top floor"] = "Ramp to top floor";
	L["Champion Armaments"] = "Champion Armaments";

	-- //////////////////////////
	-- Death Knight
	-- //////////////////////////
	L["Portal to another floor"] = "Portal to another floor";
	L["Siouxsie the Banshee <Mission Specialist>"] = "Siouxsie the Banshee <Mission Specialist>"; -- 93568
	L["Highlord Darion Mograine"] = "Highlord Darion Mograine"; -- 93437
	L["Illanna Dreadmoore <Ebon Blade Archivist>"] = "Illanna Dreadmoore <Ebon Blade Archivist>"; -- 97111
	L["Lord Thorval"] = "Lord Thorval"; -- 97134
	L["Quartermaster Ozorg <Rare Goods Vendor>"] = "Quartermaster Ozorg <Rare Goods Vendor>"; -- 93550
	L["Grand Master Siegesmith Corvus"] = "Grand Master Siegesmith Corvus"; -- 97072
	L["Soul Forge"] = "Soul Forge";
	L["Lady Alistra <Death Knight Trainer>"] = "Lady Alistra <Death Knight Trainer>"; -- 93509

	-- //////////////////////////
	-- Demon Hunter
	-- //////////////////////////
	L["Illidari Gateway"] = "Illidari Gateway";
	L["Kayn Sunfury <Illidari>"] = "Kayn Sunfury <Illidari>"; -- 95240
	L["Battlelord Gaardoun <Ashtongue Captain>"] = "Battlelord Gaardoun <Ashtongue Captain>"; -- 103025
	L["Lady S'theno <Coilskar Captain>"] = "Lady S'theno <Coilskar Captain>"; -- 98624
	L["Matron Mother Malevolence <Shivarra Captain>"] = "Matron Mother Malevolence <Shivarra Captain>"; -- 98632
	L["Falara Nightsong <Illidari Provisioner>"] = "Falara Nightsong <Illidari Provisioner>"; -- 112407
	L["Jace Darkweaver <Illidari>"] = "Jace Darkweaver <Illidari>"; -- 98646
	L["Vahu the Weathered <Illidari Researcher>"] = "Vahu the Weathered <Illidari Researcher>"; -- 111736
	L["Empowered Nether Crucible"] = "Empowered Nether Crucible";
	L["Cursed Forge of the Nathrezim"] = "Cursed Forge of the Nathrezim";
	L["Asha Ravensong <Illidari>"] = "Asha Ravensong <Illidari>"; -- 108326
	L["Izal Whitemoon <Illidari Trainer>"] = "Izal Whitemoon <Illidari Trainer>"; -- 109965
	L["Seer Akalu <Nathrezim Scholar>"] = "Seer Akalu <Nathrezim Scholar>"; -- 109596
	L["Kor'vas Bloodthorn <Illidari>"] = "Kor'vas Bloodthorn <Illidari>"; -- 103761
	L["Loramus Thalipedes <Class Hall Upgrades>"] = "Loramus Thalipedes <Class Hall Upgrades>"; -- 110599
	L["Belath Dawnblade <Illidari>"] = "Belath Dawnblade <Illidari>"; -- 108782
	L["Ariana Fireheart <Illidari>"] = "Ariana Fireheart <Illidari>"; -- 103760

	-- //////////////////////////
	-- Druid
	-- //////////////////////////
	L["Portal to Emerald Dreamway"] = "Portal to Emerald Dreamway";
	L["Amurra Thistledew <Proprietor>"] = "Amurra Thistledew <Proprietor>";  -- 112323
	L["Sister Lilith <Recruiter>"] = "Sister Lilith <Recruiter>"; -- 108393
	L["Leafbeard the Storied <Ancient of Lore>"] = "Leafbeard the Storied <Ancient of Lore>"; -- 97989
	L["Celadine the Fatekeeper <Dreamgrove Researcher>"] = "Celadine the Fatekeeper <Dreamgrove Researcher>"; -- 111737
	L["Seed of Ages"] = "Seed of Ages";
	L["Tender Daranelle"] = "Tender Daranelle"; -- 109612
	L["Rensar Greathoof <Archdruid of the Grove>"] = "Rensar Greathoof <Archdruid of the Grove>"; -- 101195
	L["Keeper Remulos"] = "Keeper Remulos"; -- 103832
	L["Lyessa Bloomwatcher <Guardian of G'Hanir>"] = "Lyessa Bloomwatcher <Guardian of G'Hanir>"; -- 104577
	L["Skylord Omnuron <Mission Specialist>"] = "Skylord Omnuron <Mission Specialist>"; -- 98002
	L["Zen'kiki"] = "Zen'kiki"; --98784
	L["Yaris Darkclaw <Recruiter>"] = "Yaris Darkclaw <Recruiter>"; -- 106442
	L["Mylune"] = "Mylune"; -- 113525

	-- //////////////////////////
	-- Hunter
	-- //////////////////////////
	L["Emmarel Shadewarden <Unseen Path>"] = "Emmarel Shadewarden <Unseen Path>"; -- 107317
	L["Altar Keeper Biehn"] = "Altar Keeper Biehn"; -- 102940
	L["Altar of the Eternal Hunt"] = "Altar of the Eternal Hunt";
	L["Outfitter Reynolds <Unseen Path>"] = "Outfitter Reynolds <Unseen Path>"; -- 103693
	L["Tactician Tinderfell <Unseen Path>"] = "Tactician Tinderfell <Unseen Path>"; -- 103023
	-- L["Halduron Brightwing <Ranger-General of the Farstriders>"] = "Halduron Brightwing <Ranger-General of the Farstriders>";
	L["Holt Thunderhorn <Lore and Legends>"] = "Holt Thunderhorn <Lore and Legends>"; -- 98737
	L["Tales of the Hunt"] = "Tales of the Hunt";
	L["Loren Stormhoof <Skyhorn Emissary>"] = "Loren Stormhoof <Skyhorn Emissary>"; -- 107315
	L["Lenara <Recruiter>"] = "Lenara <Recruiter>"; -- 106444
	L["Survivalist Bahn <Class Hall Upgrades>"] = "Survivalist Bahn <Class Hall Upgrades>"; -- 108050
	L["Sampson <Recruiter>"] = "Sampson <Recruiter>"; -- 106446
	L["Pan the Kind Hand <Stable Master>"] = "Pan the Kind Hand <Stable Master>"; -- 100661
	L["Great Eagle"] = "Great Eagle";

	-- //////////////////////////
	-- Mage
	-- //////////////////////////
	L["Edirah <Tirisgarde Researcher>"] = "Edirah <Tirisgarde Researcher>"; -- 110624
	L["Jackson Watkins <Tirisgarde Quartermaster>"] = "Jackson Watkins <Tirisgarde Quartermaster>"; -- 112440
	L["Chronicler Elrianne <Class Hall Upgrades>"] = "Chronicler Elrianne <Class Hall Upgrades>"; -- 108331
	L["Archmage Omniara <Recruiter>"] = "Archmage Omniara <Recruiter>"; -- 106377
	L["Archmage Melis <Mistress of Flame>"] = "Archmage Melis <Mistress of Flame>"; -- 108515
	L["Forge of the Guardian"] = "Forge of the Guardian";
	L["Old Fillmaff <Tirisgarde Librarian>"] = "Old Fillmaff <Tirisgarde Librarian>"; -- 107452
	L["Meryl Felstorm"] = "Meryl Felstorm"; -- 102700
	L["Archmage Kalec <Kirin Tor>"] = "Archmage Kalec <Kirin Tor>"; -- 108247
	L["Archmage Modera <Kirin Tor>"] = "Archmage Modera <Kirin Tor>"; -- 108248
	L["The Great Akazamzarak"] = "The Great Akazamzarak"; -- 103092
	L["Grand Conjurer Mimic <Mage Recruiter Extraordinaire>"] = "Grand Conjurer Mimic <Mage Recruiter Extraordinaire>"; -- 106433
	L["Esara Verrinde <Magisters>"] = "Esara Verrinde <Magisters>"; -- 108380
	L["Ravandwyr <Senior Kirin Tor Apprentice>"] = "Ravandwyr <Senior Kirin Tor Apprentice>"; -- 108377
	L["Magister Varenthas <High Forgeguard>"] = "Magister Varenthas <High Forgeguard>"; -- 109642

	-- //////////////////////////
	-- Monk
	-- //////////////////////////
	L["Caydori Brightstar <Purveyor of Rare Goods>"] = "Caydori Brightstar <Purveyor of Rare Goods>"; -- 112338
	L["Portal to Peak of Serenity"] = "Portal to Peak of Serenity";
	L["Master Hsu <Mission Master>"] = "Master Hsu <Mission Master>"; -- 99179
	L["Elder Xang <Monk Trainer>"] = "Elder Xang <Monk Trainer>"; -- 101749
	L["Iron-Body Ponshu <Senior Master Ox>"] = "Iron-Body Ponshu <Senior Master Ox>"; -- 100438
	L["Forge of the Roaring Mountain"] = "Forge of the Roaring Mountain";
	L["Lorewalker Cho <Head Archivist>"] = "Lorewalker Cho <Head Archivist>"; -- 106942
	L["Transportation Mandala"] = "Transportation Mandala";
	L["Lao Li the Quiet <Monk Trainer>"] = "Lao Li the Quiet <Monk Trainer>"; -- 101757

	-- //////////////////////////
	-- Paladin
	-- //////////////////////////
	L["Sister Elda <Keeper of the Ancient Tomes>"] = "Sister Elda <Keeper of the Ancient Tomes>"; -- 91190
	L["Lord Grayson Shadowbreaker <Mission Specialist>"] = "Lord Grayson Shadowbreaker <Mission Specialist>"; -- 90250
	L["Katherine the Pure <Paladin Trainer>"] = "Katherine the Pure <Paladin Trainer>"; -- 92313
	L["Vindicator Baatun <Paladin Trainer>"] = "Vindicator Baatun <Paladin Trainer>"; -- 92316
	L["Altar of Ancient Kings"] = "Altar of Ancient Kings";
	L["Eadric the Pure <Quartermaster>"] = "Eadric the Pure <Quartermaster>"; -- 100196

	-- //////////////////////////
	-- Priest
	-- //////////////////////////
	L["Command Map"] = "Command Map";
	L["Altar of Light and Shadow"] = "Altar of Light and Shadow";
	L["Betild Deepanvil <Master Artificer>"] = "Betild Deepanvil <Master Artificer>"; -- 102709
	L["Juvess the Duskwhisperer <Keeper of Scrolls>"] = "Juvess the Duskwhisperer <Keeper of Scrolls>"; -- 111738
	L["Meridelle Lightspark <Logistics>"] = "Meridelle Lightspark <Logistics>"; -- 112401
	L["Alonsus Faol <Bishop of Secrets>"] = "Alonsus Faol <Bishop of Secrets>"; -- 110564
	L["Dark Cleric Cecille <Priest Trainer>"] = "Dark Cleric Cecille <Priest Trainer>"; -- 112576
	L["Grand Anchorite Gesslar <Recruiter>"] = "Grand Anchorite Gesslar <Recruiter>"; -- 106450
	L["Moira Thaurissan <Queen of the Dark Iron>"] = "Moira Thaurissan <Queen of the Dark Iron>"; -- 109776
	L["Prophet Velen"] = "Prophet Velen"; -- 110557
	L["Delas Moonfang <Priestess of the Moon>"] = "Delas Moonfang <Priestess of the Moon>"; -- 110571
	L["Archon Torias <Class Hall Upgrades>"] = "Archon Torias <Class Hall Upgrades>"; -- 110725 
	L["Vicar Eliza <Recruiter>"] = "Vicar Eliza <Recruiter>"; -- 106451
	L["Lilith <Armament Supplier>"] = "Lilith <Armament Supplier>"; -- 110595

	-- //////////////////////////
	-- Rogue
	-- //////////////////////////
	L["Madam Gosu <Black Market Liaison>"] = "Madam Gosu <Black Market Liaison>"; -- 103791
	L["Lord Jorach Ravenholdt"] = "Lord Jorach Ravenholdt"; -- 113362
	L["Filius Sparkstache <Archivist>"] = "Filius Sparkstache <Archivist>"; -- 102641
	L["Marin Noggenfogger <Baron of Gadgetzan>"] = "Marin Noggenfogger <Baron of Gadgetzan>"; -- 102594
	L["Crucible of the Uncrowned"] = "Crucible of the Uncrowned";
	L["Nikki the Gossip <Tales fo Adventure and Profit>"] = "Nikki the Gossip <Tales fo Adventure and Profit>"; -- 98092
	L["Loren the Fence <Rogue Trainer>"] = "Loren the Fence <Rogue Trainer>"; -- 105989
	L["Kelsey Steelspark <Quartermaster>"] = "Kelsey Steelspark <Quartermaster>"; -- 105986

	-- //////////////////////////
	-- Shaman
	-- //////////////////////////
	L["Aggra <Shaman Trainer>"] = "Aggra <Shaman Trainer>"; -- 99531
	L["Elementalist Janai <Earthen Ring>"] = "Elementalist Janai <Earthen Ring>"; -- 109464
	L["Maelstrom Pillar"] = "Maelstrom Pillar";
	L["Puzzlemaster Lo <The Earthen Ring>"] = "Puzzlemaster Lo <The Earthen Ring>"; -- 103004
	L["Flamesmith Lanying <Earthen Ring Quartermaster>"] = "Flamesmith Lanying <Earthen Ring Quartermaster>"; -- 112318
	L["Gorma Windspeaker <Keeper of Legends>"] = "Gorma Windspeaker <Keeper of Legends>"; -- 111739
	L["Tribemother Torra <Shaman Trainer>"] = "Tribemother Torra <Shaman Trainer>"; -- 111922
	L["Advisor Sevel <The Earthen Ring>"] = "Advisor Sevel <The Earthen Ring>"; -- 96746

	-- //////////////////////////
	-- Warlock
	-- //////////////////////////
	L["Calydus"] = "Calydus"; -- 101097
	L["Unjari Feltongue <The Heartbearer>"] = "Unjari Feltongue <The Heartbearer>"; -- 109686
	L["Felblood Altar"] = "Felblood Altar";
	L["Lurr <Dreadscar Blacksmith>"] = "Lurr <Dreadscar Blacksmith>"; -- 101913
	L["Ritssyn Flamescowl <Council of the Black Harvest>"] = "Ritssyn Flamescowl <Council of the Black Harvest>"; -- 104795
	L["Dreadscar Battle Plans"] = "Dreadscar Battle Plans";
	L["Gakin the Darkbinder <Mission Strategist>"] = "Gakin the Darkbinder <Mission Strategist>"; -- 106199
	L["Demonic Gateway"] = "Demonic Gateway";
	L["Gigi Gigavoid <Black Harvest Quartermaster>"] = "Gigi Gigavoid <Black Harvest Quartermaster>"; -- 112434
	L["Mile Raitheborne <Head Archivist>"] = "Mile Raitheborne <Head Archivist>"; -- 111740
	L["Jared <Recruiter>"] = "Jared <Recruiter>"; -- 106217

	-- //////////////////////////
	-- Warrior
	-- //////////////////////////
	L["Aerylia <Stormflight Master>"] = "Aerylia <Stormflight Master>"; -- 96679
	L["Quartermaster Durnolf"] = "Quartermaster Durnolf"; -- 112392
	L["Fjornson Stonecarver <Keeper of Legends>"] = "Fjornson Stonecarver <Keeper of Legends>"; -- 111741
	L["Master Smith Helgar"] = "Master Smith Helgar"; -- 96586
	L["Forge of Odyn"] = "Forge of Odyn";
	L["Weaponmaster Asvard <Warrior Trainer>"] = "Weaponmaster Asvard <Warrior Trainer>"; -- 112577
	L["Skyseer Ghrent"] = "Skyseer Ghrent"; -- 100635
	L["Eye of Odyn"] = "Eye of Odyn";
	L["Captain Hjalmar Stahlstrom <Recruiter>"] = "Captain Hjalmar Stahlstrom <Recruiter>"; -- 106459
	L["Einar the Runecaster <Class Hall Upgrades>"] = "Einar the Runecaster <Class Hall Upgrades>"; -- 107994 
	L["Savyn Valorborn <Recruiter>"] = "Savyn Valorborn <Recruiter>"; -- 106460
	L["Haklang Ulfsson <Armaments Requisitioner>"] = "Haklang Ulfsson <Armaments Requisitioner>"; -- 110437
	L["Travel to:"] = "Travel to:";
end
