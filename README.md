lovemi
==============

Integrate the konami code and customised patterns into your game!

This library lets you call functions using customised patterns, so that you can add secret cheats!

Usage
----------------

```lua
local lovemi = require "lovemi"

function love.load()
  local pattern = lovemi.add(attributes)
end

function love.update(dt)
  lovemi.update(dt)
end

function love.keypressed(key, isrepeat)
  lovemi.keypressed(key, isrepeat)
end
```

Attributes
----------------

The majority of them are optional. You can set these attributes when creating a new pattern.

```lua
pattern = lovemi.add({

  pattern = {"a", "b", "c", "d"},

  onStart = function()
    --pattern executed
  end
  
})
```

Attributes

```lua
pattern --table containing keys (required)

duration --if not set, onEnd will never be called
```

Callbacks

```lua
onStart --pattern executed
onEnd --pattern execution ended

onSuccess --right key
onFail --wrong key, pattern resets
```

Methods

```lua
pattern:getActive() --is pattern being executed?

pattern:getLength() --returns pattern length
pattern:getPosition() --returns current pattern position (useful for combo systems)

pattern:remove() --removes the pattern from lovemi

lovemi.clear() --removes every pattern from lovemi
```