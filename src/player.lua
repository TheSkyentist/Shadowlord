-- create player object
Player = Object:extend()

-- player constructor
function Player:new(name, element, color)
    self.name = name
    self.element = element
    self.color = color
    self.characters = {}
    self.hand = {}
end