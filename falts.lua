task.wait(10)
-- v1 with Presents
getgenv().config = {
    autoFishing = true,              -- farm off execution or not
    placetoFish = "AdvancedFishing", -- "Fishing" // "AdvancedFishing"
    sendReels = false,                  -- send reels webhooks
    reelsUrl = "",                     -- webhook URL for reels
    invisWater = true,                  -- make water transparent

    autoPresents = true,              -- auto collect presents
    sendPresents = false,             -- send presents webhooks
    presentsUrl = "",                 -- webhook URL for presents
    
    autoDaycare = false,              -- configurable auto daycare     
    petToEnroll = "",                 -- name of pet to enroll
    enrollpetType = 2,                 -- 1=Golden, 2=Rainbow, 0=Regular
    
    autoMerchants = true,             -- auto buy from merchants
    autoVendings = false,              -- auto buy from machines

    autoMail = false,                  -- true // false
    userToMail = "",                  -- Username to auto mail
    amountToMail = 0,                  -- Amount to Mail // 0 sends all
    mailTimer = 300,                  -- custom timer (seconds)
    
    manualMailUsernames = {             -- option to be able to mail different accounts with GUI button
        "Username1",
        "Username2",
    }
    
    --autoCollectMail = false,
    --collectTimer = "300",
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/92e9e3513b3d3359d311cccd6c5ef57c.lua"))()
setfpscap(5)
--game:GetService("RunService"):Set3dRenderingEnabled(false)
