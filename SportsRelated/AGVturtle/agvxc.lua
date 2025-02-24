-- 调用 turtle.inspectDown() 获取方块信息

local function readblock()
    local success, blockData = turtle.inspectDown()--不了解为什么需要家success,但是给我的感觉是判断
if success then
    -- 获取方块的名称
    local blockName = blockData.name
    print("This is", blockName,"I mind it")
    return blockName
end
end
--读取脚下方块名称信息


Config = io.open("test.txt", "r")
-- 设置默认输入文件为 test.lua
--io.input(Config)
--只要加了这段就出现警告，暂时没法理解为什么会这样
-- 关闭打开的文件
Fowardtag=io.read()
Backtag=io.read()
TurnRight=io.read()
TurnLefttag = io.read()
io.close(Config)
--读取配置文件？然后设定下面方块是什么触发这个
while true do--通过代码实现转向
    if readblock()==Fowardtag then
        turtle.forward()
    end
    if readblock()==Backtag  then
        turtle.back()
    end
    if readblock()== TurnRight then
        turtle.turnRight()
        turtle.forward()
    end
    if readblock()==TurnLefttag   then
        turtle.turnLeft()
        turtle.forward()
    end

end
