local isBurning = false
local isStunned = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isBurning then
            local playerPed = PlayerPedId()
            RequestAnimDict('missarmenian2')
            while not HasAnimDictLoaded('missarmenian2') do
                Citizen.Wait(100)
            end
            TaskPlayAnim(playerPed, 'missarmenian2', 'drunk_loop', 8.0, -8.0, -1, 49, 0, false, false, false)
            ApplyDamageToPed(playerPed, Config.BurnDamage, false)
        end
        if isStunned then
            local playerPed = PlayerPedId()
            SetPedToRagdoll(playerPed, Config.StunDuration * 1000, Config.StunDuration * 1000, 0, false, false, false)
        end
    end
end)

RegisterNetEvent('BurnStunSystem:BurnPlayer')
AddEventHandler('BurnStunSystem:BurnPlayer', function()
    isBurning = true
    Citizen.SetTimeout(Config.BurnDuration * 1000, function()
        isBurning = false
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('BurnStunSystem:StunPlayer')
AddEventHandler('BurnStunSystem:StunPlayer', function()
    isStunned = true
    Citizen.SetTimeout(Config.StunDuration * 1000, function()
        isStunned = false
    end)
end)