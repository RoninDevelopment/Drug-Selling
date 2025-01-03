-- drug_selling_client.lua (Client-side)

local QBCore = exports['qb-core']:GetCoreObject()

-- Marker or NPC location to sell drugs
local sellingLocations = {
    {x = 123.45, y = -456.78, z = 29.34},  -- Example coordinates
}

-- Creating a marker for the drug selling area
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for _, loc in ipairs(sellingLocations) do
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local dist = #(playerCoords - vector3(loc.x, loc.y, loc.z))

            if dist < 3.0 then
                DrawMarker(1, loc.x, loc.y, loc.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 150, 0, 0, 0, 1)
                if dist < 1.5 then
                    DisplayHelpText("Press ~INPUT_CONTEXT~ to sell drugs")
                    if IsControlJustPressed(0, 38) then
                        OpenSellMenu()  -- Open the selling menu
                    end
                end
            end
        end
    end
end)

-- Function to display the selling menu
function OpenSellMenu()
    local elements = {}

    -- You can expand this to include various drugs
    table.insert(elements, {label = 'Sell Weed', value = 'weed'})
    table.insert(elements, {label = 'Sell Cocaine', value = 'coke'})

    -- Create a menu to select what drug to sell
    TriggerEvent('qb-menu:client:openMenu', elements, function(data, menu)
        menu.close()

        -- Prompt for the amount of drugs to sell
        local drug = data.value
        local amount = 1  -- In this case, selling 1 unit per transaction
        TriggerServerEvent('drug_selling:sell', drug, amount)
    end)
end

-- Help text function
function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
