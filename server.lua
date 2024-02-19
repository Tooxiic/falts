local SERVER_URL = "http://192.168.4.3:8080/"

local data = request(
    {
        Url = SERVER_URL,
        Method = "GET"
    }
)

local heartbeatDelay = game.HttpService:JSONDecode(data.Body)["heartbeatDelay"]

local function sendRequest(reqType)
    return request(
        {
            Url = SERVER_URL,
            Method = "POST",
            Body = {
                requestType = reqType,
                account = game:GetService("Players").LocalPlayer.Name
            }
        }
    )
end

sendRequest("START")

game:GetService("NetworkClient").ChildRemoved:Connect(function()
    while true do
        sendRequest("DISCONNECTED")
        task.wait(1)
    end
end)

while true do
    sendRequest("HEARTBEAT")
    task.wait(heartbeatDelay)
end
