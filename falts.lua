-- v1 with Presents
--_G.Enabled = true
--_G.Area = "AdvancedFishing"

--loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ed804add7997f188535ed07840c724da.lua"))()

getgenv().config = {                 
    autoFishing = true,              -- farm off execution or not
    placetoFish = "AdvancedFishing", -- "Fishing" // "AdvancedFishing"
    invisWater = true,                  -- make water transparent
    autoPresents = true,              -- auto collect presents

    autoMail = false,                  -- true // false
    autoMailUsers = {                 
        "Username1",                 -- Usernames to auto mail
        "Username2",                 -- can add as many as you want
    },
    autoMailItem = "",                 -- "Magic Shards" // "Huge Poseidon Corgi"
    autoMailAmount = 0,              -- amount to auto mail (for shards)
    autoMailTimer = 300,              -- custom timer (seconds)

    manualMailUsers = {
        "Username1",                 -- Usernames to manual mail
        "Username2",                 -- can add as many as you want
    },
    manualMailItem = "",             -- "Magic Shards" // "Huge Poseidon Corgi"
    manualMailAmount = 0,              -- amount to manually mail
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/e7295942a8e53136487f943515e8fd8b.lua"))()

setfpscap(3)
--game:GetService("RunService"):Set3dRenderingEnabled(false)
