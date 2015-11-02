local konami = {instances = {}}
setmetatable(konami, konami)

function konami:add(onStart, duration, onEnd)
  
  local instance = {
    code = {"up", "up", "down", "down", "left", "right", "left", "right", "b", "a"},
    onStart = onStart,
    duration = duration,
    time = 0,
    onEnd = onEnd,
    enabled = true,
    active = false,
    current = 0
  }
  
  table.insert(self.instances, instance)

end

function konami:update(dt)
  
  for i = 1, #self.instances do
    local instance = self.instances[i]
    if instance.active and instance.duration then
      instance.time = instance.time + dt
      if instance.time > instance.duration then
        instance.active = false
        if instance.onEnd then instance.onEnd() end
      end
    end
  end
  
end

function konami:keypressed(key, isrepeat)
  
  for i = 1, #self.instances do
    local instance = self.instances[i]
    if not instance.active then
      if key == instance.code[instance.current + 1] then
        instance.current = instance.current + 1
        
        if instance.current == #instance.code then
          instance.active = true
          instance.time = 0
          if instance.onStart then instance.onStart() end
        end
      else
        instance.current = 0
      end
    end
  end
  
end

return konami