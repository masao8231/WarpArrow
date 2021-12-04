require("engine.ui.box")
require("engine.ui.label")
Button = Box:extend()

--Create the button 
function Button:new(x, y, w, h, color, label, label_color)
    Button.super.new(self, x, y, w, h, color)
    self.label_color = label_color or {1,1,1}
    self.label = Label(x, y, label, self.label_color)
end

--Draws the button 
function Button:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
    self.label:draw()
end

--Update the button 
function Button:update()
    
end