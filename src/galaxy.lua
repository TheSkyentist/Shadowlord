-- create galaxy object
Galaxy = Object:extend()

-- galaxy constructor
function Galaxy:new(type, ID, connectingGalaxies)
    self.galaxyType = type
    self.galaxyID = ID
    self.connectingGalaxies = {connectingGalaxies}
    self.occupyingCharacters = {}
    self.spaceships = {}
    -- need to add some way to get to **Character** (face-down circle)
end

galaxyList = {}

    table.insert(galaxyList, Galaxy("Home Planet 1", 1, {13,14,15}))
    table.insert(galaxyList, Galaxy("Home Planet 2", 2, {17,20,24}))
    table.insert(galaxyList, Galaxy("Home Planet 3", 3, {19,23,26}))
    table.insert(galaxyList, Galaxy("Home Planet 4", 4, {29,28,27}))

    table.insert(galaxyList, Galaxy("Starport 1", 5, {14,17}))
    table.insert(galaxyList, Galaxy("Starport 2", 6, {16,19}))
    table.insert(galaxyList, Galaxy("Starport 3", 7, {24,27}))
    table.insert(galaxyList, Galaxy("Starport 4", 8, {26,29}))

    table.insert(galaxyList, Galaxy("Ruins 1", 9, {13,14,17,18,21}))
    table.insert(galaxyList, Galaxy("Ruins 2", 10, {13,16,18,19,22}))
    table.insert(galaxyList, Galaxy("Ruins 3", 11, {13,21,24,25,27}))
    table.insert(galaxyList, Galaxy("Ruins 4", 12, {13,22,25,26,29}))
    
    table.insert(galaxyList, Galaxy("Lost Kingdom", 13, {9,10,11,12}))
    
    table.insert(galaxyList, Galaxy("Galaxy 14", 14, {1,5,9,15}))
    table.insert(galaxyList, Galaxy("Galaxy 15", 15, {1,14,16,18}))
    table.insert(galaxyList, Galaxy("Galaxy 16", 16, {1,6,15,10}))
    table.insert(galaxyList, Galaxy("Galaxy 17", 17, {2,5,9,20}))
    table.insert(galaxyList, Galaxy("Galaxy 18", 18, {9,10,15}))
    table.insert(galaxyList, Galaxy("Galaxy 19", 19, {3,6,10,23}))
    table.insert(galaxyList, Galaxy("Galaxy 20", 20, {2,17,21,24}))
    table.insert(galaxyList, Galaxy("Galaxy 21", 21, {9,11,20}))
    table.insert(galaxyList, Galaxy("Galaxy 22", 22, {10,12,23}))
    table.insert(galaxyList, Galaxy("Galaxy 23", 23, {3,19,22,26}))
    table.insert(galaxyList, Galaxy("Galaxy 24", 24, {2,7,20,11}))
    table.insert(galaxyList, Galaxy("Galaxy 25", 25, {11,12,28}))
    table.insert(galaxyList, Galaxy("Galaxy 26", 26, {3,8,12,23}))
    table.insert(galaxyList, Galaxy("Galaxy 27", 27, {4,7,11,28}))
    table.insert(galaxyList, Galaxy("Galaxy 28", 28, {4,25,27,29}))
    table.insert(galaxyList, Galaxy("Galaxy 29", 29, {4,8,12,28}))

    print(galaxyList[1].galaxyType)
    print(galaxyList[1].galaxyID)

    for i=1,#galaxyList do
        print(galaxyList[i].galaxyType)
        print(galaxyList[i].galaxyID)
        
        for j = 1,#galaxyList[i].connectingGalaxies[1] do
            print(galaxyList[i].connectingGalaxies[1][j])
        end
    end