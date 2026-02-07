-- WheelSlipDisplay.lua

-- Integrating with FS25 HUD

function updateWheelSlipDisplay() 
    local slipRatio = wheel.slipRatio
    local slipDisplay = g_gui.hud:addDrawable("WheelSlipDisplay", slipRatio)
    
    -- Update the HUD with the current slip ratio
    slipDisplay:setValue(slipRatio)
end

function onWheelSpecsUpdated() 
    -- Trigger HUD update when wheel specs are updated
    updateWheelSlipDisplay()
end

-- Adding drawable to Mission
Mission:addDrawable("WheelSlipDisplay", updateWheelSlipDisplay)