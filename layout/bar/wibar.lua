local awful = require("awful")
local beautiful = require("beautiful")
local colors = require("themes.neon.config.colors")
local dpi   = require("beautiful.xresources").apply_dpi
local gears = require("gears")
local lain  = require("lain")
local markup = lain.util.markup
local wibox = require("wibox")

-- ###########################################################
-- # intiating Widgets
-- ###########################################################

-- Clock
local mytextclock = require("widgets.clock")({font=beautiful.font})

-- Calendar
beautiful.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "monospace 10",
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})

-- Temp
local temp_widget = require("widgets.temp")

-- Weather
local weathericon = wibox.widget.imagebox(beautiful.widget_weather)

beautiful.weather = lain.widget.weather({
    city_id = 360630, -- placeholder (Cairo)
    notification_preset = { font = "Terminus 10", fg = beautiful.fg_normal },
    weather_na_markup = markup.fontfg(beautiful.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(beautiful.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
    end
})


-- Net
local net = require("widgets.net")

-- MEM
local memory = require("widgets.memory")({
    color=colors.neon.yellow, 
    font=beautiful.font, 
    icon=beautiful.widget_mem
})

local seperator= require("widgets.seperator")
-- container
local container = require("widgets.container")

-- Edit config widget
-- local config_widget = require("widgets.edit_config")({
--     color=colors.neon.green, 
--     font=beautiful.font, 
--     icon=beautiful.widget_config
-- })

-- Brightness Widget
brightness_widget = require("widgets.brightness-widget.brightness")

-- Volume Widget
local volume_icon = require("widgets.volume-control.volume-icon")
local volume_control = require("widgets.volume-control")
volumecfg = volume_control({
    device  = "pulse",
    font = beautiful.font,
    colors = {
        on=colors.neon.fuchsia,
        off=colors.danger
    }
})

-- CPU widget
local cpu_widget = require("widgets.cpu-widget.cpu-widget")


-- Battery widget
local battery_widget = require("widgets.battery-widget.battery")

local function wibar(s)
    s.wibar = awful.wibar({ 
        position = beautiful.wibar_position, 
        screen = s, 
        height = beautiful.wibar_height, 
        bg = beautiful.bg, 
        fg = beautiful.fg_normal , 
        opacity = beautiful.wibar_opacity,
        shape = beautiful.wibar_shape,
    })

    -- Add widgets to the wibox 
    s.wibar:setup {
    
    {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
    
            container(s.taglist, {hover=false}),
            
            -- s.mypromptbox,
        },
    
            s.tasklist, -- Middle widget


        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            wibox.widget.textbox("  "),

            -- config_widget,

            -- seperator,

            net({
                netdownicon=beautiful.widget_netdown, 
                netupicon=beautiful.widget_netup, 
                netdowncolor=colors.neon.blue, 
                netupcolor=colors.neon.fuchsia
            }),

            seperator,

            container({
                layout = wibox.layout.fixed.horizontal,
                memory.icon,
                memory.widget,
            }),
            
            seperator,

            temp_widget({
                color=colors.neon.orange,
                font=beautiful.font,
                icon=beautiful.widget_temp
            }),

            seperator,

            -- weathericon,
            -- beautiful.weather.widget,

            container(
                cpu_widget({
                width = 70,
                step_width = 2,
                step_spacing = 0,
                color = colors.neon.blue
                })
            ),
            
            seperator,
            

            container({
                layout = wibox.layout.fixed.horizontal,
                volume_icon,
                volumecfg.widget,
            }),

            seperator,

            container(
                brightness_widget{
                    type = 'icon_and_text',
                    font = beautiful.font,
                }
            ),

            seperator,

        -- container(
        --     battery_widget({
        --         show_current_level = true
        --     })
        -- ),

        --     seperator,

            s.systray,
    
            container(mytextclock),
            
            seperator,

            container(awful.widget.keyboardlayout:new ()),

            seperator,


            s.mylayoutbox,
            seperator

        },
    },
    top     = dpi(2),
    bottom  = dpi(2),
    widget  = wibox.container.margin
    }
end

return wibar