local Object = require "classic"
local RottenApple = Object:extend()


    function RottenApple:new()
        self.image = love.graphics.newImage("Textures/Rottenapple.png")
        self.x = love.math.random(2,550)
        self.y = 40
        self.speed = 200
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
    end

    function RottenApple:draw()
    love.graphics.draw(self.image, self.x,self.y)
    end
    
    function RottenApple:update(dt)
    self.y = self.y + self.speed * dt
    
    if self.y > 850 then
        self.y = 40
        self.x = love.math.random(2,500)       
        end
    
    end

    function RottenApple:checkCollision(a,b)
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
            
         end
         
         
         
         rottenapple = love.math.random(1,3)
         self.touched = false
         return true
         
     else
         rottenapple = love.math.random(1,3)
         return false
         
     end

    end
    
    return RottenApple
    