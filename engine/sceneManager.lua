require("dep.classic")
SceneManager = Object:extend()

--The scene manager handle the entire scenes list
--it can change for another and etc 

function SceneManager:new(...)
    self.scenes = {...}
    self.current_scene = 1
end

--update the current scene 
function SceneManager:update(dt)
    self.scenes[self.current_scene]:update(dt)
end

--draws the current scene 
function SceneManager:draw()
    self.scenes[self.current_scene]:draw()
end

