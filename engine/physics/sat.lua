require("engine.vector2")

local S = {}

--give a vector2 list of vertices points 
local function edge_normals(vertices)
    --flow control for avoiding empty or non-existent values 
    if vertices == nil or #vertices == 0 then return nil end 

    local normal_vectors = {}

    --remember that we're using a vector2 tables, so, we need to convert them to a normal table

    for i, _ in ipairs(vertices) do 
        --get the vertices points
        local v_1 = vertices[i]
        local v_2 = vertices[i+1] or vertices[1]

        --subtract them and we get our edge 
        local edge = v_1:sub(v_2)

        --Get the edge normal (with have the opposite direction)
        local normal = edge:normal()
        --Then, normalizes
        normal = normal:unit()
        normal_vectors[#normal_vectors+1] = normal
    end

    
    --normal_vectors, edge_normals = Vec2Table(normal_vectors)
    return normal_vectors
end

local function project(polygon, axis)
    --get the dot product by the first vertice 
    local min = axis:dot_prod(polygon.v_points[1])
    local max = min 
    
    for i=2, #polygon.v_points do
        
        --updating the min and max values 
        local p = axis:dot_prod(polygon.v_points[i])
        if p < min then min = p 
        elseif p > max then max = p end
    end
    --returns the max and min points of projection 
    return min, max 
end


--The separate axis theorem
function S.isColliding(polygon_1, polygon_2)
    local axes_1 = edge_normals(polygon_1.v_points)
    local axes_2 = edge_normals(polygon_2.v_points)
    local overlap = 0xFFFFF --big ass number 
    local penetration_axis = nil 

    --concatenating the axes_1 into axes_2 table 
    for i, _ in ipairs(axes_2) do axes_1[#axes_1+1] = axes_2[i] end

    --loop all over the separating axes 
    --if there's a single on overlap, then, it must be done, because one single overlap is enough 
    --to assume there's a collision happening

    for i,_ in ipairs(axes_1) do 
        --project their axes 
        local p1min, p1max = project(polygon_1, axes_1[i])
        local p2min, p2max = project(polygon_2, axes_1[i])

        --after getting our axes, we must find if there's one overlaping to another 
        --if there's no overlap, so there's not having a collision, then returns nil 
        if p1min > p2max or p2min > p1max then return nil end 
        --get the overlap's amount to calculate the separation vector 
        local o = math.min(p1max, p2max) - math.min(p1min, p2max)
        if o < overlap then 
            overlap = o
            penetration_axis = axes_1[i]
        end
    end

    
    if penetration_axis == nil then return nil end 
    --definitely colliding
    return penetration_axis * overlap

end


return S 