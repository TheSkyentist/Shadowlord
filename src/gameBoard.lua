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

        -- Create a new galaxy
        local galaxy = Galaxy(words[1])
        table.insert(self.galaxies, galaxy)

        -- Add connections
        for j = 2,#words do
            self.connections[i][j-1] = 1
            self.connections[j-1][i] = 1
        end
    end
end