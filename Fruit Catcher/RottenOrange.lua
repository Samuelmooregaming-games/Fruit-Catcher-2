local Object = require "classic"
local RottenOrange = Object:extend()


    function RottenOrange:new()
        self.image = love.graphics.newImage("Textures/RottenOrange.png")
        self.x = love.math.random(2,550)
        self.y = 40
        self.speed = 400
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
    end

    function RottenOrange:draw()
    love.graphics.draw(self.image, self.x,self.y)
    end
    
    function RottenOrange:update(dt)
    self.y = self.y + self.speed * dt
    
    if self.y > 850 then
        self.y = 40
        self.x = love.math.random(2,500)       
        end


        local window_width = love.graphics.getWidth()

if self.x < 0 then
self.x = 0
elseif self.x + self.width > window_width then
self.x = window_width - self.width
end 
    
if resetfallspeed == true then 

    self.speed = 400
    resetfallspeed = false
end


    end

    function RottenOrange:checkCollision(a,b)
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
             self.y = 40
             self.x = love.math.random(2,550)
             if a.tag ~= "Ground" and a.tag == "Player" then
                gameover = true
                ChangeScreen(4)
                song:stop()
                
             end
             
             
             
             rottenorange = love.math.random(1,3)
             self.touched = false
             return true
             
         else
             rottenorange = love.math.random(1,3)
             return false
             
         end
    
            
            
        end
    
    return RottenOrange
    