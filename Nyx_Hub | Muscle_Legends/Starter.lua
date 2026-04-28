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
  window = nil,
  tabs = {},
  states = {},
  objects = {},
  functions = {
    ["get_player_character"] = get_player_character,
    ["get_character_instance"] = get_character_instance
  }
}

local HomeTab = loadstring(game:HttpGet(""))()
local MainTab = loadstring(game:HttpGet(""))()
local CrystalTab = loadstring(game:HttpGet(""))()
local KillerTab = loadstring(game:HttpGet(""))()
local RebirthsTab = loadstring(game:HttpGet(""))()
local StatusTab = loadstring(game:HttpGet(""))()
local MiscTab = loadstring(game:HttpGet(""))()