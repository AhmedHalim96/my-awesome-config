local awful = require("awful")
local beautiful = require("beautiful")
local dpi           = require("beautiful.xresources").apply_dpi
local freedesktop   = require("freedesktop")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")


local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


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

  root.buttons(my_table.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end)        
))

