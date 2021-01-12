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

local colors = require("themes.multicolor.config.colors")
local markup = lain.util.markup



-- ###########################################################
-- #Theme Variables
-- ###########################################################

local theme                                                    = {}
theme.confdir                                                  = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
theme.wallpaper                                                = theme.confdir .. "/wall.png"
theme.font                                                     = "Noto Sans 10"
theme.menu_bg_normal                                           = colors.bg
theme.menu_bg_focus                                            = colors.bg
    theme.bg_normal                                                = colors.bg
theme.bg_focus                                                 = colors.bg_light
theme.bg_urgent                                                = colors.danger
theme.fg_normal                                                = "#aaaaaa"
theme.fg_focus                                                 = colors.secondary
theme.fg_urgent                                                = colors.danger
theme.fg_minimize                                              = colors.white
theme.border_width                                             = dpi(2)
theme.border_normal                                            = "#b0bec5"
theme.border_focus                                             = colors.secondary
theme.border_marked                                            = "#3ca4d8"
theme.menu_border_width                                        = dpi(2)
theme.menu_border_color                                        = colors.secondary
theme.menu_width                                               = dpi(180)
theme.menu_submenu_icon                                        = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                                           = colors.white
theme.menu_fg_focus                                            = colors.white
theme.menu_bg_normal                                           = colors.bg
theme.menu_bg_focus                                            = colors.primary
theme.menu_height                                              = dpi(20)

theme.notification_max_width                                   = dpi(360)

theme.widget_temp                                              = theme.confdir .. "/icons/temp.svg"
theme.widget_uptime                                            = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                               = theme.confdir .. "/icons/cpu.svg"
theme.widget_config                                            = theme.confdir .. "/icons/pencil.svg"
theme.widget_weather                                           = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                                = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                               = theme.confdir .. "/icons/mem.svg"
theme.widget_note                                              = theme.confdir .. "/icons/note.png"
theme.widget_note_on                                           = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                                           = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                                             = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                                              = theme.confdir .. "/icons/mail.png"
theme.widget_batt                                              = theme.confdir .. "/icons/bat.png"
theme.widget_clock                                             = theme.confdir .. "/icons/clock.svg"
theme.widget_vol                                               = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                                      = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                                    = theme.confdir .. "/icons/square_b.png"

theme.tasklist_plain_task_name                                 = true
theme.tasklist_disable_icon                                    = false
theme.useless_gap                                              = dpi(5)


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



-- ###########################################################
-- #Widgets
-- ###########################################################

-- container
local container = require("widgets.container")
-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon =wibox.widget {
    {
        image = theme.widget_clock,
        widget = wibox.widget.imagebox,
    },
    forced_height=20,
    forced_width=20,
    top=5,
    right=2,
    widget = wibox.container.margin
}

local mytextclock = wibox.widget.textclock(markup(colors.neon.blue, "%a %d %b ") .. (" ") .. markup(colors.neon.fuchsia, " %H:%M "))
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


-- Coretemp
local tempicon =wibox.widget {
    {
        text="🔥 " ,
        font = theme.font,
        widget = wibox.widget.textbox,
    },
    bottom = 2,
    widget = wibox.container.margin
}


local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, colors.neon.orange, coretemp_now .. "°C "))
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
local memText = wibox.widget.textbox(markup(colors.neon.blue, "RAM: "))
local memicon =wibox.widget {
    {
        font = theme.font,
        widget = memText,
    },
    widget = wibox.container.margin
}

local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, colors.neon.fuchsia, mem_now.used .. "M "))
    end
})



local spacer= wibox.widget.textbox('  ')

