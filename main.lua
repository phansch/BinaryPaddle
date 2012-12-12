local Paddle = require 'Paddle'
local Ball = require 'Ball'

width = love.graphics.getWidth()
height = love.graphics.getHeight()

local paddle_left = Paddle.create(15, height / 2 - 50)
local paddle_right = Paddle.create(width-30, height / 2 - 50)
local ball = Ball.create()

function love.load()
    love.graphics.setFont(love.graphics.newFont(40))
end

function love.draw()
   paddle_left:draw()
   paddle_right:draw()
   love.graphics.print(paddle_left.score, width/2-50, 50, 0)
   love.graphics.print(paddle_right.score, width/2+50, 50, 0)
   ball:draw()
end

function love.update()
    checkKeyEvents()
    ball:update(paddle_left, paddle_right)
end

function checkKeyEvents()
    if love.keyboard.isDown("f10") then
        love.graphics.toggleFullscreen()
        print("toggled fullscreen")
    end
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
    if love.keyboard.isDown("up") then
        paddle_right:update(-1) -- move paddle up
    end
    if love.keyboard.isDown("down") then
        paddle_right:update(1) -- move paddle down
    end
    if love.keyboard.isDown("w") then
        paddle_left:update(-1) -- move paddle up
    end
    if love.keyboard.isDown("s") then
        paddle_left:update(1) -- move paddle down
    end
end