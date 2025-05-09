local Object = require "classic"

local PowerUp = Object:extend()

function PowerUp:new()
    self.image = love.graphics.newImage("Textures/powerup.png")
        self.x = love.math.random(2,550)
        self.y = 40
        self.speed = 100
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
end

function PowerUp:update(dt)
self.y = self.y + self.speed * dt

end

function PowerUp:draw()
love.graphics.draw(self.image,self.x,self.y)
end



function PowerUp:checkCollision(a,b)
local a_left = a.x
local a_right = a.x + a.width
local a_top = a.y
local a_bottom = a.y + a.height

local b_left = b.x
local b_right = b.x + b.width
local b_top = b.y
local b_bottom = b.y + b.height


 if  a_right > b_left
 
 and a_left < b_right

 and a_bottom > b_top
 
 and a_top < b_bottom then
         
    
    print("a collision occurred")

        SpeedUp = true  
     return true
     
 else
    
     
 end

end


return PowerUp