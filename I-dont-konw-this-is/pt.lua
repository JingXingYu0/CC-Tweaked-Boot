--[[a=0
b=15
s=1
local m = { }
pt=m
function m.q()
    while( a < 15 )
    do
        
        while(turtle.getItemCount()<1)
        do
            print("s",s)
            turtle.select(s)
            s=s+1
             while(s==15)
               do
               s=1
              end
          end
        print("a=", a)
        a = a+1
        turtle.placeDown()
        turtle.forward()
        turtle.getFuelLevel()
        while(turtle.getFuelLevel()<16)
        do 
                 print("f=",f)
                for f=1,16 do print(f)
                turtle.select(f)
                turtle.refuel()
                turtle.select(1)   
                end
        print("FuelLevel",turtle.getFuelLevel())
         end
    end
    a=0
end
--[[
m.q()
while(b>=1)
do

turtle.turnRight()
m.q()
turtle.turnRight()
m.q()
b=b-1
turtle.turnRight()
m.q()
print("faurr")
end
螺旋代码（废弃）
]]--
--[[
while(b>=1)
do
m.q()
turtle.turnRight()
turtle.placeDown()
turtle.forward()
print("b=",b)
turtle.turnRight()
b=b-1
m.q()
turtle.turnLeft()
turtle.placeDown()
turtle.forward()
print("b=",b)
turtle.turnLeft()
b=b-1
end
]]--