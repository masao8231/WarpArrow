require("engine.rectangle")
CollisionRect2D = Rectangle2D:extend()

--Create the rectangle 
function CollisionRect2D:new(x, y, w, h, draw) 
    CollisionRect2D.super.new(self, x, y, w, h, draw)

end

--Update the rectangle 
function CollisionRect2D:update(dt)
    if love.keyboard.isDown("d") then 
        self:move(100, 0, dt)
    end 
    if love.keyboard.isDown("a") then 
        self:move(-100, 0, dt)
    end 
    if love.keyboard.isDown("w") then 
        self:move(0, -100, dt)
    end 
    if love.keyboard.isDown("s") then 
        self:move(0, 100, dt)
    end 
end

--Draws the rectangle 
