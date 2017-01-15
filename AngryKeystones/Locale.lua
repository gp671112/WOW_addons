local ADDON, Addon = ...
local Locale = Addon:NewModule('Locale')

local default_locale = "enUS"
local current_locale = GetLocale()

local langs = {}
langs.enUS = {
	config_characterConfig = "Per-character configuration",
	config_progressTooltip = "Show progress each enemy gives on their tooltip",
	config_progressFormat = "Enemy Forces Format",
	config_progressFormat_1 = "24.19%",
	config_progressFormat_2 = "90/372",
	config_progressFormat_3 = "24.19% - 90/372",
	config_progressFormat_4 = "24.19% (75.81%)",
	config_progressFormat_5 = "90/372 (282)",
	config_progressFormat_6 = "24.19% (75.81%) - 90/372 (282)",
	config_splitsFormat = "Objective Splits Display",
	config_splitsFormat_1 = "Disabled",
	config_splitsFormat_2 = "Time from start",
	config_splitsFormat_3 = "Relative to previous",
	config_autoGossip = "Automatically select gossip entries during Mythic Keystone dungeons (ex: Odyn)",
	config_cosRumors = "Output to party chat clues from \"Chatty Rumormonger\" during Court of Stars",
	config_silverGoldTimer = "Show timer for both 2 and 3 bonus chests at same time",
	config_completionMessage = "Show message with final times on completion of a Mythic Keystone dungeon",
	config_showSplits = "Show split time for each objective in objective tracker",
	keystoneFormat = "[Keystone: %s - Level %d]",
	completion0 = "Timer expired for %s with %s, you were %s over the time limit.",
	completion1 = "Beat the timer for %s in %s. You were %s ahead of the timer, and missed +2 by %s.",
	completion2 = "Beat the timer for +2 %s in %s. You were %s ahead of the +2 timer, and missed +3 by %s.",
	completion3 = "Beat the timer for +3 %s in %s. You were %s ahead of the +3 timer.",
	completionSplits = "Split timings were: %s.",
	timeLost = "Time Lost",
	config_smallAffixes = "Reduce the size of affix icons on timer frame",
	config_deathTracker = "Show death tracker on timer frame",
	config_persistTracker = "Continue showing objective tracker after Mythic Keystone completion (requires Reload UI to take effect)",
	scheduleTitle = "Schedule",
	scheduleWeek1 = "This week",
	scheduleWeek2 = "Next week",
	scheduleWeek3 = "In two weeks",
	scheduleWeek4 = "In three weeks",
	scheduleMissingKeystone = "Requires a level 7+ Mythic Keystone in your inventory to display.",
	config_exclusiveTracker = "Hide quest and achievement trackers during Mythic Keystone dungeons (requires Reload UI to take effect)",
	config_hideTalkingHead = "Hide Talking Head dialog during a Mythic Keystone dungeon",
}
langs.enGB = langs.enUS

