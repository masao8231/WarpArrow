Object = require("dep.classic")
Scene = Object:extend()
--The scene will be made by components, which are accessed by its name 

--create the scene 
function Scene:new(...)
    self.components = {...} or {}
end

--Add the component 
function Scene:addComponent(component, name)
    local comp_name = name or "component_"..tostring(#self.components)
    self.components[comp_name] = component or nil 
end

--delete the component 
function Scene:removeComponent(name)
    self.components[name] = nil 
end

--update all the components 
function Scene:update(dt)
    --iterate for all the components 
    for i, v in ipairs(self.components) do 
        if v["update"] ~= nil then 
            v:update(dt)
        end
    end
end

--draw all the components 
function Scene:draw()
    --iterate for all the components 
    for i, v in ipairs(self.components) do 
        if v["draw"] ~= nil then 
            v:draw()
        end 
    end
end


