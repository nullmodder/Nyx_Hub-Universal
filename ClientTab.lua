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
local NoclipPartsOriginalCollide = {}

function SetNoclip(State)
  local Character = GetCharacter(Client)
  if Character then
    for i,v in ipairs(Character:GetDescendants()) do
      if v:IsA("BasePart") then
        if not NoclipPartsOriginalCollide[v] then
          NoclipPartsOriginalCollide[v] = v.CanCollide
        end
        if State then
          v.CanCollide = false
        else
          local OriginalCollide = NoclipPartsOriginalCollide[v]
          v.CanCollide = OriginalCollide
        end
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
      if not State then
        SetWalkSpeed(16)
      end
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
      if WalkSpeedState then
      SetWalkSpeed(Value)
      else
      SetWalkSpeed(16)
      end
      WalkSpeedValue = Value
    end
})

ClientTab:CreateToggle({
    Name = "Enable JumpPower",
    CurrentValue = false,
    Callback = function(State)
      JumpPowerState = State
      if not State then
        SetJumpPower(52)
      end
    end
})

local JumpPowerValue = 50

ClientTab:CreateSlider({
    Name = "JumpPower Value",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = 52,
    Callback = function(Value)
      if JumpPowerState then
      SetJumpPower(Value)
      else
        SetJumpPower(52)
      end
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

ClientTab:CreateToggle({
    Name = "Enable Float",
    CurrentValue = false,
    Callback = function(State)
      if State then
        StartFloat()
      else
        StopFloat()
      end
    end
})

local FloatSpeed = 1

ClientTab:CreateSlider({
    Name = "Float Speed",
    Range = {1, 100},
    Increment = 0.1,
    Suffix = "Studs/s",
    CurrentValue = 1,
    Callback = function(Value)
      FloatSpeed = Value
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
        local HumanoidRootPartLookVector = HumanoidRootPart.CFrame.LookVector
        local CameraLookVector = Camera.CFrame.LookVector
        
        if MoveDirection.Magnitude > 0 then
          HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, CameraLookVector)
          HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + (HumanoidRootPart.Position + HumanoidRootPartLookVector * FloatSpeed)
          Humanoid.PlatformStand = true
          Workspace.Gravity = 0
        end
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