-- drug_selling.lua (Server-side)

local QBCore = exports['qb-core']:GetCoreObject()

-- Define the drugs and their values
local drugs = {
    ["weed"] = 100,  -- Sell price for 1 unit of weed
    ["coke"] = 200,  -- Sell price for 1 unit of cocaine
}

-- Triggered when a player attempts to sell drugs
RegisterServerEvent('drug_selling:sell')
AddEventHandler('drug_selling:sell', function(drug, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Check if the player has enough drugs in their inventory
    local playerDrugs = Player.Functions.GetItemByName(drug)
    if playerDrugs and playerDrugs.amount >= amount then
        local sellAmount = drugs[drug] * amount
        Player.Functions.RemoveItem(drug, amount)  -- Remove the sold drugs
        Player.Functions.AddMoney('cash', sellAmount)  -- Add money to the player
        TriggerClientEvent('QBCore:Notify', src, 'You sold ' .. amount .. ' ' .. drug .. ' for $' .. sellAmount, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have enough ' .. drug, 'error')
    end
end)

