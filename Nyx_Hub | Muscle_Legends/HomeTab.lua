-- Nyx_Hub
local nyx_hub = getgenv().Nyx_Hub
local window = nyx_hub.window
local tabs = nyx_hub.tabs
local states = nyx_hub.states
local objects = nyx_hub.objects
local functions = nyx_hub.functions
local get_player_character = functions["get_player_character"]
local get_character_instance = functions["get_character_instance"]

-- Tab creation
tabs["HomeTab"] = window:CreateTab("Home")

-- Variables
local players = game:GetService("Players")
local player = players.LocalPlayer

-- Tab
local tab = tabs["HomeTab"]

-- Functions
function set_walkspeed(value)
  local character = get_player_character(player)
  if character then
    local humanoid = get_character_instance(character,"Humanoid")
    if humanoid then
      humanoid.WalkSpeed = value
    end
  end
end

function set_jumppower(value)
  local character = get_player_character(player)
  if character then
    local humanoid = get_character_instance(character,"Humanoid")
    if humanoid then
      humanoid.JumpPower = value
    end
  end
end

function set_size(value)
  
end