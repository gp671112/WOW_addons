local _, U1 = ...

local D = {}
U1.CfgDefaults = D
D["!BugGrabber"] = { 
	defaultEnable = 1,
	optdeps = { "BugSack", },
	protected = true, 
	title = "錯誤收集器",
	desc = "收集錯誤訊息，防止遊戲中斷，訊息會顯示在錯誤訊息袋中。`",
	modifier = "Rabbit, Whyv, zhTW",
	icon = "Interface\\Icons\\inv_misc_bugsprayer",
	img = true,
};
D["!KalielsTracker"] = {
	defaultEnable = 1,
	title = "任務目標清單增強",
	desc = "增強畫面右方任務目標清單的功能。在設定選項中可以調整位置和文字大小。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\achievement_quests_completed_05",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["KALIELSTRACKER"]("config") end,
    },
};
D["Accountant_Classic"] = {
	defaultEnable = 1,
	title = "個人會計",
	desc = "追蹤每個角色的所有收入與支出狀況，並可顯示當日小計、當週小計、以及自有記錄起的總計。並可顯示所有角色的總金額。`",
	modifier = "arith, 彩虹ui",
	icon = "Interface\\Icons\\achievement_general_150kdailyquests",
	img = true,
	{
        text = "顯示/隱藏個人會計",
        callback = function(cfg, v, loading) AccountantClassic_ButtonOnClick() end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("個人會計")
			InterfaceOptionsFrame_OpenToCategory("個人會計")
		end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '個人會計' 按鈕也可以顯示主視窗。",
	}
};
D["AchievementsReminder"] = { 
	parent = "RaidAchievement",
};
D["Adapt"] = {
	defaultEnable = 0,
	title = "3D動態頭像",
	desc = "讓頭像變成3D動態的，可以搭配暴雪頭像美化，或遊戲內建的頭像一起使用。``|cffFF2D2D請勿和 'Stuf 頭像' 同時載入使用。|r`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_head_clockworkgnome_01",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ADAPT"]("") end,
    },
	{
		type = "text",
        text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",       
	},
};
D["AdvancedInterfaceOptions"] = {
	defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "進階介面選項",
	desc = "軍臨天下版本移除了一些遊戲內建的介面選項，這個插件除了讓你可以使用這些被移除的介面選項，還可以瀏覽和設定 CVar 遊戲參數，以及更多遊戲設定。``常用的有浮動戰鬥文字、鏡頭最遠距離、血條視野範圍、網路延遲和滑鼠滾輪捲動聊天內容。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\inv_gizmo_08",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["AIO"]("") end,
    },
	{
        text = "設定浮動戰鬥文字",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("進階")
			InterfaceOptionsFrame_OpenToCategory("浮動戰鬥文字")
		end,
    },
	{
        text = "設定 CVar 遊戲參數",
        callback = function(cfg, v, loading) SlashCmdList["CVAR"]("") end,
    },
};
D["Align"] = {
	defaultEnable = 0,
	tags = { "MISC" },
	title = "對齊網格",
	desc = "顯示調整UI時方便用來對齊位置的網格線。`",
	icon = "Interface\\Icons\\inv_misc_net_01",
	img = true,
    {
        text = "32x32 網格",
        callback = function(cfg, v, loading) SlashCmdList["TOGGLEGRID"]("32") end,
    },
	{
        text = "64x64 網格",
        callback = function(cfg, v, loading) SlashCmdList["TOGGLEGRID"]("64") end,
    },
	{
        text = "128x128 網格",
        callback = function(cfg, v, loading) SlashCmdList["TOGGLEGRID"]("128") end,
    },
	{
        text = "256x256 網格",
        callback = function(cfg, v, loading) SlashCmdList["TOGGLEGRID"]("256") end,
    },
	{
		type = "text",
        text = "按一下顯示，再按一下隱藏網格。`",       
	},
};
D["AlreadyKnown"] = { 
	defaultEnable = 1,
	tags = { "AUCTION" },
	title = "商品已入荷?",	
	desc = "和商人交易或在逛拍賣時，已經學會和擁有的物品會顯示為綠色，讓你知道可以不用重複購買。``包括配方/寵物/坐騎/玩具，和其他可以學習的物品。`",
	icon = "Interface\\Icons\\inv_misc_coinbag_special",
	img = true,
};
D["AngryKeystones"] = {
	defaultEnable = 1,
	title = "傳奇+ 進度時間",
	desc = "在傳奇鑰石的副本中，會在任務目標清單顯示兩箱、三箱的時間，以及詞綴難度等額外資訊。``在傳奇難度地城 (本週最佳成績) 的視窗中，會顯示本週、下週和下下週的詞綴資訊。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\spell_mage_altertime",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["AngryKeystones"]("") end,
    },
};
D["AnyFont"] = { 
	defaultEnable = 1, 
	title = "傷害數字字體",
	desc = "打怪時，將顯示在怪頭上的傷害輸出數字變得更有FU~``可以自行替換為喜愛的字體，請將字體檔案放到 AddOns\\AnyFont 資料夾內，並且將字體檔案名稱改為 font.ttf。``|cffFF2D2D更改字體後必須重新啟動遊戲才會生效，重新載入無效。``若使用英文字體，中文字會變成問號???。|r`",
	author = "Ketho",
	icon = "Interface\\Icons\\spell_misc_hellifrepvpcombatmorale",
	img = true,
};
D["AppearanceTooltip"] = {
	defaultEnable = 1,
	title = "塑形外觀預覽",
	desc = "滑鼠指向裝備圖示時，會顯示你的角色穿上時的外觀預覽。``設定選項中可以調整縮放大小、自動旋轉、脫光其他部位、更改預覽的種族性別，以及其他相關設定。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\inv_raidpriestmythic_q_01chest",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["APPEARANCETOOLTIP"]("") end,
    },
	{
		type = "text",
        text = "旋轉外觀預覽：滾動滑鼠滾輪。",       
	},
};
D["ArtifactProgressionPath"] = { 
	defaultEnable = 0,
	title = "神兵武器點法建議",
	desc = "|cffFF2D2D尚未支援 7.2，請勿載入使用。|r``顯示神兵武器升級的最佳路徑。``打開神器介面，照著提示的數字順序來配點即可。``適用於大部分的情況，若你有特殊需求，此點法僅供參考。``資料來源：icy-veins.com`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_mace_1h_artifactazshara_d_03",
	img = true,
};
D["AtlasLoot"] = {
	defaultEnable = 0,
	tags = { "ITEM" },
	title = "副本戰利品查詢",
	desc = "顯示首領與小怪可能掉落的物品，並可查詢各陣營與戰場的獎勵物品、套裝物品等資訊。`",
	modifier = "arith, BNS, Daviesh, jerry99spkk, Proteyer, scars377, sheahoi, soso15, Whyv, ytzyt, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\inv_box_02",
	img = true,
    {
        text = "顯示戰利品查詢",
        callback = function(cfg, v, loading) SlashCmdList["ATLASLOOT"]("") end,
    },
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ATLASLOOT"]("options") end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '副本戰利品查詢' 按鈕也可以顯示主視窗。",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["Auctionator"] = {
	defaultEnable = 1,
	title = "拍賣小幫手",
	desc = "一個輕量級的插件，增強拍賣場的功能，方便快速的購買、銷售和管理拍賣。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\garrison_building_tradingpost",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("拍賣")
			InterfaceOptionsFrame_OpenToCategory("拍賣")
			InterfaceOptionsFrame_OpenToCategory("基本設定")
		end,
    },
};
D["AutoActionCam"] = {
	defaultEnable = 0,
	title = "動感鏡頭",
	desc = "享受像家機遊戲般的動感。``登入時自動啟用遊戲內建的動感鏡頭功能，加大前方的視野並且自動聚焦到選取目標 (畫面會晃動)。``在副本中會自動改為半動感模式 (畫面不會晃動)。``想要加大視野但不要晃動，推薦使用 '半動感' 模式。`",
	icon = "Interface\\Icons\\inv_corgi2",
	img = true,
    {
        type = "radio",
		text = "動感鏡頭模式",
		options = {
			"全動感：自動聚焦到目標", "full",
			"半動感：加大前方視野 (不晃動)", "basic",
			"一點點動感", "default",
			"一點都不動感", "off",
		},
		cols = 1,
		callback = function(cfg, v, loading) SlashCmdList["AAC"](v) end,
    },
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["AAC"]("reset") end,
		reload = true,
    },
};
D["AutoGearSwap"] = { defaultEnable = 0, };
D["AutoHidePlayerFrame"] = {
	defaultEnable = 0,
	tags = { "UNITFRAME" },
	title = "自動隱藏頭像",
	desc = "讓你在行走逛街時能欣賞到更多風景。沒有目標時會自動隱藏玩家頭像，選取目標和進入戰鬥時會自動顯示。``|cffFF2D2D'Stuf 頭像' 已經包含這個功能，請勿同時載入使用。|r``可以搭配暴雪頭像美化或遊戲內建的頭像一起使用。`",
	author = "彩虹ui",
	icon = "Interface\\Icons\\ability_druid_supriseattack",
	img = true,
};
D["BankItems"] = {
	defaultEnable = 1,
	title = "更多角色銀行",
	desc = "讓你可以隨時瀏覽同帳號內所有伺服器、所有人物的裝備以及背包、郵件、銀行和公會銀行中的物品，並且會在背包物品的滑鼠提示中顯示其他角色擁有相同物品的數量。`",
	modifier = "a9012456, Isler, Xinhuan, 彩虹ui",
	icon = "Interface\\Icons\\inv_misc_bag_10_blue",
	img = true,
    {
        text = "顯示更多角色銀行",
        callback = function(cfg, v, loading) SlashCmdList["BANKITEMS"]("") end,
    },
	{
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("銀行")
			InterfaceOptionsFrame_OpenToCategory("銀行")
		end,
    },
	{
		type = "text",
        text = "點小地圖的 '更多角色銀行' 按鈕也可以顯示主視窗。",
	},
};
D["BarrelsOEasy"] = {
	defaultEnable = 1,
	title = "桶樂會爽爽玩",
	desc = "幫助你輕鬆完成世界任務：桶樂會。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_vehicle_plaguebarrel",
	img = true,
    {
        text = "顯示標記圖示框架",
        callback = function(cfg, v, loading) SlashCmdList["BarrelsOEasy"]("show") end,
    },
	{
		type = "text",
        text = "請先開始玩第一輪，當桶子停止移動時，再將滑鼠指向桶子來幫桶子上標記。",
	},
};
D["BasicChatMods"] = {
	defaultEnable = 1,
	title = "聊天功能增強",
	desc = "一個輕量級的聊天視窗功能增強插件。``提供複製聊天內容、複製網址、對當前目標密語、加大歷史記錄...和更多功能。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\spell_holy_divineprovidence",
    img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BasicChatMods"]("") end,
    },
	{
		type = "text",
        text = "複製內容：Shift+左鍵 點擊聊天視窗標籤頁。",
	},
};
D["BattlegroundTargets"] = {
	defaultEnable = 0,
	title = "戰場目標框架",
	desc = "戰場專用的友方和敵方單位框架。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_h_a",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BATTLEGROUNDTARGETS"]("") end,
    },
};
D["BattlePetBreedID"] = {
	defaultEnable = 0,
	title = "戰寵品級提示",
	desc = "在寵物日誌、對戰、聊天視窗連結和拍賣場的滑鼠提示中顯示戰寵的屬性品級資訊。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_pet_achievement_raise75petstolevel25",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BATTLEPETBREEDID"]("") end,
    },
};
D["BaudBag"] = {
	defaultEnable = 0,
	title = "Baud 整合背包",
	desc = "可以選擇要將哪幾個背包整合成一個，有多種外觀風格可供選擇。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_bag_23_netherweave",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BaudBagOptions_SLASHCMD"]("") end,
    },
	{
		type = "text",
        text = "|cffFF2D2DDJ 智能分類背包和 Baud 整合背包選擇其中一種使用即可，請勿同時載入。|r",
	},
};
D["BGDefender"] = {
	defaultEnable = 0,
	title = "戰場喊話助手",
	desc = "會顯示一個小小的按鈕視窗，只要用滑鼠按一下，便能喊話落人來防守。節省許多打字的時間。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_h_04",
	img = true,
	{
        text = "顯示戰場喊話助手",
        callback = function(cfg, v, loading) SlashCmdList["BGDefender"]("show") end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BGDefender"]("options") end,
    },
};
D["BlizzMove"] = {
	defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "移動暴雪視窗",
	desc = "允許自由拖曳移動和縮放遊戲內建的各種視窗。``只是暫時性的移動和縮放，不會保存位置。要永久性的移動位置和縮放，請使用 '版面配置' 插件來調整。`",
	icon = "Interface\\Icons\\misc_arrowright",
	img = true,
	{
		type = "text",
        text = "移動：拖曳最上方的視窗標題。\n\n縮放：按住 Ctrl 鍵不放在視窗上滾動滑鼠滾輪，可以放大和縮小整個視窗，包括內容文字。",
	},
};
D["BonusRollPreview"] = {
	defaultEnable = 1,
	title = "骰子裝備預覽 (歐洲版!!)",
	desc = "推倒地城/團隊首領/世界王後，如果你有額外獎勵的骰子，在擲骰子前方便先查看可以骰到哪些裝備，以及切換拾取天賦專精。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_azsharacoin",
	img = true,
	{
		type = "text",
        text = "查看可骰的裝備：出現額外獎勵的骰子面板時，點中間上方的橫桿。\n\n快速切換拾取專精：點骰子面板左上角小小的圓形圖示。",
	},
};
D["bosseskilled"] = {
	defaultEnable = 1,
	tags = { "BOSSRAID" },
	title = "首領擊殺記錄",
	desc = "在隨機團隊搜尋器和團隊視窗旁顯示你已經擊殺過哪些首領。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_hunter_rapidkilling",
	img = true,
};
D["Broker_ChatAlerts"] = {
	defaultEnable = 1,
	tags = { "SOCIAL" },
	title = "聊天通知",
	desc = "在畫面上方顯示聊天對話、拾取物品和系統訊息的文字和音效通知。``可自行選擇要通知的頻道和使用關鍵字過濾，讓你不會錯過任何重要的聊天訊息!`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_warrior_rallyingcry",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("聊天-通知")
			InterfaceOptionsFrame_OpenToCategory("聊天-通知")
		end,
    },
	{
		type = "text",
        text = "開啟/關閉通知：點小地圖按鈕的 '聊天通知' 按鈕可以快速設定要顯示哪些頻道的通知和音效。\n\n調整文字大小和位置：載入 '版面配置' 插件，然後從 'Esc > 版面配置 > 其他 > 顯示錯誤&警告' 調整框架的位置和縮放大小。",
	},
};
D["BugSack"] = {
	defaultEnable = 1,
	parent = "!BugGrabber",
	protected = true,
	{
        text = "查看錯誤訊息",
        callback = function(cfg, v, loading) SlashCmdList["BugSack"]("show") end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["BugSack"]("") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '紅色小袋子' 也可以查看錯誤訊息。"
	}
};
D["ButtonForge"] = {
	defaultEnable = 0,
	title = "更多快捷列",
	desc = "快捷列不夠用嗎?``讓你可以打造出更多的快捷列和按鈕。要幾個、要擺哪裡都可以隨意搭配。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_food_dimsum",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("快捷列-更多")
			InterfaceOptionsFrame_OpenToCategory("快捷列-更多")
		end,
    },
	{
		type = "text",
        text = "建立快捷列：在設定選項中開啟更多快捷列工具來建立。",
	},
	{
        text = "按鈕間距",
		type = "spin",
		range = {0, 20, 1},
		default	= 6,
        callback = function(cfg, v, loading) SlashCmdList["BUTTONFORGE"]("-gap "..v) end,
    },
};
D["BuyEmAll"] = {
	defaultEnable = 1,
	tags = { "AUCTION" },
	title = "大量購買",
	desc = "在商人視窗按 Shift+左鍵 點擊物品可一次購買多個數量。`",
	icon = "Interface\\Icons\\inv_misc_coin_02",
	img = true,
};
D["ChatBar"] = {
	defaultEnable = 1,
	tags = { "SOCIAL" },
	title = "聊天頻道按鈕",
	desc = "在聊天視窗上方顯示一排能夠快速切換聊天頻道的按鈕列。`",
	icon = "Interface\\Icons\\achievement_halloween_smiley_01",
	img = true,
	{
		type = "text",
		text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",
	},
	{
		type = "text",
		text = "切換頻道：點聊天視窗上方的小按鈕。\n\n設定選項：在按鈕列的最左端或最右端點滑鼠右鍵。",
	},
};
D["ChatEmote"] = {
	defaultEnable = 1,
	tags = { "SOCIAL" },
	title = "聊天表情圖案",
	desc = "聊天視窗右上方會多出三個小按鈕，提供插入聊天表情圖案、擲骰子以及開場倒數功能 (需要載入 DBM)。``按住 Ctrl 拖曳按鈕可以移動位置。`",
	icon = "Interface\\Icons\\inv_valentinescandy",
	img = true,
};
D["ClassSpecStats"] = {
	defaultEnable = 1,
	tags = { "ITEM" },
	title = "裝備屬性選擇建議",
	desc = "根據職業和專精，在角色資訊視窗上方顯示裝備屬性選擇優先順序的建議。``這是最基本且簡略的屬性配法，適用於大部分的情況。若想要有更精準的數據，例如每個屬性該配到多少%，建議依據你的實際配裝和手法，到討論區爬文或和其他玩家討論。``如有需要，也可以自行編輯屬性順序或加上註解，以符合個人需求。``資料來源：icy-veins.com`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_paladin_beaconoflight",
	img = true,
	{
		type = "text",
		text = "自行修改屬性順序：請用記事本或 Notepad++ 編輯 AddOns\\ClassSpecStats\\ stats.lua",
	},
};
D["Clique"] = {
	defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "快速施法",
	desc = "提供簡單而強大的滑鼠點擊快速施法功能，用滑鼠點一下頭像/框架就能夠立即施放法術。``可以搭配大多數的單位框架一起使用。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_monk_counteractmagic",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("快速施法")
			InterfaceOptionsFrame_OpenToCategory("快速施法")
			InterfaceOptionsFrame_OpenToCategory("一般選項")
			InterfaceOptionsFrame_OpenToCategory("快速施法")
			InterfaceOptionsFrame_OpenToCategory("一般選項")
		end,
    },
	{
		type = "text",
		text = "開始使用：按下法術書最右下角的標籤頁來設定法術和對應的滑鼠按鍵。",
	},
};
D["CloudyUnitInfo"] = {
	defaultEnable = 1,
	tags = { "ITEM" },
	title = "裝等提示",
	desc = "提供快速查看玩家裝等的功能。``滑鼠指向玩家時，在滑鼠提示中顯示玩家已裝備的平均物品等級和專精，並提示 PVP 與帳號綁定 (BOA) 裝備件數。`",
	icon = "Interface\\Icons\\achievement_garrisonfollower_itemlevel650",
	img = true,
};
D["CollectMe"] = {
	defaultEnable = 0,
	title = "收藏進度",
	desc = "列出尚未收集到的寵物、坐騎、玩具、頭銜、追隨者、傳家寶，顯示收藏進度。``還有隨機召喚寵物和坐騎的功能。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\trade_archaeology_chestoftinyglassanimals",
	img = true,
	{
        text = "顯示收藏進度",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_COLLECTME"]("") end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("收藏-進度")
			InterfaceOptionsFrame_OpenToCategory("收藏-進度")
			InterfaceOptionsFrame_OpenToCategory("資訊列選項 (Broker)")
		end,
    },
	{
        type = "text",
		text = "輸入 /cm 也可以顯示主視窗。",
    },
};
D["CollectionShop"] = {
	defaultEnable = 0,
	title = "收藏專賣店",
	desc = "專門搜尋和購買坐騎、寵物、玩具、塑形外觀，保證最低價!`",
	modifier = "彩虹ui",
	img = true,
	{
        type = "text",
		text = "開始使用：打開拍賣場，點右下角的 '收藏專賣店' 標籤頁面。",
    },
};
D["CompactRaid"] = {
	defaultEnable = 0,
	tags = { "BOSSRAID" },
	title = "精簡團隊框架",
	desc = "簡單好用的團隊框架，可以自訂團隊增益/減益效果圖示，提供滑鼠點擊快速施法的功能。`",
	icon = "Interface\\Icons\\inv_gizmo_adamantiteframe",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["COMPACTRAID"]("") end,
    },
	{
		type = "text",
		text = "點第一個小旗子圖示也可以開啟設定選項。\n\n移動位置：拖曳團隊框架的外框。",
	}
};
D["DBM-Core"] = {
    defaultEnable = 1,
	title = "<DBM> 副本首領警報",
	desc = "提供地城/團隊副本首領的技能提醒、倒數計時條和警報功能。``小女孩快跑! 是打團必備的插件。`",
	icon = [[Interface\Icons\INV_Helmet_06]],
	img = true,
    tags = { "BOSSRAID" },
    {
        text = "測試計時條",
        callback = function(cfg, v, loading) DBM:DemoMode() end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["DEADLYBOSSMODS"]("") end,
    },
	{
		type = "text",
		text = "中文語音：輸入 /dbm > 選項 > 語音警告，右邊第四個下拉選單\n'設置語音警告的語音包' 選擇 'Yike Xia (夏一可)'。",
	},
	{
		type = "text",
		text = " ",
	},
};
D["DBM-StatusBarTimers"] = { defaultEnable = 1, hide = 1, lod = 1, };
D["Decursive"] = {
	defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "一鍵驅散",
	desc = "每個隊友會顯示成一個小方格，當隊友獲得 Debuff (負面狀態效果) 時，小方格會亮起來。``點一下亮起來的小方格，立即驅散。``設定選項中還可以設定進階過濾和優先權。`",
	modifier = "ananhaid, Archarodim, BNS, deleted_1214024, laincat, sheahoi, titanium0107, YuiFAN, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\spell_nature_purge",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_DECURSIVE"]("") end,
    },
	{
        type = "text",
		text = "驅散 Debuff：點一下亮起來的小方格。\n\n移動格子：滑鼠指向第一個小方格的上方 (不是上面)，出現小亮點時按住 Alt 來拖曳移動。\n\n中 Debuff 的玩家清單：在設定選項中開啟或關閉 '即時清單'。",
    },
};
D["djbags"] = {
	defaultEnable = 1,
	title = "DJ 智能分類背包",
	desc = "會自動分類物品，也能自訂分類的整合背包。",
	icon = "Interface\\Icons\\inv_misc_bag_25_mooncloth",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["DJBAGS"]("") end,
    },
	{
		type = "text",
        text = "|cffFF2D2DDJ 智能分類背包和 Baud 整合背包選擇其中一種使用即可，請勿同時載入。|r",
	},
	{
        type = "text",
		text = "設定：按住 Alt 點分類框的背景。\n\n自訂分類：按住 Alt 點背包物品。",
    },
};
D["Dominos"] = {
	defaultEnable = 1,
	title = "達美樂快捷列",
	desc = "用來取代遊戲內建的主要快捷列，提供方便的快捷列配置、快速鍵設定，讓你可以自由安排快捷列的位置和大小，以及多種自訂功能。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_food_draenor_crispyfriedscorpion",
	img = true,
	{
        text = "設定快捷列",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_DOMINOS"]("config") end,
    },
	{
        text = "設定快速鍵",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_DOMINOS"]("bind") end,
    },
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_DOMINOS"]("") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '快捷列' 按鈕也可以開啟設定。\n\n更詳細的用法說明請看：\nhttp://wp.me/p7DTni-e1",
	},
	{
		type = "text",
		text = " ",
	}
};
D["Dominos_Bufftimes"] = {
	defaultEnable = 1,
	title = "增益/減益時間 (快捷列)",
	desc = "在快捷列按鈕上顯示你對目標所施放的增益/減益效果時間，更方便監控Buff/DOT。``效果持續時間內，增益效果按鈕的外框是綠色，減益效果的外框是桃紅色。``設定選項中還可以設定要忽略或是要轉換 (A按鈕顯示B法術時間) 的技能。``一般來說，增益/減益效果時間結束後，會自動改為顯示技能冷卻時間 (如果有的話)。若這兩種時間相衝突，或你覺得不方便，可以在設定中將該技能設為忽略，便只會顯示外框顏色和冷卻時間。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_food_148_cupcake",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("快捷列-增益時間")
			InterfaceOptionsFrame_OpenToCategory("快捷列-增益時間")
		end,
    },
};
D["DugisGuideViewerZ"] = {
	defaultEnable = 0,
	title = "Dugi 任務高手",
	desc = "提供類似衛星導航的箭頭，帶你做任務和升級!``開始導航：點畫面右方任務目標清單中，任務標題左方的數字圓圈，開始導航這個任務。``地圖預覽：接到任務時會自動顯示地圖，方便預覽任務的位置。``建議裝備：拿到比身上好的裝備時會自動建議更換裝備。``這些功能都可以在設定選項中開啟或關閉。``|cffFF2D2D這個插件的記憶體使用量較大。電腦較慢，或打副本/團隊不需要使用時請勿載入。|r``版權所有(c) 2010-2016 UltimateWoWGuide.com`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\misc_arrowlup",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["DG"]("config") end,
    },
	{
        text = "重置框架位置",
        callback = function(cfg, v, loading) SlashCmdList["DG"]("reset") end,
    },
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["DG"]("fix") end,
		reload = true,
    },
	{
        type = "text",
		text = "右鍵點 DG 小圓鈕也可以開啟設定。",
    },
	{
		type = "text",
        text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",       
	},
	
};
D["EKplates"] = {
	defaultEnable = 0,
	tags = { "COMBAT" },
	title = "EK 血條",
	desc = "另一種血條增強插件，預設使用血量百分比數字來取代血條，怪物頭上大大的數字就是血量百分比 (不會顯示 % 符號)。血滿的時候不會顯示，只有血量不是 100% 的時候才會顯示數字。``當前目標頭上會有明顯的箭頭指示，非常方便!``也可以更改為顯示血條而不是數字，需要在設定中調整。但如果你喜歡血條樣式，建議改用 Tidy 血條插件，有多種外觀樣式可供選擇。`",
	icon = "Interface\\Icons\\ability_ironmaidens_corruptedblood",
	img = true,
	{
		type = "text",
        text = "|cffFF2D2D請勿和 Tidy 血條同時載入使用。|r",
	},
	{
		type = "text",
        text = "設定選項：用記事本或 Notepad++ 編輯 AddOns\\EKplates\\config.lua\n依照裡面的說明來修改。",
	},
	{
		type = "text",
        text = "已知問題：遇到騎在坐騎上面的敵人時會發生錯誤，請等待日後修正。",
	},
};
D["EmoteCenter"] = {
	defaultEnable = 1,
	tags = { "SOCIAL" },
	title = "表情動作選單",
	desc = "方便使用所有表情動作指令，可以加入最愛來快速使用。`",
	modifier = "BNS",
	icon = "Interface\\Icons\\inv_misc_firedancer_01",
	img = true,
	{
		type = "text",
        text = "點小地圖按鈕的 '表情' 按鈕選擇表情動作。",
	},
};
D["EnemyGrid"] = {
	defaultEnable = 0,
	tags = { "MISC" },
	title = "敵方框架",
	desc = "顯示附近敵人的單位框架，包含血量、施法條、增減/益效果監控。``因為暴雪的限制，只能用來觀察敵人的狀態，已經不能選取目標和快速施法。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_arena_3v3_4",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ENEMYGRID"]("") end,
    },
	{
		type = "text",
        text = "需要開啟敵方單位名條 (血條) \n敵方框架才會出現。",
	},
};
D["Engraved"] = {
	defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "連擊點數-符文字",
	desc = "使用非常有型的魔獸古代符文字來顯示連擊點數，有多種樣式可以選擇。``支援死亡騎士符文、盜賊和德魯伊的連擊點數、術士靈魂裂片、法師祕法充能、聖騎士聖能和武僧真氣。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\70_inscription_vantus_rune_odyn",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("連擊點數-符文字")
			InterfaceOptionsFrame_OpenToCategory("連擊點數-符文字")
		end,
    },
};
D["EnhBloodlust"] = {
	defaultEnable = 1,
	tags = { "COMBAT" },
	title = "嗜血音樂",
	desc = "為嗜血與英勇效果添加超棒的音樂。`",
	icon = "Interface\\Icons\\spell_nature_bloodlust",
	img = true,
	{
        text = "測試音樂",
        callback = function(cfg, v, loading) SlashCmdList["ENHBLOODLUST"]("") end,
    },
	{
		type = "text",
		text = "自訂音樂：將長度為40秒的MP3檔案放到 AddOns\\EnhBloodlust 資料夾內。然後用記事本或 Notepad++ 編輯 hawayconfig.lua。\n\n更詳細的說明請看\nhttp://wp.me/p7DTni-Fp",
	}
};
D["ExRT"] = {
	defaultEnable = 0,
	title = "ExRT 團隊工具包",
	desc = "提供出團時會用到的許多方便功能。像是團隊分析觀察、準備確認、檢查食物精煉、上光柱標記助手、團隊技能CD監控、團隊輔助工具和一些首領的戰鬥模組...等。`",
	icon = "Interface\\Icons\\inv_misc_bag_26_spellfire",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["exrtSlash"]("set") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 'R' 按鈕也可以開啟設定選項。",
	}
};
D["FishingBuddy"] = {
	defaultEnable = 0,
	title = "釣魚夥伴",
	desc = "幫忙處理釣魚的相關工作、漁具、魚類資訊...等等。`",
	modifier = "alec65, Andyca, icearea, machihchung, smartdavislin, Sutorix, titanium0107, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\inv_misc_fish_74",
    {
        text = "顯示主視窗",
        callback = function(cfg, v, loading) SlashCmdList["fishingbuddy"]("") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '釣魚夥伴' 按鈕也可以開啟主視窗。",
	}
};
D["FlaskFoodCheck"] = {
	defaultEnable = 0,
	tags = { "BOSSRAID" },
	title = "檢查食物精煉",
	desc = "「吃吃喝喝!!`還沒吃完的團確不要打勾。」``檢查所有團隊成員是否都有食物、精煉藥劑和增強符文的增益效果。``可自訂要檢查的食物精煉等級。",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_alchemy_70_flask03purple",
    {
        text = "立即檢查食物精煉",
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("run") end,
    },
	{
        text = "顯示目前的設定值",
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("values") end,
    },
	{
        type = "text",
		text = "檢查結果",
    },
	{
        type = "radio",
		text = "發送對象",
		options = {
			"團隊","unmute",
			"自己","mute",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"](v) end,
    },
	{
        type = "radio",
		text = "團隊確認時自動檢查",
		options = {
			"不需要權限","any",
			"團隊助理","assist",
			"必須是隊長","raidlead",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("require "..v) end,
    },
	{
        type = "text",
		text = "食物",
    },
	{
        type = "radio",
		text = "食物加成屬性最低要求",
		options = {
			"300","300",
			"100","100",
			"375","375",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("minfood "..v) end,
    },
	{
        text = "啟用/停用檢查食物",
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("check food") end,
    },
	{
        type = "text",
		text = "精煉",
    },
	{
        type = "radio",
		text = "精煉加成屬性最低要求",
		options = {
			"1300","1300",
			"250","250",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("minflask "..v) end,
    },
	{
        text = "啟用/停用檢查精煉",
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("check flask") end,
    },
	{
        type = "text",
		text = "符文",
    },
	{
        type = "radio",
		text = "符文加成屬性最低要求",
		options = {
			"325","325",
			"50","50",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("minrune "..v) end,
    },
	{
        text = "啟用/停用檢查符文",
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("check rune") end,
    },
	{
        type = "text",
		text = "其他",
    },
	{
        type = "radio",
		text = "列出玩家的最低等級",
		options = {
			"110","110",
			"100","100",
		},
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("minlevel "..v) end,
    },
	{
        type = "spin",
		text = "快要過期的時間(分鐘)",
		range = {1, 10, 1},
		default = 8,
        callback = function(cfg, v, loading) SlashCmdList["FFC"]("expire "..v*60) end,
    },
};
D["FloTotemBar"] = {
	defaultEnable = 0,
	tags = { "CLASSALL", "HUNTER", "SHAMAN" },
	title = "圖騰和陷阱快捷列",
	desc = "自動產生薩滿圖騰和獵人陷阱的快捷列，會顯示圖騰/陷阱存在的時間。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_shaman_multitotemactivation",
	img = true,
	{
        type = "radio",
		text = "位置",
		options = {
			"自動","auto",
			"鎖定","lock",
			"解除鎖定","unlock",
		},
        callback = function(cfg, v, loading) SlashCmdList["FLOTOTEMBAR"](v) end,
    },
	{
        type = "spin",
		text = "縮放大小",
		range = {0.1, 10, 0.1},
		default = 1,
        callback = function(cfg, v, loading) SlashCmdList["FLOTOTEMBAR"]("scale "..v) end,
    },
	{
        type = "radio",
		text = "邊框",
		options = {
			"顯示","borders",
			"隱藏","noborders",
		},
        callback = function(cfg, v, loading) SlashCmdList["FLOTOTEMBAR"](v) end,
    },
    {
        text = "重置設定",
		reload = true,
        callback = function(cfg, v, loading) SlashCmdList["FLOTOTEMBAR"]("reset") end,
    },
	{
        type = "text",
		text = "在圖騰/陷阱快捷列最左側點滑鼠右鍵也可以設定。\n\n快速鍵：從 Esc > 按鍵設定 > 其他 > 圖騰/陷阱 按鈕，綁定按鍵。",
    },
};
D["FlyoutButtonCustom"] = {
	defaultEnable = 0,
	title = "快捷列彈出式按鈕",
	desc = "在快捷列上自訂彈出式的按鈕清單，類似獵人寵物、術士惡魔和法師傳送門的彈出式按鈕。``可以完全自訂彈出的按鈕清單中要放哪些技能、物品或巨集。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_food_161_fish_89",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["FBCUSTOM"]("") end,
    },
	{
		type = "text",
        text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",       
	},
	{
		type = "text",
        text = "建立彈出式按鈕清單：打開法術書或收藏視窗，將圖示拖曳到快捷列的黃色小箭頭上。\n\n更詳細的用法說明請看：\nhttp://wp.me/p7DTni-Vz",       
	},
};
D["flyPlateBuffs"] = {
	defaultEnable = 0,
	tags = { "MISC" },
	title = "血條增益/減益效果",
	desc = "增強血條上的增益/減益效果圖示功能，可以調整位置、自訂大小和要顯示哪些圖示。``血條插件都已經包含增益/減益效果圖示的功能，但如果你需要更進階的調整和控制圖示的顯示方式，可以將血條插件的圖示功能關閉，改用這個插件。",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_deathknight_heartstopaura",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["FLYPLATEBUFFS"]("") end,
    },
	{
		type = "text",
        text = "和 Tidy 血條一起使用時：將 Tidy 血條設定選項中的 '啟用光環套件' 取消打勾。\n\n和 EK 血條一起使用時：編輯 EK 血條的設定檔案，將 C.myfiltertype 和 C.otherfiltertype 的值都改為 none 。",       
	},
};
D["Focuser"] = {
	defaultEnable = 0,
	tags = { "BOSSRAID" },
	title = "快速專注目標",
	desc = "快速將指定的對象設定為專注目標。",
	icon = "Interface\\Icons\\ability_eyeoftheowl",
	{
		type = "text",
        text = "快速設為專注目標：Shift+左鍵 點擊人物。\n\n更改按鍵：用記事本或 Notepad++ 編輯 AddOns\\Focuser\\Focuser.lua。",       
	},
};
D["FocusInterruptSounds"] = {
	defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "斷法提醒和通報",
	desc = "你的敵對目標開始施放可以中斷的法術時，會有語音提醒快打斷。``成功打斷時會在聊天視窗顯示訊息告知你的隊友。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\spell_arcane_arcane04",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("斷法")
			InterfaceOptionsFrame_OpenToCategory("斷法")
		end,
    },
	{
		type = "text",
        text = "開始使用：在設定選項中加入自己的斷法技能名稱，刪除其他的。",       
	},
};
D["FriendListColors"] = {
	defaultEnable = 1,
	tags = { "SOCIAL" },
	title = "彩色好友名單",
	desc = "有好友的人生是彩色的!``好友名單顯示職業顏色，還可以自訂要顯示哪些內容。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_doublerainbow",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("好友名單")
			InterfaceOptionsFrame_OpenToCategory("好友名單")
		end,
    },
	{
		type = "text",
        text = "按 O 開啟好友名單。",       
	},
};
D["FriendsMenuXP"] = {
	defaultEnable = 1,
	title = "玩家右鍵選單增強",
	desc = "聊天視窗中的玩家名字上點滑鼠右鍵會有更多方便的功能。`",
	icon = "Interface\\Icons\\inv_misc_groupneedmore",
	img = true,
	{
		type = "text",
        text = "玩家選單：滑鼠右鍵點玩家名字。\n\n快速邀請：按住 Alt 點玩家名字。\n\n選為目標：按住 Ctrl 點玩家名字。",
	},
};
D["GarrisonCommander"] = {
	defaultEnable = 1,
	tags = { "QUEST" },
	title = "要塞任務指揮官",
	desc = "自動幫你挑選出最佳的隊伍組合，讓你可以輕鬆的一鍵派出要塞追隨者任務，還有更多功能。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\garrison_building_barracks",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_GARRISONCOMMANDER"]("gui") end,
    },
	{
        text = "顯示/隱藏啟動訊息",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_GARRISONCOMMANDER"]("silent") end,
    },
};
D["GatherMate2"] = {
	defaultEnable = 0,
	tags = { "PROFESSION" },
	title = "採集助手",
	desc = "採草、挖礦、釣魚的好幫手。``收集草、礦、考古學、寶藏和釣魚的位置，在世界地圖和小地圖上顯示採集點的位置。`",
	modifier = "alpha2009, arith, BNS, chenyuli, ibmibmibm, icearea, jerry99spkk, kagaro, laxgenius, machihchung, morphlings, scars377, sheahoi, soso15, titanium0107, wxx011, zhTW",
	icon = "Interface\\Icons\\inv_herbalism_70_starlightrosepetals",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["GatherMate2"]("") end,
    },
	{
		type = "text",
        text = "匯入已知的採集點：設定選項 > 匯入資料 > 匯入。",
	},
};
D["GladiatorlosSA2"] = {
	defaultEnable = 0,
	title = "技能語音提示",
	desc = "用語音報出敵方玩家正在施放的技能。`",
	icon = "Interface\\Icons\\achievement_pvp_h_08",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_GLADIATORLOSSA"]("gui") end,
    },
};
D["Gladius"] = {
	defaultEnable = 0,
	title = "競技場頭像",
	desc = "競技場專用的敵方單位框架。`",
	modifier = "Resike, PDI175, Proditorlol, Resike, 彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_h_12",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["GLADIUS"]("ui") end,
    },
	{
        text = "顯示測試框架",
        callback = function(cfg, v, loading) SlashCmdList["GLADIUS"]("test") end,
    },
	{
        text = "隱藏測試框架",
        callback = function(cfg, v, loading) SlashCmdList["GLADIUS"]("hide") end,
    },    
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["GLADIUS"]("reset") end,
    },
};
D["GTFO"] = {
	defaultEnable = 1,
	tags = { "COMBAT" }, 
	title = "地板傷害警報",
	desc = "你快死了! 麻煩神走位!``踩在會受到傷害的區域上面時會發出警報聲，趕快離開吧!``受到傷害愈嚴重警報聲音愈大，設定選項中可以調整音量。`",
	modifier = "Andyca, BNS, wowuicn, Zensunim",
	icon = "Interface\\Icons\\spell_fire_volcano",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["GTFO"]("options") end,
    },
};
D["GW2_UI"] = {
	defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "GW2 UI (激戰2)",
	desc = "一個經過精心設計，用來替換魔獸世界原本的遊戲介面。讓你可以聚焦在需要專注的地方，心無旁騖地盡情遊戲。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\pet_type_dragon",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["GWSLASH"]("") end,
    },
};
D["HandyNotes"] = {
	defaultEnable = 1,
	title = "地圖標記",
	desc = "在地圖上提供方便的標註功能。``搭配相關模組一起使用時，可以在地圖上顯示寶箱、稀有怪...的位置。`",
	modifier = "Sprider @巴哈姆特, BNS, 彩虹ui",
	icon = "Interface\\Icons\\inv_misc_map_01",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_HANDYNOTES"]("gui") end,
    },
};
D["HandyNotes_Achievements"] = { defaultEnable = 0, };
D["HandyNotes_AzerothsTopTunes"] = { defaultEnable = 0, };
D["HandyNotes_DraenorTreasures"] = { defaultEnable = 0, };
D["HandyNotes_DungeonLocations"] = { defaultEnable = 1, };
D["HandyNotes_LegionRaresTreasures"] = { defaultEnable = 1, };
D["HandyNotes_TimelessIsleChests"] = { defaultEnable = 0, };
D["HealBot"] = {
    defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "智能治療",
	desc = "用來取代隊伍/團隊框架，滑鼠點一下就能快速施放法術/補血，是補師的好朋友!`` 可以自訂框架的外觀，提供治療、驅散、施放增益效果、使用飾品、距離檢查和仇恨提示的功能。`",
	icon = "Interface\\Icons\\petbattle_health",
	img = true,
	{
        text = "啟用/停用",
        callback = function(cfg, v, loading) SlashCmdList["HEALBOT"]("t") end,
    },
	{
        text = "小隊樣式",
        callback = function(cfg, v, loading) SlashCmdList["HEALBOT"]("skin Group") end,
    },
	{
        text = "團隊樣式",
        callback = function(cfg, v, loading) SlashCmdList["HEALBOT"]("skin Raid") end,
    },
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["HEALBOT"]("") end,
    },
};
D["HHTD"] = {
    defaultEnable = 0,
	title = "補師必須死!",
	desc = "補師和其他人一樣都必須死，這就是魔獸世界的真實面貌。這個插件能幫助你影響這種悲慘的命運，幸與不幸，就看你是否與補師站在同一邊...``會自動幫敵方和我方的補師上頭標，方便優先擊殺或保護。我方補師被攻擊時，可以選擇是否要在聊天視窗發出通知。`",
	modifier = "ananhaid, Archarodim, bigcell, BNS, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_a_06",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_HHTD"]("ShowGUI") end,
    },
};
D["Healers-Have-To-Die"] = {
    defaultEnable = 0,
	parent = "HHTD",
};
D["HiddenArtifactTracker"] = {
	defaultEnable = 1,
	title = "神兵武器隱藏版提示",
	desc = "在神兵武器的滑鼠提示最下方顯示隱藏版外觀的相關資訊，包括取得方式和解鎖進度。``|cffFF2D2D不是每個職業專精都有提供取得方式。|r`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_staff_2h_artifactheartofkure_d_06",
	img = true,
};
D["HunterPets"] = {
    defaultEnable = 0,
	title = "獵人寵物圖鑑",
	desc = "「這根本就是獵人的神奇寶貝圖鑑!」``包含獵人寵物圖鑑和獸欄瀏覽器。``獵人寵物圖鑑：瀏覽和搜尋所有可供馴服的寵物和所在位置地圖。``獸欄瀏覽器：隨時隨地查看獵人角色的獸欄。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_pet_mouse",
	img = true,
	{
        text = "顯示獸欄寵物",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_HUNTERPETS"]("stable") end,
    },
    {
        text = "顯示統計狀態",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_HUNTERPETS"]("stats") end,
    },
	{
        text = "啟用/停用區域訊息",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_HUNTERPETS"]("zone") end,
    },
	{
		type = "text",
		text = "顯示圖鑑：按 Shift+P 開啟收藏視窗，點右下角的 '獵人寵物' 標籤頁面。",
	},
	{
		type = "text",
		text = " ",
	}
};
D["ILD-Baudbag"] = { defaultEnable = 0, };
D["ILD-Blizzard"] = { defaultEnable = 0, };
D["Immersion"] = {
    defaultEnable = 1,
	title = "任務內容對話劇情",
	desc = "與NPC對話、接受/交回任務時，會使用軍臨天下 '說話的頭' 風格的對話方式，取代傳統的任務說明。``讓你更能享受並融入任務內容的對話劇情。`",
	author = "MunkDev",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_boss_illidan",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["IMMERSION"]("") end,
    },
	{
		type = "text",
        text = "繼續下一步、接受/交回任務：滑鼠/空白鍵。\n\n選擇對話項目：1~9 數字鍵。\n\n回上一步：倒退鍵。\n\n取消對話：Esc 鍵。",
	},
};
D["IncentiveProgram"] = {
    defaultEnable = 0,
	title = "隨機獎勵通知",
	desc = "隨機隊伍搜尋器有額外獎勵，在等你加入的時候顯示通知。``預設的通知音效是 PPAP 和好吃的頻果派，在設定選項中可以自行選擇音效或關閉。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_bag_30",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["INCENTIVEPROGRAM"]("") end,
    },
	{
		type = "text",
        text = "移動圖示：用滑鼠直接拖曳。\n\n加入隨機隊伍：右鍵點圖示。",
    },
};
D["InProgressMissions"] = {
    defaultEnable = 1,
	tags = { "QUEST" },
	title = "職業大廳報告",
	desc = "在職業大廳報告中列出所有角色的追隨者任務進度，也包括要塞的。``|cffFF2D2D其他角色必須先登入過遊戲，並且也有載入這個插件才會顯示在報告中。|r`",
	icon = "Interface\\Icons\\inv_icon_mission_complete_order",
	img = true,
    {
        text = "顯示職業大廳報告",
        callback = function(cfg, v, loading) SlashCmdList["InProgressMissions"]("") end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '職業大廳' 按鈕也可以顯示主視窗。",
    },
};
D["InterruptedIn"] = {
	defaultEnable = 1,
	tags = { "MISC" },
	title = "巨集指令 /iin",
	desc = "讓你可以使用 /iin 指令製作具有時間性的發話巨集，具備中斷發話的功能。``例如開怪倒數巨集：`/iin stop`/stopmacro [btn:2]`/pull 5`/iin 0 大家注意要開怪啦 >>%T<<`/iin 1 4...`/iin 2 3...`/iin 3 2...偷爆發`/iin 4 1...`/iin 5 上!!!`/iin start``中斷倒數巨集：`/iin stop`/pull 0`/iin 0 >>>已中斷!!!<<<`/iin start``分裝倒數巨集：`/iin stop`/stopmacro [btn:2]`/iin 0.1 %L 倒數開始囉，要的骰！`/iin 5 5...`/iin 6 4...`/iin 7 3...`/iin 8 2...`/iin 9 1...`/iin 10 0!!!`/iin start``詳細說明和更多範例請看`https://goo.gl/yN2S5n`",
	author = "永恆滿月",
	icon = "Interface\\Icons\\spell_holy_borrowedtime",
	img = true,
};
D["ItemLevelDisplay"] = {
    defaultEnable = 1,
	title = "裝備欄物品等級",
	desc = "在角色資訊的裝備欄中顯示物品等級。``另外也提供整合背包、暴雪背包顯示物品等級的相關模組。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_garrisonfollower_itemlevel600",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_ITEMLEVELDISPLAY"]("gui") end,
    },
};
D["ItemLinkLevel"] = {
    defaultEnable = 1,
	title = "物品等級連結",
	desc = "在聊天視窗的物品連結中顯示裝備等級和種類。例如：``|cffFF8000[歐尼斯的直覺 (940 皮甲 手腕)]|r`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_belt_19",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("聊天-物品等級")
			InterfaceOptionsFrame_OpenToCategory("聊天-物品等級")
		end,
    },
};
D["KeystoneCommander"] = { defaultEnable = 0, };
D["KeystoneHelper"] = {
	defaultEnable = 1,
	title = "傳奇+ 詞綴說明",
	desc = "在傳奇鑰石的滑鼠提示中顯示難度附加詞綴的詳細說明，例如：狂怒 壞死 火山 暴君 膿血 是什麼意思。`",
	icon = "Interface\\Icons\\ability_racial_bloodrage",
	img = true,
};
D["Leatrix_Plus"] = {
    defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "功能百寶箱",
	desc = "讓生活更美好的插件，提供多種各式各樣的遊戲功能設定。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_gizmo_hardenedadamantitetube",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["Leatrix_Plus"]("") end,
    },
	{
        text = "音樂播放器",
        callback = function(cfg, v, loading) SlashCmdList["Leatrix_Plus"]("play") end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '功能百寶箱' 按鈕，也可以顯示主視窗。",
    },
};
D["Mapster"] = {
    defaultEnable = 1,
	title = "世界地圖增強",
	desc = "在世界地圖上顯示座標、顯示未探索區域、自訂地圖大小、透明度和其他功能。`",
	modifier = "alpha2009, arith, BNS, Nevcairiel, NightOw1, 彩虹ui",
	icon = "Interface\\Icons\\icon_treasuremap",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_MAPSTER"]("") end,
    },
};
D["Masque"] = {
    defaultEnable = 0,
	tags = { "ACTIONBAR" },
	title = "按鈕外觀",
	desc = "讓你可以變換快捷列按鈕和多種插件的按鈕外觀樣式，讓遊戲介面更具風格!``有許多外觀主題可供選擇。`",
	modifier = "a9012456, ananhaid, BNS, chenyuli, StormFX, yunrong, zhTW",
	icon = "Interface\\Icons\\inv_misc_food_36",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["MASQUE"]("") end,
    },
};
D["MBB"] = {
    defaultEnable = 1,
	title = "小地圖按鈕選單",
	desc = "將小地圖周圍的按鈕，整合成一個彈出式按鈕選單!`",
	icon = "Interface\\Icons\\achievement_boss_cthun",
	img = true,
    {
        text = "重置按鈕位置",
        callback = function(cfg, v, loading) SlashCmdList["MBB"]("reset position") end,
    },
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["MBB"]("reset all") end,
    },
	{
		type = "text",
        text = "無法重置的話請重新載入後再試",
    },
	{
		type = "text",
        text = "左鍵：展開按鈕選單。\n\n拖曳：移動位置。\n\n右鍵：設定選項。\n\nCtrl+右鍵：與小地圖分離或結合。",
    },
	
};
D["MeepMerp"] = {
	defaultEnable = 1,
	tags = { "COMBAT" },
	title = "超出法術範圍音效",
	desc = "距離過遠、超出法術可以施放的範圍時會發出「咕嚕嚕嚕～」的音效來提醒。`",
	icon = "Interface\\Icons\\highmaulraid_range_far",
	img = true,
	{
		type = "text",
        text = "自訂音效：將聲音檔案 (MP3 或 OGG) 複製到 AddOns\\MeepMerp 資料夾裡面，然後用記事本編輯 MeepMerp.lua，將音效檔案位置和檔名那一行裡面的 Bonk.ogg 修改為新的聲音檔案名稱，要記得加上副檔名 .mp3 或 .ogg。\n\n更改完成後要重新啟動遊戲才會生效，重新載入無效。",
    },
	};
