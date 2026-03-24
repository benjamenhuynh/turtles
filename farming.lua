------------------------
--- Ben Huynh        ---
--- 03/17/2026       ---
--- Farming Turtle   ---
------------------------

------------------------
--- CONFIG: 
------------------------
local farmArr = {"minecraft:carrots", "minecraft:potatoes", "minecraft:wheat"}
local woolPairs = { {"white", "red"}}
--, {"red", "yellow"}, {"yellow", "gray"} 
local startingBlockIndex = 1


function main()
    checkFuel()
    checkBlock()
end


function checkBlock()
    local isBlock, block = turtle.inspectDown()
    if isBlock then
        print("Block found" .. block.name)

        for i, pair in ipairs(woolPairs) do
            local foundOrange = false
            while not foundOrange do
                if block.name == "minecraft:wool" then
                    if block.state.color == "orange" then
                        print("Block is orange wool - chest found!")
                        findChest()
                        foundOrange = true
                    elseif block.state.color == pair[1] then
                        print("Block is starting wool: " .. block.state.color)
                        -- starting turns
                        turtle.turnRight()
                        turtle.forward()
                        turtle.turnRight()
                        turtle.forward()
                    elseif block.state.color == pair[2] then
                        print("Block is ending wool: " .. block.state.color)
                        -- ending turns
                        turtle.turnLeft()
                        turtle.forward()
                        turtle.turnLeft()
                        turtle.forward()
                    else
                        for i = 1, #farmArr do
                            if block.name == farmArr[i] and block.state.age == 7 then
                                turtle.dig()
                                turtle.placeDown()     
                            end
                        end
                    end
                    turtle.forward()
                end
            end
        end
    else
        print("No block detected.")
        turtle.suckDown()
        turtle.placeDown()
        turtle.forward()
    end
end


function checkFuel()
    local fuelLevel = turtle.getFuelLevel()
    if fuelLevel < 200 then
        print("Low fuel: " .. fuelLevel)
        turtle.select(1)
        turtle.refuel(1)
    else
        print("Fuel level is sufficient: " .. fuelLevel)
    end
end


function emptyInventory()
    for i = 2, 16 do
        turtle.select(i)
        turtle.dropUp()
    end
end


function findChest()
    local foundChest = false
    local isBlock, block = turtle.inspectUp()

    turtle.turnLeft()

    while not foundChest do
        if isBlock and block.name == "minecraft:chest" then
            print("Chest found above!")
            emptyInventory()
            foundChest = true
        else
            isBlock, block = turtle.inspectUp()
        end
        turtle.forward()
    end
    
end

while true do
    main()
end