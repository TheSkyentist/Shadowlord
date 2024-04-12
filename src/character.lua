-- Create character object
Character = Object:extend()

-- Character Constructor
function Character:new(name,class,strength)
    self.name = name
    self.class = class
    self.strength = strength
    self.cards = {}
    self.powerStone = false
    self.numSpaceships = 0
end

-- 