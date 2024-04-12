-- Load at start of game
function love.load()
    Object = require "lib.classic" -- OOP library
end

-- Main game loop
function love.draw()
    love.graphics.print('Hello World!', 400, 300)
end

-- Update game state
function love.update(dt)

end