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
        icon_scale = 1.0,
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
    name = myname:gsub("HandyNotes_", ""),
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        ns.HL:SendMessage("HandyNotes_NotifyUpdate", myname:gsub("HandyNotes_", ""))
    end,
    args = {
        icon = {
            type = "group",
            name = "圖示設置",
            inline = true,
            args = {
                desc = {
                    name = "這些設置控制圖示的外觀。",
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = "圖示縮放",
                    desc = "The scale of the icons",
                    min = 0.25, max = 2, step = 0.01,
                    order = 20,
                },
                icon_alpha = {
                    type = "range",
                    name = "圖示透明度",
                    desc = "The alpha transparency of the icons",
                    min = 0, max = 1, step = 0.01,
                    order = 30,
                },
                show_on_world = {
                    type = "toggle",
                    name = "世界地圖",
                    desc = "在世界地圖顯示圖示",
                    order = 40,
                },
                show_on_minimap = {
                    type = "toggle",
                    name = "小地圖",
                    desc = "在小地圖顯示圖示",
                    order = 50,
                },
            },
        },
        display = {
            type = "group",
            name = "顯示什麼",
            inline = true,
            args = {
                icon_item = {
                    type = "toggle",
                    name = "使用物品圖示",
                    desc = "顯示物品的圖示（如果已知）; 否則將使用成就圖示",
                    order = 0,
                },
                tooltip_item = {
                    type = "toggle",
                    name = "使用物品提示",
                    desc = "顯示物品的完整提示",
                    order = 10,
                },
                found = {
                    type = "toggle",
                    name = "顯示已發現",
                    desc = "顯示已經發現的物品路徑點？",
                    order = 20,
                },
                show_npcs = {
                    type = "toggle",
                    name = "顯示稀有NPC",
                    desc = "顯示要殺的稀有NPC，通常用於物品或成就",
                    order = 30,
                },
                show_treasure = {
                    type = "toggle",
                    name = "顯示財寶",
                    desc = "Show treasure that can be looted",
                    order = 30,
                },
                show_junk = {
                    type = "toggle",
                    name = "垃圾",
                    desc = "顯示不包含在任何成就的物品",
                    order = 40,
                },
                -- repeatable = {
                --     type = "toggle",
                --     name = "顯示可重複的",
                --     desc = "顯示可重複的物品？ 這通常意味著附加了每日追踪任務的那些",
                --     order = 40,
                -- },
                tooltip_questid = {
                    type = "toggle",
                    name = "顯示任務ID",
                    desc = "Show the internal id of the quest associated with this node. Handy if you want to report a problem with it.",
                    order = 40,
                },
                unhide = {
                    type = "execute",
                    name = "重設隱藏的節點",
                    desc = "顯示您手動透由通過右鍵單擊並選擇“隱藏”隱藏的所有節點。",
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
