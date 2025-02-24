---@diagnostic disable: lowercase-global
--[[
============== 矿道挖掘程序说明 ==============
使用CC: Tweaked的乌龟机器人API
功能：三维矿道挖掘与自动燃料管理
注意：以下注释仅解释原有代码，不做任何修改
--]]

-- 带障碍检测的前进函数
local function rboot_forward_detect()
    -- 使用turtle.detect()循环检测前方方块
    while turtle.detect() == true do
        print("NO")  -- 输出检测到障碍的提示
        turtle.dig() -- 执行挖掘动作（需要工具支持）
    end
    turtle.forward() -- 无障碍后前进
end

-- 后退指定格数函数
local function rboot_back(number)
    -- 倒序循环执行后退动作
    for i = number, 1, -1 do
        print(i)         -- 输出剩余步数
        turtle.back()    -- 执行后退
    end
end

-- 下降指定层数函数
local function rboot_down(number)
    -- 倒序循环执行下降动作
    for i = number, 1, -1 do
        print(i)        -- 输出剩余层数
        turtle.down()   -- 执行下降
    end
end

-- 向上挖掘并移动函数
local function rboot_digup_go(number)
    -- 倒序循环执行向上挖掘
    for i = number, 1, -1 do
        print(i)         -- 输出剩余层数
        turtle.digUp()   -- 挖掘头顶方块
        turtle.up()      -- 执行上升
    end
end

-- 燃料管理函数
local function rboot_fuel(tslot, slot, level)
    -- 显示当前燃料水平
    print("getFuelLevel=", turtle.getFuelLevel())
    -- 燃料不足时循环补充
    while (turtle.getFuelLevel() < level) do
        print("fuel=", turtle.getFuelLevel())
        turtle.select(slot)  -- 选择燃料槽位
        turtle.refuel(1)     -- 补充1个单位燃料
        turtle.select(tslot) -- 恢复原工具槽位
    end
end

-- 单维度挖掘模式
local function rboot_go_dig_1xn(number, forward, high)
    -- 前进挖掘循环
    for i = forward, 1, -1 do
        turtle.dig()        -- 挖掘前方
        turtle.forward()    -- 前进
        turtle.digDown()    -- 挖掘脚下
        -- 处理垂直方向
        rboot_digup_go(high - 2)  -- 向上挖掘指定层数
        rboot_down(high - 2)      -- 返回原高度
    end
end

-- 三维立体挖掘模式
local function rboot_go_dig_nxnxn(number, high)
    -- 主挖掘路径规划
    rboot_go_dig_1xn(number, 1, high) -- 初始前进
    turtle.turnRight()                -- 右转
    rboot_go_dig_1xn(number, number, high) -- 横向扩展
    rboot_back(number)                -- 返回路径起点
    turtle.turnLeft()                 -- 180度转向
    turtle.turnLeft()
    rboot_go_dig_1xn(number, number, high)
    rboot_back(number)
    turtle.turnRight()                -- 恢复原始朝向
end

-- 火把放置系统
local function torch(tslot, slot, i)
    -- 每8格放置火把
    if i % 8 == 0 then
        print("torch_YES,i=", i)
        turtle.down()       -- 下降到地面层
        -- 检查地面是否存在
        if turtle.detectDown() == false then
            turtle.select(tslot)  -- 选择临时槽位
            turtle.placeDown()    -- 填补地面
        end
        turtle.up()          -- 回到工作层
        turtle.select(slot)  -- 选择火把槽位
        turtle.placeDown()   -- 放置火把
        turtle.select(tslot) -- 恢复工具槽位
    end
end

-- 主程序参数处理
if arg[1]=="h" then  -- 帮助命令
    print("xmx Length Width*2 Height")
    return 0
end

-- 参数直接赋值（建议添加类型检查）
j = arg[2]  -- 宽度参数（实际使用需要*2）
k = arg[1]  -- 长度参数
h = arg[3]  -- 高度参数

-- 初始化燃料
rboot_fuel(1, 16, 255)  -- 使用16号槽位燃料
turtle.up()             -- 起始高度调整

-- 主挖掘循环
for i = 1, k, 1 do
    -- 动态燃料检查（需确保公式准确性）
    rboot_fuel(1, 16, (j * 2 * h * 2) + 32)
    -- 执行三维挖掘
    rboot_go_dig_nxnxn(j, h)
    -- 放置火把
    torch(1, 15, i)  -- 使用15号槽火把
    print("i=", i)
end

-- 返程准备
rboot_fuel(1, 16, k * 1)  -- 返程燃料检查
rboot_back(k)            -- 返回起点
turtle.down()            -- 恢复原始高度
