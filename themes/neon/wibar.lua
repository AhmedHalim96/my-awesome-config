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
local mytextclock = require("themes.neon.widgets.clock")({font=beautiful.font})

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
local temp = require("themes.neon.widgets.temp")({color=colors.neon.orange, font=beautiful.font, icon=beautiful.widget_temp})

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
local net = require("themes.neon.widgets.net")({
    netdownicon=beautiful.widget_netdown, 
    netupicon=beautiful.widget_netup, 
    netdowncolor=colors.neon.blue, 
    netupcolor=colors.neon.fuchsia
})

-- MEM
local memory = require("themes.neon.widgets.memory")({
    color=colors.neon.yellow, 
    font=beautiful.font, 
    icon=beautiful.widget_mem
})

local spacer= wibox.widget.textbox('  ')

-- container
local container = require("themes.neon.widgets.container")

-- Edit config widget
local config_widget = require("themes.neon.widgets.edit_config")({
    color=colors.neon.green, 
    font=beautiful.font, 
    icon=beautiful.widget_config
})

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
    position = "top", 
    screen = s, 
    height = dpi(34), 
    bg = beautiful.bg, 
    fg = beautiful.fg_normal , 
    opacity = 0.9,
    shape = gears.shape.rectangle,
  })

  -- Add widgets to the wibox 
  s.wibar:setup {
    
    {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
    
            container(s.mytaglist, {hover=false}),

            spacer,
            
            s.mypromptbox,
            spacer
        },
    
            s.tasklist, -- Middle widget


        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            spacer,
            spacer,
            config_widget,

            spacer,

            container({
                layout = wibox.layout.fixed.horizontal,
                net.down.icon,
                net.down.widget,
                net.up.icon,
                net.up.widget,
            }),

            spacer,

            container({
                layout = wibox.layout.fixed.horizontal,
                memory.icon,
                memory.widget,
            }),
            
            spacer,

            container({
                layout = wibox.layout.fixed.horizontal,
                temp.icon,
                temp.widget,
            }),

            spacer,

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
            
            spacer,
            

            container({
                layout = wibox.layout.fixed.horizontal,
                volume_icon,
                volumecfg.widget,
            }),

            spacer,

            container({
                brightness_widget{
                    type = 'icon_and_text',
                    font = beautiful.font,
                },
                valign = 'center',
                margins = 2,
                widget = wibox.container.place,
            }),

            spacer,

        container({
            battery_widget({
                show_current_level = true
            }),
            valign = 'center',
            margins = 2,
            widget = wibox.container.place,
        }),

            spacer,

            s.systray,
    
            container(mytextclock),
            
            spacer,

            container(awful.widget.keyboardlayout:new ()),

            spacer,


            s.mylayoutbox,
            spacer

        },
    },
    top     = dpi(4),
    bottom  = dpi(4),
    widget  = wibox.container.margin
   
  }
  
end

return wibar