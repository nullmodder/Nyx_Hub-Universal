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
  MainTab = loadstring(game:HttpGet("Url")),
  ClientTab = loadstring(game:HttpGet("Url")),
  TrollTab loadstring(game:HttpGet("Url")),
  AnimationsTab = loadstring(game:HttpGet("Url")),
  ScriptsTab = loadstring(game:HttpGet("Url")),
  CombatTab = loadstring(game:HttpGet("Url")),
  VisualsTab = loadstring(game:HttpGet("Url")),
  TeleportsTab = loadstring(game:HttpGet("Url")),
  MiscTab = loadstring(game:HttpGet("Url")),
  UiSettingsTab = loadstring(game:HttpGet("Url")),
  CreditsTab = loadstring(game:HttpGet("Url")),
  AdminTab loadstring(game:HttpGet("Url"))
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
