local Object = require "classic"
local Player = Object:extend()

function Player:new()
self.image = love.graphics.newImage("Textures/PlayerBasket.png")
self.x = 300
self.y = 770
self.speed = 400
score = 0
highscore = 0
self.width = self.image:getWidth()
self.height = self.image:getHeight()
self.tag = "Player"

activetimer = 0
activeduration = 10
end

function Player:draw()
love.graphics.draw(self.image, self.x,self.y)
end

function Player:update(dt)
if love.keyboard.isDown("left") then
self.x = self.x - self.speed * dt
elseif love.keyboard.isDown("right") then
self.x = self.x + self.speed * dt
end

local window_width = love.graphics.getWidth()

if self.x < 0 then
self.x = 0
elseif self.x + self.width > window_width then
self.x = window_width - self.width
end 


if SpeedUp == true then
    activetimer = activetimer + dt
    self.speed = 700
    
    
end

if activetimer >= activeduration then
activetimer = 0
self.speed = 400
SpeedUp = false
end

end

return Player