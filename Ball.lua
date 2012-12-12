local Ball = {x, y}
Ball.__index = Ball

local x, y
local speed = 15
local xdir = 1
local ydir = 1
dt = love.timer.getDelta()

function Ball.create()
    local ball = {}
    setmetatable(ball, Ball)
    ball.x = love.graphics.getWidth() / 2
    ball.y = love.graphics.getHeight() / 2

    -- TODO: set random starting direction
    return ball
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, 10, 100)
end

function Ball:update(paddle_left, paddle_right)
    self.x = self.x + xdir * dt * speed
    self.y = self.y + ydir * dt * speed

    -- ball collides with top or bottom
    if(self.y >= love.graphics.getHeight()) then
        ydir = -1
    end
    if(self.y <= 0) then
        ydir = 1
    end

    -- if x < 0 or x > width then ball is out of bounds -> round over
    if(self.x >= love.graphics.getWidth()) then
        -- round over
    end
    if(self.x <= 0) then
        -- round over
    end

    -- check if ball collides with paddle
    if(checkCollision(self, paddle_left)) then
        xdir = 1
    end
    if(checkCollision(self, paddle_right)) then
        xdir = -1
    end

end

function checkCollision(ball, paddle)
    --print(ball.x)
    local ball_x1, ball_y1 = ball.x, ball.y
    local paddle_x1, paddle_y1 = paddle.x, paddle.y

    -- Simple bounding box collision check
    -- source: https://love2d.org/wiki/BoundingBox.lua
    local ball_x2 = ball_x1 + 10
    local ball_y2 = ball_y1 + 10
    local paddle_x2 = paddle_x1 + paddle.width
    local paddle_y2 = paddle_y1 + paddle.height

    return ball_x1 < paddle_x2 and ball_x2 > paddle_x1 and
        ball_y1 < paddle_y2 and ball_y2 > paddle_y1
end

return Ball