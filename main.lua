local timeLmt = 3400
centerX = display.contentCenterX
centerY = display.contentCenterY

local function pulseObj(obj,increm)
	if increm == -1 then
		transition.to(obj,{time=timeLmt,x=display.screenOriginX-1100})
	else
		transition.to(obj,{time=timeLmt,x=centerX+80})
	end
	print("transitioning object here")
end
local rectGradient = {}
local colorGradient = {
  {62/255,35/255,1},
  {1,1,60/255},
  {1,35/255,98/255},
  {45/255,175/255,230/255},
  {.5,0,1},
  {1,128/255,0}
  }
local inc = #colorGradient
local increm = -1

local rectBack = display.newRect(centerX, centerY, display.contentWidth*2, display.contentHeight)
rectBack:setFillColor(0,0,1)
for i=1, #colorGradient do
	rectGradient[i] = display.newRect(centerX, centerY, display.contentWidth*1.5, display.contentHeight)
	rectGradient[i]:setFillColor(unpack(colorGradient[i]))
	--rectGradient[i].x = display.screenOriginX+(i*(rectGradient[i].width/2))
	rectGradient[i].x = centerX+(display.contentWidth/8)
	rectGradient[i].increm = -1
	rectGradient[i].alpha = .9
	rectGradient[i].fill.effect = "filter.linearWipe"
	rectGradient[i].fill.effect.direction = { 1, 0 }
	rectGradient[i].fill.effect.smoothness = .9
	rectGradient[i].fill.effect.progress = 0.5
end
local function transitionBackg()
	timer.performWithDelay(timeLmt/2, function()
		pulseObj(rectGradient[inc],increm)
		if inc > #colorGradient then
			increm = -1
		elseif inc < 3 then
			increm = 1
		end
		inc = inc+increm
		print("inc = "..inc)
		print("increm = "..increm)
	end, 0)
end
transitionBackg()