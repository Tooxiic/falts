getgenv().AuthKey = "HUGE_jBFvQnaZ3P5s"
getgenv().LoadSettings = {
    Example_Setting = Example_Value
}
loadstring(game:HttpGet("https://hugegames.io/ps99"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Tooxiic/falts/main/autorejoiner.lua"))()
getgenv().autoChest = true

getgenv().autoChestConfig = {
    START_DELAY = 3, -- delay before starting
    SEND_PETS = true, -- send pets to break chests (if false, it shouldn't interfere with autofarm)
    SERVER_HOP = true, -- server hop after breaking all chests
    SERVER_HOP_DELAY = 1, -- delay in seconds before server hopping (set to 0 for no delay)
    CHEST_BREAK_DELAY = 2, -- delay before breaking next chest
    TIMER_SEARCH_DELAY = 3 -- if you are crashing or lagging, increase this value, otherwise leave it as is
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/fdvll/pet-simulator-99/main/autoChest.lua"))()