-- round container
function container (widget, args)
    args = args or {}

    local hover = args.hover
    if args.hover == nil then
        hover = true
    end

    local shape = args.shape or gears.shape.rounded_bar
    

    local _container = wibox.widget {
        {
           widget,
            left   = 10,
            right  = 10,
            top    = 3,
            bottom = 3,
            widget = wibox.container.margin
        },
        shape              = shape,
        shape_border_color = colors.bg_light,
        shape_border_width = dpi(2),
        bg                 = theme.bg,
        widget             = wibox.container.background
    }

    if hover then
        _container:connect_signal("mouse::enter", function (args)
            _container.bg = theme.bg_focus
        end)
        _container:connect_signal("mouse::leave",function ()
            _container.bg = theme.bg_normal
        end)
    end
    return _container
end


-- Edit config widget
local config_widget = container(wibox.widget.imagebox(theme.widget_config), {shape=gears.shape.rounded_rect})

config_widget:buttons(awful.util.table.join(
    awful.button({"","Control"}, 1, function(  )
        awful.spawn("awesome-config")
    end)
        ))

        
-- Brightness Widget
local brightness_widget = require("widgets.brightness-widget.brightness")

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
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Systray
    s.systray =  wibox.widget.systray()
    -- s.systray.visible = false 
    s.systray.set_base_size(18)

    s.systray = container({
        s.systray,
        valign = 'center',
        margins = 2,
        widget = wibox.container.place,
       }, {hover=false})

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox = container(s.mylayoutbox, {shape=gears.shape.rounded_rect})
    s.mylayoutbox:buttons(my_table.join(
            awful.button({}, 1, function () awful.layout.inc( 1) end),
            awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
            awful.button({}, 3, function () awful.layout.inc(-1) end),
            awful.button({}, 4, function () awful.layout.inc( 1) end),
            awful.button({}, 5, function () awful.layout.inc(-1) end)
        )
    )
    

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = awful.util.taglist_buttons,

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
                top    = 3,
                bottom = 3,
                widget = wibox.container.margin
            },
            
        -- Add support for hover colors
        create_callback = function(self, c, index, objects)
            self:connect_signal('mouse::enter', function()
                self.bg = theme.bg_focus
            end)
            self:connect_signal('mouse::leave', function()
               if mouse.screen.selected_tag.index ~= index then
                   self.bg = theme.bg
               end
            end)
        end,
    
            id     = 'background_role',
            widget = wibox.container.background,
            
        },
    

    }


    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons= awful.util.tasklist_buttons,
        
        style    = {
            shape_border_width = dpi(2),
            shape_border_color = colors.bg_light,
            shape  = gears.shape.rounded_bar,
        },
        layout   = {
            spacing = 5,
            layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        {
                            {
                                forced_height=dpi(16),
                                forced_width=dpi(16),
                                id     = 'icon_role',
                                widget = wibox.widget.imagebox,
                            },
                            valign = 'center',
                            halign = 'center',
                            margins = 2,
                            widget = wibox.container.place,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
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
            
            -- Add support for hover colors
            create_callback = function(self, c, index, objects)
                self:connect_signal('mouse::enter', function()
                    self.bg = theme.bg_focus
                end)
                self:connect_signal('mouse::leave', function()
                    local focused_client = client.focus
                    if c then
                        if focused_client ~= c then
                            self.bg = theme.bg   
                        end
                    end 
                end)
            end,

            id     = 'background_role',
            widget = wibox.container.background,
        },
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s, 
        height = dpi(28), 
        bg = colors.bg, 
        fg = theme.fg_normal , 
        opacity = 0.9,
        shape = gears.shape.rectangle,
    })

    -- Add widgets to the wibox 
    s.mywibox:setup {
        
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
                netdownicon,
                netdowninfo,
                netupicon,
                netupinfo.widget,
            }),

            spacer,

            container({
                layout = wibox.layout.fixed.horizontal,
                memicon,
                memory.widget,
            }),
            
            spacer,

            container({
                layout = wibox.layout.fixed.horizontal,
                tempicon,
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
                brightness_widget(),
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
           
            spacer,
       
            container(mytextclock),
            
            spacer,

            container(awful.widget.keyboardlayout:new (),  {shape=gears.shape.rounded_rect}),

            spacer,


            s.mylayoutbox,
            spacer

        },
       
    }

end

return theme
