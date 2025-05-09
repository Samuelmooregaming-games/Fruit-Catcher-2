local Object = require "classic"
local Ground = Object:extend()

function Ground:new()
    self.tag = "Ground"
    self.image = love.graphics.newImage("Textures/Ground.png")
    self.x = 0
    self.y = 850
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
   
end

function Ground:draw()
    love.graphics.draw(self.image, self.x,self.y)
end
return Ground