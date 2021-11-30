require("engine.vector2")
require("engine.sprite")
require("engine.2dobject")
require("engine.player")

map = {
    {1,1,1,1,1,1,1,1,1,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,0,0,0,0,0,0,0,0,1},
    {1,1,1,1,1,1,1,1,1,1},
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
    
    --loading tiles
    line = 0
    for y = 1, #map do
        line = line + 1
        for x=1, #map[y] do 
            if (map[y][x] == 1) then 
                table.insert(tiles, Vector2((x * tile:getWidth()) - tile:getWidth(), (y * tile:getHeight()) - tile:getHeight()))
            end 
        end 
    end
    print(row)

end

function love.update(dt)
    player:update(dt)
end

function love.draw()  
    sprite:draw()
    player:draw()

    --draw the tiles 
    for i=1, #tiles do 
        love.graphics.draw(tile, tiles[i].x, tiles[i].y)
    end
end