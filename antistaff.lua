local WAITING = false

local function serverhop(player)
    local timeToWait = Random.new():NextInteger(300, 600)
    print("[ANTI-STAFF] BIG Games staff (" .. player.Name ..  ") is in server! Waiting for " .. tostring(timeToWait) .. " seconds before server hopping...")
    task.wait(timeToWait)

    local success, _ = pcall(function()
        local gameId = game.PlaceId

        local function getServer()
            local servers = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. tostring(gameId) .. '/servers/Public?sortOrder=Asc&limit=100')).data
            local server = servers[Random.new():NextInteger(1, 100)]
            if server then
                return server
            else
                return getServer()
            end
        end
        
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getServer().id, game.Players.LocalPlayer)
        
        task.wait(10)
        while true do
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
            task.wait()
        end
    end)

    if not success then
        game.Players.LocalPlayer:Kick("[ANTI-STAFF] A BIG Games staff member joined and script was unable to server hop")
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player:IsInGroup(5060810) then
        WAITING = true
        serverhop(player)
    end
    print("[ANTI-STAFF] No staff member detected")
end

game.Players.PlayerAdded:Connect(function(player)
    if player:IsInGroup(5060810) and not WAITING then
        getgenv().autoBalloon = false
        getgenv().autoChest = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        local _, zoneData = require(game:GetService("ReplicatedStorage").Library.Util.ZonesUtil).GetZoneFromNumber(Random.new():NextInteger(40, 90))
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map[tostring(zoneData["_script"])].PERSISTENT.Teleport.CFrame

        serverhop(player)
    end
end)
