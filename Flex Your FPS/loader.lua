-- // Get PlaceName //
local cloneref = cloneref or function(o) return o end
local Place = cloneref(game:GetService("MarketplaceService")):GetProductInfo(game.PlaceId)

-- // Library //
local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window(Place.Name)
local serv = win:Server("Script", "")
local main = serv:Channel("main")

-- // Settings //
getgenv().FakePing = false
getgenv().Ping = 0


main:Toggle("Fake Ping",false, function(bool)
getgenv().FakePing = bool
end)


main:Slider("Ping (Slider)", 0, 2500, 400, function(t)
getgenv().Ping = t
end)


main:Textbox("Ping (Textbox)", "Type here!", true, function(t)
if string.lower(t) == "math.huge" or string.lower(t) == "inf" then
getgenv().Ping = math.huge
elseif string.lower(t) == "nan" then
getgenv().Ping = math.huge - math.huge
end
getgenv().Ping = tonumber(t)
end)

main:Label([[infinity = "inf"]])
main:Label([[nan = "nan"]])


game:GetService("RunService").Heartbeat:Connect(function()
if getgenv().FakePing then
game:GetService("ReplicatedStorage").PingRem:FireServer(getgenv().Ping)
end
end)
