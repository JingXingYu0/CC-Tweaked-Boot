
local function rboot_forward_detect()

    while turtle.detect()==true do
        print("NO")
        turtle.dig()
    end

        turtle.forward()

end
local function rboot_back(number)
    for i=number,1,-1 do
        print(i)
        turtle.back()
    end
end
local function rboot_down(number)
    for i=number,1,-1 do
        print(i)
        turtle.down()
    end
end

local function rboot_digup(number)
    for i=number,1,-1 do
        print(i)
        turtle.digUp()
        turtle.up()
    end
        rboot_down(number)
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


local function rboot_go_dig_1xn(number,forward)


    for i=forward,1,-1 do
    turtle.dig()
    turtle.forward()
    turtle.digDown()
    turtle.digUp()

    end
end

local function rboot_go_dig_nxn(number)
    rboot_go_dig_1xn(number,1)
    turtle.turnRight()
    rboot_go_dig_1xn(number,number)
    rboot_back(number)
    turtle.turnLeft()
    turtle.turnLeft()
    rboot_go_dig_1xn(number,number)
    rboot_back(number)
    turtle.turnRight()
    
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



function main()
    
end

if arg[1]==nil then
    print("NO")
    return 0
end
if arg[2]==nil then
    print("NO")
    return 0
end
j=arg[2]
k=arg[1]
i=1
turtle.up()
rboot_fuel(1, 16,k*2+j*j*3)
for i=1, k ,1 do
rboot_fuel(1, 16,j*2)
rboot_go_dig_nxn(j)
torch(1,15,i)
print("i=",i)
end
rboot_fuel(1, 16, k*1 )
rboot_back(k)
turtle.down()   




