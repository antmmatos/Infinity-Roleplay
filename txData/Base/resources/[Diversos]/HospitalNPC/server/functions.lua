GetPlayersWithJob = function(jobName)
    local players = ESX.GetPlayers()

    local count = 0

    for _, playerSrc in pairs(players) do
        local character = ESX.GetPlayerFromId(playerSrc)

        if character and character.job.name == jobName then
            count = count + 1
        end
    end

    return count
end