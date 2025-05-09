local Player = require "Player"



local SCREEN_INDEX = 1
SCREEN_WIDTH = 600
SCREEN_HEIGHT = 900

Screens = {}

function ChangeScreen(index)

    if index > #Screens then
    print("invalid index")
    return
    end

    SCREEN_INDEX = index

    Screens[SCREEN_INDEX]:Reset()

   

end

function love.load()
    local startScreen = require "Startscreen"
    local GameScreen = require "GameScreen"
    local TutorialScreen = require "Tutorial"
    local GameOver = require "loose"
    --Screens = require "screen"
    love.window.setMode(600,900)
    love.window.setIcon(love.image.newImageData("Textures/apple.png") )
    love.window.setTitle('Fruit Catcher 2')

    Screens = {}
    table.insert(Screens, startScreen())
    table.insert(Screens, GameScreen())
    table.insert(Screens, TutorialScreen())
    table.insert(Screens,GameOver())

end

function love.update(dt)
Screens[SCREEN_INDEX]:Update(dt)
end



function love.draw()
Screens[SCREEN_INDEX]:DrawScreen()
--print("index:".. SCREEN_INDEX)
end

function love.mousepressed(x,y, button)
    if SCREEN_INDEX ~=2 then
    Screens[SCREEN_INDEX]:MousePressed(x,y,button)
    end
end

function love.keypressed(key)
    Screens[SCREEN_INDEX]:Keypressed(key)
    -- if key == "space" then
    --     SCREEN_INDEX = SCREEN_INDEX + 1
    --     if SCREEN_INDEX > 4 then
    --         SCREEN_INDEX = 1
    --         score = 0
            
            
    --     end
    -- end
end