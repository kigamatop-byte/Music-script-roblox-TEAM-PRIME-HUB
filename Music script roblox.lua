--==============================================================
--                 TEAM PRIME HUB V25
--              PREMIUM MUSIC SYSTEM
--==============================================================

--==============================================================
-- SERVICES
--==============================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==============================================================
-- CONFIG
--==============================================================

local CONFIG = {
GUI_NAME = "TEAM_PRIME_HUB",
SOUND_NAME = "TEAM_PRIME_AUDIO",

TOGGLE_KEY = Enum.KeyCode.RightShift,

DESKTOP_WIDTH = 600,
DESKTOP_HEIGHT = 470,

MOBILE_MAX_WIDTH = 405,
MOBILE_MIN_WIDTH = 295,
MOBILE_MARGIN = 10,

MIN_SCALE = 0.85,
MAX_SCALE = 1.15,

MIN_SPEED = 0.50,
MAX_SPEED = 2.00,
SPEED_STEP = 0.05,

DEFAULT_VOLUME = 0.65,
DEFAULT_SPEED = 1.00,

LOAD_TIMEOUT = 12,

-- ВАЖНО:
-- ID НЕ ЗАБЛОКИРОВАН.
-- Для него просто установлен предел 115 секунд.
SPECIAL_TRACK_LIMITS = {
	["75485931767123"] = 115,
},
}

--==============================================================
-- COLORS
--==============================================================

local BASE = {
Background = Color3.fromRGB(7, 8, 13),
Background2 = Color3.fromRGB(15, 16, 25),

Header = Color3.fromRGB(12, 13, 21),

Card = Color3.fromRGB(17, 18, 28),
Card2 = Color3.fromRGB(22, 23, 35),

Border = Color3.fromRGB(56, 58, 78),

White = Color3.fromRGB(248, 248, 252),
Secondary = Color3.fromRGB(143, 145, 166),
Muted = Color3.fromRGB(82, 84, 103),

Green = Color3.fromRGB(76, 222, 148),
Yellow = Color3.fromRGB(245, 194, 83),
Red = Color3.fromRGB(244, 82, 102),
}

--==============================================================
-- THEMES
--==============================================================

local THEMES = {
PURPLE = {
A = Color3.fromRGB(126, 91, 255),
B = Color3.fromRGB(67, 116, 255),
},

BLUE = {
	A = Color3.fromRGB(55, 118, 255),
	B = Color3.fromRGB(49, 198, 255),
},

CYAN = {
	A = Color3.fromRGB(38, 207, 210),
	B = Color3.fromRGB(53, 116, 255),
},

RED = {
	A = Color3.fromRGB(244, 70, 94),
	B = Color3.fromRGB(255, 137, 67),
},

GREEN = {
	A = Color3.fromRGB(50, 207, 133),
	B = Color3.fromRGB(57, 135, 255),
},

PINK = {
	A = Color3.fromRGB(244, 84, 179),
	B = Color3.fromRGB(116, 80, 255),
},
}

--==============================================================
-- LANGUAGES
--==============================================================

local LANG = {
RU = {
startupTitle = "TEAM PRIME HUB",
startupText = "Выбери язык интерфейса",

	ru = "РУССКИЙ",
	en = "ENGLISH",
	continueText = "ПРОДОЛЖИТЬ",

	title = "TEAM PRIME",
	subtitle = "PREMIUM MUSIC SYSTEM",

	placeholder = "Вставь Roblox Audio ID...",
	load = "ЗАГРУЗИТЬ",

	ready = "ГОТОВО",
	loading = "ЗАГРУЗКА...",
	playing = "ИГРАЕТ",
	paused = "ПАУЗА",
	stopped = "ОСТАНОВЛЕНО",
	finished = "ТРЕК ЗАКОНЧИЛСЯ",

	invalid = "НЕВЕРНЫЙ AUDIO ID",
	unavailable = "АУДИО НЕДОСТУПНО",
	waiting = "ПОДОЖДИ, ИДЁТ ЗАГРУЗКА",
	first = "СНАЧАЛА ЗАГРУЗИ ТРЕК",

	play = "▶  PLAY",
	pause = "Ⅱ  PAUSE",
	stop = "■  STOP",

	volume = "ГРОМКОСТЬ",
	loop = "ЗАЦИКЛИВАНИЕ",
	speed = "СКОРОСТЬ",

	loopOn = "ВКЛ",
	loopOff = "ВЫКЛ",

	mute = "🔊  ЗВУК",
	muted = "🔇  БЕЗ ЗВУКА",

	settings = "НАСТРОЙКИ",
	music = "МУЗЫКА",
	design = "ДИЗАЙН",

	theme = "ТЕМА",
	animation = "АНИМАЦИИ",
	glow = "GLOW",
	opacity = "ПРОЗРАЧНОСТЬ",
	scale = "МАСШТАБ",

	on = "ВКЛ",
	off = "ВЫКЛ",

	purple = "ФИОЛЕТ",
	blue = "СИНИЙ",
	cyan = "ЦИАН",
	red = "КРАСНЫЙ",
	green = "ЗЕЛЁНЫЙ",
	pink = "РОЗОВЫЙ",

	noTrack = "Трек не загружен",

	external =
		"Для воспроизведения нужен Roblox Audio ID.",

	footer =
		"TEAM PRIME • PREMIUM AUDIO",
},

EN = {
	startupTitle = "TEAM PRIME HUB",
	startupText = "Choose your interface language",

	ru = "РУССКИЙ",
	en = "ENGLISH",
	continueText = "CONTINUE",

	title = "TEAM PRIME",
	subtitle = "PREMIUM MUSIC SYSTEM",

	placeholder = "Paste Roblox Audio ID...",
	load = "LOAD",

	ready = "READY",
	loading = "LOADING...",
	playing = "PLAYING",
	paused = "PAUSED",
	stopped = "STOPPED",
	finished = "TRACK FINISHED",

	invalid = "INVALID AUDIO ID",
	unavailable = "AUDIO UNAVAILABLE",
	waiting = "PLEASE WAIT",
	first = "LOAD A TRACK FIRST",

	play = "▶  PLAY",
	pause = "Ⅱ  PAUSE",
	stop = "■  STOP",

	volume = "VOLUME",
	loop = "LOOP",
	speed = "SPEED",

	loopOn = "ON",
	loopOff = "OFF",

	mute = "🔊  SOUND",
	muted = "🔇  MUTED",

	settings = "SETTINGS",
	music = "MUSIC",
	design = "DESIGN",

	theme = "THEME",
	animation = "ANIMATIONS",
	glow = "GLOW",
	opacity = "OPACITY",
	scale = "UI SCALE",

	on = "ON",
	off = "OFF",

	purple = "PURPLE",
	blue = "BLUE",
	cyan = "CYAN",
	red = "RED",
	green = "GREEN",
	pink = "PINK",

	noTrack = "No track loaded",

	external =
		"A Roblox Audio ID is required for playback.",

	footer =
		"TEAM PRIME • PREMIUM AUDIO",
},
}

--==============================================================
-- STATE
--==============================================================

local State = {
Language = "RU",
Theme = "PURPLE",

Hidden = true,
Minimized = false,
SettingsOpen = false,

Volume = CONFIG.DEFAULT_VOLUME,
Speed = CONFIG.DEFAULT_SPEED,

Loop = true,
Muted = false,

Animations = true,
Glow = true,

Scale = 1,
Opacity = 1,

CurrentSound = nil,
AudioID = nil,

Loading = false,
Playing = false,

Dragging = false,
Seeking = false,
VolumeDragging = false,

DragStart = nil,
DragOrigin = nil,

LoadToken = 0,

SavedMouseBehavior = nil,
SavedMouseIcon = nil,

-- MOBILE DRAG
DragInput = nil,
}

--==============================================================
-- CLEAN OLD GUI
--==============================================================

local OldGui =
PlayerGui:FindFirstChild(
CONFIG.GUI_NAME
)

if OldGui then
	OldGui:Destroy()
end

--==============================================================
-- BASIC HELPERS
--==============================================================

local function L()
return LANG[
State.Language
] or LANG.RU
end

local function T()
return THEMES[
State.Theme
] or THEMES.PURPLE
end

local function Safe(value)

if value == nil then
	return ""
end

return tostring(value)

end

local function IsMobile()

local camera =
	workspace.CurrentCamera

if not camera then
	return false
end

return camera.ViewportSize.X <= 650

end

local function FormatTime(value)

value =
	tonumber(value)
	or 0

value =
	math.max(
		value,
		0
	)

local minutes =
	math.floor(
		value / 60
	)

local seconds =
	math.floor(
		value % 60
	)

return string.format(
	"%02d:%02d",
	minutes,
	seconds
)

end

--==============================================================
-- UI HELPERS
--==============================================================

local function Corner(
object,
radius
)

local ui =
	Instance.new(
		"UICorner"
	)

ui.CornerRadius =
	UDim.new(
		0,
		radius
	)

ui.Parent =
	object

return ui

end

local function Stroke(
object,
color,
transparency,
thickness
)

local ui =
	Instance.new(
		"UIStroke"
	)

ui.Color =
	color

ui.Transparency =
	transparency or 0

ui.Thickness =
	thickness or 1

ui.Parent =
	object

return ui

end

local function Gradient(
object,
a,
b,
rotation
)

local ui =
	Instance.new(
		"UIGradient"
	)

ui.Color =
	ColorSequence.new({
		ColorSequenceKeypoint.new(
			0,
			a
		),

		ColorSequenceKeypoint.new(
			1,
			b
		),
	})

ui.Rotation =
	rotation or 0

ui.Parent =
	object

return ui

end

local function MakeText(
parent,
value,
size,
font
)

local ui =
	Instance.new(
		"TextLabel"
	)

ui.BackgroundTransparency =
	1

ui.Text =
	Safe(value)

ui.TextColor3 =
	BASE.White

ui.TextTransparency =
	0

