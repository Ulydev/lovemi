local konami = require "konami"

local music
local targetVolume = 0 --fade audio

function love.load()
  music = love.audio.newSource("love.mp3", "stream")
  konami:add(
    
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
  
  konami:update(dt)

  music:setVolume(music:getVolume() * (.95) + targetVolume * .05) --fade music
  if music:getVolume() < .02 and targetVolume == 0 then music:stop() end
  
end

function love.keypressed(key, isrepeat)
  
  konami:keypressed(key, isrepeat)
  
end