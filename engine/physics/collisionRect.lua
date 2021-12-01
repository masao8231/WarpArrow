require("engine.rectangle")
CollisionRect2D = Rectangle2D:extend()

--Create the rectangle 
function CollisionRect2D:new(x, y, w, h, draw) 
    CollisionRect2D.super.new(self, x, y, w, h, draw)

end

--Update the rectangle 

--Draws the rectangle 
