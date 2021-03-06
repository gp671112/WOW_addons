﻿local myname, ns = ...

-- note to self: I like Garr_TreasureIcon...

local merge = function(t1, t2)
    if not t2 then return t1 end
    for k, v in pairs(t2) do
        t1[k] = v
    end
end
ns.merge = merge

local AZERITE = 1553
local CHEST = 'Treasure Chest'
local CHEST_SM = 'Small Treasure Chest'
local CHEST_GLIM = 'Glimmering Treasure Chest'

local path_meta = {__index = {
    label = "到財寶的路徑",
    atlas = "map-icon-SuramarDoor.tga", -- 'PortalPurple'
    path = true,
    scale = 1.1,
}}
local path = function(details)
    return setmetatable(details or {}, path_meta)
end
ns.path = path

ns.map_spellids = {
    -- [862] = 0, -- Zuldazar
    -- [863] = 0, -- Nazmir
    -- [864] = 0, -- Vol'dun
    -- [895] = 0, -- Tiragarde Sound
    -- [896] = 0, -- Drustvar
    -- [942] = 0, -- Stormsong Valley
}

ns.points = {
    --[[ structure:
    [uiMapID] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            currency=[id], -- currencyid
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
            hide_before=[id], -- hide if quest not completed
        },
    },
    --]]
    [862] = { -- Zuldazar
        [54093150] = {quest=48938, achievement=12851, criteria=40988, note="在二樓",}, -- Offerings of the Chosen
        [64732170] = {quest=50259, achievement=12851, criteria=40989,}, -- Witch Doctor's Hoard
        [51718690] = {quest=49936, achievement=12851, criteria=40990, note="船的底層",}, -- Spoils of Pandaria
        [51432661] = {quest=50582, achievement=12851, criteria=40991,}, -- Gift of the Brokenhearted
        [49486526] = {quest=49257, achievement=12851, criteria=40992, note="船的頂部",}, -- Warlord's Cache
        [38793443] = {quest=50707, achievement=12851, criteria=40993, note="在瀑布後的路",}, -- Dazar's Forgotten Chest
        [61065863] = {quest=50947, achievement=12851, criteria=40994, npc=133208, note="事件：先殺死大白鯊",}, -- Da White Shark's Bounty
        [71841676] = {quest=50949, achievement=12851, criteria=40995,}, -- The Exile's Lament
        [56123806] = {quest=51338, achievement=12851, criteria=40996, note="在瀑布後的洞穴",}, -- Cache of Secrets
        [71161767] = path{quest=50949},
        [52974722] = {quest=51624, achievement=12851, criteria=40997}, -- Riches of Tor'nowa
        -- junk
        [80135512] = {quest=51346, junk=true, label="Treasure Chest",},
        [50823158] = {quest=50711, junk=true, label="Treasure Chest",},
    },
    [863] = { -- Nazmir
        [77903634] = {quest=49867, achievement=12771, criteria=40857,}, -- Lucky Horace's Lucky Chest
        [77884635] = {quest=50061, achievement=12771, criteria=40858, note="在死河馬的嘴",}, -- Partially-Digested Treasure
        [43065078] = {quest=49979, achievement=12771, criteria=40859, note="在洞穴",}, -- Cursed Nazmani Chest
        [42275056] = path{quest=49979},
        [35668560] = {quest=49885, achievement=12771, criteria=40860, note="在洞穴",}, -- Cleverly Disguised Chest
        [62103487] = {quest=49891, achievement=12771, criteria=40861, note="水下洞穴",}, -- Lost Nazmani Treasure
        [42772620] = {quest=49484, achievement=12771, criteria=40862, note="爬上樹",}, -- Offering to Bwonsamdi
        [66791735] = {quest=49483, achievement=12771, criteria=40863, note="爬上樹",}, -- Shipwrecked Chest
        [46238292] = {quest=49889, achievement=12771, criteria=40864,}, -- Venomous Seal
        [76826220] = {quest=50045, achievement=12771, criteria=40865, note="水下洞穴",}, -- Swallowed Naga Chest
        [35455498] = {quest=49313, achievement=12771, criteria=40866, note="在洞穴",}, -- Wunja's Trove
    },
    [864] = { -- Vol'dun
        [46598801] = {quest=50237, achievement=12849, criteria=40966, note="使用礦車",}, -- Ashvane Spoils
        [44339222] = path{quest=50237, label="Mine cart"},
        [49787940] = {quest=51132, achievement=12849, criteria=40968, note="爬上石拱門",}, -- Lost Explorer's Bounty
        [44502613] = {quest=51135, achievement=12849, criteria=40970, note="爬上倒下的樹",}, -- Stranded Cache
        [44712480] = path{quest=51135},
        [29388742] = {quest=51137, achievement=12849, criteria=40972, note="在沙堆下",}, -- Zem'lan's Buried Treasure
        [40578574] = {quest=52994, achievement=12849, criteria=41003,}, -- Deadwood Chest
        [38848290] = path{quest=52994},
        [48186469] = {quest=51093, achievement=12849, criteria=40967, note="東邊的門", hide_before=50550, faction="Horde",}, -- Grayal's Last Offering
        [49166469] = path{quest=51093},
        [47195846] = {quest=51133, achievement=12849, criteria=40969, note="從南邊過來",}, -- Sandfury Reserve
        [47445984] = path{quest=51133},
        [57746464] = {quest=51136, achievement=12849, criteria=40971,}, -- Excavator's Greed
        [56696469] = path{quest=51136},
        [57061121] = {quest=52992, achievement=12849, criteria=41002, note="進入神廟頂部",}, -- Lost Offerings of Kimbul
        [26484534] = {quest=53004, achievement=12849, criteria=41004, note="使用被遺棄的浮球",}, -- Sandsunken Treasure
        -- Scavenger of the Sands
        [56297011] = {quest=53132, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41342, note="在橋下",}, -- Jason's Rusty Blade
        [36217838] = {quest=53133, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41343, note="在翻過來的盒子裡面",}, -- Ian's Empty Bottle
        [53568981] = {quest=53134, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41344, note="在桌上",}, -- Julie's Cracked Dish
        [37813049] = {quest=53135, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41345, note="在岩石下",}, -- Brian's Broken Compass
        [26775289] = {quest=53136, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41346, note="一樓，藍色石桌",}, -- Ofer's Bound Journal
        [29455937] = {quest=53137, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41347, note="在小山丘上",}, -- Skye's Pet Rock
        [52431439] = {quest=53138, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41348, note="靠近懸崖的骨頭附近",}, -- Julien's Left Boot
        [43217700] = {quest=53139, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41349, note="靠近牆",}, -- Navarro's Flask
        [47067577] = {quest=53140, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41350, note="階梯下面",}, -- Zach's Canteen
        [45883072] = {quest=53141, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41351, note="掛在小屋上",}, -- Damarcus' Backpack
        [66413590] = {quest=53142, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41352, note="在洞穴",}, -- Rachel's Flute
        [64883632] = path{quest=53142},
        [47933673] = {quest=53143, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41353, note="大樹下面的洞穴",}, -- Josh's Fang Necklace
        [45229114] = {quest=53144, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41354, note="牆上",}, -- Portrait of Commander Martens
        [62832267] = {quest=53145, minimap=true, atlas="VignetteLootElite", scale=1.2, achievement=13016, criteria=41355, note="從Tortaka避難所下來",}, -- Kurt's Ornate Key
        -- junk
        [46984656] = {quest=50883, junk=true, label="Mysterious trashpile", achievement=12482, note="在壁龕裡，召喚Jani，給它充能好的Ranishu Antennae"},
        [61071734] = {quest=50914, junk=true, label=CHEST,},
        [53841481] = {quest=50915, junk=true, label=CHEST,},
        [60843637] = {quest=50916, junk=true, label=CHEST,},
        [62783373] = {quest=50916, junk=true, label=CHEST,},
        [54363351] = {quest=50917, junk=true, label=CHEST,},
        [64172528] = {quest=50918, junk=true, label=CHEST,},
        [35095003] = {quest=50919, junk=true, label=CHEST,},
        [48338890] = {quest=50920, junk=true, label=CHEST, note="在洞穴"},
        [46384538] = {quest=50921, junk=true, label=CHEST,},
        [30344624] = {quest=50922, junk=true, label=CHEST,},
        [29815402] = {quest=50922, junk=true, label=CHEST,},
        [26496777] = {quest=50923, junk=true, label=CHEST,},
        [31158381] = {quest=50924, junk=true, label=CHEST,},
        [37577607] = {quest=50924, junk=true, label=CHEST,},
        [36918033] = {quest=50924, junk=true, label=CHEST,},
        [44858126] = {quest=50925, junk=true, label=CHEST,},
        [52747649] = {quest=50926, junk=true, label=CHEST,},
        [56496993] = {quest=50926, junk=true, label=CHEST,},
        [57545508] = {quest=50928, junk=true, label=CHEST,},
        [52328519] = {quest=51673, junk=true, label=CHEST,},
        [51908251] = {quest=51673, junk=true, label=CHEST,},
    },
    [895] = { -- Tiragarde Sound
        [61515233] = {quest=49963, achievement=12852, criteria=41012, note="騎上保衛者",}, -- Hay Covered Chest
        [56033319] = {quest=52866, achievement=12852, criteria=41014,}, -- Precarious Noble Cache
        [72482169] = {quest=52870, achievement=12852, criteria=41016, note="在洞穴",}, -- Scrimshaw Cache
        [72495814] = {quest=50442, item=155381, achievement=12852, criteria=41013,}, -- Cutwater Treasure Chest
        [61786275] = {quest=52867, achievement=12852, criteria=41015, note="在洞穴",}, -- Forgotten Smuggler's Stash
        [73103950] = {quest=52195, item=161342, achievement=12852, criteria=41017, note="波拉勒斯，在斯陀頌恩修道院",}, -- Secret of the Depths
        [55769095] = {quest=52195, hide_before={52134, 52135, 52136, 52137, 52138}, item=161342, achievement=12852, criteria=41017, note="從斯陀頌恩傳送至此，撿起寶石",}, -- Secret of the Depths
        -- Freehold treasure maps
        [80007600] = {quest=52853, item=162571, achievement=12852, criteria=41018, note="殺死自由港的海盜直到地圖掉落",}, -- Soggy Treasure Map 162571 (q:52853)
        [80708050] = {quest=52859, item=162581, achievement=12852, criteria=41020, note="殺死自由港的海盜直到地圖掉落",}, -- Yellowed Treasure Map 162581 (q:52859)
        [74008300] = {quest=52854, item=162580, achievement=12852, criteria=41019, note="殺死自由港的海盜直到地圖掉落",}, -- Fading Treasure Map 162580 (q:52854)
        [76008500] = {quest=52860, item=162584, achievement=12852, criteria=41021, note="殺死自由港的海盜直到地圖掉落",}, -- Singed Treasure Map 162584 (q:52860)
        -- ...and the actual treasures they point to
        [54994608] = {quest=52807, hide_before=52853, achievement=12852, criteria=41018, note="殺死自由港的海盜直到地圖掉落",}, -- Soggy Treasure Map 162571 (q:52853)
        [90507551] = {quest=52836, hide_before=52859, achievement=12852, criteria=41020, note="殺死自由港的海盜直到地圖掉落",}, -- Yellowed Treasure Map 162581 (q:52859)
        [29222534] = {quest=52833, hide_before=52854, achievement=12852, criteria=41019, note="殺死自由港的海盜直到地圖掉落",}, -- Fading Treasure Map 162580 (q:52854)
        [48983759] = {quest=52845, hide_before=52860, achievement=12852, criteria=41021, note="殺死自由港的海盜直到地圖掉落",}, -- Singed Treasure Map 162584 (q:52860)
        -- junk:
        [76967543] = {quest=48593, junk=true, label=CHEST_SM,},
        [78008050] = {quest=48595, junk=true, label=CHEST_SM,},
        [76358090] = {quest=48595, junk=true, label=CHEST_SM,},
        [75758283] = {quest=48596, junk=true, label=CHEST_SM,},
        [38432868] = {quest=48598, junk=true, label=CHEST_SM,},
        [38762673] = {quest=48599, junk=true, label=CHEST_SM,},
        [78114901] = {quest=48607, junk=true, label=CHEST_SM,},
        [79205050] = {quest=48607, junk=true, label=CHEST_SM,},
        [81344938] = {quest=48607, junk=true, label=CHEST_SM,},
        [76126733] = {quest=48608, junk=true, label=CHEST_SM,},
        [68635108] = {quest=48609, junk=true, label=CHEST_SM,},
        [50842310] = {quest=48611, junk=true, label=CHEST_SM,},
        [47442365] = {quest=48611, junk=true, label=CHEST_SM,},
        [61212836] = {quest=48612, junk=true, label=CHEST_SM,},
        [57311757] = {quest=48617, junk=true, label=CHEST_SM,},
        [87347379] = {quest=48618, junk=true, label=CHEST_SM,},
        [88387840] = {quest=48618, junk=true, label=CHEST_SM,},
        [69801270] = {quest=48619, junk=true, label=CHEST_SM,},
        [46481829] = {quest=48621, junk=true, label=CHEST_SM,},
    },
    [896] = { -- Drustvar
        [33713008] = {quest=53356, achievement=12995, criteria=41697,}, -- Web-Covered Chest
        [63306585] = {quest=53385, achievement=12995, criteria=41699, note="左下上右",}, -- Runebound Cache
        [33687173] = {quest=53387, achievement=12995, criteria=41701, note="右上左下",}, -- Runebound Coffer
        [55605181] = {quest=53472, achievement=12995, criteria=41703, note="點擊女巫火炬",}, -- Bespelled Chest
        [25472416] = {quest=53474, achievement=12995, criteria=41705, note="點擊女巫火炬",}, -- Enchanted Chest
        [25751995] = {quest=53357, achievement=12995, criteria=41698, note="從烏鴉獲得鑰匙",}, -- Merchant's Chest
        [44222770] = {quest=53386, achievement=12995, criteria=41700, note="左右下上",}, -- Runebound Chest
        [18515133] = {quest=53471, achievement=12995, criteria=41702, note="點擊女巫火炬",}, -- Hexed Chest
        [67767367] = {quest=53473, achievement=12995, criteria=41704, note="點擊女巫火炬",}, -- Ensorcelled Chest
        [24304840] = {quest=53475, achievement=12995, criteria=41752,}, -- Stolen Thornspeaker Cache
    },
    [942] = { -- Stormsong Valley
        [66901200] = {quest=51449, achievement=12853, criteria=41061,}, -- Weathered Treasure Chest
        [42854723] = {quest=50089, achievement=12853, criteria=41062, note="在洞穴",}, -- Old Ironbound Chest
        [48968407] = {quest=50526, achievement=12853, criteria=41063,}, -- Frosty Treasure Chest
        [67224321] = {quest=50734, achievement=12853, criteria=41064, note="船下",}, -- Sunken Strongbox
        [59913907] = {quest=50937, achievement=12853, criteria=41065, note="屋頂上",}, -- Hidden Scholar's Chest
        [58608388] = {quest=49811, achievement=12853, criteria=41066, note="平台下",}, -- Smuggler's Stash
        [58216368] = {quest=52326, achievement=12853, criteria=41067, note="在棚子內的架子上層",}, -- Discarded Lunchbox
        [44447353] = {quest=52429, achievement=12853, criteria=41068, note="跳去平台",}, -- Carved Wooden Chest
        [36692323] = {quest=52976, achievement=12853, criteria=41069, note="爬梯子上船",}, -- Venture Co. Supply Chest
        [46003069] = {quest=52980, achievement=12853, criteria=41070, note="柱子後面",}, -- Forgotten Chest
        [41256950] = {achievement=13046, atlas="Food", note="在這裡開一個難忘的午餐；在旅店購買，或從Brennadam廢棄的午餐盒中拾取一個",}, -- These Hills Sing
        -- junk
        [66567107] = {quest=50576, item=154476, label="Honey Vat", note="奇怪的是，不是成就的一部分",},
        [62056563] = {quest=51184, junk=true, label=CHEST_SM,},
        [51796523] = {quest=51184, junk=true, label=CHEST_SM,},
        [70265958] = {quest=51927, junk=true, label=CHEST_SM,},
        [64366899] = {quest=51939, junk=true, label=CHEST_SM,},
        [68067158] = {quest=51939, junk=true, label=CHEST_SM, note="在灌木叢中",},
    },
    [1161] = { -- Boralus
        [61901010] = {quest=52870, achievement=12852, criteria=41016, note="在洞穴",}, -- Scrimshaw Cache
        -- Secret of the Depths:
        [61518382] = {quest=52195, atlas="MagePortalAlliance", minimap=true, achievement=12852, criteria=41017, note="水下洞穴的入口",},
        [55979126] = {quest=52134, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="閱讀潮濕的卷軸; 水下洞穴，入口在修道院",},
        [61527772] = {quest=52135, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="閱讀潮濕的卷軸; 地下",},
        [63078186] = {quest=52136, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="閱讀潮濕的卷軸; 樓上",},
        [70328576] = {quest=52137, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="閱讀潮濕的卷軸; 地下",},
        [67147982] = {quest=52138, atlas="poi-workorders", minimap=true, achievement=12852, criteria=41017, note="閱讀潮濕的卷軸",},
        [55769095] = {quest=52195, atlas="DemonInvasion2", scale=1.4, minimap=true, hide_before={52134, 52135, 52136, 52137, 52138}, item=161342, achievement=12852, criteria=41017, note="不祥的祭壇；使用它，然後傳送，撿起寶石",}, -- Secret of the Depths
        -- junk
        [66758031] = {quest=50952, junk=true, label=CHEST_SM,},
    },
    [1165] = { -- Dazar'alor
        [59258870] = {quest=50947, minimap=true, achievement=12851, criteria=40994, npc=133208, note="事件：先殺死大白鯊",}, -- Da White Shark's Bounty
        [44472690] = {quest=51338, minimap=true, achievement=12851, criteria=40996, note="在瀑布後的洞穴",}, -- Cache of Secrets
        [38300716] = {quest=48938, minimap=true, achievement=12851, criteria=40988, note="在高階祭司大廳的頂部",}, -- Offerings of the Chosen
        [41141101] = path{quest=48938},
    },
}
