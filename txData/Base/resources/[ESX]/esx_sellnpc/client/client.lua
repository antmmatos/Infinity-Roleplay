local drugtype, selling, numberofcops, drugselling = nil, false, 0, false
local drugname = {
	bagofmeth = "metafetamina",
	bagofdope = "erva"
}

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterCommand("vender", function()
	drugselling = not drugselling
	ESX.ShowNotification("VENDER DROGA", drugselling and 'Modo dealer ativado' or 'Modo dealer desativado', 2000, drugselling and 'success' or 'error')
end, false)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/vender', '')
end)


Citizen.CreateThread(function()
	while true do
		while drugselling do
			Citizen.Wait(8)
			if ped ~= 0 and not IsPedDeadOrDying(ped) and not IsPedInAnyVehicle(ped) then
				local pedType = GetPedType(ped)
				if ped ~= oldped and not selling and (IsPedAPlayer(ped) == false and pedType ~= 28) then
					--if numberofcops >= Config.NumberOfCops then
					local pos = GetEntityCoords(ped)
					local distanceFromCity = GetDistanceBetweenCoords(24.1806, -1721.6968, -29.2993, pos['x'], pos['y'], pos['z'], true)
					if distanceFromCity < 2500 then
						DrawText3Ds(pos.x, pos.y, pos.z, 'Pressiona E para vender droga')
						if IsControlJustPressed(1, 86) then
							interact()
						end
					end
				else
					Citizen.Wait(500)
				end
			end
		end
		Citizen.Wait(3000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPed = GetPlayerPed(-1)
		if not IsPedInAnyVehicle(playerPed) or not IsPedDeadOrDying(playerPed) then
			ped = GetPedInFront()
		else
			Citizen.Wait(1000)
		end
		Citizen.Wait(1000)
	end
end)

function GetPedInFront()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.3, 0.0)
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, 1.0, 12,
		plyPed, 7)
	local _, _, _, _, ped = GetShapeTestResult(rayHandle)
	return ped
end

function DrawText3Ds(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local px, py, pz = table.unpack(GetGameplayCamCoords())
	local scale = 0.30
	if onScreen then
		SetTextScale(scale, scale)
		SetTextFont(6)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextOutline()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x, _y)
	end
end

function interact()
	ESX.TriggerServerCallback('Infinity:getJobsOnline', function(police)
		numberofcops = police
	end)
	oldped, selling, drugtype = ped, true, nil
	SetEntityAsMissionEntity(ped)
	TaskStandStill(ped, 9.0)
	exports['mythic_progbar']:Progress({
		name = "vendersellnpc",
		duration = 12500,
		label = "A negociar...",
		useWhileDead = false,
		canCancel = false,
		controlDisables = {},
		prop = {},
	}, function(wasCancelled)
		ESX.TriggerServerCallback('esx_sellnpc:getItemsToSell', function(cb)
			if cb ~= false then
				if ESX.PlayerData.job.name == 'police' then
					ESX.ShowNotification("VENDA DE DROGA", 'O comprador reconheceu-te e sabe que pertences à DPLS', 2000, 'error')
					SetPedAsNoLongerNeeded(oldped)
					selling = false
					return
				else if ESX.PlayerData.job.name == 'ambulance' then
					ESX.ShowNotification("VENDA DE DROGA", 'O comprador reconheceu-te e sabe que pertences à SEM', 2000, 'error')
					SetPedAsNoLongerNeeded(oldped)
					selling = false
					return
				end

				
				end
	
				-- Checks the distance between the PED and the seller before continuing.
				if Config.DistanceCheck then
					if ped ~= oldped then
						ESX.ShowNotification("VENDA DE DROGA", 'Afastaste-te do local e o comprador já não quer o teu produto', 2000, 'error')
							TriggerEvent("esx_status:add", 'stress', 70000)
						SetPedAsNoLongerNeeded(oldped)
						selling = false
						return
					end
				end
	
				-- It all begins.
				local percent = math.random(1, 11) -- mudar isto para math.random(1, 11)
	
				if percent <= 2 then
					ESX.ShowNotification("VENDA DE DROGA", 'O comprador não estava interessado', 2000, 'error')
					TriggerEvent("esx_status:add", 'stress', 25000)
				elseif percent <= 10 then
	
					if Config.EnableAnimation == true then
						TriggerEvent("animation", cb)
					end
					Wait(1500)
	
				else
					local playerCoords = GetEntityCoords(PlayerPedId())
					pedAnimCop()
					ESX.ShowNotification("VENDA DE DROGA", 'O comprador não estava interessado', 2000, 'error')
					TriggerEvent("esx_status:add", 'stress', 55000)
					DecorSetInt(PlayerPedId(), "IsOutlaw", 2)
					TriggerServerEvent("esx_outlawalert:drugsaleInProgress",
							'police', "Venda de Droga", "Desconhecido", "person", "gps_fixed", 1, 
							playerCoords.x, playerCoords.y, playerCoords.z, 140, 75, "10-10"
						)
				end
	
				selling = false
				SetPedAsNoLongerNeeded(oldped)
				FreezeEntityPosition(ped, false)
			end
		end)
	end)
