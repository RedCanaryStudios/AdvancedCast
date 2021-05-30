# AdvancedCast
More options for raycasting

\[RayCastWithAdvancedFilter\] (origin, dir, filterCallback, rayparams)

Usage: Provide a callback to filter out objects. Rather than having a table of objects to ignore, you can providee a function as it is more versatile. For example, you might want to ignore all parts that are called "BLUE", so you may do the following. If the callback returns true (or a truthy value), it will ignore the object,

```lua
local result = RayCastWithAdvancedFilter(--[[origin]], --[[direction]], function(part)
  return part.Name == "BLUE" -- will ignore parts named blue
end --[[can be anonymous, or an existing function]])
```

This can be extended into complex functions.

```lua
local function ignoreCallback(part)
  for _, player in ipairs(plr.Team:GetPlayers()) do
    if plr.Character then
      if part:IsDescendantOf(plr.Character) then
        return true
      end
    end
  end
  
  return false
end

local result = RayCastWithAdvancedFilter(origin, direction, ignoreCallback) -- this will ignore players on the same team, useful for guns, etc,
```

\[AllPartsOnRay\] (origin, direction, rayparams)

Very self explanatory. Provide the WorldRoot:RayCast() normally. But in this case it will return an array of RaycastResult instances, rather than just the first ones hit. The array will be in the order the parts were hit in.

\[GetXthObjectInRay\] (origin, direction, X, rayparams)

This raycast will return the Xth object, rather than the first. Suppose you want a gun that shoots through 3 parts maximum, this is the function you want, as you can specify it to get the 3rd object rather than just the first. This also returns a 2nd parameter of all the parts it went through.

```lua
local result, array = AllPartsOnray(orign, direction, 3, RP)
```
