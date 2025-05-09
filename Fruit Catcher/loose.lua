local Object = require "screen"
local Loose = Object:extend()

local Button = require 'button'
local backButton = Button("Back",SCREEN_WIDTH/2 - 100, SCREEN_HEIGHT - 150, 200, 100, function() ChangeScreen(1) score = 0 end, love.graphics.newFont(25),{0.8,0.1,0.1},{1,1,1})

function Loose:new()
    mus_loose = love.audio.newSource("Audio/loose.ogg", "stream")
end

function Loose:update(dt)
    
end

function Loose:DrawScreen()
    love.graphics.setBackgroundColor(.1,.1,.1)

     mus_loose:play()
    local winText = "GAME OVER!"
    local font = love.graphics.newFont(64)
    love.graphics.setFont(font)
    local textWidth = font:getWidth(winText)
    local textHeight = font:getHeight()
    local screenWidth, screenHeight = love.graphics.getDimensions()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(winText, (screenWidth - textWidth) / 2, screenHeight / 4)

    -- Draw total score
    local scoreText = "Total Score: " .. score
    local scoreFont = love.graphics.newFont(32)
    love.graphics.setFont(scoreFont)
    local scoreWidth = scoreFont:getWidth(scoreText)
    love.graphics.print(scoreText, (screenWidth - scoreWidth) / 2, screenHeight / 4 + textHeight + 20)

    local HighscoreText = "High Score: " .. highscore
    local highscorefont = love.graphics.newFont(32)
    love.graphics.setFont(highscorefont)
    local highscoreWidth = highscorefont:getWidth(HighscoreText)
    love.graphics.print(HighscoreText, (screenWidth - highscoreWidth) / 2, screenHeight / 3 + textHeight + 30)
    -- Back Button
    backButton:render()
    
end

function Loose:MousePressed(x,y,button)

    if button == 1 then
        backButton:CheckPressed(x,y)
    end

end

return Loose
