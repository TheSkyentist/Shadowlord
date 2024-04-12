-- Create character object
Character = Object:extend()

-- Character Constructor
function Character:new(name,type,strength)
    self.name = name
    self.characterType = class
    self.strength = strength
    self.cards = {}
    self.powerStone = false
    self.numSpaceships = 0
end

-- Available Characters
availableCharacters = {}

-- Add Warrior Characters
for i,name in ipairs({"Randi","Holger","Viggo","Sten","Astrid","Axel","Bernhard","Kaare"}) do
    table.insert(availableCharacters,Character(name, "Warrior", 6))
end

-- Add Merchant Characters
for i,name in ipairs({"Vang","Svein","Faye","Folke","Selwyn","Arne","Elayne","Brandon"}) do
    table.insert(availableCharacters,Character(name, "Merchant", 3))
end

-- Add Diplomat Characters
for i,name in ipairs({"Elfrida","Sigurd","Bors","Gye","Erling","Ola","Deems","Aage"}) do
    table.insert(availableCharacters,Character(name, "Diplomat", 0))
end

-- Add Shadow Characters
for i,name in ipairs({"Marshal Lynx", "Marshal Racson"}) do
    table.insert(availableCharacters,Character(name, "Shadow", 3))
end
for i,name in ipairs({"The Iron Claw", "Baron Cruel", "Count Hector", "Count Gwyth", "Duke Halifax"}) do
    table.insert(availableCharacters,Character(name, "Shadow", 6))
end
for i,name in ipairs({"Invincible Darkness"}) do
    table.insert(availableCharacters,Character(name, "Shadow", 10))
end