sources = {}

function newsource()
    return love.audio.newSource("/examples/mlg/hit.mp3")
end

function playsource()
      for i, s in ipairs(sources) do
         if s:isStopped() then
            love.audio.play(s)
            return
         end
       end
       table.insert(sources, newsource())
       love.audio.play(sources[#sources])
end