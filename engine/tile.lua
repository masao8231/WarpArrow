require("engine.2dobject")
require("engine.physics.collisionRect")
Tiles = Object2D:extend()

function Tiles:new(x, y, map, t_source)
    self.super.new(self, x, y)
    self.tiles = {}
    self.tiles.positions = {}
    self.tile = t_source
    self.shapes = {}

    --load the tile parameters 
    for y = 1, #map do
        for x=1, #map[y] do 
            if (map[y][x] == 1) then 
                table.insert(self.tiles.positions, Vector2((x * tile:getWidth()) - tile:getWidth(), (y * tile:getHeight()) - tile:getHeight()))
                self.shapes[#self.shapes+1] = CollisionRect2D((x * tile:getWidth()) - tile:getWidth(), (y * tile:getHeight()) - tile:getHeight(), self.tile:getWidth(), self.tile:getHeight(), true)
            end 
        end 
    end
end

function Tiles:draw()
    --draw tiles on the screen based on map 
    for i=1, #self.tiles.positions do 
        love.graphics.draw(self.tile, self.tiles.positions[i].x, self.tiles.positions[i].y)
        self.shapes[i]:draw()
    end
end
