local AC = {}

AC.RayCastWithAdvancedFilter function(origin, dir, FilterCallback, RP)
    local cast
    local filter = RP.FilterDescendantsInstances

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

    until cast == nil or FilterCallback(cast.Instance)

    return cast
end

return AC
