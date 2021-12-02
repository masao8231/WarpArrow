Object = require("dep.classic")
require("engine.vector2")
Object2D = Object:extend() 

function Object2D:new(x, y)
    self.position = Vector2(x, y) or Vector2(0,0)
end

function Object2D:draw()
    
end

function Object2D:update(dt)
    
end