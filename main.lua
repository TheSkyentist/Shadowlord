-- Load at start of game
function love.load()
    
    -- Load libraries
    Object = require "lib.classic" -- OOP library
    require "src.player" -- Player class
    require "src.character" -- Character class
    require "src.powerCards" -- Deck of cards class
    require "src.galaxy" -- Galaxy class
    require "src.gameBoard" -- GameBoard class
    require "src.information" -- Information Box class

    -- Create GameBoard
    gameBoard = GameBoard()

    -- create Information Box
    informationBox = Information()

    -- Iterate over Elements
    players = {} -- Create players table
    for i, element in ipairs({"Earth", "Fire", "Water", "Air"}) do
        
        -- Create player objects
        local player = Player(i, element)

        -- Create Master Character
        table.insert(player.characters, Character(element.." Master", "Master", 10))
        
        -- Start with one Warrior and one Diplomat
        for  j, characterType in ipairs({"Warrior", "Diplomat"}) do

            -- Get indices of available characters
            local available = {}
            for k,character in ipairs(availableCharacters) do
                if character.characterType == characterType then
                    table.insert(available, k)
                end
            end

            -- Get random character            
            table.insert(
                player.characters,
                table.remove(availableCharacters,available[love.math.random(1,#available)])
            )
        end

        -- Give each player character a saceship
        for j, character in ipairs(player.characters) do
            character.numSpaceships = 1
        end

        -- Append player to players table
        table.insert(players,player)

    end

    -- Add remaining Characters to the game board
    for i, galaxy in ipairs(gameBoard.galaxies) do
        
        -- Get random character if on a valid galaxy
        if (galaxy.galaxyType ~= "Lost Kingdom") and (galaxy.galaxyType ~= "Home")then
            galaxy.faceDownCharacter = table.remove(availableCharacters,love.math.random(1,#availableCharacters))
        end

    end

    -- Decide which player goes first
    currentPlayer = love.math.random(1,#players) -- Index of current player

    -- Place each player on each home galaxy
    -- Clockwise turn order
    for i,index in ipairs({1,12,29,18}) do

        -- Place player characters on galaxy
        galaxy = gameBoard.galaxies[index]
        for j, character in ipairs(players[currentPlayer].characters) do
            table.insert(galaxy.occupyingCharacters, character)
        end

        -- Increment player
        currentPlayer = (currentPlayer % #players) + 1
    end

    -- Create Power Cards
    powerCards = PowerCards()
    
end

-- Main game loop
function love.draw()
    gameBoard:draw()
    informationBox:draw()
end

-- Update game state
function love.update(dt)
    gameBoard:update(dt)
end 