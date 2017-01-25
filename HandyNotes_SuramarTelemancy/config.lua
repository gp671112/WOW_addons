local myname, ns = ...

ns.defaults = {
    profile = {
        icon_scale = 1.5,
        icon_alpha = 1.0,
        entrances = true,
		upcoming = false,
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
            name = "圖示設定",
            inline = true,
            args = {
                desc = {
                    name = "這些設定控制圖示的外觀。",
                    type = "description",
                    order = 0,
                },
                icon_scale = {
                    type = "range",
                    name = "圖示縮放",
                    desc = "圖示的縮放",
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
            },
        },
        display = {
            type = "group",
            name = "那些要顯示",
            inline = true,
            args = {
                entrances = {
                    type = "toggle",
                    name = "顯示入口",
                    desc = "顯示傳送點入口的圖標，以及傳送點的位置",
                    order = 0,
                },
				upcoming = {
                    type = "toggle",
                    name = "顯示即將到來的傳送點",
                    desc = "顯示即將到來的傳送點，因為你不在正確的任務階段所以還無法啟用。",
                    order = 10,
                },
            },
        },
    },
}
