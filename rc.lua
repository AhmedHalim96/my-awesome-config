-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awesome, client, screen = awesome, client, mouse
local string, os, type =  string, os, type


local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")
-- require("collision")()
local lain= require("lain")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local freedesktop   = require("freedesktop")
local dpi           = require("beautiful.xresources").apply_dpi

-- Notifications
require('modules.notifications')


--Variable definitions]
local default_apps = require("config.default_apps")

terminal = default_apps.terminal
editor = default_apps.editor
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
altkey = "Mod1"
browser = default_apps.browser
filemanager = default_apps.filemanager
awful.util.terminal = terminal
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", }

sloppy_focus_enabled = true 

awful.layout.layouts = {
    awful.layout.suit.tile,   
    awful.layout.suit.max,
    awful.layout.suit.floating,
}


awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            -- not sure what this line does
            c:emit_signal("request::activate", "tasklist", {raise = true})

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/themes/multicolor/theme.lua", os.getenv("HOME")))
--beautiful.wallpaper="/mnt/Data/Pictures/Bacakgrounds/2560x1440.png"


-- }}}

-- {{{ menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
  }
  awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or dpi(16),
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", terminal },
        -- other triads can be put here
    }
  })
  -- hide menu when mouse leaves it
--   awful.util.mymainmenu.wibox:connect_signal("mouse::leave", function() awful.util.mymainmenu:hide() end)
  
  --menubar.utils.terminal = terminal -- Set the Menubar terminal for applications that require it
  -- }}}
  -- }}}


  -- {{{ Screen
  -- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
  screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
  end)


  -- Create a wibox for each screen and add it
  awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
  -- }}}

  -- {{{ Mouse bindings
root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end)        
))
-- }}}

--- Global keys
local globalkeys = require("config.global_keys")

-- Set keys
root.keys(globalkeys)

-- client rules
require("config.client_rules")

-- client Signals
require("config.client_signals")

-- Styling clients
require('modules.decorate-client')

-- Autostart apps
require("modules.autostart")
