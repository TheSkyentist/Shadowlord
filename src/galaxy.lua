-- create galaxy object
Galaxy = Object:extend()

-- galaxy constructor
function Galaxy:new(galaxyType, x, y)

    -- Galaxy Type
    self.galaxyType = galaxyType

    -- Coordinates
    self.x0 = x
    self.y0 = y
    self.x = x
    self.y = y
    self.time = love.math.random(0,100)

    -- Galaxy properties
    self.connections = {}
    self.occupyingCharacters = {}
    self.spaceships = {}
    self.faceDownCharacter = nil

end

-- Galaxy draw function
function Galaxy:draw(transform)

    -- Transform coordinates
    local x,y = transform(self.x, self.y)

    -- Set size depending on galaxy type
    if self.galaxyType == "Home" or self.galaxyType == "Galaxy" then
        size = 35
    elseif self.galaxyType == "Space Base" then
        size = 50
    elseif self.galaxyType == "Ruins" or self.galaxyType == "Lost Kingdom" then
        size = 40
    end

    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill", x, y, size)
end

-- Galaxy update function
function Galaxy:update(dt)

    -- Update time
    self.time = self.time + dt
    local noiseScale = 0.25 -- Time-scale of noise
    local noiseStrength = 0.025 -- Positional-scale of noise

    -- Perlin noise
    local noise = love.math.noise(self.time*noiseScale,0)
    self.x = self.x0 + (noise-0.5)*noiseStrength
    local noise = love.math.noise(0,self.time*noiseScale)
    self.y = self.y0 + (noise-0.5)*noiseStrength
    
end

function Galaxy:galaxiesReached(playerSteps)
    
    local totalPossibleMoves = {self}
    local value
    local possibleMoves = {}

    for i = 1,playerSteps do

        for j, connection in ipairs(totalPossibleMoves) do
            table.insert(totalPossibleMoves, connection)
        end

    end


    for i = 1, #totalPossibleMoves do
        value = totalPossibleMoves[i]

        for j = 1, #totalPossibleMoves do
            if totalPossibleMoves[j] ~= value then
                table.insert(possibleMoves, totalPossibleMoves[j])
            end
        end
    end
    return totalPossibleMoves
end