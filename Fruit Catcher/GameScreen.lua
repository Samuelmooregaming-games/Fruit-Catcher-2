local Object = require "classic"
local Player = require "Player"
local Apple = require "Apple"
local Banana = require "Banana"
local Orange = require "Orange"
local PowerUp = require "powerup"
local RottenApple = require "RottenApple"
local RottenBanana = require "RottenBanana"
local RottenOrange = require "RottenOrange"
local Ground = require "Ground"
local Screen = require "screen"


 


local GameScreen = Screen:extend()
function GameScreen:new()
    
    self.super:new()
    player = Player()
    apple = Apple()
    banana = Banana()
    orange = Orange()
    rottenapple = RottenApple()
    rottenbanana = RottenBanana()
    rottenorange = RottenOrange()
    ground = Ground()
    self.powerup = nil
   Object = require "classic"
    require "player"
    require "powerup"
    require "Apple"
    require  "Banana"
    require "Orange"
    require "RottenApple"
    require "RottenBanana"
    require "RottenOrange"
    require "Ground"
    self.image = love.graphics.newImage("Textures/Background.png")
    song = love.audio.newSource("Audio/fruit catch.ogg", "stream")
    catch = love.audio.newSource("Audio/collect.ogg", "static")
    powerupget = love.audio.newSource("Audio/powerup get.ogg", "static")
    
    Fruits = {apple,banana,orange}
    table.insert(Fruits, apple)
    table.insert(Fruits, banana)
    table.insert(Fruits, orange)



    RottenFruits = {rottenapple,rottenbanana, rottenorange}
    table.insert(RottenFruits, rottenapple)
    table.insert(RottenFruits, rottenbanana)
    table.insert(RottenFruits, rottenorange)


    self.fruit = love.math.random(1,3)
    self.rotten = love.math.random(1,3)

    timer = 60
    duration = 0.0

    

end


function  GameScreen:Update(dt)
    
    if score >= highscore then
        highscore = score
       
    end

    if self.powerup ~= nil then
        self.powerup:update(dt)
    end
--apple:update(dt)
Fruits[self.fruit]:update(dt) 


RottenFruits[self.rotten]:update(dt)

timer = timer - dt

if timer <= duration then
    self.powerup = PowerUp()
    timer = 60
end

-- orange:update(dt)   
player:update(dt)

-- rottenapple:update(dt)
-- rottenbanana:update(dt)
-- rottenorange:update(dt)
-- apple:checkCollision(player)
--Fruits[self.fruit]:checkCollision(player,Fruits[self.fruit])

if Fruits[self.fruit]:checkCollision(player,Fruits[self.fruit])  == true then
    self.fruit = love.math.random(1,3)
    catch:play()
    

elseif Fruits[self.fruit]:checkCollision(ground,Fruits[self.fruit])  == true then
    self.fruit = love.math.random(1,3)
end




if RottenFruits[self.rotten]:checkCollision(player, RottenFruits[self.rotten] ) == true then
    self.rotten = love.math.random(1,3)
    player.x = 259
    SpeedUp = false
    player.speed = 400
    activetimer = 0
    self.powerup = nil

elseif RottenFruits[self.rotten]:checkCollision(ground, RottenFruits[self.rotten]) == true then
    self.rotten = love.math.random(1,3)
end

if self.powerup ~= nil then

if self.powerup:checkCollision(player, self.powerup) == true then
self.powerup = nil
powerupget:play()
timer = 60
end

end


-- RottenFruits[self.rotten]:checkCollision(player, Fruits[self.rotten])

--orange:checkCollision(player)
-- rottenapple:checkCollision(player)
-- rottenbanana:checkCollision(player)
-- rottenorange:checkCollision(player)

-- banana:checkCollision(apple)
-- orange:checkCollision(apple)

-- apple:checkCollision(orange)
-- banana:checkCollision(orange)

-- apple:checkCollision(banana)
-- orange:checkCollision(banana)






function GameScreen:DrawScreen()
love.graphics.draw(self.image)
ground:draw()
title:stop()
song:play()
--apple:draw()
--banana:draw()
--orange:draw()
-- rottenapple:draw()
-- rottenbanana:draw()
-- rottenorange:draw()
Fruits[self.fruit]:draw()

RottenFruits[self.rotten]:draw()

if self.powerup ~= nil then
    self.powerup:draw()
end

-- for i = 1, #Fruits do
-- if (Fruits[i])
-- end

song:play()
love.graphics.print("Score: " .. score, 16, 16)
love.graphics.print("highscore: ".. highscore, 200, 16)
if SpeedUp == true then
    love.graphics.print("Speed Up! "..activeduration - activetimer   ,443, 16)
    
end

player:draw()


end
end

return GameScreen