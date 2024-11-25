local function countpolices()
    local polices = 0
    for _, playerId in ipairs(GetPlayers()) do
        if IsPlayerAceAllowed(playerId, "police.permission") then
            polices = polices + 1
        end
    end
    return polices
end

RegisterNetEvent('robberyStatus:getDados')
AddEventHandler('robberyStatus:getDados', function()
    local source = source
    local policeOnline = countpolices()
    local playersOnline = #GetPlayers() 
    TriggerClientEvent('robberyStatus:setDados', source, policeOnline, playersOnline)
end)
