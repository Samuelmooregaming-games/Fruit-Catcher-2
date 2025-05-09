local Object = require "classic"
local Apple = Object:extend()


    function Apple:new()
        self.image = love.graphics.newImage("Textures/apple.png")
        
        self.x = love.math.random(2,550)
        self.y = 40
        self.speed = 200
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
    end



    function Apple:draw()
    love.graphics.draw(self.image, self.x,self.y)
    end
    
    

    function Apple:update(dt)
    self.y = self.y + self.speed * dt
    
    if gameover == true then
        self.y = 40
        self.x = love.math.random(2,500)
        score = 0
        gameover = false
        end

        if resetfallspeed == true then 

            self.speed = 200
            resetfallspeed = false
        end


        local window_width = love.graphics.getWidth()

        if self.x < 0 then
        self.x = 0
        elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        end 

        
    end

    function Apple:checkCollision(a,b)
        
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
            score = score + 1
         end
         
         
         
         apple = love.math.random(1,3)
         self.touched = false
         return true
         
     else
         apple = love.math.random(1,3)
         return false
         
     end

        
        
    end

    
    
    return Apple
    