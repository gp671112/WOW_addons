if GetLocale() ~= "zhTW" then return end
local L

---------------
-- Odyn --
---------------
L= DBM:GetModLocalization(1819)

---------------------------
-- Guarm --
---------------------------
L= DBM:GetModLocalization(1830)

L:SetOptionLocalization({
	YellActualRaidIcon		= "更改所有DBM泡沫大喊為喊玩家的圖標設置而非匹配的顏色 (需要團長權限)",
	FilterSameColor			= "如果跟玩家現有的顏色匹配則不要設置圖標、大喊或給予泡沫的特別警告"
})

---------------------------
-- Helya --
---------------------------
L= DBM:GetModLocalization(1829)

L:SetTimerLocalization({
	OrbsTimerText		= "下一個球(%d-%s)"
})

L:SetMiscLocalization({
	phaseThree =	"凡人，你們根本白費工夫！歐丁永遠別想自由！",
	near =			"近",
	far =			"遠",
	multiple =		"多"
})

-------------
--  Trash  --
-------------
L = DBM:GetModLocalization("TrialofValorTrash")

L:SetGeneralLocalization({
	name =	"勇氣試煉小怪"
})
