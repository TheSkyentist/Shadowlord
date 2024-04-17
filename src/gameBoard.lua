-- create GameBoard object
GameBoard = Object:extend()

-- GameBoard constructor
function GameBoard:new()

    -- Create Table of Galaxies
    self.galaxies = {}

    -- Open a file and get the lines
    local lines = {}
    for line in io.lines("assets/galaxies.tsv") do
        table.insert(lines, line)
    end

    -- Create Table of Connections (lower triangular matrix)
    self.connections = {}
    for i = 1,(#lines) do
        local row = {}
        for j = 1,i do 
            table.insert(row, 0)
        end
        table.insert(self.connections, row)
    end

    -- Iterate over lines
    for i = 1,#lines do 

        -- Split line on tabs
        local words = {}
        for word in lines[i]:gmatch("[^\t]+") do
            table.insert(words, word)
        end

        -- Get galaxy parameters by parsing the line
        local galaxyType = words[1] -- Galaxy Type
        local connections = {} -- Stored as list of integers
        for connection in words[2]:gmatch("[^,]+") do
            -- Add connection to list (only need to do this once, since it is symmetric)
            if i >= tonumber(connection) then
                self.connections[i][tonumber(connection)] = 1
            end
        end

        -- Get coordinates
        local coordinates = {} -- Stored as list of integers
        for coordinate in words[3]:gmatch("[^,]+") do
            table.insert(coordinates, tonumber(coordinate))
        end

        -- Create a new galaxy
        local galaxy = Galaxy(galaxyType, coordinates[1], coordinates[2])
        table.insert(self.galaxies, galaxy)
    end

    -- Iterate over galaxies and add connections
    for i,galaxy in ipairs(self.galaxies) do

        -- Empty Connections List
        local galaxyConnections = {}

        -- Iterate over all connections
        for j,connects in ipairs(self.connections) do

            -- If there is a connection to this galaxy, add it to list
            if (i <= #connects) and (connects[i] == 1) then
                table.insert(galaxyConnections, self.galaxies[j]) 
            end

            -- If these are the connections for this galaxy, iterate over and add to list
            if i == j then
                for k,connection in ipairs(connects) do
                    if connection == 1 then 
                        table.insert(galaxyConnections, self.galaxies[k]) 
                    end
                end                
            end
        end

        -- Set connections
        galaxy.connections = galaxyConnections
    end

end

-- Draw the game board
function GameBoard:draw()

    -- Draw each galaxy
    for i, galaxy in ipairs(self.galaxies) do
        galaxy:draw(self.transform)
    end

    -- Draw connections
    for i = 1,#self.connections do
        for j = 1,#self.connections do
            if self.connections[i][j] == 1 then
                local x1,y1 = self.transform(self.galaxies[i].x, self.galaxies[i].y)
                local x2,y2 = self.transform(self.galaxies[j].x, self.galaxies[j].y)
                love.graphics.line(x1,y1,x2,y2)
            end
        end
    end

end

-- Update the game board
function GameBoard:update(dt)

    -- Update each galaxy
    for i, galaxy in ipairs(self.galaxies) do
        galaxy:update(dt)
    end
    

end

-- Transform from X,Y coordiantes from galaxy (-1,1,-1,1) to window coordinates along with rotation
function GameBoard.transform(x,y)

    -- (Clockwise) Rotation Angle
    theta = 0

    -- Rotate x,y by theta
    local xr = x * math.cos(theta) - y * math.sin(theta)
    local yr = x * math.sin(theta) + y * math.cos(theta)

    -- Get Window Size
    local height = love.graphics.getHeight()
    local width = height -- Restrict to square window

    -- Transform x,y to window coordinates
    local xs = (xr + 1) * width / 2
    local ys = (-1*yr + 1) * height / 2 -- Flip y axis

    return xs,ys
end