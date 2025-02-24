local function rboot_forward_detect()
    while turtle.detect()==true do
        print("NO")
        turtle.dig()
    end

        turtle.forward()

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

local function rboot_go_dig1x3()
    turtle.dig()
    rboot_forward_detect()
    turtle.digUp()
    turtle.digDown()
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

local function rboot_back(number)
    for i=number,1,-1 do
        print(i)
        turtle.back()
    end
end

local function torch(tslot,slot,i)
    if i % 8 ==0  then
        print("torch_YES,i=",i)
        turtle.down()
        if turtle.detectDown()==false then
            turtle.select(tslot)
            turtle.placeDown()
        end
        turtle.up()
        turtle.select(slot) 
        turtle.placeDown()
        turtle.select(tslot)
    end
end

if arg[1]==nil then
    print("NO")
    return 0
end
k=arg[1]
i=1
turtle.up()
rboot_fuel(1, 16,k*6)
for i=1, k ,1 do
rboot_fuel(1, 16,16)
rboot_go_dig3x3()
torch(1,15,i)
print("i=",i)
end
rboot_fuel(1, 16, k*1 )
rboot_back(k)
turtle.down()   




