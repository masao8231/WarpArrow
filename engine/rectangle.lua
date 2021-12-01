require("engine.2dobject")
require("engine.vector2")

Rectangle2D = Object2D:extend()

--creating a rectangle 
function Rectangle2D:new(x, y, w, h, draw)
    Rectangle2D.super.new(self, x, y)
    --set the width and height 
    self.w = w 
    self.h = h 
    self.drawable = draw or false 
    --calculate the vertices 
    self.v_points = {}
    --there's no need to use loops for this one
    self.v_points[#self.v_points+1] = self.position
    self.v_points[#self.v_points+1] = Vector2(self.position.x, self.position.y + self.h)
    self.v_points[#self.v_points+1] = Vector2(self.position.x + self.w, self.position.y + self.h)
    self.v_points[#self.v_points+1] = Vector2(self.position.x + self.w, self.position.y)

end

--move function
function Rectangle2D:move(x, y, dt)
    self.position = Vector2(self.position.x + x * dt, self.position.y + y * dt)
    for i, v in ipairs(self.v_points) do 
        self.v_points[i] = Vector2(v.x + x * dt, v.y + y * dt)
    end 
end

--update function
function Rectangle2D:update(dt)
    
end

--draw function 
function Rectangle2D:draw()
    if self.drawable == true then 
        for i, v in ipairs(self.v_points) do 
            love.graphics.circle("fill", v.x, v.y, 5)
        end 

        love.graphics.rectangle("line", self.position.x, self.position.y, self.w, self.h)
    end 
end