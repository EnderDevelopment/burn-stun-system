ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('BurnStunSystem:BurnPlayer', function(source, cb, targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)
    
    if xPlayer and xTarget then
        TriggerClientEvent('BurnStunSystem:BurnPlayer', targetId)
        MySQL.Async.execute('INSERT INTO burnstun_logs (player_id, target_id, action) VALUES (@player_id, @target_id, @action)', {
            ['@player_id'] = xPlayer.identifier,
            ['@target_id'] = xTarget.identifier,
            ['@action'] = 'burn'
        }, function(rowsChanged)
            cb(true)
        end)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('BurnStunSystem:StunPlayer', function(source, cb, targetId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(targetId)
    
    if xPlayer and xTarget then
        if math.random() < Config.StunChance then
            TriggerClientEvent('BurnStunSystem:StunPlayer', targetId)
            MySQL.Async.execute('INSERT INTO burnstun_logs (player_id, target_id, action) VALUES (@player_id, @target_id, @action)', {
                ['@player_id'] = xPlayer.identifier,
                ['@target_id'] = xTarget.identifier,
                ['@action'] = 'stun'
            }, function(rowsChanged)
                cb(true)
            end)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)