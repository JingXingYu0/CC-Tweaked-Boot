--turtle.place(1)

local function ItemBlacklistCheck(blockNameInPut)
    ItemBlacklist= io.open("ItemBlacklist.txt", "r")
    io.input(ItemBlacklist)
    while true do
        local item=io.read()

        if blockNameInPut==item then
            print("The",item,"ItemBlacklistCheck have")
            return 0
        end
        if item==nil then
            print("The Item Clear")
            io.close(ItemBlacklist)
            return 1
        end
    end
end

local function F_Item_Count_Excessive_Clear ()
    for i=1, 16 ,1 do
        --print(textutils.serialise(turtle.getItemDetail(i)))
        local blockData = turtle.getItemDetail(i)--不了解为什么需要家success,但是给我的感觉是判断
        -- 获取方块的名称
        if blockData~=nil then
            local blockName = blockData.name
            local blockcount =  blockData.count
            --File = io.open("test.txt", "a")
            --io.output(File)
            --io.write(blockName,"\n")
            --io.close(File)
            --print(blockName,blockcount)
            if ItemBlacklistCheck(blockName)==1 then
                turtle.select(i)
                turtle.drop()
            end
        else
            return 1
        end
    end
    return 0
end

local function F_Item_Count_Excessive_Check ()
    for i=1, 16 ,1 do
        --print(textutils.serialise(turtle.getItemDetail(i)))
        local blockData = turtle.getItemDetail(i)
        -- 获取方块的名称
        if blockData~=nil then
            local blockName = blockData.name
            local blockcount =  blockData.count
            --File = io.open("test.txt", "a")
            --io.output(File)
            --io.write(blockName,"\n")
            --io.close(File)
            --print(blockName,blockcount)
        else
            return 1
        end
    end
    return 0
end

print()
turtle.select(1)
Item_Count_Excessive_Check = F_Item_Count_Excessive_Check()
if Item_Count_Excessive_Check==0 then
    for i=1, 16 ,1 do
        local blockData = turtle.getItemDetail(i)
        local blockName = blockData.name
        if blockName=="minecraft:barrel" then
            print(blockName)
            turtle.select(i)
            turtle.place()
            F_Item_Count_Excessive_Clear()
        end
    end
    end

turtle.select(1)
