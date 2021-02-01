-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local string, os = string, os
require("awful.autofocus")
local beautiful = require("beautiful")

-- collision
-- require("collision")()


--Variable definitions
require("config.preferences")


beautiful.init(string.format("%s/.config/awesome/themes/multicolor/theme.lua", os.getenv("HOME")))
--beautiful.wallpaper="/mnt/Data/Pictures/Bacakgrounds/2560x1440.png"

-- Modules
require('modules.notifications')
require("modules.taglist_buttons")
require("modules.tasklist_buttons")
require("modules.awesome_menu")
require("modules.screen")



--- Global keys
require("config.global_keys")

-- client rules
require("config.client_rules")

-- client Signals
require("config.client_signals")

-- Styling clients
require('modules.decorate-client')

-- Autostart apps
require("modules.autostart")
