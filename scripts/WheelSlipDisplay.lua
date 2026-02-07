-- WheelSlipDisplay.lua

-- This script integrates with the FS25 HUD to display wheel slip

local WheelSlipDisplay = {}

-- API for getting wheel slip data
function WheelSlipDisplay:getWheelSlip()
    -- Replace with real API call to Fetch wheel slip data
    return { leftSlip = 0.1, rightSlip = 0.3 }  -- Example data
end

-- Function to display wheel slip on HUD
function WheelSlipDisplay:displaySlip()
    local wheelSlipData = self:getWheelSlip()
    
    -- Calculate colors based on slip values
    local leftColor = wheelSlipData.leftSlip > 0.5 and "red" or "green"
    local rightColor = wheelSlipData.rightSlip > 0.5 and "red" or "green"
    
    -- Display on HUD (replace with actual FS25 HUD API)
    FS25:HUD:display("Left Wheel Slip: ", wheelSlipData.leftSlip, leftColor)
    FS25:HUD:display("Right Wheel Slip: ", wheelSlipData.rightSlip, rightColor)
end

-- Call the display function
WheelSlipDisplay:displaySlip()  

return WheelSlipDisplay
