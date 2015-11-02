konami
==============

Integrate the konami code into your game!

Usage
----------------

```lua
local konami = require "konami"

function love.load()
  konami:add(onStart, duration, onEnd)
end

function love.update(dt)
  konami:update(dt)
end

function love.keypressed(key, isrepeat)
  konami:keypressed(key, isrepeat)
end
```

konami:add() takes three optional parameters : **onStart** and **onEnd** are callbacks called when the code gets activated: the **duration** value, in seconds, is the time it should stay active. If not provided, *onEnd* will not be called.