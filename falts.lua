getgenv().config = {
    autoFishing = true, -- true / false 
    placetoFish = "Fishing", -- "Fishing" // "AdvancedFishing"
    invisWater = true, -- make area's water transparent
    
    userToMail = "zBossPT", -- your main's username to mail all Magic Shards to
    amountToMail = 0, -- amount to mail if set to 0 then it sends all
    autoMail = false, -- true / false for below option
    mailTime = "3600", -- how often to send mail (seconds)
    
    --collectMail = false, -- PLANNED FEATURE NOT YET
    --collectTime = "300", -- PLANNED FEATURE NOT YET
    
    autoPresents = false, -- true / false (collects presents on 5 min timer)
    
    -- sendWebhooks = false, -- waiting for executor that supports http
    -- webhookUrl = ""
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2ba71da818277b618eace56f899d9d3e.lua"))()