langs.zhCN = {
	config_characterConfig = "为角色进行独立的配置",
	config_progressTooltip = "聊天窗口的史诗钥石显示副本名称和等级",
	config_progressFormat = "敌方部队进度格式",
	config_splitsFormat = "进度分割显示方式",
	config_splitsFormat_1 = "禁用",
	config_splitsFormat_2 = "从头计时",
	config_splitsFormat_3 = "与之前关联",
	config_autoGossip = "在史诗钥石副本中自动对话交互（如奥丁）",
	config_cosRumors = "群星庭院密探线索发送到队伍频道",
	config_cosRumors = "群星庭院造谣者线索发送到队伍频道",
	config_silverGoldTimer = "同时显示2箱和3箱的计时",
	config_completionMessage = "副本完成时在聊天窗口显示总耗时",
	config_showSplits = "在任务列表的进度上显示单独的进度计时",
	keystoneFormat = "[%s（%d级）]",
	forcesFormat = " - 敌方部队 %s",
	completion0 = "你超时完成了 %s 的战斗。共耗时 %s，超出规定时间 %s。",
	completion1 = "你在规定时间内完成了 %s 的战斗！共耗时 %s，剩余时间 %s，2箱奖励超时 %s。",
	completion2 = "你在规定时间内获得了 %s 的2箱奖励！共耗时 %s，2箱奖励剩余时间 %s，3箱奖励超时 %s。",
	completion3 = "你在规定时间内获得了 %s 的3箱奖励！共耗时 %s，3箱奖励剩余时间 %s。",
	timeLost = "损失时间",
	config_smallAffixes = "缩小进度条上的光环图标大小",
	config_deathTracker = "在进度条上显示死亡统计",
	config_persistTracker = "副本完成后继续显示任务追踪（重载插件后生效）",
	scheduleTitle = "日程表",
	scheduleWeek1 = "本周",
	scheduleWeek2 = "下周",
	scheduleWeek3 = "两周后",
	scheduleWeek4 = "三周后",
	scheduleMissingKeystone = "你需要一把7级以上的钥石才可激活此项功能。",
	config_exclusiveTracker = "在副本中隐藏任务和成就追踪（重载插件后生效）",
	config_hideTalkingHead = "在史诗钥石副本中隐藏NPC情景对话窗口",
}
langs.zhTW = {
	config_characterConfig = "角色專用的設定",
	config_progressTooltip = "在提示中顯示每個敵人所提供的進度",
	config_progressFormat = "敵方部隊進度格式",
	config_splitsFormat = "分割顯示目標時間",
	config_splitsFormat_1 = "停用",
	config_splitsFormat_2 = "開始到現在的時間",
	config_splitsFormat_3 = "相對於前一個目標的時間",
	config_autoGossip = "在傳奇鑰石副本中自動選擇對話選項 (例如: 奧丁)",
	config_cosRumors = "在眾星之廷時扮演柯南時將線索輸出到隊伍聊天頻道",
	config_silverGoldTimer = "同時顯示2箱和3箱獎勵的時間",
	config_completionMessage = "在傳奇鑰石副本完成訊息中顯示完成時間",
	config_showSplits = "在任務目標清單中分割顯示每個目標的時間",
	keystoneFormat = "[%s - 傳奇%d]",
	forcesFormat = "- 敵方部隊進度: %s",
	completion0 = "超過時間，%s 使用 %s。比時間限制超出 %s。",
	completion1 = "成功完成傳奇+! %s 使用 %s。比時間限制提早 %s，再快 %s 便能達成2箱。",
	completion2 = "成功達成2箱獎勵! %s 使用 %s。比2箱的時間限制提早 %s，再快 %s 便能達成3箱。",
	completion3 = "成功達成3箱獎勵! %s 使用 %s。比3箱的時間限制提早 %s",
	completionsplits = "分割時間是: %s。",
	timeLost = "損失時間",
	config_smallAffixes = "縮小計時框架上附加的圖示大小",
	config_deathTracker = "計時框架顯示死亡追蹤記錄",
	config_persistTracker = "副本完成後繼續顯示任務追蹤（重載插件後生效）",
	scheduleTitle = "日程表",
	scheduleWeek1 = "本周",
	scheduleWeek2 = "下周",
	scheduleWeek3 = "兩周後",
	scheduleWeek4 = "三周後",
	scheduleMissingKeystone = "你需要一把7級以上的鑰石來啟用此項功能。",
	config_exclusiveTracker = "在副本中隱藏成就和任務追蹤（重載插件後生效）",
	config_hideTalkingHead = "在傳奇鑰石副本中隱藏NPC事件對話視窗",
}

function Locale:Get(key)
	if langs[current_locale] and langs[current_locale][key] ~= nil then
		return langs[current_locale][key]
	else
		return langs[default_locale][key]
	end
end

function Locale:Local(key)
	return langs[current_locale] and langs[current_locale][key]
end

function Locale:Exists(key)
	return langs[default_locale][key] ~= nil
end

setmetatable(Locale, {__index = Locale.Get})

local clues = {}
local rumors = {}

clues.enUS = {
	male = MALE,
	female = FEMALE,
	lightVest = "Light Vest",
	darkVest = "Dark Vest",
	shortSleeves = "Short Sleeves",
	longSleeves = "Long Sleeves",
	cloak = "Cloak",
	noCloak = "No Cloak",
	gloves = "Gloves",
	noGloves = "No Gloves",
	noPotion = "No Potion",
	book = "Book",
	coinpurse = "Coinpurse",
	potion = "Potion",
}
clues.enGB = clues.enUS

