local me,ns=...
local lang=GetLocale()
local l=LibStub("AceLocale-3.0")
local L=l:NewLocale(me,"enUS",true,true)
L["Always counter increased resource cost"] = true
L["Always counter increased time"] = true
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = true
L["Always counter no bonus loot threat"] = true
L["Artifact shown value is the base value without considering knowledge multiplier"] = true
L["Attempts to use less champions for missions, in order to fill more missions"] = true
L["Better parties available in next future"] = true
L["Building Final report"] = true
L["Capped %1$s. Spend at least %2$d of them"] = true
L["Changes the sort order of missions in Mission panel"] = true
L["Combat ally is proposed for missions so you can consider unassigning him"] = true
L["Complete all missions without confirmation"] = true
L["Configuration for mission party builder"] = true
L["Cost reduced"] = true
L["Dont kill Troops"] = true
L["Don't use troops"] = true
L["Duration reduced"] = true
L["Duration Time"] = true
L["Expiration Time"] = true
L["Favours leveling follower for xp missions"] = true
L["Followers status "] = true
L["General"] = true
L["Global approx. xp reward"] = true
L["Global approx. xp reward per hour"] = true
L["HallComander Quick Mission Completion"] = true
L["If not checked, inactive followers are used as last chance"] = true
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = true
L["Ignore busy followers"] = true
L["Ignore inactive followers"] = true
L["Keep cost low"] = true
L["Keep extra bonus"] = true
L["Keep time short"] = true
L["Keep time VERY short"] = true
L["Level"] = true
L["Make Order Hall Mission Panel movable"] = true
L["Max champions"] = true
L["Maximize filled missions"] = true
L["Maximize xp gain"] = true
L["Mission duration reduced"] = true
L["Missions"] = true
L["No follower gained xp"] = true
L["Not enough troops, raise maximum champions' number"] = true
L["Nothing to report"] = true
L["Notifies you when you have troops ready to be collected"] = true
L["Only accept missions with time improved"] = true
L["Only use champions even if troops are available"] = true
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = true
L["Original method"] = true
L["Position is not saved on logout"] = true
L["Resurrect troops effect"] = true
L["Reward type"] = true
L["Show/hide OrderHallCommander mission menu"] = true
L["Sort missions by:"] = true
L["Success Chance"] = true
L["Troop ready alert"] = true
L["Unable to fill missions. Check your switches"] = true
L["Upgrading to |cff00ff00%d|r"] = true
L["URL Copy"] = true
L["Use at most this many champions"] = true
L["Use combat ally"] = true
L["When no free followers are available shows empty follower"] = true
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = true
L["You have no troops"] = true

