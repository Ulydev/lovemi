lovemi
==============

Integrate the konami code and customised patterns into your game!

This library lets you call functions using customised patterns, so that you can add secret cheats!

Usage
----------------

```lua
local lovemi = require "lovemi"

function love.load()
  lovemi:add(onStart, duration, onEnd)
end

function love.update(dt)
  lovemi:update(dt)
end

function love.keypressed(key, isrepeat)
  lovemi:keypressed(key, isrepeat)
end
```

lovemi:add() takes three optional parameters : **onStart** and **onEnd** are callbacks called when the code gets activated: the **duration** value, in seconds, is the time it should stay active. If not provided, *onEnd* will not be called.