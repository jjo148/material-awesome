local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local client_keys = require("conf.client.keys")
local client_buttons = require("conf.client.buttons")

-- Rules
awful.rules.rules = {
    -- All clients will match this rule.
    {
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            keys = client_keys,
            buttons = client_buttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen
        }
    },
    {
        rule_any = {name = {"QuakeTerminal"}},
        properties = {skip_decoration = true}
    },
    -- Titlebars
    {
        rule_any = {type = {"dialog"}, class = {"Wicd-client.py", "calendar.google.com"}},
        properties = {
            placement = awful.placement.centered,
            ontop = true,
            floating = true,
            --drawBackdrop = true,
            shape = function()
                return function(cr, w, h)
                    gears.shape.rounded_rect(cr, w, h, 8)
                end
            end,
            skip_decoration = false
        }
    },
    -- Floating clients.
    {
        rule_any = {
            instance = {
                "DTA", -- Firefox addon DownThemAll.
                "copyq" -- Includes session name in class.
            },
            class = {
                "Arandr",
                "Gpick",
                "Kruler",
                "MessageWin", -- kalarm.
                "MPlayer",
                "Sxiv",
                "Wpa_gui",
                "pinentry",
                "veromix",
                "xtightvncviewer",
                "Genymotion Player",
                "player",
                "xev"
            },
            name = {
                "Event Tester", -- xev.,
                "Genymotion Player",
                "Bluetooth",
                "xev"
            },
            role = {
                "AlarmWindow", -- Thunderbird's calendar.
                "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true,
            ontop = true
        }
    },
    -- custom
    {
        rule_any = {
            name = {
                "Genymotion Player"
            },
            class = {
                "player"
            }
        },
        properties = {
            floating = true,
            titlebars_enabled = true
        }
    }
}
