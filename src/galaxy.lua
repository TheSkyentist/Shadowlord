-- create galaxy object
Galaxy = Object:extend()

-- galaxy constructor
function Galaxy:new(galaxyType, connectedGalaxies, x, y)
    self.galaxyType = galaxyType
    self.connectedGalaxies = {connectedGalaxies}
    self.positionX = x
    self.positionY = y
    self.occupyingCharacters = {}
    self.spaceships = {}
    -- need to add some way to get to **Character** (face-down circle)
end