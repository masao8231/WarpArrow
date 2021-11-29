Object = require("dep.classic")
Vector2 = Object:extend()

--Create a new bidimentional vector
function Vector2:new(x, y)
    self.x = x or 0.0 
    self.y = y or 0.0 
end

--Returns a Vector's lenght 
function Vector2:lenght()
    return math.sqrt(self.x^2 + self.y^2)
end

--Dot product 
function Vector2:dot_prod(vector)
    assert(type(vector) == "table", "The given value must be a vector")
    return self.x * vector.x + self.y * vector.y
end

--Normalizes the vector 
function Vector2:normalize()
    local normal = self/self:lenght()
    return normal
end

--You can print the vector by lua built in print function 
function Vector2:__tostring()
    return self.x .. ", " .. self.y
end

--basic scalar operations 
--scalar sum 
function Vector2:__add(a)
    return Vector2(self.x + a, self.y + a)
end
--scalar sub
function Vector2:__sub(a)
    return Vector2(self.x - a, self.y - a)
end
--scalar mul
function Vector2:__mul(a)
    return Vector2(self.x * a, self.y * a)
end
--scalar div 
function Vector2:__div(a)
    return Vector2(self.x / a, self.y / a)
end

--basic vectorial operations 
--the sum function
function Vector2:sum(vector)
    assert(type(vector) == "table", "The given value must be a vector")
    return Vector2(self.x + vector.x, self.y + vector.y)
end

--the sub function
function Vector2:sub(vector)
    assert(type(vector) == "table", "The given value must be a vector")
    return Vector2(self.x - vector.x, self.y - vector.y)
end

--the multiplication function
function Vector2:mul(vector)
    assert(type(vector) == "table", "The given value must be a vector")
    return Vector2(self.x * vector.x, self.y * vector.y)
end

--the division function
function Vector2:div(vector)
    assert(type(vector) == "table", "The given value must be a vector")
    return Vector2(self.x / vector.x, self.y / vector.y)
end