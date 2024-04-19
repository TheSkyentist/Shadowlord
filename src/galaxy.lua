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
    self.numSpaceships = 0
    self.spaceshipPlayer = nil
    self.faceDownCharacter = nil

end

-- Find out Galaxy Owner
function Galaxy:findPlayer()

    -- Get list of players of characters on the galaxy
    local players = {}
    for i,character in ipairs(self.occupyingCharacters) do
        add = true
        for j,player in ipairs(players) do
            if player == character.player then
                add = false
            end
        end
        if add then
            table.insert(players,character.player)
        end
    end

    -- If there is only one player, return that player
    if #players == 1 then
        return players[1]
    elseif self.numSpaceships > 1 then
        return self.spaceshipPlayer
    end

    -- Contested/Unnocupied
    return nil

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

    -- Set color based on player
    local player = self:findPlayer()
    print(player)
    if player then
        love.graphics.setColor(player.color)
    else
        love.graphics.setColor({1,1,1})
    end
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