
local LoadScene = class("LoadScene", function()
    return display.newScene("LoadScene")
end)

function LoadScene:ctor()
	
	local function createScene(name)
		local scene = display.newScene(name)
		scene:addNodeEventListener(cc.NODE_EVENT,function(event)

		end)
		return scene
	end
	----1.等待界面----
	self:performWithDelay(function()
		local scene1 = createScene("scene1")
		display.replaceScene(scene1)
		display.newSprite("pic/loadingBg.png")
		:pos(display.cx,display.cy)
		:addTo(scene1)

		-----2.地图选择界面----- 
		scene1:performWithDelay(function()
			local scene2 = createScene("scene2")
			display.replaceScene(scene2)


			local sp1 = display.newSprite("map/LevelTheme/themeMap1.png")
				:pos(display.cx+348,display.cy)
			local sp2 = display.newSprite("map/LevelTheme/themeMap2.png")
				:pos(display.cx+348+1656,display.cy+40)
				:addTo(sp1)
			local sp3 = display.newSprite("map/LevelTheme/themeMap3.png")
				:pos(display.cx+348+1656,display.cy+40)
				:addTo(sp2)
			local sp4 = display.newSprite("map/LevelTheme/themeMap4.png")
				:pos(display.cx+444+1656,display.cy+40)
				:addTo(sp3)
			cc.ui.UIScrollView.new({
			direction = cc.ui.UIScrollView.DIRECTION_HORIZONTAL,
			viewRect ={x=0,y=0,width=1280,height=640},
			scrollbarImgH="map/barH.png",
				})
			:addScrollNode(sp1)
			:setDirection(cc.ui.UIScrollView.DIRECTION_HORIZONTAL)
			:addTo(scene2)
			:pos(0,0)
			:setBounceable(false)
		end,1.0)
	end,0.01)
end


function LoadScene:onEnter()
end

function LoadScene:onExit()
end

return LoadScene
