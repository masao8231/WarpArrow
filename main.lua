require("engine.scene")
local scene_1 = require("assets.scenes.scene_1")

SAT = require("engine.physics.sat")

function love.load()
    
end

function love.update(dt)
    scene_1:update(dt)
end

function love.draw()  
    scene_1:draw()
end