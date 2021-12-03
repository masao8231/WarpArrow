--it will be a scene, so it's part of the game 
require("engine.scene")
require("engine.rectangle")

local editor = Scene()

local rect = Rectangle2D(100, 100, 100, 100, true)
editor:addComponent(rect, "Rectangle")

return editor 




