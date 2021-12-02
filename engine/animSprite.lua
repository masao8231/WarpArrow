--animation module

require("engine.2dobject")
require("engine.vector2")
AnimSprite = Object2D:extend()


--loads the entire animation cycle
function AnimSprite:new(h, w, x, y, source, duration)
    AnimSprite.super.new(self, x, y)
    self.anim = {}
    --quad dimensions
    self.height = h 
    self.width = w 

    --time parameters 
    self.duration = duration or 1
    self.current_time = 0 

    --set animation's parameters:

    --the entire spritesheet 
    self.anim.spritesheet = source 
    --every frame from the spritesheet 
    self.anim.quads = {}

    --load the quads into 
    for y = 0, source:getHeight() - h, h do 
        for x = 0, source:getWidth() - w, w do
            table.insert(self.anim.quads, love.graphics.newQuad(x, y, w, h, self.anim.spritesheet:getDimensions()))
        end    
    end
end

function AnimSprite:update( dt )
    self.current_time = self.current_time + dt 
    if self.current_time >= self.duration then 
        self.current_time = self.current_time - self.duration
    end
end

function AnimSprite:draw()
    local spr_index = math.floor(self.current_time/self.duration * #self.anim.quads) + 1 
    love.graphics.draw(self.anim.spritesheet, self.anim.quads[spr_index], self.position.x, self.position.y)
end