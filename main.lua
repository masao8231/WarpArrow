require("engine.scene")
--local scene_1 = require("assets.scenes.scene_1")
local lv_edit = require("engine.edit.levelEditor")

function love.load()
    
end

function love.update(dt)
    lv_edit:update(dt)
end

function love.draw()  
    lv_edit:draw()
end