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

objects["HomeTab"]["walkspeed_slider"] = tab:CreateSlider({
    Name = "walkspeed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = 16,
    Callback = function(value)
      states["HomeTab"].walkspeed = value
    end
})

objects["HomeTab"]["walkspeed_toggle"] = tab:CreateToggle({
    Name = "auto walkspeed",
    CurrentValue = false,
    Callback = function(state)
      states["HomeTab"].auto_walkspeed = state
    end
})

objects["HomeTab"]["jumppower_slider"] = tab:CreateSlider({
    Name = "jumppower",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = 16,
    Callback = function(value)
      states["HomeTab"].jumppower = value
    end
})

objects["HomeTab"]["jumppower_toggle"] = tab:CreateToggle({
    Name = "auto jumppower",
    CurrentValue = false,
    Callback = function(state)
      states["HomeTab"].auto_jumppower = state
    end
})

objects["HomeTab"]["size_slider"] = tab:CreateSlider({
    Name = "size",
    Range = {0, 100},
    Increment = 1,
    Suffix = "studs/s",
    CurrentValue = 1,
    Callback = function(value)
      states["HomeTab"].size = value
    end
})

objects["HomeTab"]["size_toggle"] = tab:CreateToggle({
    Name = "auto size",
    CurrentValue = false,
    Callback = function(state)
      states["HomeTab"].auto_size = state
    end
})


-- Loops
local auto_size_start_time = tick()

run_service.Heartbeat:Connect(function()
  if states["HomeTab"].auto_walkspeed then
    set_walkspeed(states["HomeTab"].walkspeed)
  end
  if states["HomeTab"].auto_jumppower then
    set_jumppower(states["HomeTab"].jumppower)
  end
  if states["HomeTab"].auto_size then
    if (tick() - auto_size_start_time) > 1 then
      set_size(states["HomeTab"].size)
      auto_size_start_time = tick()
    end
  end
end)