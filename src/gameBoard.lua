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

    -- Create Table of Connections
    self.connections = {}
    for i = 1,#lines do
        local row = {}
        for j = 1,#lines do 
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
        galaxyType = words[1] -- Galaxy Type
        connections = {} -- Stored as list of integers
        for connection in words[2]:gmatch("[^,]+") do
            self.connections[i][tonumber(connection)] = 1
            self.connections[tonumber(connection)][i] = 1
        end
        coordinates = {} -- Stored as list of integers
        for coordinate in words[3]:gmatch("[^,]+") do
            table.insert(coordinates, tonumber(coordinate))
        end

        -- Create a new galaxy
        local galaxy = Galaxy(galaxyType, coordinates[1], coordinates[2])
        table.insert(self.galaxies, galaxy)
    end
end