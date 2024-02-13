local BigChests = {
    [1] = "Beach",
    [2] = "Underworld",
    [3] = "No Path Forest",
    [4] = "Heaven Gates"
}

repeat
    task.wait()
until game:IsLoaded()

local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Library = ReplicatedStorage:WaitForChild("Library")
local Client = Library:WaitForChild("Client")
local LocalPlayer = game:GetService("Players").LocalPlayer

local zonePath

local function trim(string)
    if not string then
        return false
    end
    return string:match("^%s*(.-)%s*$")
end

local function split(input, separator)
    if separator == nil then
        separator = "%s"
    end
    local parts = {}
    for str in string.gmatch(input, "([^" .. separator .. "]+)") do
        table.insert(parts, str)
    end
    return parts
end


local function teleportToZone(selectedZone)
    local teleported = false

    while not teleported do
        for _, v in pairs(Workspace.Map:GetChildren()) do
            local zoneName = trim(split(v.Name, "|")[2])
            if zoneName and zoneName == selectedZone then
                LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map[v.Name].PERSISTENT.Teleport.CFrame
                teleported = true
                break
            end
        end
        task.wait()
    end
end

local function waitForLoad(zone)
    for _, v in pairs(Workspace.Map:GetChildren()) do
        local zoneName = trim(split(v.Name, "|")[2])
        if zoneName and zoneName == zone then
            zonePath = game:GetService("Workspace").Map[v.Name]
            break
        end
    end

    if not zonePath:FindFirstChild("INTERACT") then
        local loaded = false
        local detectLoad = zonePath.ChildAdded:Connect(function(child)
            if child.Name == "INTERACT" then
                loaded = true
            end
        end)

        repeat
            task.wait()
        until loaded

        detectLoad:Disconnect()
    end

    local function getBreakZonesAmount()
        local counter = 0
        for _ in pairs(zonePath.INTERACT.BREAK_ZONES:GetChildren()) do
            counter = counter + 1
        end
        return counter
    end

    if getBreakZonesAmount() < 2 then
        local loaded = false
        local detectLoad = zonePath.INTERACT.BREAK_ZONES.ChildAdded:Connect(function(child)
            if getBreakZonesAmount() == 2 then
                loaded = true
            end
        end)
        repeat
            task.wait()
        until loaded
        detectLoad:Disconnect()
    end
end


local function breakChest(zone)

    local chest
    while not chest do
        for v in require(Client.BreakableCmds).AllByZoneAndClass(zone, "Chest") do
            chest = v
            break
        end
        task.wait()
    end

    local args = {
        [1] = {

        }
    }

    for petId, _ in pairs(require(Client.Save).Get(LocalPlayer).EquippedPets) do
        args[1][petId] = {
            ["targetValue"] = chest,
            ["targetType"] = "Player"
        }
    end

    game:GetService("ReplicatedStorage").Network.Pets_SetTargetBulk:FireServer(unpack(args))

    local brokeChest = false
    local breakableRemovedService = Workspace:WaitForChild("__THINGS").Breakables.ChildRemoved:Connect(function(breakable)
        if breakable.Name == chest then
            brokeChest = true
            print("Broke chest")
        end
    end)

    repeat
        task.wait()
    until brokeChest

    breakableRemovedService:Disconnect()
end



require(Library.Client.PlayerPet).CalculateSpeedMultiplier = function()
    return 200
end

local sortedKeys = {}
for key in pairs(BigChests) do
    table.insert(sortedKeys, key)
end
table.sort(sortedKeys)

for _, key in ipairs(sortedKeys) do
    local zoneName = BigChests[key]

    print("Starting " .. zoneName)

    teleportToZone(zoneName)
    waitForLoad(zoneName)
    task.wait()

    task.wait(2)
    for _, v in pairs(game:GetService("Workspace").__DEBRIS:GetChildren()) do

        if v.Name == "host" then
            local timer

            pcall(function()
                timer = v.ChestTimer.Timer.Text
            end)

            if timer ~= nil then
                if timer == "00:00" or timer == "09:59" then
                    print(zoneName .. " chest is available")
                    LocalPlayer.Character.HumanoidRootPart.CFrame = zonePath.INTERACT.BREAKABLE_SPAWNS.Boss.CFrame
                    breakChest(zoneName)
                else
                    print(zoneName .. " chest is not available " .. timer)
                end
                v:Destroy()
                break
            end
        end
    end
    warn("Finished " .. zoneName)
end

print("Server hopping")

task.wait()

local sfUrl = "https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=%s&excludeFullGames=true" 
local req = request({ Url = string.format(sfUrl, 8737899170, "Desc", 50) }) 
local body = game:GetService("HttpService"):JSONDecode(req.Body) 
local deep = math.random(1, 3)
if deep > 1 then
    for i = 1, deep, 1 do
        req = request({ Url = string.format(sfUrl .. "&cursor=" .. body.nextPageCursor, 8737899170, "Desc", 50) }) 
        body = game:GetService("HttpService"):JSONDecode(req.Body) 
        task.wait(0.1)
    end
end
local servers = {} 
if body and body.data then
    for i, v in next, body.data do
        if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
            table.insert(servers, 1, v.id)
        end
    end
end
local randomCount = #servers
if not randomCount then
    randomCount = 2
end
while true do
    game:GetService("TeleportService"):TeleportToPlaceInstance(8737899170, servers[math.random(1, randomCount)], LocalPlayer)
    task.wait(0.5)
    game:GetService("TeleportService"):Teleport(8737899170, LocalPlayer)
end
