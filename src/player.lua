-- create player object
Player = Object:extend()

-- player constructor
function Player:new(name, element)
    self.characters = {}
    self.element = element
    self.hand = {}
    self.name = name
end

