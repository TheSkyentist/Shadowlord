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

-- Recursively 

function Galaxy:galaxiesReached(nSteps)

    -- If no steps, return just yourself
    if nSteps == 0 then
        return {self}

    -- If just one step, return galaxy you are on, along with galaxies we are connected to
    elseif nSteps == 1 then

        -- Table of galaxies we can move to\
        
        local possibleMoves = {self}

        -- iterates through the totalPossibleMoves table and for each galaxy, adds its connections
        for i, connection in ipairs(self.connections) do
            table.insert(possibleMoves, connection)
        end

    else

        -- Empty list of possible connection
        local possibleMoves = {}
        
        -- Iterte through all our connections
        for i,connection in ipairs(self.connections) do

            -- Get the galaxies it reaches with one less step.
            for j,subconnection in ipairs(connection.galaxiesReached(nSteps-1)) do

                -- Default is to add to list
                local add = true

                -- Check if it is in the list
                for k,possibleMove in ipairs(possibleMoves) do
                    
                    -- Iff in the list, don't add it
                    if possibleMove == subconnection then
                        add = false
                        break -- No need to check the rest of the list
                    end
                    
                end
                
                if add then
                    table.insert(possibleMoves,subconnection)
                end
            end
        end

        return possibleMoves

    end
end