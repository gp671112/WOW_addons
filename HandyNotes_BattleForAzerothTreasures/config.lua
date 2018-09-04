local myname, ns = ...

ns.defaults = {
    profile = {
        show_on_world = true,
        show_on_minimap = false,
        show_junk = false,
        show_npcs = true,
        show_treasure = true,
        found = false,
        repeatable = true,
        icon_scale = 1.1,
        icon_alpha = 1.0,
        icon_item = false,
        tooltip_item = true,
        tooltip_questid = false,
    },
    char = {
        hidden = {
            ['*'] = {},
        },
    },
}

ns.options = {
    type = "group",
    name = "決戰艾澤拉斯寶藏",
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
    end,
    args = {
        icon = {
            type = "group",
            name = "圖示設定",
            inline = true,
            args = {
                desc = {
                    name = "這些設定控制圖示的外觀及風格。",
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = "圖示大小",
                    desc = "圖示的縮放大小",
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = "圖示透明度",
                    desc = "圖示的透明度",
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = "世界地圖",
                    desc = "在世界地圖上顯示圖示",
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = "小地圖",
                    desc = "在小地圖上顯示圖示",
                    order = 50,
                },
            },
        },
        display = {
            type = "group",
            name = "選擇要顯示什麼",
            inline = true,
            args = {
                icon_item = {
                    type = "toggle",
                    name = "使用物品圖示",
                    desc = "如果可以的話使用物品的圖示，否則使用成就圖示",
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = "使用物品滑鼠提示",
                    desc = "顯示物品的完整滑鼠提示",
                    order = 10,
                },
                found = {
                    type = "toggle",
                    name = "顯示發現的",
                    desc = "顯示路線導引到已經發現的物品",
                    order = 20,
                },
                show_npcs = {
                    type = "toggle",
                    name = "顯示 NPC",
                    desc = "顯示可以擊殺的稀有 NPC，通常會掉落物品或有相關成就",
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = "顯示寶藏",
                    desc = "顯示可以拾取的寶藏",
                    order = 30,
                },
                show_junk = {
                    type = "toggle",
                    name = "垃圾",
                    desc = "顯示沒有任何相關成就的物品",
                    order = 40,
                },
                -- repeatable = {
                --     type = "toggle",
                --     name = "Show repeatable",
                --     desc = "Show items which are repeatable? This generally means ones which have a daily tracking quest attached",
                --     order = 40,
                -- },
                tooltip_questid = {
                    type = "toggle",
                    name = "顯示任務 ID",
                    desc = "顯示相關任務的內部 ID，方便回報錯誤使用。",
                    order = 40,
                },
                unhide = {
                    type = "execute",
                    name = "重置隱藏的點",
                    desc = "顯示所有曾經手動點右鍵隱藏過的點。",
                    func = function()
                        for map,coords in pairs(ns.hidden) do
                            wipe(coords)
                        end
                        ns.HL:Refresh()
                    end,
                    order = 50,
                },
            },
        },
    },
}

local allQuestsComplete = function(quests)
    if type(quests) == 'table' then
        -- if it's a table, only count as complete if all quests are complete
        for _, quest in ipairs(quests) do
            if not IsQuestFlaggedCompleted(quest) then
                return false
            end
        end
        return true
    elseif IsQuestFlaggedCompleted(quests) then
        return true
    end
end

local player_faction = UnitFactionGroup("player")
local player_name = UnitName("player")
ns.should_show_point = function(coord, point, currentZone, isMinimap)
    if isMinimap and not ns.db.show_on_minimap and not point.minimap then
        return false
    elseif not isMinimap and not ns.db.show_on_world then
        return false
    end
    if point.level and point.level ~= currentLevel then
        return false
    end
    if ns.hidden[currentZone] and ns.hidden[currentZone][coord] then
        return false
    end
    if ns.outdoors_only and IsIndoors() then
        return false
    end
    if point.junk and not ns.db.show_junk then
        return false
    end
    if point.faction and point.faction ~= player_faction then
        return false
    end
    if (not ns.db.found) then
        if point.quest then
            if allQuestsComplete(point.quest) then
                return false
            end
        elseif point.achievement then
            local completedByMe = select(13, GetAchievementInfo(point.achievement))
            if completedByMe then
                return false
            end
            if point.criteria then
                local _, _, completed, _, _, completedBy = GetAchievementCriteriaInfoByID(point.achievement, point.criteria)
                if completed and completedBy == player_name then
                    return false
                end
            end
        end
        if point.follower and C_Garrison.IsFollowerCollected(point.follower) then
            return false
        end
        if point.toy and point.item and PlayerHasToy(point.item) then
            return false
        end
    end
    -- if (not ns.db.repeatable) and point.repeatable then
    --     return false
    -- end
    if not point.follower then
        if point.npc then
            if not ns.db.show_npcs then
                return false
            end
        else
            -- Not an NPC, not a follower, must be treasure
            if not ns.db.show_treasure then
                return false
            end
        end
    end
    if point.hide_before and not ns.db.upcoming and not allQuestsComplete(point.hide_before) then
        return false
    end
    return true
end
