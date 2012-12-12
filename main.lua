local Paddle = require 'Paddle'
local Ball = require 'Ball'

width = love.graphics.getWidth()
height = love.graphics.getHeight()

local paddle_left = Paddle.create(15, height / 2 - 50)
local paddle_right = Paddle.create(width-30, height / 2 - 50)
local ball = Ball.create()

function love.draw()
    paddle_left:draw()
    paddle_right:draw()
    ball:draw()

    --Draw score
    love.graphics.setFont(love.graphics.newFont(40))
    love.graphics.print(paddle_left.score, width/2-50, 50, 0)
    love.graphics.print(paddle_right.score, width/2+50, 50, 0)


    love.graphics.setFont(love.graphics.newFont(12))
    love.graphics.print("controls: left up/down - w/s, right up/down - arrow keys, esc - exit # no win conditions!", 20, height-20, 0)
end

function love.update()
    checkKeyEvents()
    ball:update(paddle_left, paddle_right)
end

function checkKeyEvents()
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