ui.TextSize =
	size or 12

ui.Font =
	font
	or Enum.Font.Gotham

ui.TextXAlignment =
	Enum.TextXAlignment.Left

ui.TextYAlignment =
	Enum.TextYAlignment.Center

ui.Parent =
	parent

return ui

end

local function MakeButton(
parent,
value,
size
)

local ui =
	Instance.new(
		"TextButton"
	)

ui.AutoButtonColor =
	false

ui.BackgroundColor3 =
	BASE.Card2

ui.BorderSizePixel =
	0

ui.Text =
	Safe(value)

ui.TextColor3 =
	BASE.White

ui.TextTransparency =
	0

ui.TextSize =
	size or 11

ui.Font =
	Enum.Font.GothamBold

ui.Parent =
	parent

Corner(
	ui,
	10
)

Stroke(
	ui,
	BASE.Border,
	0.3,
	1
)

return ui

end

local function TweenObject(
object,
duration,
properties,
style,
direction
)

if not object then
	return
end

if not State.Animations then

	for property, value in pairs(
		properties
	) do

		pcall(
			function()
				object[property] =
					value
			end
		)
	end

	return
end

local tween =
	TweenService:Create(
		object,

		TweenInfo.new(
			duration
				or 0.2,

			style
				or Enum.EasingStyle.Quint,

			direction
				or Enum.EasingDirection.Out
		),

		properties
	)

tween:Play()

return tween

end

--==============================================================
-- ROOT
--==============================================================

local GUI =
Instance.new(
"ScreenGui"
)

GUI.Name =
CONFIG.GUI_NAME

GUI.ResetOnSpawn =
false

GUI.IgnoreGuiInset =
true

GUI.DisplayOrder =
999

GUI.ZIndexBehavior =
Enum.ZIndexBehavior.Sibling

GUI.Parent =
PlayerGui

--==============================================================
-- STARTUP
--==============================================================

local Startup =
Instance.new(
"Frame"
)

Startup.AnchorPoint =
Vector2.new(
0.5,
0.5
)

Startup.Position =
UDim2.fromScale(
0.5,
0.5
)

Startup.Size =
UDim2.fromOffset(
440,
310
)

Startup.BackgroundColor3 =
BASE.Background

Startup.BorderSizePixel =
0

Startup.ZIndex =
100

Startup.Parent =
GUI

Corner(
Startup,
22
)

Stroke(
Startup,
BASE.Border,
0.08,
1
)

Gradient(
Startup,
BASE.Background,
BASE.Background2,
135
)

local StartupGlow =
Instance.new(
"Frame"
)

StartupGlow.AnchorPoint =
Vector2.new(
0.5,
0.5
)

StartupGlow.Position =
UDim2.fromScale(
0.5,
0.18
)

StartupGlow.Size =
UDim2.fromOffset(
110,
110
)

StartupGlow.BackgroundColor3 =
T().A

StartupGlow.BackgroundTransparency =
0.90

StartupGlow.BorderSizePixel =
0

StartupGlow.ZIndex =
100

StartupGlow.Parent =
Startup

Corner(
StartupGlow,
100
)

local StartupLogo =
Instance.new(
"Frame"
)

StartupLogo.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupLogo.Position =
UDim2.fromScale(
0.5,
0.08
)

StartupLogo.Size =
UDim2.fromOffset(
62,
62
)

StartupLogo.BackgroundColor3 =
T().A

StartupLogo.BorderSizePixel =
0

StartupLogo.ZIndex =
101

StartupLogo.Parent =
Startup

Corner(
StartupLogo,
18
)

local StartupLogoGradient =
Gradient(
StartupLogo,
T().A,
T().B,
45
)

local StartupLogoText =
MakeText(
StartupLogo,
"TP",
18,
Enum.Font.GothamBlack
)

StartupLogoText.Size =
UDim2.fromScale(
1,
1
)

StartupLogoText.TextXAlignment =
Enum.TextXAlignment.Center

local StartupTitle =
MakeText(
Startup,
"",
20,
Enum.Font.GothamBold
)

StartupTitle.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupTitle.Position =
UDim2.fromScale(
0.5,
0.34
)

StartupTitle.Size =
UDim2.new(
1,
-40,
0,
30
)

StartupTitle.TextXAlignment =
Enum.TextXAlignment.Center

local StartupDescription =
MakeText(
Startup,
"",
11,
Enum.Font.GothamMedium
)

StartupDescription.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupDescription.Position =
UDim2.fromScale(
0.5,
0.45
)

StartupDescription.Size =
UDim2.new(
1,
-40,
0,
22
)

StartupDescription.TextXAlignment =
Enum.TextXAlignment.Center

StartupDescription.TextColor3 =
BASE.Secondary

local StartupRU =
MakeButton(
Startup,
"",
10
)

StartupRU.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupRU.Position =
UDim2.fromScale(
0.33,
0.59
)

StartupRU.Size =
UDim2.fromOffset(
125,
43
)

local StartupEN =
MakeButton(
Startup,
"",
10
)

StartupEN.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupEN.Position =
UDim2.fromScale(
0.67,
0.59
)

StartupEN.Size =
UDim2.fromOffset(
125,
43
)

local StartupContinue =
MakeButton(
Startup,
"",
10
)

StartupContinue.AnchorPoint =
Vector2.new(
0.5,
0
)

StartupContinue.Position =
UDim2.fromScale(
0.5,
0.78
)

StartupContinue.Size =
UDim2.fromOffset(
220,
40
)

local StartupContinueGradient =
Gradient(
StartupContinue,
T().A,
T().B,
0
)

--==============================================================
-- MAIN HUB
--==============================================================

local Main =
Instance.new(
"Frame"
)

Main.AnchorPoint =
Vector2.new(
0.5,
0.5
)

Main.Position =
UDim2.fromScale(
0.5,
0.5
)

Main.Size =
UDim2.fromOffset(
CONFIG.DESKTOP_WIDTH,
CONFIG.DESKTOP_HEIGHT
)

Main.BackgroundColor3 =
BASE.Background

Main.BackgroundTransparency =
0

Main.BorderSizePixel =
0

Main.Visible =
false

Main.ZIndex =
10

Main.Parent =
GUI

Corner(
Main,
20
)

Stroke(
Main,
BASE.Border,
0.08,
1
)

Gradient(
Main,
BASE.Background,
BASE.Background2,
135
)

local MainScale =
Instance.new(
"UIScale"
)

MainScale.Scale =
0.84

MainScale.Parent =
Main

--==============================================================
-- GLOW
--==============================================================

local Glow =
Instance.new(
"Frame"
)

Glow.AnchorPoint =
Vector2.new(
0.5,
0.5
)

Glow.Position =
UDim2.fromScale(
0.5,
0.5
)

Glow.Size =
UDim2.new(
1,
26,
1,
26
)

Glow.BackgroundColor3 =
T().A

Glow.BackgroundTransparency =
1

Glow.BorderSizePixel =
0

Glow.ZIndex =
0

Glow.Parent =
Main

Corner(
Glow,
25
)

--==============================================================
-- HEADER
--==============================================================

local Header =
Instance.new(
"Frame"
)

Header.Size =
UDim2.new(
1,
0,
0,
72
)

Header.BackgroundColor3 =
BASE.Header

Header.BackgroundTransparency =
0

Header.BorderSizePixel =
0

Header.ZIndex =
11

Header.Parent =
Main

Corner(
Header,
20
)

local HeaderFix =
Instance.new(
"Frame"
)

HeaderFix.Position =
UDim2.fromScale(
0,
0.5
)

HeaderFix.Size =
UDim2.new(
1,
0,
0.5,
0
)

HeaderFix.BackgroundColor3 =
BASE.Header

HeaderFix.BorderSizePixel =
0

HeaderFix.Parent =
Header

local Logo =
Instance.new(
"Frame"
)

Logo.Position =
UDim2.fromOffset(
15,
14
)

Logo.Size =
UDim2.fromOffset(
44,
44
)

Logo.BackgroundColor3 =
T().A

Logo.BorderSizePixel =
0

Logo.ZIndex =
12

Logo.Parent =
Header

Corner(
Logo,
13
)

local LogoGradient =
Gradient(
Logo,
T().A,
T().B,
45
)

local LogoText =
MakeText(
Logo,
"TP",
13,
Enum.Font.GothamBlack
)

LogoText.Size =
UDim2.fromScale(
1,
1
)

LogoText.TextXAlignment =
Enum.TextXAlignment.Center

local Title =
MakeText(
Header,
"",
17,
Enum.Font.GothamBold
)

Title.Position =
UDim2.fromOffset(
72,
10
)

Title.Size =
UDim2.new(
1,
-220,
0,
24
)

local Subtitle =
MakeText(
Header,
"",
9,
Enum.Font.GothamMedium
)

Subtitle.Position =
UDim2.fromOffset(
73,
34
)

Subtitle.Size =
UDim2.new(
1,
-220,
0,
17
)

Subtitle.TextColor3 =
BASE.Secondary

local StatusDot =
Instance.new(
"Frame"
)

StatusDot.Position =
UDim2.fromOffset(
73,
55
)

StatusDot.Size =
UDim2.fromOffset(
6,
6
)

StatusDot.BackgroundColor3 =
BASE.Green

StatusDot.BorderSizePixel =
0

StatusDot.Parent =
Header

Corner(
StatusDot,
100
)

local SystemText =
MakeText(
Header,
"",
8,
Enum.Font.GothamMedium
)

SystemText.Position =
UDim2.fromOffset(
84,
49
)

SystemText.Size =
UDim2.new(
1,
-220,
0,
17
)

SystemText.TextColor3 =
BASE.Green

local SettingsButton =
MakeButton(
Header,
"⚙",
16
)

SettingsButton.Position =
UDim2.new(
1,
-121,
0,
17
)

SettingsButton.Size =
UDim2.fromOffset(
30,
36
)

local MinimizeButton =
MakeButton(
Header,
"—",
18
)

