local IsDead = false
local IsAnimated = false

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	TriggerEvent('esx_status:set', 'stress', 0)
end)


RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	TriggerEvent('esx_status:set', 'stress', 0)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('esx:onPlayerSpawn', function(spawn)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#CFAD0F', function(status)
		return Config.Visible
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#0C98F1', function(status)
		return Config.Visible
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'stress', 0, '#ab028c', function(status) -- #c03b3b -- Azul
		return Config.Visible
	end, function(status)
		status.add(2)
	end)

	TriggerEvent('esx_status:registerStatus', 'armor', 0, '#c03b3b', function(status) -- #c03b3b -- Azul
		return Config.Visible
	end, function(status)
		status.set(GetPedArmour(PlayerPedId()))
	end)

	TriggerEvent('esx_status:getStatus', 'armor', function(status)
		SetPedArmour(PlayerPedId(), status.val)
	end)
end)

AddEventHandler('esx_status:onTick', function(data)
	local playerPed  = PlayerPedId()
	local prevHealth = GetEntityHealth(playerPed)
	local health     = prevHealth

	for k, v in pairs(data) do
		if v.name == 'hunger' and v.percent == 0 then
			if prevHealth <= 150 then
				health = health - 5
			else
				health = health - 1
			end
		elseif v.name == 'thirst' and v.percent == 0 then
			if prevHealth <= 150 then
				health = health - 5
			else
				health = health - 1
			end
		end
	end

	if health ~= prevHealth then SetEntityHealth(playerPed, health) end
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
	if not IsAnimated then
		if prop_name ~= nil then
			prop_name = prop_name or 'prop_cs_burger_01'
		end
		IsAnimated = true

		CreateThread(function()
			local prop
			local playerPed = PlayerPedId()
			local x, y, z = table.unpack(GetEntityCoords(playerPed))
			if prop_name ~= nil then
				prop = CreateObject(joaat(prop_name), x, y, z + 0.2, true, true, true)
				local boneIndex = GetPedBoneIndex(playerPed, 18905)
				AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1,
					true)
			end
			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
				RemoveAnimDict('mp_player_inteat@burger')

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				if prop_name ~= nil then
					DeleteObject(prop)
				end
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		if prop_name ~= nil then
			prop_name = prop_name or 'prop_ld_flow_bottle'
		end
		IsAnimated = true

		CreateThread(function()
			local prop
			local playerPed = PlayerPedId()
			local x, y, z = table.unpack(GetEntityCoords(playerPed))
			if prop_name ~= nil then
				prop = CreateObject(joaat(prop_name), x, y, z + 0.2, true, true, true)
				local boneIndex = GetPedBoneIndex(playerPed, 18905)
				AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1,
					true)
			end

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				RemoveAnimDict('mp_player_intdrink')

				Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				if prop_name ~= nil then
					DeleteObject(prop)
				end
			end)
		end)

	end
end)

RegisterNetEvent('esx_basicneeds:onSmoke:Cigarro')
AddEventHandler('esx_basicneeds:onSmoke:Cigarro', function()
	if IsPedOnFoot(PlayerPedId()) then
		local playerPed = PlayerPedId()
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)
			exports['mythic_progbar']:Progress({
				name = "fumarcigarro",
				duration = 20000,
				label = "A fumar um cigarro...",
				useWhileDead = false,
				canCancel = false,
				controlDisables = {},
				prop = {},
			}, function(wasCancelled)
				TriggerEvent('esx_status:remove', 'stress', 200000)
				ClearPedTasksImmediately(PlayerPedId())
			end)
		end)
	else
		ESX.ShowNotification("FUMAR", "O cigarro voou pela janela", 2000, 'error')
	end
end)

RegisterNetEvent('esx_basicneeds:onSmoke:Ganza')
AddEventHandler('esx_basicneeds:onSmoke:Ganza', function()
	if IsPedOnFoot(PlayerPedId()) then
		local playerPed = PlayerPedId()
		Citizen.CreateThread(function()
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, true)
			exports['mythic_progbar']:Progress({
				name = "fumarganza",
				duration = 30000,
				label = "A fumar ganza...",
				useWhileDead = false,
				canCancel = false,
				controlDisables = {},
				prop = {},
			}, function(wasCancelled)
				TriggerEvent('esx_status:remove', 'stress', 350000)
				ClearPedTasks(PlayerPedId())
			end)
		end)
	else
		ESX.ShowNotification("FUMAR", "A ganza voou pela janela", 2000, 'error')
	end
end)
