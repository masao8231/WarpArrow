require ("engine.vector2")

function Vec2Table(v_tbl)
    local table = {}
    for i, v in ipairs(v_tbl) do 
        table[#table+1] = v.x 
        table[#table+1] = v.y
    end

    return v_tbl, table
end