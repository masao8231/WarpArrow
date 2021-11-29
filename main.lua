require("engine.vector2")
require("engine.sprite")

function love.load()
    local p = Vector2(2,4)
    local normalp = p:normalize()
    print(type(p))
    print(normalp:lenght())

    sprite = Sprite(200, 100, love.graphics.newImage("assets/placeholders/sprites/brick.png"))

end

function love.update(dt)
end

function love.draw()  
    sprite:draw()
end