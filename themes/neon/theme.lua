local temp = require "themes.neon.widgets.temp"
-- ###########################################################
-- #                                                         #
-- #                      MY THEME                           #
-- #                                                         #
-- ###########################################################


-- ###########################################################
-- #Imports                          
-- ###########################################################

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local colors = require("themes.neon.config.colors")
local markup = lain.util.markup



-- ###########################################################
-- #Theme Variables
-- ###########################################################

local theme                                                    = {}
theme.confdir                                                  = os.getenv("HOME") .. "/.config/awesome/themes/neon"
theme.wallpaper                                                = function () awful.spawn("randbg") end
theme.font                                                     = "Noto Sans 10"
theme.bg_normal                                                = colors.bg
theme.bg_focus                                                 = colors.bg_light
theme.bg_urgent                                                = colors.danger
theme.fg_normal                                                = "#9E9E9E"
theme.fg_focus                                                 = colors.secondary
theme.fg_urgent                                                = colors.danger
theme.fg_minimize                                              = "#757575"

theme.border_width                                             = dpi(2)
theme.border_normal                                            = "#9E9E9E"
theme.border_focus                                             = colors.secondary
theme.border_marked                                            = "#3ca4d8"

theme.menu_bg_focus                                            = colors.bg
theme.menu_border_width                                        = dpi(2)
theme.menu_border_color                                        = colors.secondary
theme.menu_width                                               = dpi(200)
theme.menu_submenu_icon                                        = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                                           = colors.white
theme.menu_fg_focus                                            = colors.white
theme.menu_bg_normal                                           = colors.bg
theme.menu_bg_focus                                            = colors.primary
theme.menu_height                                              = dpi(25)

theme.notification_max_width                                   = dpi(360)

theme.widget_temp                                              = theme.confdir .. "/icons/temp.svg"
theme.widget_uptime                                            = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                               = theme.confdir .. "/icons/cpu.svg"
theme.widget_config                                            = theme.confdir .. "/icons/gear.svg"
theme.widget_weather                                           = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                                = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                               = theme.confdir .. "/icons/mem.svg"
theme.widget_note                                              = theme.confdir .. "/icons/note.png"
theme.widget_note_on                                           = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                                           = theme.confdir .. "/icons/down.svg"
theme.widget_netup                                             = theme.confdir .. "/icons/up.svg"
theme.widget_mail                                              = theme.confdir .. "/icons/mail.png"
theme.widget_batt                                              = theme.confdir .. "/icons/bat.png"
theme.widget_clock                                             = theme.confdir .. "/icons/clock.svg"
theme.widget_vol                                               = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                                      = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                                    = theme.confdir .. "/icons/square_b.png"

theme.tasklist_plain_task_name                                 = true
theme.tasklist_disable_icon                                    = false

theme.useless_gap                                              = dpi(5)
theme.icon_theme                                               = "Papirus-Dark"

theme.snap_border_width                                        = dpi(2)
theme.snapper_gap                                              = dpi(5)
theme.snap_bg                                                  = colors.secondary
theme.snap_shape                                               = gears.shape.rectangle

theme.layout_tile                                              = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                                          = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                                          = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                                        = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                                           = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                                             = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                                             = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                                            = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                                           = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                               = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                                        = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                                         = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                                          = theme.confdir .. "/icons/floating.png"


theme.titlebar_bg_normal                                       = colors.titlebar_bg
theme.titlebar_bg                                              = colors.titlebar_bg

theme.titlebar_close_button_normal                             = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus                              = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_focus_hover                       = theme.confdir .. "/icons/titlebar/close_hover.png"
theme.titlebar_close_button_normal_hover                       = theme.confdir .. "/icons/titlebar/close_hover.png"

theme.titlebar_minimize_button_normal                          = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus                           = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_focus_hover                     = theme.confdir .. "/icons/titlebar/minimize_hover.png"
theme.titlebar_minimize_button_normal_hover                    = theme.confdir .. "/icons/titlebar/minimize_hover.png"

theme.titlebar_ontop_button_normal_inactive                    = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive                     = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active                      = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active                       = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive                   = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive                    = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active                     = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active                      = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive                 = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive                  = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active                   = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active                    = theme.confdir .. "/icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive                = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive                 = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_focus_inactive_hover           = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_normal_inactive_hover          = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_normal_active                  = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_active                   = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active_hover            = theme.confdir .. "/icons/titlebar/maximized_hover.png"
theme.titlebar_maximized_button_focus_active_hover             = theme.confdir .. "/icons/titlebar/maximized_hover.png"

theme.widget_border_width                                      = dpi(1)
theme.widget_border_color                                      = colors.bg_lighter

-- ###########################################################
-- #Widgets
-- ###########################################################

-- Clock
local mytextclock = require("themes.neon.widgets.clock")({font=theme.font})

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "monospace 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Temp
local temp = require("themes.neon.widgets.temp")({color=colors.neon.orange, font=theme.font, icon=theme.widget_temp})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)

theme.weather = lain.widget.weather({
    city_id = 360630, -- placeholder (Cairo)
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
    end
})


-- Net
local net = require("themes.neon.widgets.net")({
    netdownicon=theme.widget_netdown, 
    netupicon=theme.widget_netup, 
    netdowncolor=colors.neon.blue, 
    netupcolor=colors.neon.fuchsia
})

-- MEM
local memory = require("themes.neon.widgets.memory")({
    color=colors.neon.yellow, 
    font=theme.font, 
    icon=theme.widget_mem
})

local spacer= wibox.widget.textbox('  ')

-- container
local container = require("themes.neon.widgets.container")

-- Edit config widget
local config_widget = require("themes.neon.widgets.edit_config")({
    color=colors.neon.green, 
    font=theme.font, 
    icon=theme.widget_config
})

-- Brightness Widget
brightness_widget = require("widgets.brightness-widget.brightness")

-- Volume Widget
local volume_icon = require("widgets.volume-control.volume-icon")
local volume_control = require("widgets.volume-control")
volumecfg = volume_control({
    device  = "pulse",
    font = theme.font,
    colors = {
        on=colors.neon.fuchsia,
        off=colors.danger
    }
})

-- CPU widget
local cpu_widget = require("widgets.cpu-widget.cpu-widget")


-- Battery widget
local battery_widget = require("widgets.battery-widget.battery")


function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s , awful.layout.suit.tile)

    -- Systray
    s.systray =  wibox.widget.systray()
    -- s.systray.visible = false 
    s.systray.set_base_size(18)

    s.systray = wibox.widget{
        layout=wibox.layout.fixed.horizontal,
        container({
            s.systray,
            valign = 'center',
            margins = 2,
            widget = wibox.container.place,
           }, {hover=false}),
        spacer,
    }

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = require("themes.neon.widgets.layoutbox")
    

    -- Create a taglist widget
    local _taglist = require("themes.neon.widgets.taglist")(s)
    s.mytaglist = _taglist


    -- Create a tasklist widget
    local _tasklist = require("themes.neon.widgets.tasklist")(s)
    s.mytasklist = _tasklist

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s, 
        height = dpi(34), 
        bg = colors.bg, 
        fg = theme.fg_normal , 
        opacity = 0.9,
        shape = gears.shape.rectangle,
    })

    -- Add widgets to the wibox 
    s.mywibox:setup {
        
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
        
                s.mytasklist, -- Middle widget


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
                -- theme.weather.widget,

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
                        font = theme.font,
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

return theme
