require("engine.vector2")
require("engine.sprite")
require("engine.2dobject")
require("assets.scripts.player")
require("engine.tile")
require("engine.shape")
require("engine.rectangle")
require("engine.physics.collisionShape")
require("engine.physics.collisionRect")

SAT = require("engine.physics.sat")

map = {

    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}

tiles = {}

function love.load()
    local p = Vector2(2,4)
    local normalp = p:unit()
    print(type(p))
    print(normalp:lenght())

    sprite = Sprite(200, 100, love.graphics.newImage("assets/placeholders/sprites/brick.png"))
    player = Player(10, 10, love.graphics.newImage("assets/placeholders/sprites/anim_cycle.png"), 42, 74)
    tile = love.graphics.newImage("assets/placeholders/tile/tile.png")
    tilemap = Tiles(0,0, map, tile)


    shape = Shape2D(100, 200, true, Vector2(200, 100), Vector2(200, 200))
    rectangle = Rectangle2D(100, 200, 30, 40, true)

    c_shape = CollisionShape2D(100 * 2, 200 * 2, true, Vector2(200 * 2, 100 * 2), Vector2(200 * 2, 200* 2))
    c_rect = CollisionRect2D(190 * 2, 140 * 2, 30, 40, true) 

end

function love.update(dt)
    player:update(dt)
    shape:update(dt)
    rectangle:update(dt)
    c_rect:update(dt)
end

function love.draw()  
    sprite:draw()
    player:draw()
    tilemap:draw()
    shape:draw()
    rectangle:draw()
    c_shape:draw()
    c_rect:draw()
end