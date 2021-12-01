require("engine.helpers")
require("engine.2dobject")
require("engine.vector2")
Shape2D = Object2D:extend()

--create the shape
function Shape2D:new(x, y, draw, ...)
    Shape2D.super.new(self, x, y)
    
    local args = {...}
    local vertex = {}
    self.drawable = draw 
    --get the vertices vector
    assert(#args >= 2, "The shape must have 3 points or more")
    --Vertex points (v_points) which is a table of vectors2 representing each polygon vertex
    --And the list of vertices

    --Normalizes the pointers to position
    vertex[#vertex+1] = self.position
     
    for i, v in ipairs(args) do 
        vertex[#vertex+1] = args[i]
    end 

    --convert these vector2 to an default table, it makes easier to love2D build a polygon
    self.v_points, self.vertex = Vec2Table(vertex)

end

--Move each vertice from the polygon 
function Shape2D:move(x, y, dt)
    --change the position 
    self.position = Vector2(self.position.x + x, self.position.y + y) *dt
    --move every vertice 
    for i, v in ipairs(self.v_points) do
        self.v_points[i] = Vector2(v.x + x * dt, v.y + y * dt)
    end  
    self.v_points, self.vertex = Vec2Table(self.v_points)
end

function Shape2D:update(dt)
end

--Draws the polygon on the screen 
function Shape2D:draw()
    if self.drawable == true then 
        for i, v in ipairs(self.v_points) do
            love.graphics.circle("fill", v.x, v.y, 5)
            love.graphics.print("Pos("..v.x..","..v.y..")", v.x + 1, v.y + 1)
        end  
        love.graphics.circle("fill", self.position.x, self.position.y, 5)
        love.graphics.polygon("line", self.vertex)
    end
end
