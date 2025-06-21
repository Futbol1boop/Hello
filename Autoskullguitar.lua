-- Auto Soul Guitar Script for Blox Fruits (Delta Executor Mobile)

-- Settings
local delayBetweenAttacks = 0.3  -- seconds between attacks, adjust as needed

-- Function to perform Soul Guitar attack
local function autoSoulGuitar()
    while wait(delayBetweenAttacks) do
        -- Press 'E' key (Soul Guitar ability key)
        game:GetService("VirtualUser"):SendKeyEvent(true, "E", false, game)
        wait(0.1)
        game:GetService("VirtualUser"):SendKeyEvent(false, "E", false, game)
    end
end

-- Start auto attacking in a coroutine so you can stop if needed
coroutine.wrap(autoSoulGuitar)()
