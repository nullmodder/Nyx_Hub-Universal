local jmods_lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/pruebasjoao/test/refs/heads/main/JmodsLibV1.0"))()

local window = jmods_lib:CreateWindow({
    Name = "Nyx_Hub | Muscle Legends",
    Icon = 90692784970350,
    LoadingTitle = "Cargando... espera...",
    LoadingSubtitle = "ya casi está",
    Theme = "Rojo",
    OpenButtomImage = 127271155083726,
    Intro = false,
    IntroIcon = 90692784970350,
    AnimationIntro = 5,
    DragImage = 127271155083726
})

function get_player_character(player)
  return player and player.Character or false
end

function get_character_instance(character,instance_name)
  return character and character:FindFirstChild("instance_name") or false
end

getgenv().Nyx_Hub = {
  window = window,
  tabs = {},
  states = {},
  objects = {},
  functions = {
    ["get_player_character"] = get_player_character,
    ["get_character_instance"] = get_character_instance
  }
}

local HomeTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/HomeTab.lua"))()
local MainTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/MainTab.lua"))()
local CrystalTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/CrystalTab.lua"))()
local KillerTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/KillerTab.lua"))()
local RebirthsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/RebirthsTab.lua"))()
local StatusTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/StatusTab.lua"))()
local MiscTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/Nyx_Hub%20%7C%20Muscle_Legends/MiscTab.lua"))()