MinimizeButton.Position =
UDim2.new(
1,
-84,
0,
17
)

MinimizeButton.Size =
UDim2.fromOffset(
30,
36
)

local CloseButton =
MakeButton(
Header,
"×",
21
)

CloseButton.Position =
UDim2.new(
1,
-47,
0,
17
)

CloseButton.Size =
UDim2.fromOffset(
30,
36
)

local HeaderAccent =
Instance.new(
"Frame"
)

HeaderAccent.Position =
UDim2.new(
0,
15,
1,
-2
)

HeaderAccent.Size =
UDim2.new(
1,
-30,
0,
2
)

HeaderAccent.BackgroundColor3 =
T().A

HeaderAccent.BorderSizePixel =
0

HeaderAccent.Parent =
Header

Corner(
HeaderAccent,
100
)

local HeaderAccentGradient =
Gradient(
HeaderAccent,
T().A,
T().B,
0
)

--==============================================================
-- BODY
--==============================================================

local Body =
Instance.new(
"Frame"
)

Body.Position =
UDim2.fromOffset(
15,
84
)

Body.Size =
UDim2.new(
1,
-30,
1,
-99
)

Body.BackgroundTransparency =
1

Body.Parent =
Main

--==============================================================
-- INPUT
--==============================================================

local Input =
Instance.new(
"TextBox"
)

Input.Position =
UDim2.fromOffset(
0,
0
)

Input.Size =
UDim2.new(
1,
-90,
0,
42
)

Input.BackgroundColor3 =
BASE.Card

Input.BorderSizePixel =
0

Input.Text =
""

Input.PlaceholderText =
L().placeholder

Input.PlaceholderColor3 =
BASE.Secondary

Input.TextColor3 =
BASE.White

Input.TextTransparency =
0

Input.TextSize =
12

Input.Font =
Enum.Font.Gotham

Input.TextXAlignment =
Enum.TextXAlignment.Left

Input.ClearTextOnFocus =
false

Input.Parent =
Body

Corner(
Input,
11
)

Stroke(
Input,
BASE.Border,
0.18,
1
)

local InputPadding =
Instance.new(
"UIPadding"
)

InputPadding.PaddingLeft =
UDim.new(
0,
38
)

InputPadding.PaddingRight =
UDim.new(
0,
8
)

InputPadding.Parent =
Input

local InputIcon =
MakeText(
Body,
"♫",
17,
Enum.Font.GothamBold
)

InputIcon.Position =
UDim2.fromOffset(
9,
0
)

InputIcon.Size =
UDim2.fromOffset(
27,
42
)

InputIcon.TextXAlignment =
Enum.TextXAlignment.Center

InputIcon.TextColor3 =
T().A

local LoadButton =
MakeButton(
Body,
"",
10
)

LoadButton.Position =
UDim2.new(
1,
-82,
0,
0
)

LoadButton.Size =
UDim2.fromOffset(
82,
42
)

LoadButton.BackgroundColor3 =
T().A

local LoadGradient =
Gradient(
LoadButton,
T().A,
T().B,
0
)

--==============================================================
-- TRACK CARD
--==============================================================

local TrackCard =
Instance.new(
"Frame"
)

TrackCard.Position =
UDim2.fromOffset(
0,
56
)

TrackCard.Size =
UDim2.new(
1,
0,
0,
94
)

TrackCard.BackgroundColor3 =
BASE.Card

TrackCard.BorderSizePixel =
0

TrackCard.Parent =
Body

Corner(
TrackCard,
13
)

Stroke(
TrackCard,
BASE.Border,
0.2,
1
)

local Album =
Instance.new(
"Frame"
)

Album.Position =
UDim2.fromOffset(
13,
13
)

Album.Size =
UDim2.fromOffset(
68,
68
)

Album.BackgroundColor3 =
T().A

Album.BorderSizePixel =
0

Album.Parent =
TrackCard

Corner(
Album,
16
)

local AlbumGradient =
Gradient(
Album,
T().A,
T().B,
45
)

local Disc =
Instance.new(
"Frame"
)

Disc.AnchorPoint =
Vector2.new(
0.5,
0.5
)

Disc.Position =
UDim2.fromScale(
0.5,
0.5
)

Disc.Size =
UDim2.fromOffset(
40,
40
)

Disc.BackgroundColor3 =
Color3.fromRGB(
9,
10,
17
)

Disc.BorderSizePixel =
0

Disc.Parent =
Album

Corner(
Disc,
100
)

local DiscText =
MakeText(
Disc,
"♫",
18,
Enum.Font.GothamBlack
)

DiscText.Size =
UDim2.fromScale(
1,
1
)

DiscText.TextXAlignment =
Enum.TextXAlignment.Center

local TrackName =
MakeText(
TrackCard,
L().noTrack,
13,
Enum.Font.GothamBold
)

TrackName.Position =
UDim2.fromOffset(
95,
12
)

TrackName.Size =
UDim2.new(
1,
-205,
0,
22
)

TrackName.TextTruncate =
Enum.TextTruncate.AtEnd

local TrackStatus =
MakeText(
TrackCard,
L().ready,
9,
Enum.Font.GothamMedium
)

TrackStatus.Position =
UDim2.fromOffset(
95,
35
)

TrackStatus.Size =
UDim2.new(
1,
-205,
0,
17
)

TrackStatus.TextColor3 =
BASE.Secondary

local TimeLabel =
MakeText(
TrackCard,
"00:00 / 00:00",
9,
Enum.Font.GothamMedium
)

TimeLabel.Position =
UDim2.new(
1,
-100,
0,
20
)

TimeLabel.Size =
UDim2.fromOffset(
90,
20
)

TimeLabel.TextXAlignment =
Enum.TextXAlignment.Right

TimeLabel.TextColor3 =
BASE.Secondary

--==============================================================
-- PROGRESS
--==============================================================

local ProgressBack =
Instance.new(
"Frame"
)

ProgressBack.Position =
UDim2.fromOffset(
95,
62
)

ProgressBack.Size =
UDim2.new(
1,
-110,
0,
5
)

ProgressBack.BackgroundColor3 =
Color3.fromRGB(
39,
40,
54
)

ProgressBack.BorderSizePixel =
0

ProgressBack.Parent =
TrackCard

Corner(
ProgressBack,
100
)

local Progress =
Instance.new(
"Frame"
)

Progress.Size =
UDim2.new(
0,
0,
1,
0
)

Progress.BackgroundColor3 =
T().A

Progress.BorderSizePixel =
0

Progress.Parent =
ProgressBack

Corner(
Progress,
100
)

local ProgressGradient =
Gradient(
Progress,
T().A,
T().B,
0
)

--==============================================================
-- PLAYBACK CONTROLS
--==============================================================

local Controls =
Instance.new(
"Frame"
)

Controls.Position =
UDim2.fromOffset(
0,
164
)

Controls.Size =
UDim2.new(
1,
0,
0,
46
)

Controls.BackgroundTransparency =
1

Controls.Parent =
Body

local PlayButton =
MakeButton(
Controls,
"",
11
)

PlayButton.Position =
UDim2.fromOffset(
0,
0
)

PlayButton.Size =
UDim2.new(
0.34,
-4,
1,
0
)

PlayButton.BackgroundColor3 =
Color3.fromRGB(
47,
36,
85
)

local PauseButton =
MakeButton(
Controls,
"",
11
)

PauseButton.Position =
UDim2.new(
0.34,
4,
0,
0
)

PauseButton.Size =
UDim2.new(
0.33,
-4,
1,
0
)

local StopButton =
MakeButton(
Controls,
"",
11
)

StopButton.Position =
UDim2.new(
0.67,
4,
0,
0
)

StopButton.Size =
UDim2.new(
0.33,
-4,
1,
0
)

--==============================================================
-- MUSIC PANEL
--==============================================================

local MusicPanel =
Instance.new(
"Frame"
)

MusicPanel.Position =
UDim2.fromOffset(
0,
223
)

MusicPanel.Size =
UDim2.new(
1,
0,
0,
118
)

MusicPanel.BackgroundColor3 =
BASE.Card

MusicPanel.BorderSizePixel =
0

MusicPanel.Parent =
Body

Corner(
MusicPanel,
13
)

Stroke(
MusicPanel,
BASE.Border,
0.2,
1
)

local VolumeLabel =
MakeText(
MusicPanel,
"",
9,
Enum.Font.GothamBold
)

VolumeLabel.Position =
UDim2.fromOffset(
13,
8
)

VolumeLabel.Size =
UDim2.fromOffset(
120,
18
)

VolumeLabel.TextColor3 =
BASE.Secondary

local VolumeValue =
MakeText(
MusicPanel,
"65%",
9,
Enum.Font.GothamBold
)

VolumeValue.Position =
UDim2.new(
1,
-58,
0,
8
)

VolumeValue.Size =
UDim2.fromOffset(
45,
18
)

VolumeValue.TextXAlignment =
Enum.TextXAlignment.Right

VolumeValue.TextColor3 =
T().A

local VolumeBack =
Instance.new(
"Frame"
)

VolumeBack.Position =
UDim2.fromOffset(
13,
32
)

VolumeBack.Size =
UDim2.new(
1,
-26,
0,
7
)

VolumeBack.BackgroundColor3 =
Color3.fromRGB(
39,
40,
54
)

VolumeBack.BorderSizePixel =
0

VolumeBack.Parent =
MusicPanel

Corner(
VolumeBack,
100
)

local VolumeFill =
Instance.new(
"Frame"
)

VolumeFill.Size =
UDim2.new(
State.Volume,
0,
1,
0
)

VolumeFill.BackgroundColor3 =
T().A

VolumeFill.BorderSizePixel =
0

VolumeFill.Parent =
VolumeBack

Corner(
VolumeFill,
100
)

local VolumeGradient =
Gradient(
VolumeFill,
T().A,
T().B,
0
)

local VolumeKnob =
Instance.new(
"Frame"
)

