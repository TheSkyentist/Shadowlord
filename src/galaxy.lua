-- create galaxy object
Galaxy = Object:extend()

-- galaxy constructor
function Galaxy:new(galaxyType, x, y)
    self.galaxyType = galaxyType
    self.positionX = x
    self.positionY = y
    self.occupyingCharacters = {}
    self.spaceships = {}
    -- need to add some way to get to **Character** (face-down circle)
end

function Galaxy:draw()
    -- Dorel todo
end