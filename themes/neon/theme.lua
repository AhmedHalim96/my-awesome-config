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

-- spacer
local spacer= wibox.widget.textbox('  ')

-- container
local container = require("themes.neon.widgets.container")

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
    require("themes.neon.widgets.taglist")(s)

    -- Create a tasklist widget
    require("themes.neon.widgets.tasklist")(s)
    
    -- Create the wibox
   require("themes.neon.wibar")(s)

end

return theme
