local nyx_hub = getgenv().Nyx_Hub
local window = nyx_hub.window
local tabs = nyx_hub.tabs
local states = nyx_hub.states
local objects = nyx_hub.objects

tabs["HomeTab"] = window:CreateTab("Home")

local tab = tabs["HomeTab"]
