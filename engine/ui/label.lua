require("engine.2dobject")
Label = Object2D:extend()

--create the label 
function Label:new(x, y, text, color)
    self.position = Vector2(x, y)
    --Text string
    self.text = text 
    self.color = color or {1, 1, 1}
end

--Draws the label onto the screen 
function Label:draw()
    love.graphics.setColor(self.color)
    love.graphics.print(self.text, self.position.x, self.position.y)
end