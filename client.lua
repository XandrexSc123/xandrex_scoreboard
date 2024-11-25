local scoreboardConfig = {
    loja = { name = "Assaltar Loja", policeRequired = 0 },
    joalharia = { name = "Assaltar Joalharia", policeRequired = 0} ---- Config to define the robberies and necessary police officers you want
}

local teclaPredefinida = "F9"  --- Default key to open the in-game menu

RegisterNetEvent('robberyStatus:setDados')
AddEventHandler('robberyStatus:setDados', function(policeOnline, playersOnline)
    abrirMenuAssaltos(policeOnline, playersOnline)
end)

function abrirMenuAssaltos(policeOnline, playersOnline)
    local optionsMenu = {}

    table.insert(optionsMenu, {
        title = "Jogadores Online",
        description = ("Total de jogadores conectados: %d"):format(playersOnline),
        icon = "fa-solid fa-users",
        
    })

    for key, robbery in pairs(scoreboardConfig) do
        local disponivel = policeOnline >= robbery.policeRequired
        table.insert(optionsMenu, {
            title = robbery.name,
            description = ("Requer: %d Polícias"):format(robbery.policeRequired),
            icon = disponivel and "fa-solid fa-check" or "fa-solid fa-times",
            metadata = {
                { label = "Status", value = disponivel and "Disponível" or "Indisponível", color = disponivel and "green" or "red" }
            },
              
        })
    end

    lib.registerContext({
        id = "menu_assaltos",
        title = "Menu Informativo",
        options = optionsMenu
    })
    lib.showContext("menu_assaltos")
end


RegisterCommand("estadoservidor", function()
    TriggerServerEvent('robberyStatus:getDados') 
end, false)

TriggerEvent('chat:addSuggestion', '/estadoservidor', 'Exibe o estado do servidor com jogadores online e assaltos disponíveis.')


RegisterKeyMapping("estadoservidor", "Abrir o menu de estado do servidor", "keyboard", teclaPredefinida) --- Register to change the key in the game settings