VolumeKnob.AnchorPoint =
Vector2.new(
0.5,
0.5
)

VolumeKnob.Position =
UDim2.new(
State.Volume,
0,
0.5,
0
)

VolumeKnob.Size =
UDim2.fromOffset(
15,
15
)

VolumeKnob.BackgroundColor3 =
BASE.White

VolumeKnob.BorderSizePixel =
0

VolumeKnob.Parent =
VolumeBack

Corner(
VolumeKnob,
100
)

local LoopButton =
MakeButton(
MusicPanel,
"",
9
)

LoopButton.Position =
UDim2.fromOffset(
12,
63
)

LoopButton.Size =
UDim2.fromOffset(
112,
36
)

local MuteButton =
MakeButton(
MusicPanel,
"",
9
)

MuteButton.Position =
UDim2.fromOffset(
130,
63
)

MuteButton.Size =
UDim2.fromOffset(
112,
36
)

local SpeedMinus =
MakeButton(
MusicPanel,
"−",
15
)

SpeedMinus.Position =
UDim2.new(
1,
-171,
0,
63
)

SpeedMinus.Size =
UDim2.fromOffset(
36,
36
)

local SpeedValue =
MakeText(
MusicPanel,
"1.00x",
10,
Enum.Font.GothamBold
)

SpeedValue.Position =
UDim2.new(
1,
-128,
0,
63
)

SpeedValue.Size =
UDim2.fromOffset(
55,
36
)

SpeedValue.TextXAlignment =
Enum.TextXAlignment.Center

SpeedValue.TextColor3 =
T().A

local SpeedPlus =
MakeButton(
MusicPanel,
"+",
15
)

SpeedPlus.Position =
UDim2.new(
1,
-84,
0,
63
)

SpeedPlus.Size =
UDim2.fromOffset(
36,
36
)

--==============================================================
-- FOOTER
--==============================================================

local Footer =
MakeText(
Body,
"",
8,
Enum.Font.GothamMedium
)

Footer.Position =
UDim2.new(
0,
0,
1,
-15
)

Footer.Size =
UDim2.new(
1,
0,
0,
13
)

Footer.TextXAlignment =
Enum.TextXAlignment.Center

Footer.TextColor3 =
BASE.Muted

--==============================================================
-- SETTINGS
--==============================================================

local SettingsPage =
Instance.new(
"Frame"
)

SettingsPage.Position =
UDim2.fromOffset(
15,
84
)

SettingsPage.Size =
UDim2.new(
1,
-30,
1,
-99
)

SettingsPage.BackgroundColor3 =
BASE.Card

SettingsPage.BorderSizePixel =
0

SettingsPage.Visible =
false

SettingsPage.ZIndex =
40

SettingsPage.Parent =
Main

Corner(
SettingsPage,
15
)

Stroke(
SettingsPage,
BASE.Border,
0.2,
1
)

local SettingsTitle =
MakeText(
SettingsPage,
"",
15,
Enum.Font.GothamBold
)

SettingsTitle.Position =
UDim2.fromOffset(
16,
10
)

SettingsTitle.Size =
UDim2.new(
1,
-60,
0,
27
)

local SettingsBack =
MakeButton(
SettingsPage,
"←",
17
)

SettingsBack.Position =
UDim2.new(
1,
-52,
0,
8
)

SettingsBack.Size =
UDim2.fromOffset(
36,
34
)

local SettingsMusicTab =
MakeButton(
SettingsPage,
"",
9
)

SettingsMusicTab.Position =
UDim2.fromOffset(
16,
47
)

SettingsMusicTab.Size =
UDim2.fromOffset(
110,
34
)

local SettingsDesignTab =
MakeButton(
SettingsPage,
"",
9
)

SettingsDesignTab.Position =
UDim2.fromOffset(
132,
47
)

SettingsDesignTab.Size =
UDim2.fromOffset(
110,
34
)

local SettingsMusicPage =
Instance.new(
"Frame"
)

SettingsMusicPage.Position =
UDim2.fromOffset(
0,
88
)

SettingsMusicPage.Size =
UDim2.new(
1,
0,
1,
-88
)

SettingsMusicPage.BackgroundTransparency =
1

SettingsMusicPage.Parent =
SettingsPage

local SettingsMusicLabel =
MakeText(
SettingsMusicPage,
"",
10,
Enum.Font.GothamBold
)

SettingsMusicLabel.Position =
UDim2.fromOffset(
16,
10
)

SettingsMusicLabel.Size =
UDim2.fromOffset(
160,
20
)

SettingsMusicLabel.TextColor3 =
BASE.Secondary

local SettingsLoopLabel =
MakeText(
SettingsMusicPage,
"",
10,
Enum.Font.GothamBold
)

SettingsLoopLabel.Position =
UDim2.fromOffset(
16,
47
)

SettingsLoopLabel.Size =
UDim2.fromOffset(
190,
20
)

SettingsLoopLabel.TextColor3 =
BASE.Secondary

local SettingsLoopButton =
MakeButton(
SettingsMusicPage,
"",
9
)

SettingsLoopButton.Position =
UDim2.new(
1,
-150,
0,
40
)

SettingsLoopButton.Size =
UDim2.fromOffset(
134,
30
)

local SettingsMuteLabel =
MakeText(
SettingsMusicPage,
"",
10,
Enum.Font.GothamBold
)

SettingsMuteLabel.Position =
UDim2.fromOffset(
16,
85
)

SettingsMuteLabel.Size =
UDim2.fromOffset(
190,
20
)

SettingsMuteLabel.TextColor3 =
BASE.Secondary

local SettingsMuteButton =
MakeButton(
SettingsMusicPage,
"",
9
)

SettingsMuteButton.Position =
UDim2.new(
1,
-150,
0,
78
)

SettingsMuteButton.Size =
UDim2.fromOffset(
134,
30
)

local SettingsDesignPage =
Instance.new(
"Frame"
)

SettingsDesignPage.Position =
UDim2.fromOffset(
0,
88
)

SettingsDesignPage.Size =
UDim2.new(
1,
0,
1,
-88
)

SettingsDesignPage.BackgroundTransparency =
1

SettingsDesignPage.Visible =
false

SettingsDesignPage.Parent =
SettingsPage

local ThemeLabel =
MakeText(
SettingsDesignPage,
"",
10,
Enum.Font.GothamBold
)

ThemeLabel.Position =
UDim2.fromOffset(
16,
10
)

ThemeLabel.Size =
UDim2.fromOffset(
150,
20
)

ThemeLabel.TextColor3 =
BASE.Secondary

local ThemeButtons = {}

local ThemeList = {
{
ID = "PURPLE",
KEY = "purple",
},

{
	ID = "BLUE",
	KEY = "blue",
},

{
	ID = "CYAN",
	KEY = "cyan",
},

{
	ID = "RED",
	KEY = "red",
},

{
	ID = "GREEN",
	KEY = "green",
},

{
	ID = "PINK",
	KEY = "pink",
},
}

for index, data in ipairs(
ThemeList
) do

local column =
	(index - 1) % 3

local row =
	math.floor(
		(index - 1) / 3
	)

local button =
	MakeButton(
		SettingsDesignPage,
		"",
		8
	)

button.Position =
	UDim2.fromOffset(
		16 + column * 90,
		38 + row * 37
	)

button.Size =
	UDim2.fromOffset(
		82,
		31
	)

ThemeButtons[
	data.ID
] =
	button

end

local AnimationButton =
MakeButton(
SettingsDesignPage,
"",
8
)

AnimationButton.Position =
UDim2.fromOffset(
16,
116
)

AnimationButton.Size =
UDim2.fromOffset(
125,
32
)

local GlowButton =
MakeButton(
SettingsDesignPage,
"",
8
)

GlowButton.Position =
UDim2.fromOffset(
148,
116
)

GlowButton.Size =
UDim2.fromOffset(
125,
32
)

local OpacityLabel =
MakeText(
SettingsDesignPage,
"",
9,
Enum.Font.GothamBold
)

OpacityLabel.Position =
UDim2.fromOffset(
16,
162
)

OpacityLabel.Size =
UDim2.fromOffset(
150,
20
)

OpacityLabel.TextColor3 =
BASE.Secondary

local OpacityBack =
Instance.new(
"Frame"
)

OpacityBack.Position =
UDim2.fromOffset(
16,
187
)

OpacityBack.Size =
UDim2.new(
1,
-32,
0,
7
)

OpacityBack.BackgroundColor3 =
Color3.fromRGB(
39,
40,
54
)

OpacityBack.BorderSizePixel =
0

OpacityBack.Parent =
SettingsDesignPage

Corner(
OpacityBack,
100
)

local OpacityFill =
Instance.new(
"Frame"
)

OpacityFill.Size =
UDim2.new(
1,
0,
1,
0
)

OpacityFill.BackgroundColor3 =
T().A

OpacityFill.BorderSizePixel =
0

OpacityFill.Parent =
OpacityBack

Corner(
OpacityFill,
100
)

local OpacityGradient =
Gradient(
OpacityFill,
T().A,
T().B,
0
)

local OpacityKnob =
Instance.new(
"Frame"
)

OpacityKnob.AnchorPoint =
Vector2.new(
0.5,
0.5
)

OpacityKnob.Position =
UDim2.new(
1,
0,
0.5,
0
)

OpacityKnob.Size =
UDim2.fromOffset(
14,
14
)

OpacityKnob.BackgroundColor3 =
BASE.White

OpacityKnob.BorderSizePixel =
0

OpacityKnob.Parent =
OpacityBack

Corner(
OpacityKnob,
100
)

local ScaleLabel =
MakeText(
SettingsDesignPage,
"",
9,
Enum.Font.GothamBold
)

ScaleLabel.Position =
UDim2.fromOffset(
16,
217
)

ScaleLabel.Size =
UDim2.fromOffset(
150,
20
)

ScaleLabel.TextColor3 =
BASE.Secondary

