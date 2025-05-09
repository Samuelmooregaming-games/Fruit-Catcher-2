local Screen = require "screen"
local Button = require "button"


local StartScreen = Screen:extend()

--start screen code goes here
local titleBox = {x = 50, y = 100, width = 510, height = 100}



local startButton = Button("Start",150,500,300,50,function() ChangeScreen(2) end,love.graphics.newFont(25),{1,1,1},{0.8,0.1,0.1})
local tutorialbutton = Button("Tutorial",150,300,300,50,function() ChangeScreen(3) end, love.graphics.newFont(25),{1,1,1},{0.6,0.1,152})




function StartScreen:new()
    self.super.new()
    title = love.audio.newSource("Audio/title.ogg", "stream")
end

function StartScreen:Update (dt)
    
end

function StartScreen:DrawScreen()
   
mus_loose:stop()
title:play()
    love.graphics.setBackgroundColor(.1,.1,.1)


    startButton:render()

    love.graphics.setColor(0.6,0.1,0.6)
    love.graphics.rectangle("fill", titleBox.x,titleBox.y, titleBox.width,titleBox.height)
    love.graphics.setColor(1,1,1)
    local titleFont = love.graphics.newFont(70)
    love.graphics.setFont(titleFont)
    local titleText = "Fruit Catcher 2"
    local titleTextWidth = titleFont:getWidth(titleText)
    local titleTextHeight = titleFont:getHeight(titleText)
    love.graphics.print(titleText, titleBox.x + (titleBox.width / 2) - (titleTextWidth / 2),
    titleBox.y + (titleBox.height / 2) - (titleTextHeight / 2))


    tutorialbutton:render()


end
   


function StartScreen:MousePressed(x, y, button)
    if button == 1 then
        startButton:CheckPressed(x,y)
        tutorialbutton:CheckPressed(x,y)
    end
end







return StartScreen