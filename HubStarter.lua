local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/pruebasjoao/test/refs/heads/main/JmodsLibV1.0"))()

getgenv().Window = UILibrary:CreateWindow({
    Name = "NyxHub",
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

local TabsOrder = {
  "MainTab",
  "ClientTab",
  "TrollTab",
  "AnimationsTab",
  "ScriptsTab",
  "CombatTab",
  "VisualsTab",
  "TeleportsTab",
  "MiscTab",
  "UiSettingsTab",
  "CreditsTab",
  "AdminTab"
}

local TabsLoader = {
  MainTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/MainTab.lua")),
  ClientTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/ClientTab.lua")),
  TrollTab loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/TrollTab.lua")),
  AnimationsTab = loadstring(game:HttpGet("Url")),
  ScriptsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/ScriptsTab.lua")),
  CombatTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/ScriptsTab.lua")),
  VisualsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/VisualsTab.lua")),
  TeleportsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/TeleportsTab.lua")),
  MiscTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/MiscTab.lua")),
  UiSettingsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/UiSettingsTab.lua")),
  CreditsTab = loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/CreditsTab.lua")),
  AdminTab loadstring(game:HttpGet("https://raw.githubusercontent.com/nullmodder/Nyx_Hub-Universal/refs/heads/main/AdminTab.lua"))
}

for _,TabName in ipairs(TabsOrder) do
  local Tab = TabsLoader[TabName]
  Tab()
end

UILibrary:Notify({
    Title = "Script Cargado",
    Content = "¡Todo listo para usar!",
    Duration = 3
})