local ScaleMinus =
MakeButton(
SettingsDesignPage,
"−",
14
)

ScaleMinus.Position =
UDim2.new(
1,
-125,
0,
210
)

ScaleMinus.Size =
UDim2.fromOffset(
34,
31
)

local ScaleValue =
MakeText(
SettingsDesignPage,
"100%",
9,
Enum.Font.GothamBold
)

ScaleValue.Position =
UDim2.new(
1,
-84,
0,
210
)

ScaleValue.Size =
UDim2.fromOffset(
46,
31
)

ScaleValue.TextXAlignment =
Enum.TextXAlignment.Center

ScaleValue.TextColor3 =
T().A

local ScalePlus =
MakeButton(
SettingsDesignPage,
"+",
14
)

ScalePlus.Position =
UDim2.new(
1,
-43,
0,
210
)

ScalePlus.Size =
UDim2.fromOffset(
34,
31
)

--==============================================================
-- STATE FUNCTIONS
--==============================================================

local function SetStatus(
value,
color
)

TrackStatus.Text =
	Safe(value)

TrackStatus.TextColor3 =
	color
	or BASE.Secondary

end

local function SetVolume(
value
)

value =
	math.clamp(
		tonumber(value)
			or 0,
		0,
		1
	)

State.Volume =
	value

VolumeValue.Text =
	math.floor(
		value * 100
	)
	.. "%"

VolumeFill.Size =
	UDim2.new(
		value,
		0,
		1,
		0
	)

VolumeKnob.Position =
	UDim2.new(
		value,
		0,
		0.5,
		0
	)

if State.CurrentSound
	and not State.Muted
then

	State.CurrentSound.Volume =
		value
end

end

local function SetSpeed(
value
)

value =
	math.clamp(
		tonumber(value)
			or 1,

		CONFIG.MIN_SPEED,
		CONFIG.MAX_SPEED
	)

value =
	math.round(
		value * 20
	)
	/ 20

State.Speed =
	value

SpeedValue.Text =
	string.format(
		"%.2fx",
		value
	)

if State.CurrentSound then

	State.CurrentSound.PlaybackSpeed =
		value
end

end

local function SetScale(
value
)

value =
	math.clamp(
		value,

		CONFIG.MIN_SCALE,
		CONFIG.MAX_SCALE
	)

value =
	math.round(
		value * 20
	)
	/ 20

State.Scale =
	value

MainScale.Scale =
	value

ScaleValue.Text =
	math.floor(
		value * 100
	)
	.. "%"

end

local function SetOpacity(
value
)

value =
	math.clamp(
		value,
		0.65,
		1
	)

State.Opacity =
	value

Main.BackgroundTransparency =
	math.clamp(
		1 - value,
		0,
		0.35
	)

OpacityFill.Size =
	UDim2.new(
		value,
		0,
		1,
		0
	)

OpacityKnob.Position =
	UDim2.new(
		value,
		0,
		0.5,
		0
	)

end

local function UpdateLoop()

local text =
	L()

local mode =
	State.Loop
	and text.loopOn
	or text.loopOff

LoopButton.Text =
	text.loop
	.. " : "
	.. mode

SettingsLoopButton.Text =
	text.loop
	.. " : "
	.. mode

if State.CurrentSound then

	State.CurrentSound.Looped =
		State.Loop
end

if State.Loop then

	LoopButton.BackgroundColor3 =
		Color3.fromRGB(
			45,
			36,
			82
		)

	SettingsLoopButton.BackgroundColor3 =
		Color3.fromRGB(
			45,
			36,
			82
		)
else

	LoopButton.BackgroundColor3 =
		BASE.Card2

	SettingsLoopButton.BackgroundColor3 =
		BASE.Card2
end

end

local function UpdateMute()

local text =
	L()

if State.Muted then

	MuteButton.Text =
		text.muted

	SettingsMuteButton.Text =
		text.muted

	if State.CurrentSound then

		State.CurrentSound.Volume =
			0
	end
else

	MuteButton.Text =
		text.mute

	SettingsMuteButton.Text =
		text.mute

	if State.CurrentSound then

		State.CurrentSound.Volume =
			State.Volume
	end
end

end

--==============================================================
-- LANGUAGE
--==============================================================

local function ApplyLanguage()

local text =
	L()

StartupTitle.Text =
	Safe(text.startupTitle)

StartupDescription.Text =
	Safe(text.startupText)

StartupRU.Text =
	Safe(text.ru)

StartupEN.Text =
	Safe(text.en)

StartupContinue.Text =
	Safe(text.continueText)

Title.Text =
	Safe(text.title)

Subtitle.Text =
	Safe(text.subtitle)

Input.PlaceholderText =
	Safe(text.placeholder)

LoadButton.Text =
	Safe(text.load)

PlayButton.Text =
	Safe(text.play)

PauseButton.Text =
	Safe(text.pause)

StopButton.Text =
	Safe(text.stop)

VolumeLabel.Text =
	Safe(text.volume)

SettingsTitle.Text =
	Safe(text.settings)

SettingsMusicTab.Text =
	Safe(text.music)

SettingsDesignTab.Text =
	Safe(text.design)

SettingsMusicLabel.Text =
	Safe(text.music)

SettingsLoopLabel.Text =
	Safe(text.loop)

SettingsMuteLabel.Text =
	State.Muted
	and Safe(text.muted)
	or Safe(text.mute)

ThemeLabel.Text =
	Safe(text.theme)

OpacityLabel.Text =
	Safe(text.opacity)

ScaleLabel.Text =
	Safe(text.scale)

AnimationButton.Text =
	Safe(text.animation)
	.. " "
	..
	(
		State.Animations
		and text.on
		or text.off
	)

GlowButton.Text =
	Safe(text.glow)
	.. " "
	..
	(
		State.Glow
		and text.on
		or text.off
	)

SystemText.Text =
	Safe(text.ready)

Footer.Text =
	Safe(text.footer)

if not State.AudioID then

	TrackName.Text =
		Safe(text.noTrack)

	TrackStatus.Text =
		Safe(text.ready)
end

for _, data in ipairs(
ThemeList
) do

	local button =
		ThemeButtons[
			data.ID
		]

	if button then

		button.Text =
			Safe(
				text[
					data.KEY
				]
			)
	end
end

UpdateLoop()
UpdateMute()

FixTextVisibility()

end

--==============================================================
-- THEME
--==============================================================

local function ApplyTheme()

local theme =
	T()

local sequence =
	ColorSequence.new({

		ColorSequenceKeypoint.new(
			0,
			theme.A
		),

		ColorSequenceKeypoint.new(
			1,
			theme.B
		),
	})

StartupLogo.BackgroundColor3 =
	theme.A

StartupGlow.BackgroundColor3 =
	theme.A

StartupContinue.BackgroundColor3 =
	theme.A

Logo.BackgroundColor3 =
	theme.A

Album.BackgroundColor3 =
	theme.A

InputIcon.TextColor3 =
	theme.A

LoadButton.BackgroundColor3 =
	theme.A

Progress.BackgroundColor3 =
	theme.A

VolumeFill.BackgroundColor3 =
	theme.A

VolumeValue.TextColor3 =
	theme.A

SpeedValue.TextColor3 =
	theme.A

ScaleValue.TextColor3 =
	theme.A

OpacityFill.BackgroundColor3 =
	theme.A

HeaderAccent.BackgroundColor3 =
	theme.A

Glow.BackgroundColor3 =
	theme.A

StartupLogoGradient.Color =
	sequence

StartupContinueGradient.Color =
	sequence

LogoGradient.Color =
	sequence

AlbumGradient.Color =
	sequence

LoadGradient.Color =
	sequence

ProgressGradient.Color =
	sequence

VolumeGradient.Color =
	sequence

OpacityGradient.Color =
	sequence

HeaderAccentGradient.Color =
	sequence

if State.Glow then

	Glow.BackgroundTransparency =
		0.945

else

	Glow.BackgroundTransparency =
		1
end

end

--==============================================================
-- TEXT VISIBILITY
--==============================================================

function FixTextVisibility()

for _, object in ipairs(
GUI:GetDescendants()
) do

	if
		object:IsA("TextLabel")
		or
		object:IsA("TextButton")
		or
		object:IsA("TextBox")
	then

		object.TextTransparency =
			0
	end
end

end

--==============================================================
-- AUDIO CLEANUP
--==============================================================

local function DestroyCurrentSound()

local sound =
	State.CurrentSound

State.CurrentSound =
	nil

State.Playing =
	false

State.Loading =
	false

if sound then

	pcall(
		function()

			sound.Looped =
				false

			sound:Stop()
			sound:Destroy()

		end
	)
end

end

--==============================================================
-- CREATE SOUND
--==============================================================

local function CreateSound()

DestroyCurrentSound()

local sound =
	Instance.new(
		"Sound"
	)

sound.Name =
	CONFIG.SOUND_NAME

sound.Volume =
	State.Muted
	and 0
	or State.Volume

sound.PlaybackSpeed =
	State.Speed

sound.Looped =
	State.Loop

sound.Parent =
	PlayerGui

State.CurrentSound =
	sound

sound.Ended:Connect(
	function()

		if State.CurrentSound
			~= sound
		then

			return
		end

		if State.Loop then
			if sound.Parent and State.CurrentSound == sound then
				sound.TimePosition = 0
				if not sound.IsPlaying then
					sound:Play()
				end
				State.Playing = true
			end
			return
		end

		State.CurrentSound =
			nil

		State.AudioID =
			nil

		State.Playing =
			false

		State.Loading =
			false

		Progress.Size =
			UDim2.new(
				0,
				0,
				1,
				0
			)

		TimeLabel.Text =
			"00:00 / 00:00"

		TrackName.Text =
			L().noTrack

		SetStatus(
			L().finished,
			BASE.Secondary
		)

		pcall(
			function()

				sound.Looped =
					false

				sound:Stop()
				sound:Destroy()

			end
		)
	end
)

