require("engine.2dobject")
require("engine.vector2")

Rectangle2D = Object2D:extend()

--creating a rectangle 
function Rectangle2D:new(x, y, w, h)
    Rectangle2D.super.new(self, x, y)
    --set the width and height 
    self.w = w 
    self.h = h 
    --calculate the vertices 
    self.vertex = {}
    --there's no need to use loops for this one
    self.vertex[#self.vertex+1] = self.position
    self.vertex[#self.vertex+1] = Vector2(self.position.x, self.position.y + self.h)
    self.vertex[#self.vertex+1] = Vector2(self.position.x + self.w, self.position.y + self.h)
    self.vertex[#self.vertex+1] = Vector2(self.position.x + self.w, self.position.y)

end

--move function
function Rectangle2D:move(x, y, dt)
    self.position = Vector2(self.position.x + x * dt, self.position.y + y * dt)
    for i, v in ipairs(self.vertex) do 
        self.vertex[i] = Vector2(v.x + x * dt, v.y + y * dt)
    end 
end

--update function
function Rectangle2D:update(dt)
    
end

--draw function 
function Rectangle2D:draw()
    for i, v in ipairs(self.vertex) do 
        love.graphics.circle("fill", v.x, v.y, 5)
    end 

    love.graphics.rectangle("line", self.position.x, self.position.y, self.w, self.h)
end