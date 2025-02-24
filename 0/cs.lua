local function rboot_forward(number)
    for i=number,1,-1 do
        print(i)
        turtle.forward()
    end
end

local function rboot_back(number)
    for i=number,1,-1 do
        print(i)
        turtle.back()
    end
end


local function rboot_forward_detect()
    while turtle.detect()==true do
        print("NO")
        turtle.dig()
    end

    rboot_forward(1)

end

local function rboot_fuel(tslot, slot,level)
    print("getFuelLevel=",turtle.getFuelLevel())
    while (turtle.getFuelLevel() < level) do
        print("fuel=", turtle.getFuelLevel())
        turtle.select(slot)
        turtle.refuel(1)
        turtle.select(tslot)

    end
end

local function rboot_digup(number)
    for i=number,1,-1 do
        print(i)
        turtle.digUp()
        turtle.up()
    end
        rboot_back(number)
end


local function rboot_go_dig1x3()
    turtle.dig()
    rboot_forward_detect()
    turtle.digDown()
    turtle.digUp()
    
end

local function rboot_go_dig3x3()
    rboot_go_dig1x3()
    turtle.turnRight()
    rboot_go_dig1x3()
    turtle.back()
    turtle.turnLeft()
    turtle.turnLeft()
    rboot_go_dig1x3()
    turtle.back()
    turtle.turnRight()
    
end

