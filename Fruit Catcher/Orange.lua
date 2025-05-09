local Object = require "classic"
local Orange = Object:extend()


    function Orange:new()
        self.image = love.graphics.newImage("Textures/Orange.png")
        self.x = love.math.random(2,550)
        self.y = 40
        self.speed = 400
        self.width = self.image:getWidth()
        self.height = self.image:getHeight()
    end

    function Orange:draw()
    love.graphics.draw(self.image, self.x,self.y)
    end
    
    function Orange:update(dt)
        self.y = self.y + self.speed * dt
        if gameover == true then
            self.y = 40
            self.x = love.math.random(2,440)
            banana = love.math.random(1,3)
            gameover = false


            local window_width = love.graphics.getWidth()

            if self.x < 0 then
            self.x = 0
            elseif self.x + self.width > window_width then
            self.x = window_width - self.width
            end 



            end

        
    end
  
    function Orange:checkCollision(a,b)
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
             if a.tag == "Player" then
                score = score + 5
             end
                          
             return true
             
         else
             orange = love.math.random(1,3)
             return false
             
         end

       

    end
    
    return Orange
    