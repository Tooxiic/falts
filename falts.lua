getgenv().config = {
    autoFish = true,
    placetoFish = "AdvancedFishing",
    autoPresents = true,
    invisWater = true,

    userToMail = "zBossPT",
    autoMail = true,
    sendHuges = true,
    sendShards = true,

    sendDiamonds = true,
    minShards = 500,
    minDiamonds = 10000000,
    keepDiamonds = 100000,
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2c340ba7f63eb21c2e772c76d8d077be.lua"))()

wait(10)

setfpscap(5)
game:GetService("RunService"):Set3dRenderingEnabled(false)