rumors.enUS = {
	["I heard somewhere that the spy isn't female."]="male",
	["I heard the spy is here and he's very good looking."]="male",
	["A guest said she saw him entering the manor alongside the Grand Magistrix."]="male",
	["One of the musicians said he would not stop asking questions about the district."]="male",

	["Someone's been saying that our new guest isn't male."]="female",
	["A guest saw both her and Elisande arrive together earlier."]="female",
	["They say that the spy is here and she's quite the sight to behold."]="female",
	["I hear some woman has been constantly asking about the district..."]="female",

	["The spy definitely prefers the style of light colored vests."]="lightVest",
	["I heard that the spy is wearing a lighter vest to tonight's party."]="lightVest",
	["People are saying the spy is not wearing a darker vest tonight."]="lightVest",

	["The spy definitely prefers darker clothing."]="darkVest",
	["I heard the spy's vest is a dark, rich shade this very night."]="darkVest",
	["The spy enjoys darker colored vests... like the night."]="darkVest",
	["Rumor has it the spy is avoiding light colored clothing to try and blend in more."]="darkVest",

	["Someone told me the spy hates wearing long sleeves."]="shortSleeves",
	["I heard the spy wears short sleeves to keep their arms unencumbered."]="shortSleeves",
	["I heard the spy enjoys the cool air and is not wearing long sleeves tonight."]="shortSleeves",
	["A friend of mine said she saw the outfit the spy was wearing. It did not have long sleeves."]="shortSleeves",

	["I heard the spy's outfit has long sleeves tonight."]="longSleeves",
	["A friend of mine mentioned the spy has long sleeves on."]="longSleeves",
	["Someone said the spy is covering up their arms with long sleeves tonight."]="longSleeves",
	["I just barely caught a glimpse of the spy's long sleeves earlier in the evening."]="longSleeves",

	["Someone mentioned the spy came in earlier wearing a cape."]="cloak",
	["I heard the spy enjoys wearing capes."]="cloak",

	["I heard that the spy left their cape in the palace before coming here."]="noCloak",
	["I heard the spy dislikes capes and refuses to wear one."]="noCloak",

	["There's a rumor that the spy always wears gloves."]="gloves",
	["I heard the spy carefully hides their hands."]="gloves",
	["Someone said the spy wears gloves to cover obvious scars."]="gloves",
	["I heard the spy always dons gloves."]="gloves",

	["You know... I found an extra pair of gloves in the back room. The spy is likely to be bare handed somewhere around here."]="noGloves",
	["There's a rumor that the spy never has gloves on."]="noGloves",
	["I heard the spy avoids having gloves on, in case some quick actions are needed."]="noGloves",
	["I heard the spy dislikes wearing gloves."]="noGloves",

	["Rumor has is the spy loves to read and always carries around at least one book."]="book",
	["I heard the spy always has a book of written secrets at the belt."]="book",

	["A musician told me she saw the spy throw away their last potion and no longer has any left."]="noPotion",
	["I heard the spy is not carrying any potions around."]="noPotion",

	["I'm pretty sure the spy has potions at the belt."]="potion",
	["I heard the spy brought along potions, I wonder why?"]="potion",
	["I heard the spy brought along some potions... just in case."]="potion",
	["I didn't tell you this... but the spy is masquerading as an alchemist and carrying potions at the belt."]="potion",

	["I heard the spy's belt pouch is lined with fancy threading."]="coinpurse",
	["A friend said the spy loves gold and a belt pouch filled with it."]="coinpurse",
	["I heard the spy's belt pouch is filled with gold to show off extravagance."]="coinpurse",
	["I heard the spy carries a magical pouch around at all times."]="coinpurse",
}
rumors.enGB = rumors.enUS

clues.zhCN = {
	lightVest = "浅色上衣",
	darkVest = "深色上衣",
	shortSleeves = "短袖",
	longSleeves = "长袖",
	cloak = "有斗篷",
	noCloak = "无斗篷",
	gloves = "有手套",
	noGloves = "无手套",
	noPotion = "无药水",
	book = "有书",
	coinpurse = "有钱袋",
	potion = "有药水",
}

