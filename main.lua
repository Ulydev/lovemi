local lovemi = require "lovemi"

local music
local targetVolume = 0 --fade audio

function love.load()
  music = love.audio.newSource("love.mp3", "stream")
  lovemi:add(
    
    {"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"}, --KONAMI CODE!
    
    function()
      targetVolume = 1
      music:play()
    end,
    
    5,
    
    function()
      targetVolume = 0
    end
    
  )
end

function love.update(dt)
  
  lovemi:update(dt)

  music:setVolume(music:getVolume() * (.95) + targetVolume * .05) --fade music
  if music:getVolume() < .02 and targetVolume == 0 then music:stop() end
  
end

function love.keypressed(key, isrepeat)
  
  lovemi:keypressed(key, isrepeat)
  
end