﻿local VV= CreateFrame("Frame")
VV:RegisterEvent("PLAYER_ENTERING_WORLD")
VV:SetScript("OnEvent", function()
if not DBM_AllSavedOptions["Default"] then DBM_AllSavedOptions["Default"] = {} end
DBM_AllSavedOptions["Default"]["ChosenVoicePack"] = "VV"
end) 