rumors.zhCN = {
	["我在别处听说那个密探不是女性。"]="male",
	["我听说那个密探已经来了，而且他很英俊。"]="male",
	["有个客人说她看见他和大魔导师一起走进了庄园。"]="male",
	["有个乐师说，他一直在打听这一带的消息。"]="male",
	["有人说我们的新客人不是男性。"]="female",
	["他们说那个密探已经来了，而且她是个大美人。"]="female",
	["我听说有个女人一直打听贵族区的情况……"]="female",
	["那个间谍肯定更喜欢浅色的上衣。"]="lightVest",
	["我听说那个密探穿着一件浅色上衣来参加今晚的聚会。"]="lightVest",
	["大家都在说那个密探今晚没有穿深色的上衣。"]="lightVest",
	["那个间谍肯定更喜欢深色的服装。"]="darkVest",
	["我听说那个密探今晚所穿的外衣是浓密的暗深色。"]="darkVest",
	["那个密探喜欢深色的上衣……就像夜空一样深沉。"]="darkVest",
	["传说那个密探会避免穿浅色的服装，以便更好地混入人群。"]="darkVest",
	["有人告诉我那个密探讨厌长袖的衣服。"]="shortSleeves",
	["我听说密探喜欢穿短袖服装，以免妨碍双臂的活动。"]="shortSleeves",
	["我听说那个密探喜欢清凉的空气，所以今晚没有穿长袖衣服。"]="shortSleeves",
	["我的一个朋友说，她看到了密探穿的衣服，是一件短袖上衣。"]="shortSleeves",
	["我听说那个密探今天穿着长袖外套。"]="longSleeves",
	["我的一个朋友说那个密探穿着长袖衣服。"]="longSleeves",
	["有人说，那个密探今晚穿了一件长袖的衣服。"]="longSleeves",
	["上半夜的时候，我正巧瞥见那个密探穿着长袖衣服。"]="longSleeves",
	["有人提到那个密探之前是穿着斗篷来的。"]="cloak",
	["我听说那个密探喜欢穿斗篷。"]="cloak",
	["我听说那个密探在来这里之前，把斗篷忘在王宫里了。"]="noCloak",
	["我听说那个密探讨厌斗篷，所以没有穿。"]="noCloak",
	["有传言说那个密探总是带着手套。"]="gloves",
	["我听说密探都会小心隐藏自己的双手。"]="gloves",
	["有人说那个密探带着手套，以掩盖手上明显的疤痕。"]="gloves",
	["我听说那个密探总是带着手套。"]="gloves",
	["你知道吗……我在后头的房间里发现了一双多余的手套。那个密探现在可能就赤着双手在这附近转悠呢。"]="noGloves",
	["有传言说那个密探从来不戴手套。"]="noGloves",
	["我听说那个密探会尽量不戴手套，以防在快速行动时受到阻碍。"]="noGloves",
	["我听说那个密探不喜欢戴手套。"]="noGloves",
	["据说那个密探喜欢读书，而且总是随身携带至少一本书。"]="book",
	["我听说那个密探的腰带上，总是挂着一本写满机密的书。"]="book",
	["有个乐师告诉我，她看到那个密探扔掉了身上的最后一瓶药水，已经没有药水了。"]="noPotion",
	["我听说那个密探根本没带任何药水。"]="noPotion",
	["我敢肯定，那个密探的腰带上挂着药水。"]="potion",
	["我听说那个密探随身带着药水，这是为什么呢？"]="potion",
	["可别说是我告诉你的……那个密探伪装成了炼金师，腰带上挂着药水。"]="potion",
	["我听说那个密探的腰包上绣着精美的丝线。"]="coinpurse",
	["一个朋友说，那个密探喜欢黄金，所以在腰包里装满了金币。"]="coinpurse",
	["我听说那个密探的腰包里装满了摆阔用的金币。"]="coinpurse",
	["我听说那个密探总是带着一个魔法袋。"]="coinpurse",
}

function Locale:HasRumors()
	return rumors[current_locale] ~= nil and clues[current_locale] ~= nil
end

function Locale:Rumor(gossip)
	if rumors[current_locale] and rumors[current_locale][gossip] then
		return clues[current_locale] and clues[current_locale][rumors[current_locale][gossip]]
	end
end
