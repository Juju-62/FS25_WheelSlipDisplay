-- WheelSlipDisplay.lua
-- Displays wheel slip percentage for each wheel with dynamic color coding

WheelSlipDisplay = {}

-- Color thresholds
local SLIP_GREEN_MAX = 5      -- Green: 0-5%
local SLIP_YELLOW_MAX = 15    -- Yellow: 5-15%
-- Red: 15%+

-- Initialize the display
function WheelSlipDisplay:init()
    self.wheelCount = 4
    self.wheelSlip = {0, 0, 0, 0}  -- FL, FR, RL, RR
    self.displayX = 0.5
    self.displayY = 0.15  -- Below clock position
    self.isVisible = true
end

-- Get color based on slip percentage
function WheelSlipDisplay:getSlipColor(slip)
    if slip < SLIP_GREEN_MAX then
        return {1, 1, 0.2, 1}  -- Green RGBA
    elseif slip < SLIP_YELLOW_MAX then
        return {1, 0.85, 0.2, 1}  -- Orange RGBA
    else
        return {1, 0.2, 0.2, 1}  -- Red RGBA
    end
end

-- Update wheel slip values
function WheelSlipDisplay:updateWheelSlip(vehicle)
    if vehicle == nil then return end
    
    local wheels = vehicle:getWheels()
    if wheels == nil then return end
    
    for i = 1, math.min(#wheels, self.wheelCount) do
        local wheel = wheels[i]
        if wheel ~= nil then
            -- Calculate slip as percentage
            self.wheelSlip[i] = math.min(wheel.slipRatio * 100, 100)
        end
    end
end

-- Render the display
function WheelSlipDisplay:draw()
    if not self.isVisible then return end
    
    -- Draw title
    setTextColor(1, 1, 1, 1)
    renderText(self.displayX - 0.05, self.displayY + 0.04, 0.015, "WHEEL SLIP")
    
    -- Wheel names
    local wheelNames = {"FL", "FR", "RL", "RR"}
    local slipValues = self.wheelSlip
    
    -- Draw each wheel slip with dynamic color
    for i = 1, self.wheelCount do
        local slip = slipValues[i]
        local color = self:getSlipColor(slip)
        
        setTextColor(color[1], color[2], color[3], color[4])
        
        local xOffset = (i - 1) * 0.08
        renderText(self.displayX - 0.05 + xOffset, self.displayY, 0.013, 
                   string.format("%s: %.1f%%", wheelNames[i], slip))
    end
    
    -- Reset text color
    setTextColor(1, 1, 1, 1)
end

return WheelSlipDisplay