L=l:NewLocale(me,"zhCN")
if (L) then
L["Always counter increased resource cost"] = "总是反制增加资源花费"
L["Always counter increased time"] = "总是反制增加任务时间"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "总是反制杀死部队(如果我们用只剩一次耐久的部队则忽略)"
L["Always counter no bonus loot threat"] = "总是反制没有额外奖励的威胁"
--Translation missing 
L["Artifact shown value is the base value without considering knowledge multiplier"] = "Artifact shown value is the base value without considering knowledge multiplier"
--Translation missing 
L["Attempts to use less champions for missions, in order to fill more missions"] = "Attempts to use less champions for missions, in order to fill more missions"
L["Better parties available in next future"] = "在将来有更好的队伍"
L["Building Final report"] = "构建最终报告"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封顶了。花费至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改变任务面板上的任务排列顺序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "战斗盟友被建议到任务，所以你可以考虑取消指派他"
L["Complete all missions without confirmation"] = "完成所有任务不须确认"
L["Configuration for mission party builder"] = "任务队伍构建设置"
--Translation missing 
L["Cost reduced"] = "Cost reduced"
L["Dont kill Troops"] = "别让部队被杀死"
--Translation missing 
L["Don't use troops"] = "Don't use troops"
L["Duration reduced"] = "持续时间已缩短"
L["Duration Time"] = "持续时间"
L["Expiration Time"] = "到期时间"
L["Favours leveling follower for xp missions"] = "倾向于使用升级中追隨者在经验值任务"
--Translation missing 
L["Followers status "] = "Followers status "
L["General"] = "一般"
L["Global approx. xp reward"] = "整体大约经验值奖励"
--Translation missing 
L["Global approx. xp reward per hour"] = "Global approx. xp reward per hour"
L["HallComander Quick Mission Completion"] = "大厅指挥官快速任务完成"
--Translation missing 
L["If not checked, inactive followers are used as last chance"] = "If not checked, inactive followers are used as last chance"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[如果你继续，你会失去它们
点击%s來取消]=]
--Translation missing 
L["Ignore busy followers"] = "Ignore busy followers"
--Translation missing 
L["Ignore inactive followers"] = "Ignore inactive followers"
L["Keep cost low"] = "节省大厅资源"
L["Keep extra bonus"] = "优先额外奖励"
L["Keep time short"] = "减少任务时间"
L["Keep time VERY short"] = "最短任务时间"
L["Level"] = "等级"
L["Make Order Hall Mission Panel movable"] = "让大厅任务面板可移动"
--Translation missing 
L["Max champions"] = "Max champions"
--Translation missing 
L["Maximize filled missions"] = "Maximize filled missions"
L["Maximize xp gain"] = "最大化经验获取"
--Translation missing 
L["Mission duration reduced"] = "Mission duration reduced"
L["Missions"] = "任务"
L["No follower gained xp"] = "没有追随者获得经验"
--Translation missing 
L["Not enough troops, raise maximum champions' number"] = "Not enough troops, raise maximum champions' number"
L["Nothing to report"] = "没什么可报告"
L["Notifies you when you have troops ready to be collected"] = "当部队已准备好获取时提醒你"
L["Only accept missions with time improved"] = "只允许有时间改善的任务"
--Translation missing 
L["Only use champions even if troops are available"] = "Only use champions even if troops are available"
--Translation missing 
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=]
L["Original method"] = "原始方法"
L["Position is not saved on logout"] = "位置不会在登出后储存"
L["Resurrect troops effect"] = "复活部队效果"
L["Reward type"] = "奖励类型"
L["Show/hide OrderHallCommander mission menu"] = "显示/隐藏大厅指挥官任务选单"
L["Sort missions by:"] = "排列任务根据："
L["Success Chance"] = "成功机率"
L["Troop ready alert"] = "部队装备提醒"
--Translation missing 
L["Unable to fill missions. Check your switches"] = "Unable to fill missions. Check your switches"
L["Upgrading to |cff00ff00%d|r"] = "升级到|cff00ff00%d|r"
--Translation missing 
L["URL Copy"] = "URL Copy"
--Translation missing 
L["Use at most this many champions"] = "Use at most this many champions"
L["Use combat ally"] = "使用战斗盟友"
--Translation missing 
L["When no free followers are available shows empty follower"] = "When no free followers are available shows empty follower"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪费了|cffff0000%d|cffffd200 点数!!!"
--Translation missing 
L["You have no troops"] = "You have no troops"

return
end

