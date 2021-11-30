require("engine.vector2")
require("engine.sprite")
require("engine.2dobject")
require("engine.player")
require("engine.tile")
require("engine.shape")

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
    {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}

tiles = {}

function love.load()
    local p = Vector2(2,4)
    local normalp = p:normalize()
    print(type(p))
    print(normalp:lenght())

    sprite = Sprite(200, 100, love.graphics.newImage("assets/placeholders/sprites/brick.png"))
    player = Player(10, 10, love.graphics.newImage("assets/placeholders/sprites/anim_cycle.png"), 42, 74)
    tile = love.graphics.newImage("assets/placeholders/tile/tile.png")
    tilemap = Tiles(0,0, map, tile)


    shape = Shape2D(500, 400, Vector2(1,1), Vector2(100, 200), Vector2(400, 500))

end

function love.update(dt)
    player:update(dt)
    shape:update(dt)
end

function love.draw()  
    sprite:draw()
    player:draw()
    tilemap:draw()
    shape:draw()
end