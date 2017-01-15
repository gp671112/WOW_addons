OILVL_L = GetLocale() == "zhCN" and {
	-- translated by olzenkhaw
	["Set the amount of numbers past the decimal place to show"] = "设置小数点后显示几位数字",
	["Show minimap button"]="显示小地图按钮",
	["Vanquisher"]="胜利者",
	["Protector"]="保卫者",
	["Conqueror"]="征服者",
	["Scale"] = "比例",
	["Enable Sending Enchantment Reminder"] = "开启发送附魔提醒",
	["Average"] = "平均",
	["Enable Showing item level / raid progression on tooltips"]="开启屏幕右下角的信息提示等级 / 团队进度",
	["Enable Showing Raid Progression Details on tooltips"] = "开启屏幕右下角的信息提示具体团队进度",
	["Raid Progression Details"] = "具体团队进度",
	["Enable Showing Gear Item Level on Character Frame"] = "开启在角色框体显示装备等级",
	["Item Level"]="等级",
	["Average Item Level"]="平均等级",
	["Export"] = "导出",
	["Not enchanted"] = "无附魔",
	["Not socketed"] = "无宝石",
	["Low level enchanted"] = "低等级附魔",
	["Low level socketed"] = "低等级宝石",
	["Auto Scan"] = "自动扫描",

} or GetLocale() == "zhTW" and {
	-- translated by olzenkhaw & BNS
	["Set the amount of numbers past the decimal place to show"] = "設置小數點後顯示幾位數字",
	["Show minimap button"]="顯示小地圖按鈕",
	["Vanquisher"]="鎮壓者",
	["Protector"]="保衛者",
	["Conqueror"]="征服者",
	["Scale"] = "比例",
	["Enable Sending Enchantment Reminder"] = "發送附魔提醒",
	["Average"] = "平均",
	["Enable Showing item level / raid progression on tooltips"]="在提示上顯示 物品等級/團隊進度",
	["Enable Showing Raid Progression Details on tooltips"] = "在提示上顯示團隊進度細節",
	["Raid Progression Details"] = "團隊進度細節",
	["Enable Showing Gear Item Level on Character Frame"] = "在角色視窗顯示裝備等級",
	["Item Level"]="等級",
	["Average Item Level"]="平均等级",
	["Export"] = "導出",
	["Not enchanted"] = "無附魔",
	["Not socketed"] = "無寶石",
	["Low level enchanted"] = "低等級附魔",
	["Low level socketed"] = "低等級寶石",
	["Auto Scan"] = "自動掃描",

	} or { }

setmetatable(OILVL_L, {__index = function(self, key) rawset(self, key, key); return key; end})