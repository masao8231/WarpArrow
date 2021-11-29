require("engine.vector2")
require("engine.sprite")
require("engine.anim_sprite")

function love.load()
    local p = Vector2(2,4)
    local normalp = p:normalize()
    print(type(p))
    print(normalp:lenght())

    sprite = Sprite(200, 100, love.graphics.newImage("assets/placeholders/sprites/brick.png"))
    anim = AnimSprite(74, 42, 10, 100, love.graphics.newImage("assets/placeholders/sprites/anim_cycle.png"))

end

function love.update(dt)
    anim:update(dt)
end

function love.draw()  
    sprite:draw()
    anim:draw()
end