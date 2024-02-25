wait(5)

getgenv().config = {
    autoFish = true,
    placetoFish = "AdvancedFishing",
    autoPresents = true,
    --[[
    autoClaimMail = true,
    userToMail = "",
    autoMail = false,
    sendHuges = true,
    sendShards = true,

    sendDiamonds = true,
    minShards = 100,
    minDiamonds = 1050000,
    keepDiamonds = 50000,
    ]]
    setDelay = false,
    numDelay = 10, 

    randomDelay = true,
    minNum = 1,
    maxNum = 5,
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2c340ba7f63eb21c2e772c76d8d077be.lua"))()

wait(10)

setfpscap(15)
--game:GetService("RunService"):Set3dRenderingEnabled(false)
