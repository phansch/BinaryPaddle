function love.conf(t)
    t.title = "BinaryPaddles"        -- The title of the window the game is in (string)
    t.author = "Philipp Hansch"        -- The author of the game (string)
    t.url = "http://phansch.net"                 -- The website of the game (string)
    t.version = "0.8.0"         -- The LÖVE version this game was made for (string)
    t.console = true           -- Attach a console (boolean, Windows only)
    t.screen.width = 1024        -- The window width (number)
    t.screen.height = 768       -- The window height (number)
    t.screen.fullscreen = false -- Enable fullscreen (boolean)
    t.screen.vsync = true       -- Enable vertical sync (boolean)
    t.screen.fsaa = 0           -- The number of FSAA-buffers (number)
    t.modules.joystick = false   -- Enable the joystick module (boolean)
end