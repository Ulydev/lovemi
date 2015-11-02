lovemi
==============

Integrate the konami code and customised patterns into your game!

This library lets you call functions using customised patterns, so that you can add secret cheats!

Usage
----------------

```lua
local lovemi = require "lovemi"

function love.load()
  lovemi:add(pattern, onStart, duration, onEnd)
end

function love.update(dt)
  lovemi:update(dt)
end

function love.keypressed(key, isrepeat)
  lovemi:keypressed(key, isrepeat)
end
```

lovemi:add() takes four parameters:
-**pattern** is required. It's a table containing the pattern (e.g. {"up", "down", "left", "right"})
-the others are optional : **onStart** and **onEnd** are callbacks called when the code gets activated: the **duration** value, in seconds, is the time it should stay active. If not provided, *onEnd* will not be called.