return sound

end

--==============================================================
-- PARSE AUDIO
--==============================================================

local function ParseAudio(
value
)

if typeof(value)
	~= "string"
then

	return nil
end

value =
	value:gsub(
		"^%s+",
		""
	):gsub(
		"%s+$",
		""
	)

if value == "" then
	return nil
end

if value:match(
	"^%d+$"
) then

	return value
end

local id =
	value:match(
		"rbxassetid://(%d+)"
	)

if id then
	return id
end

local patterns = {
	"/library/(%d+)",
	"/asset/(%d+)",
	"/store/asset/(%d+)",
	"[?&]id=(%d+)",
	"assetId=(%d+)",
}

for _, pattern in ipairs(
patterns
) do

	id =
		value:match(
			pattern
		)

	if id then
		return id
	end
end

return nil

end

--==============================================================
-- LOAD
--==============================================================

local function LoadRobloxAudio(
id
)

id =
	tostring(id)

State.LoadToken += 1

local token =
	State.LoadToken

DestroyCurrentSound()

State.AudioID =
	id

State.Loading =
	true

State.Playing =
	false

Progress.Size =
	UDim2.new(
		0,
		0,
		1,
		0
	)

TimeLabel.Text =
	"00:00 / 00:00"

TrackName.Text =
	"Audio " .. id

SetStatus(
	L().loading,
	BASE.Yellow
)

local sound =
	CreateSound()

sound.SoundId =
	"rbxassetid://"
	.. id

task.spawn(
	function()

		local started =
			os.clock()

		while
			State.LoadToken
				== token
		do

			if State.CurrentSound
				~= sound
			then

				return
			end

			if sound.IsLoaded then

				State.Loading =
					false

				local limit =
					CONFIG.SPECIAL_TRACK_LIMITS[
						id
					]

				local length =
					limit
					or sound.TimeLength

				TimeLabel.Text =
					"00:00 / "
					.. FormatTime(
						length
					)

				SetStatus(
					L().ready,
					BASE.Green
				)

				FixTextVisibility()

				return
			end

			if
				os.clock()
				- started
				>= CONFIG.LOAD_TIMEOUT
			then

				if State.CurrentSound
					== sound
				then

					DestroyCurrentSound()

					State.AudioID =
						nil
				end

				SetStatus(
					L().unavailable,
					BASE.Red
				)

				return
			end

			task.wait(
				0.1
			)
		end
	end
)

end

local function LoadAudio()

local id =
	ParseAudio(
		Input.Text
	)

if not id then

	SetStatus(
		L().invalid,
		BASE.Red
	)

	return
end

LoadRobloxAudio(
id
)

end

--==============================================================
-- PLAYBACK
--==============================================================

local function PlayAudio()

if State.Loading then

	SetStatus(
		L().waiting,
		BASE.Yellow
	)

	return
end

if not State.AudioID then

	SetStatus(
		L().first,
		BASE.Yellow
	)

	return
end

local sound =
	State.CurrentSound

if not sound
	or not sound.IsLoaded
then

	SetStatus(
		L().unavailable,
		BASE.Red
	)

	return
end

sound.Volume =
	State.Muted
	and 0
	or State.Volume

sound.PlaybackSpeed =
	State.Speed

sound.Looped =
	State.Loop

if sound.IsPaused then

	sound:Resume()

elseif not sound.IsPlaying then

	sound:Play()
end

State.Playing =
	true

SetStatus(
	L().playing
	.. " • "
	.. State.AudioID,

	BASE.Green
)

end

local function PauseAudio()

local sound =
	State.CurrentSound

if not sound
	or not sound.IsPlaying
then

	return
end

sound:Pause()

State.Playing =
	false

SetStatus(
	L().paused,
	BASE.Yellow
)

end

local function StopAudio()

DestroyCurrentSound()

State.AudioID =
	nil

Progress.Size =
	UDim2.new(
		0,
		0,
		1,
		0
	)

TimeLabel.Text =
	"00:00 / 00:00"

TrackName.Text =
	L().noTrack

SetStatus(
	L().stopped,
	BASE.Secondary
)

end

--==============================================================
-- MOUSE UNLOCK
--==============================================================

local function UnlockMouse()

if IsMobile() then
	return
end

if not State.SavedMouseBehavior then

	State.SavedMouseBehavior =
		UserInputService.MouseBehavior

	State.SavedMouseIcon =
		UserInputService.MouseIconEnabled
end

UserInputService.MouseBehavior =
	Enum.MouseBehavior.Default

UserInputService.MouseIconEnabled =
	true

end

local function RestoreMouse()

if State.SavedMouseBehavior then

	UserInputService.MouseBehavior =
		State.SavedMouseBehavior
end

if State.SavedMouseIcon ~= nil then

	UserInputService.MouseIconEnabled =
		State.SavedMouseIcon
end

State.SavedMouseBehavior =
	nil

State.SavedMouseIcon =
	nil

end

--==============================================================
-- SEEK
--==============================================================

local function SeekFromX(
x
)

local sound =
	State.CurrentSound

if not sound
	or not sound.IsLoaded
	or sound.TimeLength <= 0
then

	return
end

local length =
	sound.TimeLength

local limit =
	CONFIG.SPECIAL_TRACK_LIMITS[
		tostring(
			State.AudioID
		)
	]

if limit then

	length =
		math.min(
			length,
			limit
		)
end

local width =
	ProgressBack.AbsoluteSize.X

if width <= 0 then
	return
end

local percent =
	math.clamp(
		(
			x
			- ProgressBack.AbsolutePosition.X
		)
		/ width,
		0,
		1
	)

sound.TimePosition =
	percent
	* length

end

--==============================================================
-- OPEN
--==============================================================

local function ShowHub()

State.Hidden =
	false

Main.Visible =
	true

UnlockMouse()

Main.BackgroundTransparency =
	math.clamp(
		1 - State.Opacity,
		0,
		0.35
	)

Main.Position =
	UDim2.new(
		0.5,
		0,
		0.57,
		30
	)

MainScale.Scale =
	0.84

Logo.Size =
	UDim2.fromOffset(
		0,
		0
	)

HeaderAccent.Size =
	UDim2.new(
		0,
		0,
		0,
		2
	)

Glow.BackgroundTransparency =
	1

TweenObject(
	Main,
	0.48,
	{
		Position =
			UDim2.fromScale(
				0.5,
				0.5
			)
	},
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out
)

TweenObject(
	MainScale,
	0.48,
	{
		Scale =
			State.Scale
	},
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out
)

