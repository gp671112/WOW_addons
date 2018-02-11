if ( GetLocale() == "zhTW" ) then 
	DugisLocals = {	

	PART_TEXT = "單方面",
	
--自行加入的翻譯	
	["Dugi Guides"] = "Dugi 任務高手", -- BINDING_HEADER_DUGI 要加上 L[]
	["Dugi Guides Off"] = "Dugi 任務高手 已停用",
	["Dugi Guides On"] = "Dugi 任務高手 已啟用",
	["|cff11ff11Dugi Guides: |rNew character detected. Wiping settings."] = "|cff11ff11Dugi 任務高手: |r偵測到新角色，重置設定。",
	["Auto Track Local Quest"] = "自動追蹤本地任務",
	["Automatically remove non-local (not in current map) quest and track local quest to the objective tracker. This will trigger when you accept a quest or during a zone change event"] = "自動移除非本地 (不是目前所在地圖) 的任務，將本地任務新增至任務目標清單。當你接受任務或更換區域時會執行這個動作。",
	["Auto Loot Quest Item"] = "自動選擇任務獎勵",
	["Abandon Quests Button"] = "放棄多項任務按鈕",
	["Mass abandon quests button in your quest log to automatically abandon all quests by their category or zone"]= "在任務列表，區域名稱的右方加入放棄多項任務的按鈕，方便自動放棄整個分類或區域的任務。",
	["Auto Select Flight Path"] = "自動選擇飛行路線",
	["Automatically select the suggested flight path after opening the flightmaster map"] = "飛行管理員地圖開啟後，自動選擇建議的飛行路線。",
	["Use Taxi System"] = "使用轉運系統",
	["Taxi system will find the fastest route to get to your destination with the use of portals, teleports, vehicles etc. Disabling this option will give you a direct waypoint instead."] = "轉運系統會使用傳送門、傳送點、交通工具...等，尋找到達目的地的最快路線。停用這個選項將會提供直接而單一的路線導引。",
	["Bronze"] = "青銅",
	["Okay"] = "確定",
	["Cancel"] = "取消",
	["Weapon Preference"] = "武器偏好",
	["Choose how gear advisor will decide which weapon to equip in the main hand and off hand slot when dual wielding. Auto option will decide based on the class and spec."] = "使用雙武器時，選擇主手和副手要推薦使用什麼樣的武器。自動選項會根據職業和專精來選擇。",
	["Auto"] = "自動",
	["Fast / Slow"] = "快/慢",
	["Slow / Fast"] = "慢/快",
	["Never Swap"] = "永不對調",
	["Suggest Trinkets"] = "建議飾品",
	["A trinket is scored by its stats and item level but not the 'use' or special effect which can make the trinket suggestion inaccurate.\n\nUnticking this setting will disable the trinkets suggestion."] = "飾品是根據屬性和等級評分，而不是使用或觸發的特效，因此飾品的建議不是那麼精準。\n\n停用這個設定將會停用飾品的建議。",
	["Display All Stats"] = "顯示所有屬性",
	["Display unused stats for gear scoring"] = "顯示裝備評分未用到的屬性。",
	["Reset Scores"] = "重置分數",
	
	-- GearAdvisor.lua
	["Agility"] = "敏捷",
	["Attack Power"] = "攻擊強度",
	["Armor"] = "護甲值",
	["Bonus Armor"] = "額外護甲值",
	["Avoidance"] = "閃躲",
	["DPS"] = "傷害",
	["DPS - Main"] = "傷害 - 主手",
	["DPS - Off"] = "傷害 - 副手",
	["Intellect"] = "智力",
	["Leech"] = "汲取",
	["Mastery"] = "精通",
	["Critical Rating"] = "致命一擊",
	["Haste Rating"] = "加速",
	["Multistrike"] = "雙擊",
	["Spell Power"] = "法術能量",
	["Spirit"] = "精神",
	["Stamina"] = "耐力",
	["Strength"] = "力量",
	["Versatility"] = "臨機應變",
	["XP Bonus"] = "經驗值加成",
	["Gear Upgrade Suggested"] = "建議升級裝備",
	
	
	-- arrow.lua
	["Waypoint arrow not available. Click here to check the world map"] = "無法使用箭頭導引，點一下查看世界地圖。",
	["Waypoint reached."] = "到達目的地。",
	[" mil"] = " 里",
	[" yd"] = " 碼",
	[" km"] = " 公里",
	[" m"] = " 公尺",
	[" (World Quest)"] = " (世界任務)",	
	["Dugi Arrow"] = "Dugi 箭頭",
	["Remove Waypoint"] = "取消路線導引",
	["Remove All Waypoints"] = "取消所有路線導引",
	["Refresh"] = "重新整理",
	["Waypoint is on a different floor"] = "路線導引在另一個樓層",
	["Lock Arrow"] = "鎖定箭頭",
	["Unlock Arrow"] = "解除鎖定箭頭",
	["Arrow Scale"] = "箭頭大小",
	["Lock Zone Map"] = "鎖定地圖大小",
	["Unlock Zone Map"] = "解除鎖定地圖大小",
	["Text Scale"] = "文字大小",
	
	-- Libs\menu.lua
	["Close Menu"] = "關閉選單",
	
	-- WorldMapTracking.lua
	["Remove tracking"] = "取消追蹤",
	["Abandon All Quests?"] = "是否確定要放棄所有任務?",
	["Yes"] = "是",
	["No"] = "否",
	["Abandon All "] = "是否確定要放棄 '",
	[" Quests?"] = "' 的所有任務?",
	["|cfff0eb20Flight location not learned|r"] = "|cfff0eb20尚未開啟這個飛行鳥點|r",
	
	-- TaxiDB.lua
	["DG: Flight master data updated!"] = "任務高手：飛行管理員資料已經更新!",
	
	-- MapOverlays.lua 
	["|cffffd200Player:|r ---"] = "|cffffd200玩家:|r ---",
	["|cffffd200Player:|r %s"] = "|cffffd200玩家:|r %s",
	["|cffffd200Cursor:|r ---"] = "|cffffd200游標:|r ---",
	["|cffffd200Cursor:|r %s"] = "|cffffd200游標:|r %s",
	-- 座標改為 150 和 -150
	
	-- DugisGuideViewer.xml
	["Show / Hide Model Viewer"] = "顯示/隱藏模組預覽",
	["Preload"] = "預先載入",
	["Reset Ban List"] = "重置忽略清單",
	["Go"] = "出發",
	["Complete"] = "完成",
	["Not Now"] = "不是現在",
	
	
	-- DugisGuideViewer.lua
	["|cff11ff11" .. "Dugi: Disabled WorldQuestTracker's \"Auto World Map\" option, this needs to be off for Dugi waypoint."] = "|cff11ff11" .. "任務高手: 已停用世界任務追蹤插件的 \"自動世界地圖\" 選項，必須停用才能使用任務高手的路線導引功能。",
	["|cff11ff11/dugi way xx xx - |rPlace waypoint in current zone."] = "|cff11ff11/dugi way xx xx - |r在目前的地區建立路線導引。",
	["|cff11ff11/dugi fix - |rReset all Saved Variable setting."] = "|cff11ff11/dugi fix - |r重置所有已儲存的變數設定。",
	["|cff11ff11/dugi reset - |rReset all frame position."] = "|cff11ff11/dugi reset - |r重置所有框架位置。",
	["|cff11ff11/dugi on - |rEnable Dugi Addon."] = "|cff11ff11/dugi on - |r啟用 Dugi 插件。",
	["|cff11ff11/dugi off - |rDisable Dugi Addon."] = "|cff11ff11/dugi off - |r停用 Dugi 插件。",
	["|cff11ff11/dugi config - |rDisplay settings menu."] = "|cff11ff11/dugi config - |r開啟設定選項。",
	["|cff11ff11/dugi automount - |rToogle Auto Mount on/off."] = "|cff11ff11/dugi automount - |r啟用/停用自動坐騎。",
	["|cff11ff11" .. "Dugi: Frame Reset"] = "|cff11ff11" .. "Dugi: 已經重置框架",
	["|cff11ff11" .. "Dugi: Cleared Saved Variables"] = "|cff11ff11" .. "Dugi: 已經清除儲存的變數",
	["|cff11ff11" .. "Dugi Guides Essential Mode"] = "Dugi 任務高手核心版 已啟用",
	["|cff11ff11" .. "Dugi Guides Off"] = "|cff11ff11" .. "Dugi 任務高手 已停用",
	["|cff11ff11" .. "Dugi Guides On"] = "|cff11ff11" .. "Dugi 任務高手 已啟用",
	["|cff11ff11Auto Mount is ON|r"] = "|cff11ff11自動坐騎 已啟用|r",
	["|cff11ff11Auto Mount is OFF|r"] = "|cff11ff11自動坐騎 已停用|r",
	
		
	["Search Locations"] = "搜尋地名",
	["Locations in"] = "位於",
	["Instance Portal"] = "副本入口",
	["Portal "] = "入口/傳送門 ",
	["Auto Quest Turn in"] = "自動交回任務",
	["Automatically turn in quests from NPCs. Disable with shift"] = "自動和NPC交回任務。按住Shift鍵可停用此功能。",
	["Automatically accept quests from NPCs. Disable with shift"] = "自動和NPC接受任務。按住Shift鍵可停用此功能。",
	["Loot Suggestion Priority"] = "建議選擇獎勵的優先順序",
	
	["Blink Minimap Resource Nodes"] = "閃爍小地圖中的資源點",
	["Resource nodes for gathering profession and battle pets will blink in your minimap to make it easier to notice"] = "小地圖中的採集專業和戰寵資源點將會閃爍，以便更容易發現。",
	["Resource nodes for gathering profession will blink in your minimap to make it easier to notice"] = "小地圖中的採集專業和戰寵資源點將會閃爍，以便更容易發現。",
	["Ignore Daily Quest Items"] = "忽略每日任務物品",
	["Don't suggest to replace quest items for completing daily quest"] = "不要建議替換每日任務所需要的物品。",
	["Demon Hunter"] = "惡魔獵人",
	["Waypoint Reached Sound"] = "到達目的地音效",
	["Plays a ping sound upon reaching each waypoint"] = "到達每一個路線導引終點時播放音效。",
	["Hide Model Preview in World Map"] = "隱藏世界地圖中的模組預覽",
	["|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|tDisable suggestions if the highlighted\nsets are equipped:"] = "|TInterface\\OptionsFrame\\UI-OptionsFrame-NewFeatureIcon:0:0:0:-1|t已裝備下方選取 (亮起來) 的\n　套裝設定時停用建議裝備：",
	
	["Import Scores"] = "匯入分數",
	["Paste below scores from another addon and press Import."] = "貼上來自其他插件的屬性權重分數，\n然後按下匯入。",
	["Import"] = "匯入",
	["Cancel"] = "取消",
	
	["Auto Mount"] = "自動坐騎",
	["Enable auto mount"] = "啟用自動坐騎",
	["Automatically mounts the fastest available mount."] = "自動騎乘可以使用的最快速坐騎。",
	["Prefered mount in flyable areas"] = "可飛行區域的偏好坐騎",
	["Prefered mount in non-flyable areas"] = "不可飛行區域的偏好坐騎",
	["Prefered mount in water"]  = "水中的偏好坐騎",
	["Key Bindings"] = "按鍵設定",
	["Delay After Spell (%.1f)"] = "施法結束後 %.1f 秒自動召喚",
	["Don't mount"] = "不要召喚坐騎",
	["Random Favorite "] = "隨機召喚最喜愛的",
	["Random Favorite"] = "隨機召喚最喜愛的坐騎",
	["None"] = "無",
	["Ground"] = "陸地坐騎",
	["Flying"] = "飛行座騎",
	["Aquatic"] = "水中坐騎",
	
	["Enabled Map Preview"] = "啟用地圖預覽",
	["Addon"] = "插件",
	["Guide Mode"] = "啟用完整版",
	["Essential Mode"] = "啟用",
	["Off Mode"] = "暫時停用",
	["Quick Settings"] = "快速設定",
	["Auto Mount"] = "自動坐騎",
	["Gear Advisor"] = "裝備建議",
	["Auto Quest Accept/Turn in"] = "自動接交任務",
	["Map Preview"] = "地圖預覽",
	["Auto Select Flight Path"] = "自動選擇飛行路線",
	["More settings.."] = "更多設定選項...",
	["Home"] = "首頁",
	
	["Taxi System"] = "轉運系統",
	["Use Zone Portals"] = "使用地區傳送門",
	["Use Player Portals"] = "使用玩家傳送門",
	["Use Boats"] = "搭船",
	["Use Class Portals"] = "使用職業傳送門",
	["Use Flight Master Whistle"] = "使用飛行管理員的哨子",
	
	["Dugi Arrow Colors"] = "Dugi 箭頭顏色",
	["Default Colors"] = "預設顏色",
	["Bad Color"] = "錯誤顏色",
	["Middle Color"] = "尚可顏色",
	["Good Color"] = "良好顏色",
	["Exact Color"] = "精確顏色",
	["Questing Area Color"] = "任務區域內顏色",
	["Notifications"] = "通知",
	["Gear Advisor Suggestions as Notifications"] = "顯示裝備建議的通知",
	["If disabled standard gear suggestion prompts will be shown."] = "停用時，會顯示標準的裝備建議提示。",
	["Ant Trail"] = "螞蟻路徑",
	["Dotted"] = "圓點",
	["Solid"] = "直線",
	
	["Dugi Zone Map"] = "Dugi 區域地圖",
	["Enable Zone Map"] = "啟用區域地圖",
	["Turn on / off the Dugi Zone Map feature"] = "開啟/關閉 Dugi 區域地圖功能。",
	["Enable Auto Zoom"] = "啟用自動縮放",
	["Automatically Zoom in / out the map based on the current waypoint"] = "自動根據目前的導引路線放大/縮小地圖。",
	["Show Quests POI"] = "顯示任務標示",
	["Turn on /off the point of interest icons for quests on the map"] = "開啟/關閉地圖上的任務標記圖示。",
	["Auto Hide Zone Map"] = "自動隱藏區域地圖",
	["Automatically hides Dugi Map in case there are no waypoints."] = "沒有導引路線時自動隱藏 Dugi 區域地圖。",
	["Merge With Dugi Arrow"] = "整合 Dugi 箭頭",
	["Dugi Arrow text is displayed underneath the Zone Map and Dugi arrow is automatically shown within close range of the waypoints"] = "Dugi 箭頭文字會顯示在區域地圖下方，Dugi 箭頭會變小，自動顯示在區域地圖裡面、導引路線的附近。",
	["Minimap Terrain Detail"] = "小地圖地形細節",
	["Turns minimap terrain details on."] = "開啟小地圖的地形細節。",
	["Zone Map Border Opacity (%.1f)"] = "區域地圖邊框透明度 (%.1f)",
	["Zone Map Opacity (%.1f)"] = "區域地圖透明度 (%.1f)",
	["Zone Map Size (%.1f)"] = "區域地圖大小 (%.1f)",
	["Character Arrow Size (%.1f)"] = "角色箭頭大小 (%.1f)",
	["Zone Map Border"] = "區域地圖邊框",
	["TextPanel"] = "文字面板",
	["Default Setting"] = "預設值",
	


---
  ["|TInterface\\AddOns\\DugisGuideViewerZ\\Artwork\\UpgradeArrow:0|t|cff1eff00+%d%%|r upgrade over %s with %s"] = "|TInterface\\AddOns\\DugisGuideViewerZ\\Artwork\\UpgradeArrow:0|t|cff1eff00+%d%%|r 更新 %s 為 %s",
  ["|TInterface\\AddOns\\DugisGuideViewerZ\\Artwork\\UpgradeArrow:0|t|cff1eff00+%d%%|r upgrade over %s"] = "|TInterface\\AddOns\\DugisGuideViewerZ\\Artwork\\UpgradeArrow:0|t|cff1eff00+%d%%|r 更新 %s",
	["%s Portal in %s"] = "%s 傳送門在 %s",
  ["%s %s in %s"] = "%s %s 在 %s",
  ["([^%s]+) Trainer"] = "([^%s]+)訓練師",
  ["([^%s]+) Trainer Female"] = "女([^%s]+)訓練師",
  ["|cff11ff11Dugi Guides: |rGrey quality items sold for %s"] = "|cff11ff11Dugi任務高手: |r賣垃圾獲得 %s",
  ["|cff11ff11Dugi Guides: |rGear automatically repaired%s for %s"] = "|cff11ff11Dugi任務高手: |r自動修裝%s，花費 %s",
  ["+2 (Heroic Dungeon)"] = "+2 (英雄副本)",
  ["+3 (Raid)"] = "+3 (團隊)",
  
--Aa
  ["Auto Tooltip (%.1fs)"] = "自動滑鼠提示 (%.1fs)",
  ["Allow NPC Journal to float anywhere on the screen"] = "允許NPC日誌放置在螢幕上的任何位置",
  ["Auto quest accept feature will only accept quests in current guide"] = "只有目前導覽中的任務才能使用自動接受任務的功能。",
  ["Add waypoint"] = "新增路線導引",
  ["Add %s to ban list"] = "將 %s 加入到忽略清單",
  ["Archaeology"] = "考古學",
  ["Automatically repair all damaged equipment at repair NPC"] = "與有修理裝備能力的NPC對話時自動修理所有裝備。",
  ["Auto Repair"] = "自動修裝",
  ["Automatically maintain the best item for each slot as player level, active spec and inventory changes occur."] = "各部位自動保持裝備最佳物品，根據玩家等級、目前專精和背包內容。",
  ["Auto Equip Smart Set"] = "自動裝備智慧型套裝 (含建議更換裝備)",
  ["Allow movement of the watch frame, not available if other incompatible addons are loaded."] = "允許移動觀察框架，如果使用其它不相容的插件則無法移動。", 
  ["Add a border for the Objective Tracker Frame"] = "替任務目標清單加上外框。",
  ["Active Talent Specialization"] = "已啟用的專精",
  ["Add"] = "新增",  
	["Account Wide Achievement"] = "帳號共通成就",
	["Add minimap tracking icons on the world map."] = "在世界地圖上新增小地圖追蹤圖示。",
	["Alchemy"] = "煉金術",
	["All Available Quests"] = "所有可用的任務",
	["All Tracked Quests"] = "所有已追蹤的任務",
	["Allow a fixed Anchored Small Frame that will integrate with the Objective Tracker"] = "允許使用固定錨點小框架，會和任務目標清單整合",
	["Allow status frame to show all currently relevant quests."] = "允許使用狀態框架，來顯示目前所有相關的任務。",
	["Allows model viewer to function"] = "允許使用模組檢視器",
	["Alternative Leveling Guides:"] = "替代的升級指引:",
	["Always"] = "永遠",
	["Amount of time the Map Preview should remain in view (zero to disable).  Enabling this feature will automatically set the world map to windowed mode on reload."] = "地圖預覽顯示的時間 ( 0 代表停用)，啟用這功能將在重新載入時自動將世界地圖設為視窗模式。",
	["Anchored Small Frame"] = "小框架錨點",
	["Ant Trail Color"] = "螞蟻路徑顏色",
	["Apply Memory Settings"] = "允許記憶體設定",
	["Apply"] = "套用",
	["Auto"] = "自動",
	["Automatic Quest Matching"] = "自動任務配合",
	["Auto Quest Accept"] = "自動接受任務",
	["Auto Quest Item Loot"] = "自動選擇任務獎勵",
	["Auto Sell Greys"] = "自動賣垃圾",
	["Auto Stick"] = "自動放置",
	["Automatic Waypoints"] = "自動導航", 
	["Automatically accept and turn in quests from NPCs. Disable with shift"] = "自動從NPC接受和交回任務。按住Shift鍵可停用此功能。",
	["Automatically loot quest items."] = "自動選擇任務獎勵物品。",
	["Automatically map waypoints from the Small Frame or from the Objective Tracker in essential mode"] = "自動加入路線導引，從小框架或基本模式中的任務目標清單。",
	["Automatically sell grey quality items to merchant NPCs"] = "自動賣垃圾品質物品給NPC商人。",

--Bb
  ["Battlemaster"] = "戰場管理員",
  ["Banker"] = "銀行員",
  ["Best in slot - |c%s%s|r"] = "最佳裝備 - |c%s%s|r",
  ["Best in slot with %s - |c%s%s|r"] = "最佳裝備是 %s - |c%s%s|r",
	["Bell Toll Alliance"] = "喪鐘聯盟",
	["Bell Toll Horde"] = "喪鐘部落",
	["BlackGold"] = "黑金",
	["Blacksmithing"] = "鍛造",
	["BloodElf Female"] = "女血精靈",
	["BloodElf Male"] = "男血精靈",
	["Boat Docked"] = "船已靠碼頭",
	["Boat to"] = "船到",
	["Borders"] = "邊框",
	["Bottom Left"] = "下左",
	["Bottom Right"] = "下右",
	["Bottom"] = "下",
	["Bronce"] = "青銅",
--Cc
  ["Collected"] = "已採集",
  ["Class Trainer"] = "職業訓練師",
  ["Class"] = "職業", 
	["Classic Arrow"] = "經典風格箭頭",
	["Clear"] = "清除",	
	["Collect Garbage"] = "收集垃圾",
	["Color Code Quest"] = "著色密碼任務",
	["Color code quest against your character's level"] = "對比你的角色等級著色密碼任務。",
	["Cooking"] = "烹飪",	
	["Copy From"] = "複製設定檔，從",
	["Current Guide"] = "目前指引",
	["Customize Macro"] = "自訂巨集",
	["Customize Target Macro"] = "自訂目標巨集",
--Dd
  ["Determines how gear should be scored, in order of greatest to least importance."] = "決定裝備評分，按最好的順序來分配重要性。",
  ["Duration (%.1fs)"] = "預覽時間 (%.1f秒)",
  ["Disable Blizzard's Automatic Quest Tracking feature and use Dugi Automatic Quest Matching feature which will sync your Objective tracker with the current guide"] = "禁用內建自動任務追蹤功能並且使用Dugi自動任務配合將與目前指引同步到你的任務目標清單",
  ["Dugi Smart Set"] = "Dugi智慧型套裝",
  ["Do above for remaining %d items"] = "剩下的%d件物品都相同",
  ["Determines which scoring configuration should be used to equip gear with Dugi Smart Set."] = "裝備Dugi智慧型套裝時要使用哪種評分設定。",
  ["Don't suggest to replace items with +cooking stats if equipped"] = "不要建議替換，如果已經裝備了+烹飪技能的物品。",
  ["Don't suggest to replace fishing pole or items with +fishing stats if equipped"] = "不要建議替換釣竿，或是已經裝備了+釣魚技能的物品。",
  ["Display a prompt to verify before committing auto equip changes"] = "自動裝備更換前顯示提醒與確認。",
  ["Druid"] = "德魯伊",
  ["Deathknight"] = "死亡騎士",
	["DarkWood"] = "黑木",
	["Default"] = "預設",
	["Delete a Profile"] = "刪除設定檔",
	["Detects account wide achievements completion."] = "偵測帳號廣泛成就完成。",
	["Display ant trail between waypoints on the world map"] = "在世界地圖的導引上顯示螞蟻路徑。",
	["Display Quest Level"] = "顯示任務等級",
	["Display quest objectives in status frame."] = "在狀態框架顯示任務物件。",
	["Displays tooltip information under guide step"] = "在指引步驟下顯示提示資訊。",
	["Display"] = "顯示",
	["Draenei Female"] = "女德萊尼",
	["Draenei Male"] = "男德萊尼",
	["Dungeon Guides"] = "地城指引",
	["Dwarf Female"] = "女矮人",
	["Dwarf Male"] = "男矮人",
--Ee
  ["Equip recommended item:"] = "裝備建議的物品:",
  ["Enabling these Dugi Guides features will require the UI to reload.  Do this now?"] = "啟用這些 Dugi 任務高手的功能，將需要重新載入介面。是否要現在重新載入?",
  ["Expand in Both Directions"] = "兩方面擴展",
  ["Expand Up"] = "向上擴展",
  ["Expand Down"] = "向下擴展",
  ["Explosion"] = "爆炸",
  ["Eternium"] = "恆鐵",
  ["ElvUI"] = "ElvUI",
  ["Enable NPC Journal Frame"] = "啟用NPC日誌框架。",
  ["Enable Essentials"] = "啟用必要",
  ["Equip Set"] = "裝備套裝",
  ["Enable /way commands and compatibility with other addons that use TomTom addon (eg LightHeaded)"] = "啟用 /way 指令並相容於其它使用 TomTom 的插件 (例如：LightHeaded)。",
  ["Enable user placed waypoints on the world map by pressing Ctrl + Right click or Shift + Right click to link them together, disable this option if the hotkey conflict with another addon"] = "在小地圖上按下Ctrl+右鍵或是Shift+右鍵來啟用使用者的路線導引，如果與其它插件的快捷鍵衝突時請停用這個選項。",
	["Easy"] = "簡單",
	["Embedded Tooltip"] = "崁入提示",
	["Enable Sticky Frame"] = "啟用黏貼框架",
	["Enchanting"] = "附魔",
	["Engineering"] = "工程學",
	["Existing Profiles"] = "已存在設定檔",
--Ff
  ["Floating NPC Journal Button"] = "浮動NPC日誌按鈕",
	["Find Nearest"] = "搜尋最近的",
	["First Aid"] = "急救",	
	["Fishing"] = "釣魚",	
	["Fixed Width Small Frame"] = "固定寬度小框架",
	["Flash"] = "閃爍",  
	["Floating Item Button"] = "可移動的物品按鈕",
	["Floating Small Frame won't adjust size horizontally and remain the same width as the Objective Tracker."] = "可任意移動的小框架和任務目標清單的寬度相同，無法調整水平大小。",
	["Fly to"] = "飛到",
	["Frames"] = "框架",
--Gg
  ["Gold"] = "黃金",
  ["Guide step text color intensifies when moused over"] = "指引步驟文字顏色增強當滑鼠移過。",
  ["Guide Suggest Mode"] = "指引建議模式",
  ["Gear Set"] = "裝備設定",
  ["Gear Scoring"] = "裝備評分",
  ["General Task"] = "一般工作",
	["Gnome Female"] = "女矮人",
	["Gnome Male"] = "男矮人",
	["Goblin Female"] = "女哥布林",
	["Goblin Male"] = "男哥布林",
	["Go"] = "到",
	["Gray"] = "灰色",
	["Green"] = "綠色",
	["Guide Suggest Mode"] = "指引建議模式",
--Hh
  ["Humm"] = "Humm",
  ["Highlight Guide Steps"] = "高亮指引步驟",
  ["Hearth to"] = "爐石到",
  ["Hunter"] = "獵人",
  ["Highest Vendor Price"] = "最高商人價格",
  ["Hard"] = "困難",
	["Herbalism"] = "草藥學",	
	["Hide Border"] = "隱藏地圖邊框",
	["Hides the minimized map border when map preview is on."] = "地圖預覽開啟時，隱藏最小化的地圖邊框。",
	["High"] = "高",
	["Human Female"] = "女人類",
	["Human Male"] = "男人類",
--Ii
  ["Item Button Size (%.1f)"] = "物品按鈕大小 (%.1f)",
  ["Item has the following stats:"] = "物品的屬性為:",
  ["Ignore Cooking Items"] = "忽略烹飪物品",
  ["Ignore Fishing Items"] = "忽略釣魚物品",
  ["Inactive Talent Specialization"] = "未啟用的專精",
	["Increases the width of the Objective tracker"] = "增加任務目標清單寬度。",
	["Inscription"] = "銘文學",	
--Jj
	["Jewelcrafting"] = "珠寶設計",	
--Ll
  ["Lock model viewer frame into place"] = "鎖定模組檢視框架到位置。",
  ["Lock Model Frame"] = "鎖定模組框架",
  ["Lock the objective tracker frame."] = "鎖定任務目標清單框架。",
  ["Lock Objective Tracker"] = "鎖定任務目標清單",
	["Leatherworking"] = "製皮",
	["Left"] = "左",
	["Leveling Mode"] = "升級模式",
	["Lock large frame into place"] = "鎖定大框架到位置",
	["Lock Large Frame"] = "鎖定大框架",
	["Lock small frame into place"] = "鎖定小框架到位置",
	["Lock Small Frame"] = "鎖定小框架",
	["Low"] = "低",
--Mm
  ["Multi-step - Anchored"] = "多步驟 - 錨點",
  ["Multi-step"] = "多步驟",
  ["Minimal"] = "最小",
  ["Map Ping"] = "地圖延遲",
  ["My Corpse"] = "我的屍體",
  ["Move Objective Tracker"] = "移動任務目標清單",
  ["Manual Waypoints"] = "手動增加路線導引",
  ["Mage"] = "法師",
  ["Monk"] = "武僧",
  ["Manual Mode"] = "手動模式",
	["Map Coordinates"] = "地圖座標",
	["Map Preview"] = "地圖預覽",
	["Maps"] = "地圖",
	["Memory"] = "記憶體",
	["Metal"] = "金屬",
	["MetalRust"] = "金屬鐵鏽",
	["Minimal - No Borders"] = "最小 - 無邊框",
	["Minimap Blob Quality"] = "小地圖塗抹品質",
	["Mining"] = "採集",
	["Model Database"] = "模組資料庫",
	["Multiple Step Mode"] = "多步驟模式",
--Nn
  ["NPC Journal Button Size (%.1f)"] = "NPC日誌按鈕大小 (%.1f)",
  ["NPC Journal Button"] = "NPC日記按鈕",
  ["Not Collected"] = "未採集",
  ["No"] = "否",
  ["Never"] = "永不",
	["New Profile"] = "新設定檔",
	["NightElf Female"] = "女夜精靈",
	["NightElf Male"] = "男夜精靈",
	["None"] = "無",
	["Normal"] = "普通",
	["Not Now"] = "不是現在",
	["NPC Name Database"] = "NPC名稱資料庫",
--Oo
  ["Only Quests In Current Guide"] = "在目前指引只有任務",
  ["Or leave slot empty:"] = "或是讓裝備欄位空著:",
  ["Or keep equipped item:"] = "或是保留已裝備物品:",
  ["OK"] = "確認",
  ["Objective Tracker Frame Border"] = "任務目標清單框架邊框",
	["OnePixel"] = "1像素",
	["OR complete Quests in Log first"] = "或是先完成在記錄中的任務",
	["Orc Female"] = "女獸人",
	["Orc Male"] = "男獸人",
	["Other"] = "其它",
--Pp
  ["Player/Target level difference. Used in determining caps for hit and expertise."] = "玩家/目標等級差異。",
  ["Priest"] = "牧師",
  ["Paladin"] = "聖騎士",
	["Pandaren Female"] = "女熊貓人",
	["Pandaren Male"] = "男熊貓人",
	["Preload"] = "預先載入",
	["Preview Quest Objectives"] = "預覽任務目標",
	["Profiles"] = "設定檔",
	["Provides localized NPC names. Required for target button."] = "提供本地化NPC名稱，目標按鈕需要使用。",
--Qq
  ["Quest Objectives"] = "任務目標", 
	["Quest Complete Sound"] = "任務完成音效",
	["Quest Level Database"] = "任務等級資料庫",
	["Questing"] = "任務",	
--Rr
  ["Relative to Watch Frame"] = "關聯到觀察框架",
  ["Remove %s Tracking"] = "取消追蹤%s",
  ["Reset Ban List"] = "重置忽略清單",
  ["Rogue"] = "盜賊",
  ["Reset weights"] = "重置權重",
	["Recommended Preset Settings"] = "推薦預先設定",
	["Red"] = "紅色",
	["Reload"] = "重新載入",
	["Remove Map Fog"] = "顯示未探索區域",
	["Reset Frames Position"] = "重置框架位置",
	["Reset Profile"] = "重置設定檔",
	["Reset"] = "重置",
	["Riding"] = "騎馬中",
	["Right"] = "右",
--Ss
  ["Size of the target button."] = "目標按鈕大小。",
  ["Size of the item button."] = "物品按鈕大小。",
  ["Small Frame Font Size (%.1f)"] = "小框架字型大小 (%.1f)",
  ["Small Frame Behavior"] = "小框架行為",
  ["Standard - Anchored"] = "標準 - 錨點",
  ["Standard"] = "標準",
  ["Simon Chime"] = "Simon Chime",
  ["Shing!"] = "Shing!",
  ["Stat Cap Level Difference"] = "統計等級差異",
  ["Show step descriptions in the Sticky Frame"] = "顯示步驟說明在黏貼框架。",
  ["Sticky Frame Step Description"] = "黏貼框架步驟說明",
  ["Suggest guides for your player on level up"] = "在玩家升級過程中建議指引。",
  ["Set Tracking Filters..."] = "設定追蹤過濾...",
  ["Set as waypoint"] = "設為目的地",
  ["Smart Gear Set"] = "智慧型套裝",
  ["Show Auto Equip Prompt"] = "顯示智慧型套裝提醒和確認",
  ["Shaman"] = "薩滿",
  ["Specialization"] = "專精",
	["Scroll"] = "滾動",
	["Shift click a quest step to track in the frame"] = "在框架中按住Shift點擊任務步驟來追蹤。",
	["Short Circuit"] = "短路",
	["Show Ant Trail"] = "顯示螞蟻路徑",
	["Show Corpse Arrow"] = "顯示屍體箭頭",
	["Show destination coordinates in the status frame tooltip"] = "在狀態框架提示上顯示終點座標。",
	["Show Dugi Arrow"] = "顯示 Dugi 箭頭",
	["Show Dugis waypoint arrow"] = "顯示 Dugi 路線導引箭頭。",
	["Show DG Icon Button"] = "顯示 DG 圖示按鈕",
	["Show Player and Mouse coordinates at the bottom of the map."] = "在地圖下方顯示玩家和滑鼠座標。",
	["Show Quest Objectives"] = "顯示任務物件",
	["Show target button frame"] = "顯示目標按鈕框架",
	["Show Target Button"] = "顯示目標按鈕",
	["Show the corpse arrow to direct you to your body"] = "顯示屍體箭頭引導你找到屍體。",
	["Show the On/Off button which enables or disables the guide"] = "顯示可以啟用或停用任務高手的開關按鈕。",
	["Show the quest level on the large and small frames"] = "顯示任務等級在大和小框架上",
	["Shows a small window to click when an item is needed for a quest"] = "需要任務物品時，在可點擊的小視窗中顯示任務物品。",
	["Shows minimum level required for quests"] = "顯示任務最小等級需求。",
	["Single Quest"] = "單一任務",
	["Skinning"] = "皮膚",	
	["Small Frame Border"] = "小框架邊框",
	["Small Frame Effect"] = "小框架效果",
	["Standard - Anchored"] = "標準 - 錨點",
	["Step Complete Sound"] = "步驟完成音效",
	["Stone"] = "石頭",
	["StonePattern"] = "石頭樣式",
	["Suggest guides for your player on level up"] = "在升等過程中建議你的玩家指引。",
	["Switch between modern and classic arrow icons"] = "切換現代與經典箭頭圖示。",
--Tt
  ["Tooltip"] = "滑鼠提示",
  ["Target Button Size (%.1f)"] = "目標按鈕大小 (%.1f)",
  ["This feature will automatically add 'as you go...' step into sticky frame"] = "這個功能會自動新增 '當你到..' 步驟至相關框架。",
  ["Take"] = "拿取",
  ["Talk to %s and fly to %s"] = "和 %s 說話並飛到 %s",
  ["Talk to %s to get flight master data."] = "跟 %s 說話來取得飛行管理員資料。",
  ["TomTom Addon Emulation"] = "模擬 TomTom 插件",
	["Tailoring"] = "裁縫",
	["Target Button"] = "目標按鈕",
	["Target the NPC needed for the quest step"] = "將任務步驟所需的NPC選為目標。",
	["Tauren Female"] = "女牛頭人",
	["Tauren Male"] = "男牛頭人",
	["Thin"] = "細",
	["Title"] = "標題",
	["Tooltip Anchor"] = "滑鼠提示錨點",
	["Tooltip Coordinates"] = "滑鼠提示座標",
	["Top Left"] = "上左",
	["Top Right"] = "上右",
	["Top"] = "上",
	["Track Achievements"] = "追蹤成就",
	["Track Rare Creatures"] = "追蹤稀有怪",
	["Troll Female"] = "女食人妖",
	["Troll Male"] = "男食人妖",
	["Turn in"] = "指向",
--Uu
  ["Use: Restores [%d/,/.]+ health"] = "使用: 回復 [%d/,/.]+ 生命",
  ["Use the LFG Teleport to %s"] = "使用隊伍搜尋器的傳送功能到 %s",
  ["Use"] = "使用",
  [" using guild bank"] = "使用公會修裝",
  ["Use guild funds when repairing automatically"] = "自動修裝時使用公會銀行支出。",
  ["Use Guild Bank"] = "使用公會修裝",
	["Undead Female"] = "男不死族",
	["Undead Male"] = "女不死族",
	["Unload Modules"] = "卸載模組",
	["Unloading modules will allow the addon to run on low memory setting in Essential Mode  but will require a UI reload to return back to normal. "] = "卸載模組會讓插件執行於低記憶體需求的基本模式，需要重載介面才會回到一般狀態。",
	["Use Carbonite Arrow"] = "使用 Carbonite 箭頭",
	["Use Flightmasters"] = "使用飛行管理員",
	["Use the Carbonite arrow instead of the built in arrow"] = "使用 Carbonite 箭頭而不是內建的箭頭。",
	["Use the same border that is selected for the large frame"] = "使用和大框架相同的邊框。",
	["Use the TomTom arrow instead of the built in arrow"] = "使用 TomTom 箭頭而不是內建箭頭。",
	["Use TomTom Arrow"] = "使用 TomTom 箭頭",
--Vv
	["View undiscovered areas of the world map, type /reload in your chat box after change of settings"] = "檢視世界地圖未探索的區域，更改設定後請輸入 /reload。",
--Ww
  ["Wham!"] = "撞擊聲!",
  ["Waypoint %d"] = "路線導引 %d",
  ["Waypoint (%d+)"] = "路線導引 (%d+)",
  ["Warlock"] = "術士",
  ["Warrior"] = "戰士",
	["Watch Frame Border"] = "觀察框架邊框",
	["Waypoints"] = "路線導引",
	["War Drums"] = "戰爭打鼓",
	["Wider Objective Tracker"] = "較寬的任務目標清單",
	["Window Close"] = "視窗關閉",
	["Window Open"] = "視窗開啟",
	["Wood"] = "木頭",
	["World Map Tracking"] = "世界地圖追蹤功能",
	["Worgen Female"] = "女狼人",
	["Worgen Male"] = "男狼人",
--Yy
  ["Yes"] = "是",
	["Yellow"] = "黃色",

} 

setmetatable(DugisLocals, {__index=function(t,k) rawset(t, k, k); return k; end})

end