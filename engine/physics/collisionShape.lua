require("engine.shape")
require("engine.vector2")
CollisionShape2D = Shape2D:extend()

--create the shape 
function CollisionShape2D:new(x, y, draw, ...)
    CollisionShape2D.super.new(self, x, y, draw, ...)

end

--update the shape 

--draws the shape