-- create powercards object
PowerCards = Object:extend()

-- powercards constructor, generates a sorted deck of cards
function PowerCards:new()
    self.deck = {}

    for i = 1,8 do
         table.insert(self.deck, 0)
    end
    
    for i = 9,23 do
        table.insert(self.deck, 2)
    end

    for i = 24,38 do 
        table.insert(self.deck, 4)
    end

    for i = 39, 48 do
        table.insert(self.deck, 7)
    end

    for i = 49,50 do
        table.insert(self.deck, 10)
    end

end

-- draws a random card from the deck, shrinks the deck by 1.
function PowerCards:draw()
    indexDrawn = love.math.random(1, #self.deck)
    cardDrawn = self.deck[indexDrawn]
    table.remove(self.deck, indexDrawn)
end