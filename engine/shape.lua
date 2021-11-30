require("engine.helpers")
require("engine.2dobject")
require("engine.vector2")
Shape2D = Object2D:extend()

function Shape2D:new(x, y, ...)
    Shape2D.super.new(self, x, y)
    
    local args = {...}
    --get the vertices vector
    assert(#args >= 3, "The shape must have 3 points or more")
    --Vertex points (v_points) which is a table of vectors2 representing each polygon vertex
    --And the list of vertices

    --Normalizes the pointers to position 
    for i, v in ipairs(args) do 
        args[i] = args[i]:translate(self.position)
    end 

    --convert these vector2 to an default table, it makes easier to love2D build a polygon
    self.v_points, self.vertex = Vec2Table(args)

end

--Move each vertice from the polygon 
function Shape2D:move(x, y, dt)
    self.position = Vector2(self.position.x + x * dt, self.position.y + y * dt)
    for i, v in ipairs(self.v_points) do
        self.v_points[i] = Vector2(v.x + x * dt, v.y + y * dt)
    end  
    self.v_points, self.vertex = Vec2Table(self.v_points)
end

function Shape2D:update(dt)

end

--Draws the polygon on the screen 
function Shape2D:draw()
    love.graphics.polygon("line", self.vertex)
end
