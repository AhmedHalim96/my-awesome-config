--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                            = {}
theme.confdir                                          = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                                        = theme.confdir .. "/wall.png"
theme.font                                             = "Noto Sans 10"
theme.menu_bg_normal                                   = "#000000"
theme.menu_bg_focus                                    = "#000000"
theme.bg_normal                                        = "#000000"
theme.bg_focus                                         = "#434345"
theme.bg_urgent                                        = "#A72323"
theme.fg_normal                                        = "#aaaaaa"
theme.fg_focus                                         = "#CC9D00"
theme.fg_urgent                                        = "#A72323"
theme.fg_minimize                                      = "#ffffff"
theme.border_width                                     = dpi(2)
theme.border_normal                                    = "#b0bec5"
theme.border_focus                                     = "#CC9D00"
theme.border_marked                                    = "#3ca4d8"
theme.menu_border_width                                = dpi(2)
theme.menu_width                                       = dpi(130)
theme.menu_submenu_icon                                = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                                   = "#aaaaaa"
theme.menu_fg_focus                                    = "#CC9D00"
theme.menu_bg_normal                                   = "#050505dd"
theme.menu_bg_focus                                    = "#050505dd"
theme.widget_temp                                      = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                                    = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                       = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                                   = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                        = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                       = theme.confdir .. "/icons/mem.png"
theme.widget_note                                      = theme.confdir .. "/icons/note.png"
theme.widget_note_on                                   = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                                   = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                                     = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                                      = theme.confdir .. "/icons/mail.png"
theme.widget_batt                                      = theme.confdir .. "/icons/bat.png"
theme.widget_clock                                     = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                       = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                              = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                            = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                         = true
theme.tasklist_disable_icon                            = false
theme.useless_gap                                      = dpi(5)
theme.layout_tile                                      = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                                  = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                                  = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                                = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                                   = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                                     = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                                     = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                                    = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                                   = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                       = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                                = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                                 = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                                  = theme.confdir .. "/icons/floating.png"
theme.titlebar_bg_normal                               = "#212121"
theme.titlebar_bg                                      = "#212121"
theme.titlebar_close_button_normal                     = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus                      = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal_hover               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal                  = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus                   = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_normal_hover            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive            = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive             = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active              = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active               = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive           = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive            = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active             = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active              = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive         = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive          = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active           = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active            = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive        = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive         = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive_hover  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active          = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active           = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active_hover    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"


local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = "Terminus 10",
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

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


-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})


-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})



-- Edit config widget
local config_widget = wibox.widget {
    {
        image = '/usr/share/icons/Papirus-Dark/symbolic/actions/tool-pencil-symbolic.svg',
        resize = false,
        widget = wibox.widget.imagebox,
    },
    top = 5,
    widget = wibox.container.margin
}

config_widget:buttons(awful.util.table.join(
    awful.button({"","Control"}, 1, function(  )
        awful.spawn("awesome-config")
    end)
        ))

local left_pipe_separator = wibox.widget.textbox( '| ')
left_pipe_separator.font="Terminus 24"

local right_pipe_separator = wibox.widget.textbox( ' |')
right_pipe_separator.font="Terminus 24"

local left_separator = wibox.widget.textbox( '[')
left_separator.font="Terminus 16"

local right_separator = wibox.widget.textbox( ']')
right_separator.font="Terminus 16"

local middle_separator = wibox.widget.textbox('] [')
middle_separator.font="Terminus 16"

local spacer= wibox.widget.textbox('  ')


local systray =  wibox.widget.systray()
-- systray.set_base_size(24)

local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")


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
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
                           
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,
        style   = {
            shape = gears.shape.circle
        },
        layout   = {

            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {          
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
            
        },
    

    }


    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons= awful.util.tasklist_buttons,
       
        layout   = {
            spacing = 5,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    {
                        widget= left_pipe_separator
                    },
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        widget= right_pipe_separator
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
              
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(26), bg = theme.bg_normal, fg = theme.fg_normal , opacity = 0.75})

    -- Add widgets to the wibox 
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
            spacer
        },
        s.mytasklist, -- Middle widget
        -- nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,

            left_separator,

            config_widget,

            middle_separator,

            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,

            middle_separator,

            memicon,
            memory.widget,

            middle_separator,

            cpuicon,
            cpu.widget,

            middle_separator,
            
            tempicon,
            temp.widget,

            -- weathericon,
            -- theme.weather.widget,

            middle_separator,

            brightness_widget(),

            right_separator,
            spacer,

            systray,
           
            spacer,
            
        
            clockicon,
            mytextclock,

            awful.widget.keyboardlayout:new (),
            s.mylayoutbox,
        },
    }

end

return theme
