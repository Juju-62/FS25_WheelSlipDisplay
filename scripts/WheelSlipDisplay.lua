-- FS25 API Implementation for Wheel Slip Display

-- Function to detect wheels using vehicle.spec_wheels and display slip ratio with dynamic colors
function updateWheelSlipDisplay(vehicle)
    local wheels = vehicle.spec_wheels.wheels
    for i, wheel in ipairs(wheels) do
        if wheel.slipRatio then
            local slipRatio = wheel.slipRatio
            local color = getColorForSlip(slipRatio)
            -- Code to display the slip ratio with the chosen color
            displaySlipRatio(wheel, slipRatio, color)
        end
    end
end

function getColorForSlip(slipRatio)
    if slipRatio < 0.1 then
        return "green"
    elseif slipRatio < 0.3 then
        return "yellow"
    else
        return "red"
    end
end

function displaySlipRatio(wheel, slipRatio, color)
    -- Implement the display logic here, using the specified color and slipRatio
end