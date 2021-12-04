require("engine.2dobject")
Box = Object2D:extend()

function Box:new(x, y, w, h, color)
    self.position = Vector2(x, y)
    self.width = w or 10 
    self.height = h or 10
    self.color = color or {0,0,0}
end

function Box:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.position.x, self.position.y, self.width, self.height)
end