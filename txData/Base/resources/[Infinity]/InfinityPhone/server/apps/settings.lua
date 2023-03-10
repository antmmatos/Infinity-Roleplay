RegisterServerEvent('InfinityPhone:server:CharacterSpawned')
AddEventHandler('InfinityPhone:server:CharacterSpawned', function()
    local src = source
    local char = ESX.GetPlayerFromId(src)
    if settings == nil then
        exports['ghmattimysql']:scalar('SELECT data FROM phone_settings WHERE identifier = @identifier', { ['identifier'] = char.identifier }, function(dbSettings)
            if dbSettings ~= nil and json.decode(dbSettings) ~= nil then
                settings = {
                    charid = char.identifier,
                    settings = json.decode(dbSettings)
                }
            else
                settings = {
                    charid = char.identifier,
                    settings = {
                        volume = 100,
                        wallpaper = 1,
                        ringtone = 1,
                        text = 1
                    }
                }

            end
        end)
    end

    while settings == nil do
        Citizen.Wait(10)
    end

    TriggerClientEvent('InfinityPhone:client:SetSettings', src, settings.settings)
    TriggerClientEvent('InfinityPhone:client:SetupData', src, { { name = 'settings', data = settings.settings } })
end)

function getData(source)
    local char = ESX.GetPlayerFromId(source)
    local identifier = char.identifier
    local result = MySQL.Sync.fetchAll("SELECT * FROM phone_settings WHERE identifier = @identifier", {['@identifier'] = char.identifier})
    if result[1] ~= nil then
        local identity = result[1]

        return {
            identifier = char.identifier['identifier'],
            data = char.identifier['data']
        }
    else
        return nil
    end
end

RegisterServerEvent('InfinityPhone:server:SaveData')
AddEventHandler('InfinityPhone:server:SaveData', function(data)
        local src = source
        local char = ESX.GetPlayerFromId(src)

    if getData(source) == nil then
        MySQL.Async.execute('INSERT INTO phone_settings (identifier, data) VALUES (@identifier, @data)', {
            ['@data'] = json.encode(data),
            ['@identifier'] = char.identifier
        })
        settings.settings = data
    else
        MySQL.Async.execute('UPDATE phone_settings SET data = @data WHERE identifier = @identifier', {
            ['@data'] = json.encode(data),
            ['@identifier'] = char.identifier
        })
        settings.settings = data
    end
end)