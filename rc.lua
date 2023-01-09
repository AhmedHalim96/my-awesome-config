-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local string, os = string, os
require("awful.autofocus")
beautiful = require("beautiful")

-- collision
-- require("modules.collision")()

-- revelation
revelation = require("modules.revelation")
revelation.tag_name = "overview"

--Variable definitions
require("config.preferences")


beautiful.init(string.format("%s/.config/awesome/themes/gtk/theme.lua", os.getenv("HOME")))
--beautiful.wallpaper="/mnt/Data/Pictures/Bacakgrounds/2560x1440.png"

-- Modules
require('modules.notifications')
require("modules.awesome_menu")
revelation.init()

-- screen signals
require("config.screen_signals")

--- Global keys
require("config.global_keys")

-- client rules
require("config.client.rules")

-- client Signals
require("config.client.signals")

-- Autostart apps
require("modules.autostart")
