-- Create character object
Character = Object:extend()

-- Character Constructor
function Character:new(name,characterType,strength)
    self.name = name
    self.characterType = characterType
    self.strength = strength
    self.cards = {}
    self.powerStone = false
    self.numSpaceships = 0
    self.player = nil
end

-- Load Available Characters
availableCharacters = {}

-- Open a file and iterate over lines
for line in io.lines("assets/characters.tsv") do

    -- Split line on tabs
    local words = {}
    for word in line:gmatch("[^\t]+") do
        table.insert(words, word)
    end

    -- Create a new character
    local character = Character(words[1], words[2], tonumber(words[3]))
    table.insert(availableCharacters, character)
end