task.delay(
	0.06,
	function()

		TweenObject(
			Logo,
			0.40,
			{
				Size =
					UDim2.fromOffset(
						44,
						44
					)
			},
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.10,
	function()

		TweenObject(
			HeaderAccent,
			0.45,
			{
				Size =
					UDim2.new(
						1,
						-30,
						0,
						2
					)
			}
		)
	end
)

if State.Glow then

	task.delay(
		0.08,
		function()

			TweenObject(
				Glow,
				0.45,
				{
					BackgroundTransparency =
						0.945
				}
			)
		end
	)
end

FixTextVisibility()

end

--==============================================================
-- CLOSE
--==============================================================

local function HideHub()

if State.Hidden then
	return
end

State.Hidden =
	true

RestoreMouse()

TweenObject(
	Main,
	0.24,
	{
		Position =
			UDim2.new(
				0.5,
				0,
				0.58,
				24
			)
	},
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In
)

TweenObject(
	MainScale,
	0.24,
	{
		Scale =
			0.84
	},
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In
)

TweenObject(
	Logo,
	0.16,
	{
		Size =
			UDim2.fromOffset(
				0,
				0
			)
	}
)

TweenObject(
	HeaderAccent,
	0.16,
	{
		Size =
			UDim2.new(
				0,
				0,
				0,
				2
			)
	}
)

TweenObject(
	Glow,
	0.16,
	{
		BackgroundTransparency =
			1
	}
)

task.delay(
	0.25,
	function()

		if State.Hidden then

			Main.Visible =
				false
		end
	end
)

end

--==============================================================
-- LAYOUT
--==============================================================

local function ApplyLayout()

local camera =
	workspace.CurrentCamera

if not camera then
	return
end

local viewport =
	camera.ViewportSize

if viewport.X <= 650 then

	local width =
		math.min(
			CONFIG.MOBILE_MAX_WIDTH,

			viewport.X
				- CONFIG.MOBILE_MARGIN * 2
		)

	width =
		math.max(
			width,
			CONFIG.MOBILE_MIN_WIDTH
		)

	local height =
		math.max(
			math.min(
				CONFIG.DESKTOP_HEIGHT,
				viewport.Y - 14
			),
			405
		)

	if not State.Minimized then

		Main.Size =
			UDim2.fromOffset(
				width,
				height
			)
	end

	TrackCard.Size =
		UDim2.new(
			1,
			0,
			0,
			92
		)

	Album.Position =
		UDim2.fromOffset(
			11,
			11
		)

	Album.Size =
		UDim2.fromOffset(
			66,
			66
		)

	TrackName.Position =
		UDim2.fromOffset(
			88,
			11
		)

	TrackName.Size =
		UDim2.new(
			1,
			-177,
			0,
			21
		)

	TrackStatus.Position =
		UDim2.fromOffset(
			88,
			34
		)

	TrackStatus.Size =
		UDim2.new(
			1,
			-177,
			0,
			16
		)

	TimeLabel.Position =
		UDim2.new(
			1,
			-91,
			0,
			18
		)

	TimeLabel.Size =
		UDim2.fromOffset(
			80,
			18
		)

	ProgressBack.Position =
		UDim2.fromOffset(
			88,
			61
		)

	ProgressBack.Size =
		UDim2.new(
			1,
			-102,
			0,
			5
		)

	Controls.Position =
		UDim2.fromOffset(
			0,
			157
		)

	MusicPanel.Position =
		UDim2.fromOffset(
			0,
			216
		)

	MusicPanel.Size =
		UDim2.new(
			1,
			0,
			0,
			153
		)

	LoopButton.Position =
		UDim2.fromOffset(
			12,
			63
		)

	LoopButton.Size =
		UDim2.new(
			0.5,
			-18,
			0,
			36
		)

	MuteButton.Position =
		UDim2.new(
			0.5,
			6,
			0,
			63
		)

	MuteButton.Size =
		UDim2.new(
			0.5,
			-18,
			0,
			36
		)

	SpeedMinus.Position =
		UDim2.new(
			0.5,
			-87,
			1,
			-43
		)

	SpeedValue.Position =
		UDim2.new(
			0.5,
			-27,
			1,
			-43
		)

	SpeedPlus.Position =
		UDim2.new(
			0.5,
			35,
			1,
			-43
		)

	Footer.Visible =
		false

else

	if not State.Minimized then

		Main.Size =
			UDim2.fromOffset(
				CONFIG.DESKTOP_WIDTH,
				CONFIG.DESKTOP_HEIGHT
			)
	end

	TrackCard.Size =
		UDim2.new(
			1,
			0,
			0,
			94
		)

	Album.Position =
		UDim2.fromOffset(
			13,
			13
		)

	Album.Size =
		UDim2.fromOffset(
			68,
			68
		)

	TrackName.Position =
		UDim2.fromOffset(
			95,
			12
		)

	TrackName.Size =
		UDim2.new(
			1,
			-205,
			0,
			22
		)

	TrackStatus.Position =
		UDim2.fromOffset(
			95,
			35
		)

	TrackStatus.Size =
		UDim2.new(
			1,
			-205,
			0,
			17
		)

	TimeLabel.Position =
		UDim2.new(
			1,
			-100,
			0,
			20
		)

	TimeLabel.Size =
		UDim2.fromOffset(
			90,
			20
		)

	ProgressBack.Position =
		UDim2.fromOffset(
			95,
			62
		)

	ProgressBack.Size =
		UDim2.new(
			1,
			-110,
			0,
			5
		)

	Controls.Position =
		UDim2.fromOffset(
			0,
			164
		)

	MusicPanel.Position =
		UDim2.fromOffset(
			0,
			223
		)

	MusicPanel.Size =
		UDim2.new(
			1,
			0,
			0,
			118
		)

	LoopButton.Position =
		UDim2.fromOffset(
			12,
			63
		)

	LoopButton.Size =
		UDim2.fromOffset(
			112,
			36
		)

	MuteButton.Position =
		UDim2.fromOffset(
			130,
			63
		)

	MuteButton.Size =
		UDim2.fromOffset(
			112,
			36
		)

	SpeedMinus.Position =
		UDim2.new(
			1,
			-171,
			0,
			63
		)

	SpeedValue.Position =
		UDim2.new(
			1,
			-128,
			0,
			63
		)

	SpeedPlus.Position =
		UDim2.new(
			1,
			-84,
			0,
			63
		)

	Footer.Visible =
		true
end

end

--==============================================================
-- DRAG
--==============================================================

Header.InputBegan:Connect(
function(input)

	-- DESKTOP
	if input.UserInputType
		== Enum.UserInputType.MouseButton1
	then

		local position =
			input.Position

		local function Inside(
			object
		)

			if not object then
				return false
			end

			local p =
				object.AbsolutePosition

			local s =
				object.AbsoluteSize

			return
				position.X >= p.X
				and
				position.X <=
					p.X + s.X

				and

				position.Y >= p.Y
				and
				position.Y <=
					p.Y + s.Y
		end

		if
			Inside(SettingsButton)
			or
			Inside(MinimizeButton)
			or
			Inside(CloseButton)
		then

			return
		end

		State.Dragging =
			true

		State.DragStart =
			position

		State.DragOrigin =
			Main.Position

		State.DragInput =
			input

		return
	end

	-- MOBILE
	if input.UserInputType
		== Enum.UserInputType.Touch
	then

		local position =
			input.Position

		local function Inside(
			object
		)

			if not object then
				return false
			end

			local p =
				object.AbsolutePosition

			local s =
				object.AbsoluteSize

			return
				position.X >= p.X
				and
				position.X <=
					p.X + s.X

				and

				position.Y >= p.Y
				and
				position.Y <=
					p.Y + s.Y
		end

		if
			Inside(SettingsButton)
			or
			Inside(MinimizeButton)
			or
			Inside(CloseButton)
		then

			return
		end

		State.Dragging =
			true

		State.DragStart =
			position

		State.DragOrigin =
			Main.Position

		State.DragInput =
			input

	end
end
)

--==============================================================
-- MOVEMENT
--==============================================================

UserInputService.InputChanged:Connect(
function(input)

	-- DESKTOP MOUSE MOVEMENT
	if input.UserInputType
		== Enum.UserInputType.MouseMovement
	then

		if
			State.Dragging
			and State.DragStart
			and State.DragOrigin
			and (
				not State.DragInput
				or State.DragInput.UserInputType
					== Enum.UserInputType.MouseButton1
			)
		then

			local delta =
				input.Position
				- State.DragStart

			Main.Position =
				UDim2.new(
					State.DragOrigin.X.Scale,
					State.DragOrigin.X.Offset
						+ delta.X,

					State.DragOrigin.Y.Scale,
					State.DragOrigin.Y.Offset
						+ delta.Y
				)
		end

		if State.VolumeDragging then

			local width =
				VolumeBack.AbsoluteSize.X

			if width > 0 then

				SetVolume(
					(
						input.Position.X
						- VolumeBack.AbsolutePosition.X
					)
					/ width
				)
			end
		end

		if State.Seeking then

			SeekFromX(
				input.Position.X
			)
		end

		return
	end

	-- MOBILE TOUCH MOVEMENT
	if input.UserInputType
		== Enum.UserInputType.Touch
	then

		if
			State.Dragging
			and State.DragStart
			and State.DragOrigin
			and State.DragInput
			and input == State.DragInput
		then

			local delta =
				input.Position
				- State.DragStart

			Main.Position =
				UDim2.new(
					State.DragOrigin.X.Scale,
					State.DragOrigin.X.Offset
						+ delta.X,

					State.DragOrigin.Y.Scale,
					State.DragOrigin.Y.Offset
						+ delta.Y
				)
		end
	end
end
)

UserInputService.InputEnded:Connect(
function(input)

	if
		input.UserInputType
			== Enum.UserInputType.MouseButton1

		or

		input.UserInputType
			== Enum.UserInputType.Touch
	then

		if State.DragInput == input then
			State.DragInput = nil
		end

		State.Dragging =
			false

		State.VolumeDragging =
			false

		State.Seeking =
			false
	end
end
)

--==============================================================
-- SLIDERS
--==============================================================

VolumeBack.InputBegan:Connect(
function(input)

	if
		input.UserInputType
			== Enum.UserInputType.MouseButton1

		or

		input.UserInputType
			== Enum.UserInputType.Touch
	then

		State.VolumeDragging =
			true

		local width =
			VolumeBack.AbsoluteSize.X

		if width > 0 then

			SetVolume(
				(
					input.Position.X
					- VolumeBack.AbsolutePosition.X
				)
				/ width
			)
		end
	end
end
)

ProgressBack.InputBegan:Connect(
function(input)

	if
		input.UserInputType
			== Enum.UserInputType.MouseButton1

		or

		input.UserInputType
			== Enum.UserInputType.Touch
	then

		State.Seeking =
			true

		SeekFromX(
			input.Position.X
		)
	end
end
)

OpacityBack.InputBegan:Connect(
function(input)

	if
		input.UserInputType
			== Enum.UserInputType.MouseButton1

		or

		input.UserInputType
			== Enum.UserInputType.Touch
	then

		local width =
			OpacityBack.AbsoluteSize.X

		if width > 0 then

			SetOpacity(
				(
					input.Position.X
					- OpacityBack.AbsolutePosition.X
				)
				/ width
			)
		end
	end
end
)

--==============================================================
-- MUSIC EVENTS
--==============================================================

LoadButton.MouseButton1Click:Connect(
LoadAudio
)

Input.FocusLost:Connect(
function(enterPressed)

	if enterPressed then
		LoadAudio()
	end
end
)

PlayButton.MouseButton1Click:Connect(
PlayAudio
)

PauseButton.MouseButton1Click:Connect(
PauseAudio
)

StopButton.MouseButton1Click:Connect(
StopAudio
)

LoopButton.MouseButton1Click:Connect(
function()

	State.Loop =
		not State.Loop

	UpdateLoop()
end
)

SettingsLoopButton.MouseButton1Click:Connect(
function()

	State.Loop =
		not State.Loop

	UpdateLoop()
end
)

MuteButton.MouseButton1Click:Connect(
function()

	State.Muted =
		not State.Muted

	UpdateMute()
	ApplyLanguage()
end
)

SettingsMuteButton.MouseButton1Click:Connect(
function()

	State.Muted =
		not State.Muted

	UpdateMute()
	ApplyLanguage()
end
)

SpeedMinus.MouseButton1Click:Connect(
function()

	SetSpeed(
		State.Speed
			- CONFIG.SPEED_STEP
	)
end
)

SpeedPlus.MouseButton1Click:Connect(
function()

	SetSpeed(
		State.Speed
			+ CONFIG.SPEED_STEP
	)
end
)

--==============================================================
-- SETTINGS EVENTS
--==============================================================

SettingsButton.MouseButton1Click:Connect(
function()

	if State.Minimized then
		return
	end

	State.SettingsOpen =
		not State.SettingsOpen

	Body.Visible =
		not State.SettingsOpen

	SettingsPage.Visible =
		State.SettingsOpen

	UnlockMouse()

	FixTextVisibility()
end
)

SettingsBack.MouseButton1Click:Connect(
function()

	State.SettingsOpen =
		false

	Body.Visible =
		true

	SettingsPage.Visible =
		false

	FixTextVisibility()
end
)

SettingsMusicTab.MouseButton1Click:Connect(
function()

	SettingsMusicPage.Visible =
		true

	SettingsDesignPage.Visible =
		false
end
)

SettingsDesignTab.MouseButton1Click:Connect(
function()

	SettingsMusicPage.Visible =
		false

	SettingsDesignPage.Visible =
		true
end
)

--==============================================================
-- DESIGN
--==============================================================

AnimationButton.MouseButton1Click:Connect(
function()

	State.Animations =
		not State.Animations

	ApplyLanguage()
end
)

GlowButton.MouseButton1Click:Connect(
function()

	State.Glow =
		not State.Glow

	ApplyTheme()
	ApplyLanguage()
end
)

ScaleMinus.MouseButton1Click:Connect(
function()

	SetScale(
		State.Scale
			- 0.05
	)
end
)

ScalePlus.MouseButton1Click:Connect(
function()

	SetScale(
		State.Scale
			+ 0.05
	)
end
)

for themeID, button in pairs(
ThemeButtons
) do

button.MouseButton1Click:Connect(
	function()

		State.Theme =
			themeID

		ApplyTheme()
		ApplyLanguage()
		FixTextVisibility()
	end
)

end

--==============================================================
-- STARTUP LANGUAGE
--==============================================================

StartupRU.MouseButton1Click:Connect(
function()

	State.Language =
		"RU"

	ApplyLanguage()

	StartupRU.BackgroundColor3 =
		Color3.fromRGB(
			45,
			36,
			82
		)

	StartupEN.BackgroundColor3 =
		BASE.Card2
end
)

StartupEN.MouseButton1Click:Connect(
function()

	State.Language =
		"EN"

	ApplyLanguage()

	StartupEN.BackgroundColor3 =
		Color3.fromRGB(
			45,
			36,
			82
		)

	StartupRU.BackgroundColor3 =
		BASE.Card2
end
)

--==============================================================
-- STARTUP CONTINUE
--==============================================================

StartupContinue.MouseButton1Click:Connect(
function()

	Startup.Visible =
		false

	State.Hidden =
		true

	ApplyLayout()

	ShowHub()
end
)

--==============================================================
-- MINIMIZE
--==============================================================

MinimizeButton.MouseButton1Click:Connect(
function()

	if State.Minimized then

		State.Minimized =
			false

		Main.Size =
			UDim2.fromOffset(
				CONFIG.DESKTOP_WIDTH,
				CONFIG.DESKTOP_HEIGHT
			)

		Body.Visible =
			not State.SettingsOpen

		SettingsPage.Visible =
			State.SettingsOpen

		MinimizeButton.Text =
			"—"

		ApplyLayout()

		TweenObject(
			MainScale,
			0.35,
			{
				Scale =
					State.Scale
			},
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		)

		FixTextVisibility()

	else

		State.Minimized =
			true

		Body.Visible =
			false

		SettingsPage.Visible =
			false

		State.SettingsOpen =
			false

		MinimizeButton.Text =
			"+"

		TweenObject(
			Main,
			0.25,
			{
				Size =
					UDim2.fromOffset(
						Main.AbsoluteSize.X,
						72
					)
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
end
)

--==============================================================
-- CLOSE
--==============================================================

CloseButton.MouseButton1Click:Connect(
function()

	HideHub()
end
)

--==============================================================
-- RIGHT SHIFT
--==============================================================

UserInputService.InputBegan:Connect(
function(input, processed)

	if processed then
		return
	end

	if input.KeyCode
		~= CONFIG.TOGGLE_KEY
	then
		return
	end

	if Startup.Visible then
		return
	end

	if State.Hidden then
		ShowHub()
	else
		HideHub()
	end
end
)

--==============================================================
-- TIMER
--==============================================================

task.spawn(
function()

	while GUI.Parent do

		local sound =
			State.CurrentSound

		if
			sound
			and sound.Parent
			and sound.IsLoaded
			and sound.TimeLength > 0
		then

			local position =
				sound.TimePosition

			local realLength =
				sound.TimeLength

			local limit =
				CONFIG.SPECIAL_TRACK_LIMITS[
					tostring(
						State.AudioID
					)
				]

			local displayLength =
				limit
				or realLength

			if
				limit
				and position >= limit
			then

				if State.Loop then
					sound.TimePosition = 0
					if not sound.IsPlaying then
						sound:Play()
					end
					State.Playing = true
				else

					local endedSound =
						State.CurrentSound

					State.CurrentSound =
						nil

					State.AudioID =
						nil

					State.Playing =
						false

					State.Loading =
						false

					if endedSound then

						pcall(
							function()

								endedSound.Looped =
									false

								endedSound:Stop()
								endedSound:Destroy()

							end
						)
					end

					Progress.Size =
						UDim2.new(
							0,
							0,
							1,
							0
						)

					TimeLabel.Text =
						"00:00 / 00:00"

					TrackName.Text =
						L().noTrack

					SetStatus(
						L().finished,
						BASE.Secondary
					)
				end

			else

				TimeLabel.Text =
					FormatTime(
						position
					)
					.. " / "
					.. FormatTime(
						displayLength
					)

				if not State.Seeking then

					local progress =
						math.clamp(
							position
								/ displayLength,
							0,
							1
						)

					Progress.Size =
						UDim2.new(
							progress,
							0,
							1,
							0
						)
				end

				if sound.IsPlaying then

					Disc.Rotation =
						(
							Disc.Rotation
							+ 0.8
						)
						% 360
				end
			end
		end

		if
			State.Glow
			and Main.Visible
		then

			Glow.BackgroundTransparency =
				0.945
				+
				math.sin(
					os.clock()
						* 2
				)
				* 0.012
		else

			Glow.BackgroundTransparency =
				1
		end

		if Startup.Visible then

			StartupGlow.Size =
				UDim2.fromOffset(
					110
						+ math.sin(
							os.clock()
								* 2
						)
						* 8,

					110
						+ math.sin(
							os.clock()
								* 2
						)
						* 8
				)
		end

		task.wait(
			0.05
		)
	end
end
)

--==============================================================
-- STARTUP PREMIUM ANIMATION
--==============================================================

local function PlayStartupAnimation()

Startup.BackgroundTransparency =
	1

StartupLogo.Size =
	UDim2.fromOffset(
		0,
		0
	)

StartupTitle.TextTransparency =
	1

StartupDescription.TextTransparency =
	1

StartupRU.TextTransparency =
	1

StartupEN.TextTransparency =
	1

StartupContinue.TextTransparency =
	1

StartupRU.BackgroundTransparency =
	1

StartupEN.BackgroundTransparency =
	1

StartupContinue.BackgroundTransparency =
	1

StartupGlow.BackgroundTransparency =
	1

TweenObject(
	Startup,
	0.45,
	{
		BackgroundTransparency =
			0
	},
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out
)

task.delay(
	0.05,
	function()

		TweenObject(
			StartupGlow,
			0.65,
			{
				BackgroundTransparency =
					0.90
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.10,
	function()

		TweenObject(
			StartupLogo,
			0.55,
			{
				Size =
					UDim2.fromOffset(
						62,
						62
					)
			},
			Enum.EasingStyle.Back,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.25,
	function()

		TweenObject(
			StartupTitle,
			0.30,
			{
				TextTransparency =
					0
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.32,
	function()

		TweenObject(
			StartupDescription,
			0.30,
			{
				TextTransparency =
					0
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.40,
	function()

		TweenObject(
			StartupRU,
			0.30,
			{
				TextTransparency =
					0,

				BackgroundTransparency =
					0
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)

		TweenObject(
			StartupEN,
			0.30,
			{
				TextTransparency =
					0,

				BackgroundTransparency =
					0
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
)

task.delay(
	0.50,
	function()

		TweenObject(
			StartupContinue,
			0.35,
			{
				TextTransparency =
					0,

				BackgroundTransparency =
					0
			},
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		)
	end
)

end

--==============================================================
-- INITIALIZATION
--==============================================================

ApplyTheme()

ApplyLanguage()

SetVolume(
CONFIG.DEFAULT_VOLUME
)

SetSpeed(
CONFIG.DEFAULT_SPEED
)

SetScale(
1
)

SetOpacity(
1
)

UpdateLoop()
UpdateMute()

ApplyLayout()
FixTextVisibility()

Startup.Visible =
true

PlayStartupAnimation()

--==============================================================
-- RESPONSIVE WATCHER
--==============================================================

task.spawn(
function()

	while GUI.Parent do

		ApplyLayout()

		FixTextVisibility()

		task.wait(
			0.25
		)
	end
end
)

--==============================================================
-- CLEANUP
--==============================================================

GUI.AncestryChanged:Connect(
function(_, parent)

	if parent == nil then

		RestoreMouse()
		DestroyCurrentSound()
	end
end
)

--==============================================================
-- DEBUG
--==============================================================

print("================================================")
print("             TEAM PRIME HUB V25")
print("================================================")
print("FUNCTION ORDER          : FIXED")
print("LANGUAGE SYSTEM         : READY")
print("THEME SYSTEM            : READY")
print("TEXT VISIBILITY         : FIXED")
print("STARTUP ANIMATION       : READY")
print("LOGO POP                : READY")
print("STARTUP GLOW            : READY")
print("PREMIUM OPEN            : READY")
print("PREMIUM CLOSE           : READY")
print("MINIMIZE                : READY")
print("CLOSE                   : READY")
print("RIGHT SHIFT             : READY")
print("DRAG                    : DESKTOP + MOBILE")
print("MOBILE                  : READY")
print("VOLUME                  : READY")
print("SPEED                   : READY")
print("LOOP                    : READY")
print("TIMER                   : READY")
print("SEEK                    : READY")
print("SPECIAL TRACK           : 75485931767123 / 01:55")
print("AUTO NEXT TRACK         : DISABLED")
print("CAMERA CFRAME           : NOT USED")
print("================================================")
