local lovemi = require "lovemi"

require "examples.mlg.sound" --allows hit to be played multiple times

local music

function love.load()
  
  --load resource m8
  music = love.audio.newSource("/examples/mlg/rekt.mp3", "stream")
  music:setVolume(0)
  illuminati = love.audio.newSource("/examples/mlg/illuminati.mp3")
  hit = love.graphics.newImage("/examples/mlg/hit.png")
  bg = love.graphics.newImage("/examples/mlg/bg.png")
  doritos = love.graphics.newImage("/examples/mlg/doritos.png")
  sanic = love.graphics.newImage("/examples/mlg/sanic.png")
  weed = love.graphics.newImage("/examples/mlg/weed.png")
  
  konami = lovemi.add({
    
    pattern = {"g", "e", "t", "r", "e", "k", "t", "u", "n", "u", "b", "return"}, --getrektunub 

    duration = 2.1,
    
    onStart = function()
      music:play()
    end,
    
    onEnd = function()
      --well things hav 2 end someday
    end,
    
    onSuccess = function()
      playsource() --play hit sound
    end,
    
    onFail = function()
      if illuminati:isPlaying() then illuminati:stop() end
      illuminati:play()
    end
    
  })

  love.graphics.setNewFont(64)
end

function love.update(dt)
  
  lovemi.update(dt)

  music:setVolume(music:getVolume() * (.95) + (konami:isActive() and 1 or 0) * .05) --fade music
  if music:getVolume() < .02 and not konami:isActive() then music:stop() end
  
end

function love.draw()

  local fun = music:getVolume()
  if fun > 0.01 then
    
    local col = (konami.time/konami.duration)*1200
    love.graphics.setColor(125+(-col+125), 125+col, 125+(-col+125), fun*255)
    love.graphics.push()
    local scal = -.01+math.random()*.02 --scale dat
    love.graphics.scale(1+(fun*scal), 1+(fun*scal))
    love.graphics.translate(love.graphics.getWidth()*.5, love.graphics.getHeight()*.5)
    love.graphics.rotate(fun*(-.1+math.random()*.2))
    love.graphics.translate(-love.graphics.getWidth()*.5+fun*scal, -love.graphics.getHeight()*.5+fun*scal)
    
    love.graphics.draw(bg, -100, -20, 0, .65, .75)
    
    --randomize diz shiet
    love.graphics.setColor(255, 255, 255, fun*255)
    love.graphics.draw(doritos, 100+math.random()*10, 200+math.random()*10, math.random()*3, 1, 1, 80, 120) --official sponspor m9
    love.graphics.draw(doritos, 600+math.random()*10, 150+math.random()*10, math.random()*3, 1, 1, 80, 120)
    love.graphics.draw(doritos, 300+math.random()*10, 500+math.random()*10, math.random()*3, 1, 1, 80, 120)
    
    love.graphics.draw(sanic, -1100+col*1.7, 300, math.random(), .5, .5, 256, 256)
    
    love.graphics.draw(weed, 200, -600+col*1.5, math.random()*.5, .5, .5, 256, 256)
    love.graphics.draw(weed, 700, -600+col*1.3, math.random()*.5, .5, .5, 256, 256)
    love.graphics.draw(weed, 400, 1200-col*1.7, math.random()*.5, .5, .5, 256, 256)
    
  end
  
  love.graphics.setColor(255, 255, 255)
  for i = 1, konami:getPosition() do
    love.graphics.draw(hit, love.graphics.getWidth()*.5-25, 60+(i-1)*40, 0, .5, .5)
  end
  
  if fun > 0.01 then
    
    love.graphics.pop()
    
  end
  
end

function love.keypressed(key, isrepeat)
  
  lovemi.keypressed(key, isrepeat)
  
end