end

function giveMoneyAnimPed()

	ClearPedTasks(ped)
	local coords = GetEntityCoords(ped)
	local bone = GetPedBoneIndex(ped, 28422)
	RequestAnimDict("mp_safehouselost@")
	TaskPlayAnim(ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
	SetEntityAsMissionEntity(ped, 1, 1)
	Wait(500)
	local moneyObject = CreateObject(GetHashKey('p_banknote_onedollar_s'), coords.x, coords.y, coords.z, 1, 1, 1)
	AttachEntityToEntity(moneyObject, ped, bone, 0.0, 0.0, 0.0, 80.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
	Wait(3500)
	DeleteObject(moneyObject)
	SetEntityAsMissionEntity(ped, 0, 0)

end

function pedAnimCop()

	local crds = GetEntityCoords(oldped)
	SetRelationshipBetweenGroups(255, GetPedRelationshipGroupHash(oldped), GetPedRelationshipGroupHash(GetPlayerPed(-1)))
	SetEntityAsMissionEntity(oldped, 1, 1)
	RequestAnimDict("cellphone@")
	ClearPedTasks(oldped)
	CellphoneObject = CreateObject(GetHashKey('prop_phone_ing'), crds.x, crds.y, crds.z, 1, 1, 1)
	AttachEntityToEntity(CellphoneObject, oldped, GetPedBoneIndex(oldped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0,
		2, 1)
	TaskPlayAnim(oldped, "cellphone@", "cellphone_call_listen_base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)

end

RegisterNetEvent('animation')
AddEventHandler('animation', function(itemtosell)
	local pid = PlayerPedId()
	local itemcount = 0
	RequestAnimDict("mp_safehouselost@")
	while (not HasAnimDictLoaded("mp_safehouselost@")) do
		Citizen.Wait(10)
	end
	if IsEntityPlayingAnim(ped, "mp_safehouselost@", "package_dropoff", 3) then
		TaskPlayAnim(pid, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
	else
		TaskPlayAnim(pid, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0)
	end
	attachModel = GetHashKey("prop_drug_package_02")
	SetCurrentPedWeapon(PlayerPedId(), 0xA2719263)
	local bone = GetPedBoneIndex(PlayerPedId(), 28422)
	RequestModel(attachModel)
	while not HasModelLoaded(attachModel) do
		Citizen.Wait(100)
	end
	closestEntity = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
	AttachEntityToEntity(closestEntity, PlayerPedId(), bone, 0.02, 0.02, -0.08, 270.0, 180.0, 0.0, 1, 1, 0, true, 2, 1)
	Citizen.Wait(4000)
	if DoesEntityExist(closestEntity) then
		DeleteEntity(closestEntity)
	end
	SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"), 1)
	if itemtosell.count >= 8 then
		itemcount = math.random(5, 8)
		TriggerServerEvent('esx_sellnpc:removeitem', itemtosell.name, itemcount)
	elseif itemtosell.count >= 3 then
		itemcount = math.random(2, 3)
		TriggerServerEvent('esx_sellnpc:removeitem', itemtosell.name, itemcount)
	else
		itemcount = 1
		TriggerServerEvent('esx_sellnpc:removeitem', itemtosell.name, itemcount)
	end
	Citizen.Wait(1000)
	giveMoneyAnimPed()
	if numberofcops == 0 then
		TriggerServerEvent('esx_sellnpc:addmoney', (itemtosell.price + math.random(-8, 0)) * itemcount)
	elseif numberofcops < 3 then
		TriggerServerEvent('esx_sellnpc:addmoney', (itemtosell.price + math.random(-2, 4)) * itemcount)
	else
		TriggerServerEvent('esx_sellnpc:addmoney', (itemtosell.price + math.random(2, 6)) * itemcount)
	end
	SetEntityAsMissionEntity(ped)
	StopAnimTask(pid, "mp_common", "givetake1_a", 1.0)
end)
