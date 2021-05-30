local AC = {}

AC.RayCastWithAdvancedFilter = function(origin, dir, FilterCallback, RP)
    local cast
    local filter = RP and RP.FilterDescendantsInstances or {}

    assert(type(FilterCallback) == "function", "Callback not provided.")
    
    repeat
        local newRP = RaycastParams.new()
        newRP.CollisionGroup = RP.CollisionGroup
        newRP.FilterDescendantsInstances = filter
        newRP.FilterType = RP.FilterType
        newRP.IgnoreWater = RP.IgnoreWater

        cast = workspace:Raycast(origin, dir, newRP)

        if cast then
            table.insert(filter, cast.Instance)
        end

    until cast == nil or not FilterCallback(cast.Instance)

    return cast
end

AC.AllPartsOnRay = function(origin, dir, RP)
    local cast
    local items = {}
    local filter =  RP and RP.FilterDescendantsInstances or {}
    
    repeat
        local newRP = RaycastParams.new()
        newRP.CollisionGroup = RP.CollisionGroup
        newRP.FilterDescendantsInstances = filter
        newRP.FilterType = RP.FilterType
        newRP.IgnoreWater = RP.IgnoreWater

        cast = workspace:Raycast(origin, dir, newRP)

        if cast then
            table.insert(items, cast)
            table.insert(filter, cast.Instance)
        end

    until cast == nil

    return items
end

AC.GetXthObjectInRay = function(origin, dir, X, RP)
    local cast
    local items = {}
    local filter = RP and RP.FilterDescendantsInstances or {}

    local iteration = 1
    
    assert(type(X) == "number", "Number not provided.")
    
    repeat
        iteration += 1
        local newRP = RaycastParams.new()
        newRP.CollisionGroup = RP.CollisionGroup
        newRP.FilterDescendantsInstances = filter
        newRP.FilterType = RP.FilterType
        newRP.IgnoreWater = RP.IgnoreWater

        cast = workspace:Raycast(origin, dir, newRP)

        if cast then
            table.insert(items, cast)
            table.insert(filter, cast.Instance)
        end

    until cast == nil or iteration == X

    return cast, items
end

return AC
