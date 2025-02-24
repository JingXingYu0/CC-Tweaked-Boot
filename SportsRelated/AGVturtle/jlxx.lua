-- 调用 turtle.inspectDown() 获取方块信息

local function writenblock()
    local success, blockData = turtle.inspectDown()
if success then
    -- 获取方块的名称
    local blockName = blockData.name
    print( blockName)
    File = io.open("test.txt", "a")
    --io.output(File)
    io.write(blockName ,"\n")
    io.close(File)
    --写入方块名称
end
end

--主程序用来获取机器前下方的四个方块的信息
    for i=4, 1 , -1 do
        writenblock()
        turtle.forward()
    end
