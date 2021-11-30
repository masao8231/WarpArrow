require("engine.vector2")
require("engine.sprite")
require("engine.2dobject")
require("engine.player")

function love.load()
    local p = Vector2(2,4)
    local normalp = p:normalize()
    print(type(p))
    print(normalp:lenght())

    sprite = Sprite(200, 100, love.graphics.newImage("assets/placeholders/sprites/brick.png"))
    player = Player(10, 10, love.graphics.newImage("assets/placeholders/sprites/anim_cycle.png"), 42, 74)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()  
    sprite:draw()
    player:draw()
end