------------------------
--- Ben Huynh        ---
--- 03/17/2026       ---
--- Farming Turtle   ---
------------------------

------------------------
--- CONFIG: 
------------------------
local function main()
    local block = turtle.inspectDown();
    if(block and block.age == 7)then
        turtle.digDown();
        turtle.select(2);
        turtle.placeDown();
    else if block and block.name == "minecraft::red_wool" then
        turtle.dance();
    end
    turtle.forward()
end


while true do
    main()
end