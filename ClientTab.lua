local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local Window = getgenv().Window
local Client = Players.LocalPlayer

function GetCharacter(Player)
  return Player and Player.Character or nil
end

function GetCharacterInstance(Character,Instance)
  return Character and Character:FindFirstChild(Instance,true) or nil
end

if not Window then warn("No se encontro la Window: ClientTab") return end

local ClientTab = Window:CreateTab("Client")
local MovementSection = ClientTab:CreateSection("Movement")

local WalkSpeedState = false

function SetWalkSpeed(WalkSpeed)
  local Character = GetCharacter(Client)
  if Character then
    local Humanoid = GetCharacterInstance(Character,"Humanoid")
    if Humanoid then
      Humanoid.WalkSpeed = WalkSpeed
    end
  end
end

local JumpPowerState = false

function SetJumpPower(JumpPower)
  local Character = GetCharacter(Client)
  if Character then
    local Humanoid = GetCharacterInstance(Character,"Humanoid")
    if Humanoid then
      Humanoid.JumpPower = JumpPower
    end
  end
end

local NoclipState = false

function SetNoclip(State)
  local Character = GetCharacter(Client)
  if Character then
    for i,v in ipairs(Character:GetDescendants()) do
      if v:IsA("BasePart") then
        v.CanCollide = not State
      end
    end
  end
end

local FloatState = false

function StartFloat()
  Workspace.Gravity = 0
  local Character = GetCharacter(Client)
  if Character then
    local Humanoid = GetCharacterInstance(Character,"Humanoid")
    if Humanoid then
      Humanoid.PlatformStand = true
      FloatState = true
    else
      Workspace.Gravity = 192
    end
  else
    Workspace.Gravity = 192
  end
end

function StopFloat()
  FloatState = false
  Workspace.Gravity = 192
  local Character = GetCharacter(Client)
  if Character then
    local Humanoid = GetCharacterInstance(Character,"Humanoid")
    if Humanoid then
      Humanoid.PlatformStand = false
    else
      Workspace.Gravity = 192
    end
  else
    Workspace.Gravity = 192
  end
end

ClientTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Callback = function(State)
      WalkSpeedState = State
    end
})

local WalkSpeedValue = 16

ClientTab:CreateSlider({
    Name = "WalkSpeed Value",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 16,
    Callback = function(Value)
      SetWalkSpeed(Value)
      WalkSpeedValue = Value
    end
})

ClientTab:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Callback = function(State)
      JumpPowerState = State
    end
})

local JumpValue = 50

ClientTab:CreateSlider({
    Name = "JumpPower Value",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 52,
    Callback = function(Value)
      JumpPowerState(Value)
      JumpValue = Value
    end
})

ClientTab:CreateToggle({
    Name = "Enable Noclip",
    CurrentValue = false,
    Callback = function(State)
      NoclipState = State
    end
})

RunService.Heartbeat:Connect(function()
    local Character = GetCharacter(Client)
    local Camera = Workspace.CurrentCamera
    if Character and Camera then
      local Humanoid = GetCharacterInstance(Character,"Humanoid")
      local HumanoidRootPart = GetCharacterInstance(Character,"HumanoidRootPart")
      if Humanoid and HumanoidRootPart then
        if FloatState then
        local MoveDirection = Humanoid.MoveDirection
        local LookVector = Camera.CFrame.LookVector
        
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(LookVector + MoveDirection)
        Humanoid.PlatformStand = true
        Workspace.Gravity = 0
        end
        if WalkSpeedState then
          SetWalkSpeed(WalkSpeedValue)
        end
        if JumpPowerState then
          SetJumpPower(JumpPowerValue)
        end
        if NoclipState then
          SetNoclip(true)
        else
          SetNoclip(false)
        end
      end
    end
end)