L=l:NewLocale(me,"zhTW")
if (L) then
L["Always counter increased resource cost"] = "總是反制增加資源花費"
L["Always counter increased time"] = "總是反制增加任務時間"
L["Always counter kill troops (ignored if we can only use troops with just 1 durability left)"] = "總是反制殺死部隊(如果我們用只剩一次耐久的部隊則忽略)"
L["Always counter no bonus loot threat"] = "總是反制沒有額外獎勵的威脅"
L["Artifact shown value is the base value without considering knowledge multiplier"] = "神兵顯示的值是基礎值，沒有經過神兵知識的加成。"
L["Attempts to use less champions for missions, in order to fill more missions"] = "嘗試使用較少的勇士來出任務，以便能夠派出更多任務。"
L["Better parties available in next future"] = "在將來有更好的隊伍"
L["Building Final report"] = "建立報告"
L["Capped %1$s. Spend at least %2$d of them"] = "%1$s封頂了。花費至少%2$d在它身上"
L["Changes the sort order of missions in Mission panel"] = "改變任務面板上的任務排列順序"
L["Combat ally is proposed for missions so you can consider unassigning him"] = "戰鬥盟友被建議到任務，所以你可以考慮取消指派他"
L["Complete all missions without confirmation"] = "完成所有任務不須確認"
L["Configuration for mission party builder"] = "任務隊伍構建設置"
L["Cost reduced"] = "花費已降低"
L["Dont kill Troops"] = "別讓部隊被殺死"
L["Don't use troops"] = "不要使用部隊"
L["Duration reduced"] = "持續時間已縮短"
L["Duration Time"] = "持續時間"
L["Expiration Time"] = "到期時間"
L["Favours leveling follower for xp missions"] = "傾向於使用升級中追隨者在經驗值任務"
L["Followers status "] = "追隨者狀態"
L["General"] = "(G) 一般"
L["Global approx. xp reward"] = "整體大約經驗值獎勵"
L["Global approx. xp reward per hour"] = "每小時獲得整體經驗值獎勵"
L["HallComander Quick Mission Completion"] = "快速任務完成"
L["If not checked, inactive followers are used as last chance"] = "不勾選時，閒置的追隨者會成為最後的考量。"
L[ [=[If you %s, you will lose them
Click on %s to abort]=] ] = [=[如果您繼續，您會失去它們
點擊%s來取消]=]
L["Ignore busy followers"] = "忽略任務中的追隨者"
L["Ignore inactive followers"] = "忽略閒置的追隨者"
L["Keep cost low"] = "保持低花費"
L["Keep extra bonus"] = "保持額外獎勵"
L["Keep time short"] = "保持短時間"
L["Keep time VERY short"] = "保持非常短的時間"
L["Level"] = "等級"
L["Make Order Hall Mission Panel movable"] = "讓大廳任務面板可移動"
L["Max champions"] = "最多勇士"
L["Maximize filled missions"] = "盡可能分派較多的任務"
L["Maximize xp gain"] = "最大化經驗獲取"
L["Mission duration reduced"] = "任務時間已縮短"
L["Missions"] = "(M) 任務"
L["No follower gained xp"] = "沒有追隨者獲得經驗"
L["Not enough troops, raise maximum champions' number"] = "部隊不足，增加勇士的數量上限。"
L["Nothing to report"] = "沒有內容可報告"
L["Notifies you when you have troops ready to be collected"] = "當部隊已準備好獲取時提醒你"
L["Only accept missions with time improved"] = "只允許有時間改善的任務"
L["Only use champions even if troops are available"] = "有可用的部隊時，仍然只要使用勇士。"
L[ [=[OrderHallCommander overrides GarrisonCommander for Order Hall Management.
 You can revert to GarrisonCommander simply disabling OrderhallCommander.
If instead you like OrderHallCommander remember to add it to Curse client and keep it updated]=] ] = [=[職業大廳指揮官已經取代要塞指揮官來管理職業大廳。
要返回使用要塞指揮官，只要停用職業大廳指揮官插件就可以了。]=]
L["Original method"] = "原始方法"
L["Position is not saved on logout"] = "位置不會在登出後儲存"
L["Resurrect troops effect"] = "復活部隊效果"
L["Reward type"] = "獎勵類型"
L["Show/hide OrderHallCommander mission menu"] = "顯示/隱藏大廳指揮官任務選單"
L["Sort missions by:"] = "排列任務根據："
L["Success Chance"] = "成功機率"
L["Troop ready alert"] = "部隊整備提醒"
L["Unable to fill missions. Check your switches"] = "無法分派任務，請檢查你的設定選項。"
L["Upgrading to |cff00ff00%d|r"] = "升級到|cff00ff00%d|r"
L["URL Copy"] = "複製網址"
L["Use at most this many champions"] = "至少使用這個數量的勇士"
L["Use combat ally"] = "使用戰鬥盟友"
L["When no free followers are available shows empty follower"] = "沒有可用的追隨者時，顯示空欄位。"
L["You are wasting |cffff0000%d|cffffd200 point(s)!!!"] = "你浪費了|cffff0000%d|cffffd200 點數!!!"
L["You have no troops"] = "你沒有部隊"
L["Empty missions sorted as last"] = "空的任務排在最後"
L["Empty or 0% success mission are sorted as last. Does not apply to \"original\" method"] = "空的或成功率 0% 的任務排列在最後面。不要套用到 \"原始方法\"。"
L["Missions' results"] = "任務結果"

return
end
