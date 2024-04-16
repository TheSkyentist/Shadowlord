-- Load at start of game
function love.load()
    
    -- Load libraries
    Object = require "lib.classic" -- OOP library
    require "src.player" -- Player class
    require "src.character" -- Character class
    require "src.powerCards" -- Deck of cards class
    require "src.galaxy" -- Galaxy class
    require "src.gameBoard" -- GameBoard class

    -- Create GameBoard
    gameBoard = GameBoard()

    -- Iterate over Elements
    players = {} -- Create players table
    for i, element in ipairs({"Earth", "Fire", "Water", "Air"}) do
        
        -- Create player objects
        player = Player(i, element)

        -- Create Master Character
        table.insert(player.characters, Character(element.." Master", "Master", 10))

        -- TODO
        -- Get one of each type of character
        -- Iterate over character types

        -- Append player to players table
        table.insert(players,player)

    end
end

-- Main game loop
function love.draw()
    gameBoard:draw()
end

-- Update game state
function love.update(dt)
    gameBoard:update(dt)
end