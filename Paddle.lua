local Paddle = {x, y, width, height} -- public interface
Paddle.__index = Paddle

-- private
local x, y, width, height
local speed = 15

function Paddle.create(x, y)
    local pdl = {}
    setmetatable(pdl, Paddle)
    pdl.x = x
    pdl.y = y
    pdl.width = 20
    pdl.height = 100
    return pdl
end

function Paddle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Paddle:update(dir)
        self.y = self.y + dir * dt * speed
end

return Paddle