--it will be a scene, so it's part of the game 
require("engine.scene")
require("engine.ui.button")
require("engine.ui.box")
require("engine.ui.label")

local editor = Scene()

local label = Label(10, 10, "Escrevendo texto")
local box = Box(20, 80, 100, 100, {0.5, 0.5, 0.5})
local btn = Button(30, 30, 300, 100, {0.215686, 0.737255, 0.215686}, "Botão")

editor:addComponent(label, "Label")
editor:addComponent(btn, "Button")
editor:addComponent(box, "Box")

return editor 




