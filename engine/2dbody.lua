require("engine.2dobject")
require("engine.vector2")
Body2D = Object2D:extend()

function Body2D:new(x, y, weight, mass)
    Body2D.super.new(self, x, y)
    
    --member variables 
    self.weight = weight or 1
    self.mass = mass or 1 
end



