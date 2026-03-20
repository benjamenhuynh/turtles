------------------------
--- Ben Huynh        ---
--- 03/17/2026       ---
--- Farming Turtle   ---
------------------------

------------------------
--- CONFIG: 
------------------------
function main()
    checkFuel();
    checkBlock();

end

function checkBlock()
    local isBlock, block = turtle.inspectDown();
   
    if isBlock then
        print("Block found" .. block.name);
        -- make an array of blocks that are considered farmland check the array 
        -- need a second pair of arrays that check if the block is a colored wool 
        if block.name == "minecraft:carrots" then
            print("Block is farmland.");
            
        else
            print("Block is not farmland: " .. data.name);
            return false;
        end
    else
        print("No block detected.");
        turtle.suckDown();
        turtle.placeDown();
        turtle.forward();
        return false;
    end
end
function checkFuel()s
    local fuelLevel = turtle.getFuelLevel();
    if fuelLevel < 200 then
        print("Low fuel: " .. fuelLevel);
        turtle.select(1);
        turtle.refuel(1);
    else
        print("Fuel level is sufficient: " .. fuelLevel);
    end
end