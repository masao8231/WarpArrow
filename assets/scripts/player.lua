require("engine.physics.2dbody")
require("engine.animSprite")
require("engine.physics.collisionRect")
Player = Body2D:extend()

--creating the player
function Player:new(x, y, spritesheet, w, h)
    Player.super.new(self, x, y)
    --creating the anim sprite based on it's spritesheet
    self.anim = AnimSprite(h, w, x, y, spritesheet)
    
    --creating it's collision shape 
    self.shape = CollisionRect2D(self.position.x, self.position.y, self.anim.width, self.anim.height, true)

end

--updating the player
function Player:update(dt)
    self.anim:update(dt)
    if love.keyboard.isDown("right") then
        self.position.x = self.position.x + 100 * dt  
        self.shape:move(100, 0, dt)      
    end
    if love.keyboard.isDown("left") then
        self.position.x = self.position.x - 100 * dt   
        self.shape:move(-100, 0, dt)     
    end
    if love.keyboard.isDown("up") then
        self.position.y = self.position.y - 100 * dt        
        self.shape:move(0, -100, dt)
    end
    if love.keyboard.isDown("down") then
        self.position.y = self.position.y + 100 * dt      
        self.shape:move(0, 100, dt)  
    end

    --update members positions
    self.anim.position = self.position
end

--drawing the player 
function Player:draw()
    self.anim:draw()
    self.shape:draw()
end