Object = require("dep.classic")
require("engine.vector2")
local T_dobject = Object:extend() 

function T_dobject:new(x, y)
    self.position = Vector2(x, y) or Vector2(0,0)
end

return T_dobject
