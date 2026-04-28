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
states["HomeTab"] = {
  auto_walkspeed = false,
  auto_jumppower = false,
  auto_size = false,
  walkspeed = 16,
  jumppower = 52,
  size = 2
}

-- Variables
local run_service = game:GetService("RunService")
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
  local args = {
    [1] = "changeSize",
    [2] = value
}

game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer(unpack(args))
end


-- Loops
local auto_size_start_time = tick()

run_service.Heartbeat:Connect(function()
  if states["TabHome"].auto_walkspeed then
    set_walkspeed(states["TabHome"].walkspeed)
  end
  if states["TabHome"].auto_jumppower then
    set_jumppower(states["TabHome"].jumppower)
  end
  if states["TabHome"].auto_size then
    if (tick() - auto_size_start_time) > 1 then
      set_size(states["TabHome"].size)
      auto_size_start_time = 0
    end
  end
end)