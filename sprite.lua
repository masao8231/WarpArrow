--sprite module, for static objects

Object = require("dep.classic")
require("engine.vector2")
Sprite = Object:extend()

--create a new sprite (with love.graphics.newImage)
function Sprite:new(x, y, image)
  self.position = Vector2(x, y)
  self.image = image
end

--drawing the sprite by love2D built in functions 
function Sprite:draw()
  love.graphics.draw(self.image, self.position.x, self.position.y)
end