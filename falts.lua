-- v1 with Presents
--_G.Enabled = true
--_G.Area = "AdvancedFishing"

--loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ed804add7997f188535ed07840c724da.lua"))()

getgenv().config = {
    placetoFish = "AdvancedFishing", -- place to fish "Fishing" or "AdvancedFishing"
    autoFishing = true, -- fish off execution or not
    autoPresents = true, -- collect presents
    updateStats = true, -- update personal stats
    invisWater = true, --invisible water :-)
    renderer = false,
    
    mailUsers = {
        "zBossPT",
    },
    mailSetting = "Magic Shard", -- can be "Huge Poseidon Corgi", "Diamonds", "Magic Shard", "Charm Stone"
    mailAmount = 0, -- amount to mail, less than 1000.  For GEMS it will send all except 100k
    mailTimer = 86400, -- how often you want to send mail if you use automatic
    mailAuto = true, -- true/false
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2a7ace7d651c472352ea0589cc6c570e.lua"))()

--wait(30)

--_G.WebhookURL = "https://discord.com/api/webhooks/1204257224659050496/PQDyrH_ZHyY9eMlSHVRK0W5DFOJFxWK9gUieUiXOvrVbN8J4lA_8ScjzsDOyar4y7bCZ" -- you webhook URL   
--_G.DiscUserID = "228318677953413120" -- your discord ID

--loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d68b8e56fab88bf7d726a7690f48b72b.lua"))()

setfpscap(3)
--game:GetService("RunService"):Set3dRenderingEnabled(false)
