local awful = require('awful')
local leader = require "modules.awesome-leader"


local mpd_keys = leader.bind_actions({
  {"P",
    function()
      awful.spawn("playerctl -p mpd play-pause")
    end,
    "play-pause"
  },

  {"n",
    function()
      awful.spawn("playerctl -p mpd next")
    end,
    "next"
  },

  {"p",
    function()
      awful.spawn("playerctl -p mpd previous")
    end,
    "previous"
  },

  {"o",
    function()
      awful.spawn("alacritty -e ncmpcpp")
    end,
    "open player"
  },
})

local rec_leader =
  leader.wrap(
    leader.repeat_count,
    leader.bind({
        {"m", mpd_keys, "MPD"},
  }))

return  leader.leader(rec_leader)

