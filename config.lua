-- config.lua
local aspectRatio = display.pixelHeight / display.pixelWidth
local factorDown = 1
eX = 320-((320/10)*factorDown)
eY = 480-((480/10)*factorDown)
print("eX = "..eX)
print("eY = "..eY)

application =
{
	content =
	{
		width = aspectRatio > 1.5 and eX or math.ceil( eY / aspectRatio ),
       height = aspectRatio < 1.5 and eY or math.ceil( eX * aspectRatio ),
		fps = 30,
		scale = "zoomEven" 
	},
}
