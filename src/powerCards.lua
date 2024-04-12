-- create powercards object
PowerCards = Object:extend()

-- powercards constructor, generates a sorted deck of cards
function PowerCards:new()

    -- Create deck table
    self.deck = {}

    -- Create the deck from the template 
    local deckTemplate = {{0,8},{2,16},{4,15},{7,10},{10,2}}
    for i,card in ipairs(deckTemplate) do
        for j = 1, card[2] do
            table.insert(self.deck, card[1])
        end
    end
    
end

-- draws a random card from the deck, shrinks the deck by 1.
function PowerCards:draw()
    return table.remove(self.deck, love.math.random(1, #self.deck))
end

-- Test if deck is empty
function PowerCards:isEmpty()
    return #self.deck == 0
end