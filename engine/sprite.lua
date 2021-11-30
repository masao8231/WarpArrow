
require("engine.2dobject")
require("engine.vector2")
Sprite = Object2D:extend()

--create a new sprite (with love.graphics.newImage)
function Sprite:new(x, y, image)
  Sprite.super.new(self, x, y)
  self.image = image
end

--drawing the sprite by love2D built in functions 
function Sprite:draw()
  love.graphics.draw(self.image, self.position.x, self.position.y)
end 