D["MikScrollingBattleText"] = {
    defaultEnable = 0,
	tags = { "MISC" },
	title = "MSBT捲動戰鬥文字",
	desc = "讓打怪的傷害數字和系統訊息，整齊的在角色周圍捲動。``可以自訂顯示的位置、大小和要顯示哪些戰鬥文字。`",
	icon = "Interface\\Icons\\ability_warrior_challange",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["MSBT"]("") end,
    },
};
D["mOnArs_WardrobeHelper"] = {
    defaultEnable = 0,
	title = "衣櫃永遠少一件",
	desc = "快速查看缺少了哪件衣服，還有收集進度。``要去舊副本刷塑形裝之前建議先看一下哦!`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_chest_cloth_17",
	img = true,
    {
        text = "顯示主視窗",
        callback = function(cfg, v, loading) SlashCmdList["MONWARDROBE"]("") end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '衣櫃永遠少一件' 按鈕，也可以顯示主視窗。",
    },
};
D["MoveAnything"] = {
    defaultEnable = 0,
	title = "版面配置",
	desc = "萬物皆可動。``移動、縮放、隱藏、調整遊戲畫面上的任何框架和介面元素。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_gizmo_02",
	img = true,
    {
        text = "顯示主視窗",
        callback = function(cfg, v, loading) SlashCmdList["MAMOVE"]("") end,
    },
	{
		type = "text",
        text = "從 Esc > 版面配置，也可以顯示主視窗。",
    },
};
D["MoveTalkingHead"] = {
    defaultEnable = 1,
	title = "移動說話的頭",
	desc = "讓 NPC '說話的頭' 訊息對話框可以移動。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\quest_khadgar",
	img = true,
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["MOVETALKINGHEAD"]("reset") end,
    },
	{
        text = "縮放大小",
		type = "spin",
		range = {0.5, 2, 0.1},
		default	= 1,
        callback = function(cfg, v, loading) SlashCmdList["MOVETALKINGHEAD"](v) end,
    },
	{
		type = "text",
        text = "按住 Shift 鍵拖曳可以移動位置。",       
	},
	{
		type = "text",
        text = "說話的頭出現時才能調整設定，否則會發生錯誤。",       
	},
};
D["MythicPlusLoot"] = { 
	defaultEnable = 1,
	tags = { "BOSSRAID" },
	title = "傳奇+ 物品等級",
	desc = "在傳奇鑰石的滑鼠提示中顯示戰利品和每週寶箱的物品等級。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\garrison_silverchest",
	img = true,
};
D["NomiCakes"] = {
    defaultEnable = 0,
	title = "燒焦糯米",
	desc = "和達拉然的糯米對話時，對話選項旁會顯示每種食材可以學到哪些食譜。``或許糯米這次不會再燒焦了?!`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_worldevent_brewmaster",
	img = true,
    {
        text = "顯示食譜來源",
        callback = function(cfg, v, loading) SlashCmdList["NOMICAKES"]("") end,
    },
	{
		type = "text",
        text = "完成糯米的任務後才能使用。",       
	},
};
D["NugComboBar"] = {
    defaultEnable = 0,
	title = "連擊點數-3D圓",
	desc = "使用精美的3D圓形來顯示連擊點數。``支援死亡騎士符文、盜賊和德魯伊的連擊點數、術士靈魂裂片、法師祕法充能、聖騎士聖能和武僧真氣。`",
	icon = "Interface\\Icons\\ability_mage_greaterpyroblast",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["NCBSLASH"]("gui") end,
    },
};
D["ObeliskQuest"] = {
    defaultEnable = 1,
	tags = { "QUEST" },
	title = "任務怪提示",
	desc = "「到哪裡? 殺幾隻?」``在任務怪血條的上方顯示任務目標進度的提示文字，一眼就可以找出你要殺的怪。`",
	icon = "Interface\\Icons\\achievement_garrisonquests_0100",
	img = true,
    {
        type = "text",
		text = "開始使用：開啟敵方血條。\n\n一次放棄多個任務：在世界地圖旁任務清單的區域名稱上點滑鼠右鍵，可以放棄該區域中的所有任務。",
    },
};
D["OmniBar"] = {
    defaultEnable = 0,
	title = "敵方技能監控",
	desc = "監控敵人的技能冷卻時間。`",
	modifier = "Jordons",
	icon = "Interface\\Icons\\achievement_pvp_a_11",
	img = true,
    {
        text = "設定選項",
        -- callback = function(cfg, v, loading) SlashCmdList["OmniBar"]("") end,
		callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("PVP 技能監控")
			InterfaceOptionsFrame_OpenToCategory("PVP 技能監控")
		end,
    },
};
D["OmniCC"] = {
    defaultEnable = 0,
	tags = { "MISC" },
	title = "冷卻時間",
	desc = "所有東西的冷卻倒數計時，冷卻完畢會顯示動畫效果提醒。``遊戲本身已有內建的冷卻時間，從 Esc > 介面 > 快捷列 > 冷卻時間，可以開啟/關閉。若要使用插件的功能，請關閉遊戲內建的冷卻時間，避免兩種冷卻時間數字重疊。``|cffFF2D2D特別注意：這個插件的CPU使用量較大。電腦較慢，或不需要使用時請勿載入，也可以改用遊戲內建的冷卻時間。|r`",
	icon = "Interface\\Icons\\spell_nature_timestop",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["OmniCC"]("") end,
    },
};
D["OPie"] = {
    defaultEnable = 1,
	title = "環形快捷列",
	desc = "按下快速鍵時顯示圓環形的技能群組，可以做為輔助的快捷列使用，十分方便!``要更改環形快捷列的按鈕外觀，需要和按鈕外觀插件以及外觀主題同時載入使用。`",
	modifier = "foxlit, moseciqing, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\ability_mage_conjurefoodrank9",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["OPIE"]("") end,
    },
	{
		type = "text",
        text = "開始使用：在設定選項的 '快速鍵' 中幫環形快捷列設定按鍵。",
	},
	{
		type = "text",
        text = " ",
	},
};
D["OPieMasque"] = {
	defaultEnable = 0,
	parent = "OPie",
};
D["OrderHallCommander"] = {
	defaultEnable = 1,
	tags = { "QUEST" },
	title = "職業大廳指揮官",
	desc = "自動幫你挑選出最佳的隊伍組合，讓你可以輕鬆的一鍵派出職業大廳追隨者任務，還有更多功能。`",
	modifier = "alar, BNS, 彩虹ui",
	icon = "Interface\\Icons\\garrison_building_stables",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_ORDERHALLCOMMANDER"]("gui") end,
    },
	{
        text = "顯示/隱藏啟動訊息",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_ORDERHALLCOMMANDER"]("silent") end,
    },
};
D["OrderHallIcon"] = {
	defaultEnable = 0,
	tags = { "ENHANCEMENT" },
	title = "職業大廳圖示",
	desc = "在畫面上方中間顯示職業大廳圖示，取代一整條黑色的職業大廳列。``滑鼠指向圖示會顯示職業大廳相關資訊。`",
	img = true,
};
D["Ovale"] = {
    defaultEnable = 0,
	tags = { "CLASSALL" },
	title = "輸出助手",
	desc = "畫面中央會顯示2~4個圖示，提示下一個要施放的技能，可以做為輸出迴圈的新手教學，幫助你打出漂亮的 DPS。``所有傷害輸出職業都可使用，不支援坦克和補師。``支援的職業專精包括：冰邪死騎、鳥貓熊D、獵人三系、法師三系、織霧御風武僧、懲戒騎、暗影牧、盜賊三系、元素增強薩、術士三系和武器狂怒戰。`",
	modifier = "jlam, l222lin, lsjyzjl, Sidoine, zorxliu, 彩虹ui",
	icon = "Interface\\Icons\\ability_hunter_zenarchery",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_OVALE"]("config") end,
    },
	{
		type = "text",
        text = "開始使用：依照圖示提示或是快捷列發光的技能來輸出。\n\n移動圖示：滑鼠拖曳圖示外框的上方。",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["Overachiever"] = {
    defaultEnable = 1,
	title = "非凡成就視窗",
	desc = "讓玩家在找尋成就時可以稍微輕鬆點的微調工具。``成就視窗會多出搜尋、建議和觀察標籤頁面，並且提供和其他玩家比較成就的功能。`",
	modifier = "a9012456, alpha2009, fdasw1628, laincat, PDI175, pepper_ep, silzephyr, Tuhljin, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\achievement_bg_tophealer_ab",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["Overachiever"]("") end,
    },
};
D["Pawn"] = {
    defaultEnable = 1,
	title = "裝備屬性比較",
	desc = "計算屬性 EP 值並給予裝備提升百分比的建議。``此建議適用於大部分的情況，但因為天賦、配裝和手法流派不同，所需求的屬性可能不太一樣，這時可以自訂屬性權重分數，以便完全符合個人需求。`",
	author = "VgerAN",
	modifier = "BNS, scars377, 彩虹ui",
	icon = "Interface\\Icons\\achievement_garrisonfollower_levelup",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["PAWN"]("") end,
    },
};
D["PepeBuddy"] = {
    defaultEnable = 0,
	tags = { "ENHANCEMENT" },
	title = "皮皮好夥伴",
	desc = "人見人愛的皮皮，會一直在畫面上陪伴著你呦!`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_garrison_orangebird",
	img = true,
	{
        text = "找回皮皮",
        callback = function(cfg, v, loading) SlashCmdList["PEPERESET"]("") end,
    },
	{
        text = "皮皮大小",
		type = "spin",
		range = {50, 300, 10},
		default	= 100,
        callback = function(cfg, v, loading) SlashCmdList["PEPESET"](v) end,
    },
	{
		type = "text",
        text = "左鍵：拖曳皮皮移動\n右鍵：點皮皮換造型",       
	},
	
};
D["PersonalLootHelper"] = {
    defaultEnable = 1,
	title = "個人拾取分享助手",
	desc = "提示你拾取的裝備可以交易，而且可以幫隊友提升裝等，或是隊友拿到的裝備可以幫助你提升裝等，讓個人拾取分享裝備更容易。``拿到可以交易，而且自己或隊友需要的裝備時，會自動在聊天視窗顯示 <分享> 的訊息。``在設定選項中可以設定是否要將 `<分享> 裝備的訊息發佈到隊伍/團隊頻道，以及是否要讓隊長執行分裝擲骰。`",
    author = "Madone-Zul'Jin",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_reputation_06",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["PLHelperCommand"]("") end,
    },
};
D["PetTracker"] = {
    defaultEnable = 0,
	title = "戰寵助手",
	desc = "追蹤你在該區域已有和缺少的戰寵。`",
	icon = "Interface\\Icons\\inv_babyhippo01_blue",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("戰寵")
			InterfaceOptionsFrame_OpenToCategory("戰寵")
		end,
    },
};
D["PhanxBuffs"] = {
    defaultEnable = 0,
	tags = { "MISC" },
	title = "玩家增益/減益效果",
	desc = "增強畫面右上角的玩家增益/減益效果圖示功能，可以調整位置、自訂圖示大小和時間文字。`",
	modifier = "Akkorian, BNS, Phanx, 彩虹ui",
	icon = "Interface\\Icons\\ability_mage_invisibility",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["PHANXBUFFS"]("") end,
    },
};
D["Postal"] = {
	defaultEnable = 1,
	title = "超強信箱",
	desc = "強化信箱功能。``收件人可以快速地選擇分身，避免寄錯；一次收取所有信件，還有更多功能。`",
	modifier = "a9012456, ananhaid, andy52005, BNS, NightOw1, oscarucb, smartdavislin, titanium0107, whocare, Whyv, Xinhuan",
	icon = "Interface\\Icons\\achievement_guildperk_gmail",
	img = true,
};
D["premade-filter"] = {
    defaultEnable = 1,
	title = "預組隊伍增強",
	desc = "顯示預組隊伍的職業和角色資訊，較新的預組隊伍會排列在上方，還有進階的過濾方式。`",
	modifier = "BNS",
	icon = "Interface\\Icons\\ability_dualwieldspecialization",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("預組隊伍")
			InterfaceOptionsFrame_OpenToCategory("預組隊伍")
		end,
    },
};
D["Quartz"] = {
	defaultEnable = 1,
	title = "施法條",
	desc = "功能增強、模組化、可自訂外觀的施法條。``包括：玩家、目標、專注目標、寵物、GCD、增益效果和敵方施法條。`",
	modifier = "a9012456, alpha2009, ananhaid, Nevcairiel, Seelerv, Whyv, YuiFAN, zhTW, 彩虹ui",
	icon = "Interface\\Icons\\spell_holy_renew",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("施法條")
			InterfaceOptionsFrame_OpenToCategory("施法條")
			InterfaceOptionsFrame_OpenToCategory("玩家")
			InterfaceOptionsFrame_OpenToCategory("施法條")
		end,
    },
};
D["RaidAchievement"] = {
    defaultEnable = 0,
	title = "副本成就",
	desc = "追蹤地城和團隊副本的成就。``載入 '副本成就-提醒' 模組時，會提示是否已達到成就的條件。",
	modifier = "fanjunyi, lsjyzjl, pepper_ep, Shurshik, 彩虹ui",
	icon = "Interface\\Icons\\achievement_quests_completed_08",
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["PHOENIXSTYLEEASYACH"]("") end,
    },
};
D["RangeDisplay"] = {
    defaultEnable = 0,
	tags = { "MISC" },
	title = "顯示距離",
	desc = "顯示你和目標之間的距離，包括當前目標、專注目標、寵物、滑鼠指向對象以及競技場對象。還可以依據距離遠近來設定警告音效。`",
	modifier = "alpha2009, lcncg, 彩虹ui",
	icon = "Interface\\Icons\\ability_hunter_pathfinding",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["RANGEDISPLAY"]("") end,
    },
	{
		type = "text",
        text = "第一次使用請從設定選項中將距離數字框架鎖定，或解鎖移動。",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["ReadySetDing"] = {
    defaultEnable = 1,
	title = "升級的點點滴滴",
	desc = "叮! 升級囉! 發佈升級訊息公告，以及記錄每個等級遊玩的時間。",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_level_110",
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_READYSETDING"]("") end,
    },
};
D["REFlex"] = {
	defaultEnable = 0,
	title = "戰績記錄",
	desc = "競技場和戰場的對戰歷史記錄。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_a_h",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("PVP 戰績記錄")
			InterfaceOptionsFrame_OpenToCategory("PVP 戰績記錄")
		end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '戰績記錄' 按鈕開啟主視窗。",       
	},
};
D["RegularTab"] = {
	defaultEnable = 1,
	title = "Tab鍵選怪順序調整",
	desc = "恢復成軍臨天下之前的Tab鍵選怪方式。",
	icon = "Interface\\Icons\\achievement_arena_5v5_3",
};
D["Rematch"] = {
	defaultEnable = 0,
	title = "戰寵送作隊",
	desc = "寵物日誌介面增強，可以儲存對戰隊伍，對戰時快速載入隊伍，管理和升級戰寵更方便。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_pet_battlepettraining",
	img = true,
	{
		type = "text",
        text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",       
	},
	{
		type = "text",
        text = "按 Shift+P 打開收藏視窗 > 寵物日誌，就會發現不一樣!",       
	},
};
D["REPorter"] = {
	defaultEnable = 0,
	title = "戰場地圖",
	desc = "加強型的戰場地圖。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_pvp_a_09",
	img = true,
	{
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("PVP 戰場地圖")
			InterfaceOptionsFrame_OpenToCategory("PVP 戰場地圖")
		end,
    },
};
D["RogueBox"] = {
    defaultEnable = 0,
	title = "暴徒骰子監控",
	desc = "擲出你的骰子，命運就在腳下。`盜賊暴徒專精專用。``會固定顯示在個人資源條下方，不能調整位置和大小。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_rogue_rollthebones",
	img = true,
	{
		type = "text",
        text = "必須在 Esc > 介面 > 名稱，啟用\n'顯示個人資源'。",       
	},
};
D["SavedInstances"] = {
    defaultEnable = 1,
	title = "角色進度",
	desc = "記錄所有角色的團隊/英雄/世界首領擊殺進度，每日/每週任務、貨幣點數、交易的冷卻計時，還有更多!`",
	modifier = " a9012456, andy52005, BNS, machihchung, oscarucb, skywalkertw, yujiago, zhTW, zydzxn",
	icon = "Interface\\Icons\\inv_misc_key_05",
	img = true,
	{
        text = "顯示/隱藏角色進度",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_SAVEDINSTANCES"]("show") end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_SAVEDINSTANCES"]("config") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '角色進度' 按鈕也可以顯示主視窗。",
	}
};
D["Scrap"] = {
    defaultEnable = 1,
	tags = { "AUCTION" },
	title = "自動修裝/賣垃圾",
	desc = "和商人交易時自動修理裝備/賣垃圾，可以自訂垃圾/非垃圾物品清單。",
	icon = "Interface\\Icons\\inv_misc_coin_04",
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("自動修裝/賣垃圾")
			InterfaceOptionsFrame_OpenToCategory("自動修裝/賣垃圾")
		end,
    },
};
D["SetCollector"] = {
    defaultEnable = 0,
	title = "套裝收藏家",
	desc = "套裝圖鑑，瀏覽各個地城和團隊副本的套裝塑形外觀、查看收集進度。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_shoulder_leather_raiddruidmythic_q_01",
	img = true,
    {
        text = "顯示主視窗",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_SETCOLLECTOR"]("show") end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '套裝收藏家' 按鈕也可以顯示主視窗。",
	}
};
D["SexyMap"] = {
    defaultEnable = 1,
	title = "性感小地圖",
	desc = "讓你的小地圖更具特色和樂趣，並增添一些性感的選項設定。`",
	icon = "Interface\\Icons\\inv_misc_celestialmap",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["SexyMap"]("") end,
    },
};
D["Shooter"] = {
	defaultEnable = 1,
	title = "成就自動擷圖",
	desc = "獲得成就時會自動擷取螢幕畫面，為你的魔獸生活捕捉難忘的回憶。``畫面擷圖都存放在`World of Warcraft\\Screenshots`資料夾內。`",
	icon = "Interface\\Icons\\inv_misc_toy_07",
	img = true,
};
D["SilverDragon"] = {
    defaultEnable = 1,
	tags = { "MAP" },
	title = "稀有怪獸與牠們的產地",
	desc = "記錄稀有怪的位置和時間，發現時會通知你。支援舊地圖的稀有怪!``發現稀有怪獸時預設的通知效果會顯示通知面板、螢幕閃紅光和發出` '我看到你了!' 的音效，都可以在設定選項中更改。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_misc_head_dragon_black_nightmare",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["ACECONSOLE_SILVERDRAGON"]("") end,
    },
};
D["SilverPlateTweaks"] = {
	defaultEnable = 1,
	tags = { "COMBAT" },
	title = "血條距離微調",
	desc = "自動調整血條的視野距離 (可以看見距離多遠範圍內的血條) 和堆疊時的間距。``|cffFF2D2D若要手動從 Esc > 介面 > 插件 > 進階，來調整血條時，請關閉這個插件。|r`",
	icon = "Interface\\Icons\\artifactability_feraldruid_openwounds",
	img = true,
};
D["SimpleRaidTargetIcons"] = {
    defaultEnable = 0,
	title = "快速標記圖示",
	desc = "快速幫目標加上骷髏、叉叉、星星、月亮等團隊標記圖示。`",
	modifier = "BNS, ghostduke",
	icon = "Interface\\Icons\\ability_creature_cursed_02",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["SRTI"]("") end,
    },
	{
		type = "text",
		text = "快速加上頭標圖示：在目標身上點兩下，或是使用組合鍵點一下。",
	}
};
D["Skada"] = {
    defaultEnable = 1,
	title = "傷害統計",
	desc = "可以看自己和隊友的 DPS、HPS...等模組化的傷害統計資訊。`",
	modifier = "a9012456, ananhaid, andy52005, BNS, chenyuli, haidaodou, oscarucb, twkaixa, Whyv, Zarnivoop",
	icon = "Interface\\Icons\\ability_rogue_slicedice",
	img = true,
    {
        text = "顯示/隱藏傷害統計",
        callback = function(cfg, v, loading) SlashCmdList["SKADA"]("toggle") end,
    },
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["SKADA"]("config") end,
    },
};
D["smartquest"] = {
    defaultEnable = 1,
	title = "智能任務通報",
	desc = "追蹤和通報隊伍成員的任務進度，一起組隊解任務時粉方便!",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_garrisonquests_0010",
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["SMARTQUEST"]("OPTIONS") end,
    },
};
D["Stagger"] = {
    defaultEnable = 0,
	tags = { "CLASSALL", "MONK" },
	title = "武僧醉仙緩勁監控",
	desc = "坦僧專用的醉仙緩勁狀態監控，還有玄牛雕像、斗轉星移和金鐘絕釀的可用次數、持續和冷卻時間。``點圖示可以取消玄牛雕像。`",
	icon = "Interface\\Icons\\monk_stance_drunkenox",
	img = true,
    {
        text = "移動/鎖定位置",
        callback = function(cfg, v, loading) SlashCmdList["STAGGER"]("") end,
    },
	{
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["STAGGER"]("reset") end,
		reload = true,
    },
};
D["StarCursor"] = {
	defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "滑鼠游標亮晶晶",
	desc = "「我喜歡...亮晶晶」``快速移動滑鼠時會一閃一閃亮晶晶，讓你能夠輕鬆的找到滑鼠游標在哪裡。`",
	icon = "Interface\\Icons\\inv_archaeology_70_starlightbeacon",
	img = true,
};
D["Stuf"] = {
    defaultEnable = 1,
	title = "Stuf 頭像",
	desc = "玩家、目標、小隊等頭像和血條框架，簡單好用自訂性高!``也有傳統頭像樣式和其他外觀樣式可供選擇，詳細用法說明請看：`http://wp.me/p7DTni-142`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_leader_sylvanas",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["STUF"]("") end,
    },
	{
		type = "text",
        text = "如果看不到選項，請先按取消，然後再按一次 '設定選項' 按鈕。",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["Talentless"] = {
	defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "天賦面板增強",
	desc = "天賦面板上方多出幾個按鈕，方便快速切換專精和使用靜心之卷。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\inv_7xp_inscription_talenttome01",
	img = true,
	{
		type = "text",
		text = "用快速鍵切換專精：從 Esc > 按鍵設定 > 插件 > 啟用專精，設定按鍵。",
	}
};
D["TalentSetManager"] = {
    defaultEnable = 0,
	tags = { "ENHANCEMENT" },
	title = "天賦管理員",
	desc = "讓你可以儲存多組天賦設定，快速切換整組天賦，也可以依據天賦的設定自動換裝。``提供的巨集按鈕可以拉到快捷列上，只要按一下便能立馬換天賦。`",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\shaman_talent_elementalblast",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("天賦")
			InterfaceOptionsFrame_OpenToCategory("天賦")
		end,
    },
};
D["TankMD"] = {
	defaultEnable = 0,
	tags = { "CLASSALL", "HUNTER" },
	title = "獵人誤導坦克/寵物",
	desc = "只要一個按鈕或快速鍵，有隊伍時會自動誤導給坦克，沒有隊伍時誤導給寵物。``無須將坦克設為專注目標，隊伍順序重新排列也沒問題。``隊伍中有兩坦或三坦時，會自動誤導給隊伍順序最前面的坦克。``隊伍中沒有坦克時，會誤導給寵物。",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_hunter_misdirection",
	{
		type = "text",
		text = "快速鍵：從 Esc > 按鍵設定 > 插件 > 誤導給坦克/寵物，設定按鍵。\n\n快捷列按鈕：新增一個巨集拉到快捷列上，巨集內容為：\n\n#showtooltip 誤導\n/click MisdirectTankButton\n\n(這是插件所提供的巨集指令)",
	}
};
D["TargetNameplateIndicator"] = {
	defaultEnable = 1,
	tags = { "COMBAT" },
	title = "目標指示箭頭",
	desc = "當前目標血條上方顯示箭頭，讓目標更明顯。``|cffFF2D2DEK血條已經有這個功能，請勿和EK血條同時載入使用。|r``可以與 Tidy 血條或遊戲內建的血條一起搭配使用。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_warrior_charge",
	img = true,
	{
		type = "text",
		text = "更改箭頭圖案和位置：用記事本或 Notepad++ 編輯 AddOns\\\nTargetNameplateIndicator\\\nconfig.lua 依照裡面的說明來修改。",
	}
};
D["TidyPlates"] = {
    defaultEnable = 1,
	tags = { "COMBAT" },
	title = "Tidy 血條",
	desc = "血條增強插件，提供多種外觀主題和多樣化的自訂功能。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_warrior_innerrage",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["TIDYPLATES"]("") end,
    },
	{
		type = "text",
        text = "|cffFF2D2D啟用插件後需要重新載入介面。|r",       
	},
	{
		type = "text",
        text = "|cffFF2D2D請勿和 EK 血條同時載入使用。|r",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["TipTac"] = {
    defaultEnable = 1,
	title = "滑鼠提示增強",
	desc = "提供更多的選項讓你可以自訂滑鼠提示。`",
	modifier = "BNS",
	icon = "Interface\\Icons\\inv_wand_02",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["TipTac"]("") end,
    },
	{
		type = "text",
		text = "文字大小：設定選項 > 字型設定。\n\n移動位置：設定選項 > 定位，拖曳小長方條到喜愛的位置後，再按X將它關閉。\n\n跟隨滑鼠游標移動：設定選項 > 框架位置。\n\n戰鬥中隱藏滑鼠提示：設定選項 > 戰鬥訊息。",
	},
	{
		type = "text",
		text = " ",
	}
};
D["TinyInspect"] = {
    defaultEnable = 1,
	tags = { "ITEM" },
	title = "裝備觀察清單",
	desc = "觀察其他玩家和自己時會在角色資訊視窗右方列出已裝備的物品清單，方便查看裝備和物品等級。`",
	icon = "Interface\\Icons\\inv_helmet_leather_raiddruid_q_01",
	img = true,
};
D["ToyPlus"] = {
    defaultEnable = 0,
	tags = { "COLLECTION" },
	title = "玩具選單",
	desc = "快速使用你最喜愛的玩具。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_jewelcrafting_70_jeweltoy",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("玩具")
			InterfaceOptionsFrame_OpenToCategory("玩具")
		end,
    },
	{
		type = "text",
		text = "點小地圖按鈕的 '玩具' 按鈕顯示玩具選單。",
	}
};
D["TradeLog"] = {
	defaultEnable = 1,
	title = "交易通知/記錄",
	desc = "「銀貨兩訖」``查看與玩家交易的歷史記錄，以及在聊天視窗中顯示交易訊息。`",
	author = "Warbaby (三月十二@聖光之願<冰封十字軍>)",
	icon = "Interface\\Icons\\inv_misc_coin_16",
	img = true,
	{
		type = "text",
		text = "點小地圖按鈕的 '交易記錄' 按鈕顯示交易歷史記錄。",
	}
};
D["TransmogRoulette"] = { 
	defaultEnable = 1,
	title = "塑形轉轉樂",
	desc = "塑形時按下隨機轉轉樂按鈕，打開衣櫃的無限可能。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\inv_chest_cloth_holiday_christmas_a_02",
	img = true,
};
D["TransmogTokens"] = {
	defaultEnable = 0,
	title = "舊套裝兌換資訊",
	desc = "在舊版本套裝兌換物品的滑鼠提示中顯示兌換的 NPC 和所在位置。",
	modifier = "BNS, 彩虹ui",
	icon = "Interface\\Icons\\inv_chest_chain_03",
};
D["tullaRange"] = {
    defaultEnable = 1,
	title = "射程著色",
	desc = "超出射程時，快捷列圖示會顯示紅色。能量不足時顯示藍色，技能無法使用時顯示灰色。`",
	icon = "Interface\\Icons\\inv_misc_food_28",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("射程著色")
			InterfaceOptionsFrame_OpenToCategory("射程著色")
		end,
    },
};
D["UnitFramesImproved"] = {
    defaultEnable = 0,
	title = "暴雪頭像美化",
	desc = "喜歡遊戲內建的頭像推薦使用這個插件，讓頭像變得比較漂亮。``|cffFF2D2D請勿和 'Stuf 頭像' 同時載入使用。|r`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\achievement_leader_tyrande_whisperwind",
	img = true,
    {
        text = "恢復為預設值",
        callback = function(cfg, v, loading) SlashCmdList["UNITFRAMESIMPROVED"]("reset") end,
		reload = true,
    },
	{
        text = "縮放大小",
		type = "spin",
		range = {0.5, 2, 0.1},
		default	= 1,
        callback = function(cfg, v, loading) SlashCmdList["UNITFRAMESIMPROVED"]("scale "..v) end,
    },
	{
		type = "text",
        text = "移動位置：在頭像上面點右鍵 > 移動框架 > 解鎖框架，然後便可拖曳移動。",       
	},
};
D["WeakAuras"] = {
    defaultEnable = 0,
	tags = { "MISC" },
	title = "WA技能提醒",
	desc = "輕量級，但功能強大實用、全面性的技能提醒工具，會依據增益/減益和各種觸發效果顯示圖形和資訊，以便做醒目的提醒。``使用教學與範例：`https://rainbowui.wordpress.com/tag/wa技能提醒/``各種WA提醒效果字串下載：`https://wago.io`",
	modifier = "a9012456, scars377, sheahoi, Stanzilla, Wowords, 彩虹ui",
	icon = "Interface\\Icons\\spell_holy_aspiration",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["WEAKAURAS"]("") end,
    },
	{
		type = "text",
        text = "輸入 /wa 也可以開啟設定選項。",       
	},
	{
		type = "text",
        text = " ",       
	},
};
D["Whipped"] = {
    defaultEnable = 0,
	title = "術士惡魔監控",
	desc = "監控術士的惡魔和相關技能，盡情鞭策你的惡魔吧!`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_warlock_demonicpower",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			InterfaceOptionsFrame_OpenToCategory("術士")
			InterfaceOptionsFrame_OpenToCategory("術士")
			InterfaceOptionsFrame_OpenToCategory("小鬼")
			InterfaceOptionsFrame_OpenToCategory("術士")
		end,
    },
};
D["WIM"] = {
    defaultEnable = 1,
	title = "魔獸世界即時通",
	desc = "密語會彈出小視窗，就像使用即時通訊軟體般的方便。`",
	modifier = "wuchiwa, zhTW",
	icon = "Interface\\Icons\\inv_trinket_naxxramas02",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) SlashCmdList["WIM"]("") end,
    },
	{
		type = "text",
        text = "點小地圖按鈕的 '即時通' 按鈕顯示密語。",
	},
};
D["WorldFlightMap"] = {
	defaultEnable = 1,
	title = "世界鳥點地圖",
	desc = "使用完整的世界地圖來顯示鳥點和飛行路線，選擇鳥點的同時也可以看到任務位置。`",
	icon = "Interface\\Icons\\ability_mount_warhippogryph",
	img = true,
};
D["WorldQuestTracker"] = {
	defaultEnable = 1,
	tags = { "QUEST" },
	title = "世界任務追蹤",
	desc = "加強地圖上世界任務圖示的相關功能、提供世界任務追蹤清單，更容易找到和追蹤你要的世界任務。`",
	icon = "Interface\\Icons\\achievement_quests_completed_03",
	img = true,
	{
		type = "text",
        text = "加入追蹤清單：左鍵點一下世界任務的圖示。\n\n從追蹤清單移除：右鍵點一下世界任務的圖示或追蹤清單中的任務標題。",
	},
};
D["XIV_Databar"] = {
    defaultEnable = 1,
	tags = { "ENHANCEMENT" },
	title = "功能資訊列",
	desc = "在畫面最下方顯示一排遊戲功能小圖示，取代原本的微型選單和背包按鈕。還會顯示時間、耐久度、天賦、專業、兌換通貨、金錢、傳送和系統資訊等等。``在設定選項中可以自行選擇要顯示哪些資訊、調整位置和顏色。`",
	modifier = "彩虹ui",
	icon = "Interface\\Icons\\ability_hunter_beasttraining",
	img = true,
    {
        text = "設定選項",
        callback = function(cfg, v, loading) 
			-- InterfaceOptionsFrame:Show()
			InterfaceOptionsFrame_OpenToCategory("資訊列")
			InterfaceOptionsFrame_OpenToCategory("資訊列")
		end,
    },
	{
		type = "text",
        text = "設定功能模組：打開設定選項視窗後，在視窗左側點 '資訊列' 旁的加號將它展開，再選擇 '功能模組'。",
	},
	{
		type = "text",
        text = "開啟/關閉功能模組後如果沒有正常顯示，請重新載入。",
	},
};