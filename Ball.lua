local Ball = {x, y, xdir, ydir}
Ball.__index = Ball

local speed = 15
local dt = love.timer.getDelta()

function Ball.create()
    local ball = {}
    setmetatable(ball, Ball)
    Ball:resetBall()

    math.randomseed(os.time())
    return ball
end

function Ball:draw()
    love.graphics.circle("fill", self.x, self.y, 10, 100)
end

function Ball:update(paddle_left, paddle_right)
    self.x = self.x + self.xdir * dt * speed
    self.y = self.y + self.ydir * dt * speed

    -- ball collides with top or bottom
    if(self.y >= love.graphics.getHeight()) then
        self.ydir = -1
    end
    if(self.y <= 0) then
        self.ydir = 1
    end

    -- if x < 0 or x > width then ball is out of bounds -> round over
    if(self.x >= love.graphics.getWidth()) then
        paddle_left.score = paddle_left.score + 1
        self:resetBall()
    end
    if(self.x <= 0) then
        paddle_right.score = paddle_right.score + 1
        self:resetBall()
    end

    -- check if ball collides with paddle
    if(self:checkCollision(paddle_left)) then
        self.xdir = 1
    end
    if(self:checkCollision(paddle_right)) then
        self.xdir = -1
    end
end

function Ball:resetBall()
    --reset position
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2

    --set random direction
    self.xdir = math.random() >= 0.5 and 1 or -1
    self.ydir = math.random() >= 0.5 and 1 or -1
end

function Ball:checkCollision(paddle)
    -- Simple bounding box collision check
    -- source: https://love2d.org/wiki/BoundingBox.lua
    local ball_x2 = self.x + 10
    local ball_y2 = self.y + 10
    local paddle_x2 = paddle.x + paddle.width
    local paddle_y2 = paddle.y + paddle.height

    return self.x < paddle_x2 and ball_x2 > paddle.x and
        self.y < paddle_y2 and ball_y2 > paddle.y
end

return Ball