-- lovemi.lua v0.1

-- Copyright (c) 2015 Ulysse Ramage
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

local lovemi = {name = "lovemi", instances = {}}
lovemi.__index = lovemi

-- Public methods

function lovemi.add(f)

  assert(f and f.pattern, "Pattern required")

  local lovemiObj = f
  setmetatable(lovemiObj, lovemi)

  lovemiObj.enabled = true
  lovemiObj.active = false
  
  lovemiObj.time, lovemiObj.current = 0, 0

  table.insert(lovemi.instances, lovemiObj)
  
  return lovemiObj
end

--
-- Update
--

function lovemi:updateSelf(dt)
  
  if self.active and self.duration then
    self.time = self.time + dt
    if self.time > self.duration then
      self.active = false
      self.current = 0
      if self.onEnd then self.onEnd() end
    end
  end
  
end

function lovemi:keypressedSelf(key, isrepeat)

  if not self.active then
    if key == self.pattern[self.current + 1] then
      self.current = self.current + 1
      if self.onSuccess then self.onSuccess() end
      
      if self.current == #self.pattern then
        self.active = self.duration and true or false
        self.current = self.duration and self.current or 0
        self.time = 0
        if self.onStart then self.onStart() end
      end
    elseif self.current ~= 0 then
      self.current = 0
      if self.onFail then self.onFail() end
    end
  end
  
end

--
-- Global
--

function lovemi.update(dt)

  for i = #lovemi.instances, 1, -1 do
    if lovemi.instances[i] then
      lovemi.instances[i]:updateSelf(dt)
    end
  end
  
end

--
-- Misc
--

function lovemi:getLength()
  return #self.pattern
end

function lovemi:getPosition()
  return self.current
end

function lovemi:isActive()
  return self.active
end

function lovemi:remove()
  
  for i = #lovemi.instances, 1, -1 do
    if lovemi.instances[i] == self then table.remove(lovemi.instances, i) self = nil end
  end
  
end

function lovemi.clear()
  for i = 1, #lovemi.instances do lovemi.instances[i] = nil end
end

--
-- Key
--

function lovemi.keypressed(key, isrepeat)

  for i = #lovemi.instances, 1, -1 do
    if lovemi.instances[i] then
      lovemi.instances[i]:keypressedSelf(key, isrepeat)
    end
  end
  
end

return lovemi