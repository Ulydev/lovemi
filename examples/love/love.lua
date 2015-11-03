local lovemi = require "lovemi"

local music
local targetVolume = 0 --fade audio

function love.load()
  music = love.audio.newSource("/examples/love/love.mp3", "stream")
  konami = lovemi.add({
    
    pattern = {"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"}, --KONAMI CODE!

    duration = 4,
    
    onStart = function()
      music:play()
    end
    
  })

  love.graphics.setNewFont(64)
end

function love.update(dt)
  
  lovemi.update(dt)

  music:setVolume(music:getVolume() * (.96) + (konami:isActive() and 1 or 0) * .04) --fade music
  if music:getVolume() < .01 and not konami:isActive() then music:stop() end
  
end

function love.keypressed(key, isrepeat)
  
  lovemi.keypressed(key, isrepeat)
  
end