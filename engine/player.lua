require("engine.2dbody")
require("engine.anim_sprite")
Player = Body2D:extend()

--creating the player
function Player:new(x, y, spritesheet, w, h)
    Player.super.new(self, x, y)
    self.anim = AnimSprite(h, w, x, y, spritesheet)
end

--updating the player
function Player:update(dt)
    self.anim:update(dt)
    if love.keyboard.isDown("right") then
        self.position.x = self.position.x + 100 * dt        
    end
    if love.keyboard.isDown("left") then
        self.position.x = self.position.x - 100 * dt        
    end
    if love.keyboard.isDown("up") then
        self.position.y = self.position.y - 100 * dt        
    end
    if love.keyboard.isDown("down") then
        self.position.y = self.position.y + 100 * dt        
    end

    --update members positions
    self.anim.position = self.position
end

--drawing the player 
function Player:draw()
    self.anim:draw()
end