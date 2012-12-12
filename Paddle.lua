local Paddle = {x, y, width, height, score} -- public interface
Paddle.__index = Paddle

-- private
local x, y, width, height, score
local speed = 15
local dt = love.timer.getDelta()

function Paddle.create(x, y)
    local pdl = {}
    setmetatable(pdl, Paddle)
    pdl.x = x
    pdl.y = y
    pdl.width = 20
    pdl.height = 100
    pdl.score = 0
    return pdl
end

function Paddle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dir)
    local moveY = self.y + dir * dt * speed

    --bounds checking
    if(moveY < love.graphics.getHeight()-self.height-5 and moveY > 5) then
        self.y = moveY
    end
end

return Paddle