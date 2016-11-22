local myname, ns = ...

ns.points = {
    --[[ structure:
    [mapFile] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
        },
    },
    --]]
    ["Suramar"] = {
        [30801090] = { quest=43808, label="月之守衛要塞", icontype="Portal" },
        [21502990] = { quest=42230, label="法拉納爾", note="主線任務指引開啟", icontype="Portal" },
        [42203540] = { quest=43809, label="泰爾亞諾", icontype="Portal" },
        [36204710] = { quest=40956, label="伊露恩斯遺址", note="主線任務指引開啟", icontype="Portal" },
        [43406070] = { quest=43813, label="秩序聖所", note="直達副本門口", icontype="Portal" },
        [43607910] = { quest=43811, label="路納斯特莊園", icontype="Portal" },
        [39107630] = { quest=41575, label="魔魂堡", icontype="Portal" },
        [47508200] = { quest=42487, label="弦月旅店", note="主線任務指引開啟", icontype="Portal", hide_after=43569, },
        [52007800] = { quest=42889, label="永月露臺", icontype="Portal", hide_before=43569, },
        [64006040] = { quest=44084, label="暮光葡萄園", note="主線任務指引開啟", icontype="Portal" },
        -- entrances
        [27802230] = { quest=43808, entrance=true, label="Moon Guard (entrance)" },
        [42606170] = { quest=43813, entrance=true, label="Sanctum of Order (entrance)" },
		--地脈座標
		[41703890] = { quest=41028, label="安諾拉山谷(地脈)", note="主線任務指引開啟", icontype="Grid"},
        [65804190] = { quest=43587, label="艾洛爾善(地脈)", note="250上古法力", icontype="Grid"},
        [59304280] = { quest=43588, label="克爾巴洛(地脈)", note="200上古法力，需要擊退怪物進攻", icontype="Grid" },
        [35702410] = { quest=43590, label="月語峽谷(地脈)", note="200上古法力，需要擊退怪物進攻", icontype="Grid"},
        [24301940] = { quest=43591, label="月之守衛(地脈)", note="200上古法力，需要擊退怪物進攻", icontype="Grid"},
        [21404330] = { quest=43592, label="法拉納爾北部(地脈)", note="250上古法力，有兩個內部地圖，不在傳送門所在的內部地圖裡", icontype="Grid"},
        [20405040] = { quest=43593, label="法拉納爾南部(地脈)", note="250上古法力", icontype="Grid" },
        [29008480] = { quest=43594, label="靈魂寶庫(地脈)", note="250上古法力", icontype="Grid" },
    },
    ["FalanaarTunnels"] = { -- Fal'adore
        [40901350] = { quest=42230, label="法拉納爾", level=32 },
    },
    ["SuramarLegionScar"] = { -- The Fel Breach
        [53403680] = { quest=41575, label="魔魂堡", },
    },
}
