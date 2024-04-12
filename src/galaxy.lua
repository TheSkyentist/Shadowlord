-- create galaxy object
Galaxy = Object:extend()

-- galaxy constructor
function Galaxy:new()
    self.spaceType = nil
    self.occupyingCharacters = {}
    self.spaceships = {}
   
    -- need to add some way to get to **Character** (face-down circle)
end
