local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}

	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- function OpenMobileAmbulanceActionsMenu()
-- 	ESX.UI.Menu.CloseAll()

-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
-- 		title    = _U('ambulance'),
-- 		align    = 'top-left',
-- 		elements = {
-- 			{label = _U('ems_menu'), value = 'citizen_interaction'}
-- 	}}, function(data, menu)
-- 		if data.current.value == 'citizen_interaction' then
-- 			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
-- 				title    = _U('ems_menu_title'),
-- 				align    = 'top-left',
-- 				elements = {
-- 					{label = _U('ems_menu_revive'), value = 'revive'},
-- 					{label = _U('ems_menu_small'), value = 'small'},
-- 					{label = _U('ems_menu_big'), value = 'big'},
-- 					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'}
-- 			}}, function(data, menu)
-- 				if isBusy then return end

-- 				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

-- 				if closestPlayer == -1 or closestDistance > 1.0 then
-- 					ESX.ShowNotification(_U('no_players'))
-- 				else
-- 					if data.current.value == 'revive' then
-- 						revivePlayer(closestPlayer)
-- 					elseif data.current.value == 'small' then
-- 						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
-- 							if quantity > 0 then
-- 								local closestPlayerPed = GetPlayerPed(closestPlayer)
-- 								local health = GetEntityHealth(closestPlayerPed)

-- 								if health > 0 then
-- 									local playerPed = PlayerPedId()

-- 									isBusy = true
-- 									ESX.ShowNotification(_U('heal_inprogress'))
-- 									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
-- 									Citizen.Wait(10000)
-- 									ClearPedTasks(playerPed)

-- 									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
-- 									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
-- 									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
-- 									isBusy = false
-- 								else
-- 									ESX.ShowNotification(_U('player_not_conscious'))
-- 								end
-- 							else
-- 								ESX.ShowNotification(_U('not_enough_bandage'))
-- 							end
-- 						end, 'bandage')

-- 					elseif data.current.value == 'big' then

-- 						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
-- 							if quantity > 0 then
-- 								local closestPlayerPed = GetPlayerPed(closestPlayer)
-- 								local health = GetEntityHealth(closestPlayerPed)

-- 								if health > 0 then
-- 									local playerPed = PlayerPedId()

-- 									isBusy = true
-- 									ESX.ShowNotification(_U('heal_inprogress'))
-- 									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
-- 									Citizen.Wait(10000)
-- 									ClearPedTasks(playerPed)

-- 									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
-- 									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
-- 									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
-- 									isBusy = false
-- 								else
-- 									ESX.ShowNotification(_U('player_not_conscious'))
-- 								end
-- 							else
-- 								ESX.ShowNotification(_U('not_enough_medikit'))
-- 							end
-- 						end, 'medikit')

-- 					elseif data.current.value == 'put_in_vehicle' then
-- 						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
-- 					end
-- 				end
-- 			end, function(data, menu)
-- 				menu.close()
-- 			end)
-- 		end

-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsEntityPlayingAnim(closestPlayerPed, 'dead', 'dead_a', 3) then --if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				TriggerEvent('notification', _U('revive_inprogress'), 1)

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				TriggerEvent('notification', _U('player_not_unconscious'), 2)
			end
		else
			TriggerEvent('notification', _U('not_enough_medikit'), 2)
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for hospitalNum,hospital in pairs(Config.Hospitals) do
				-- Ambulance Actions
				for k,v in ipairs(hospital.AmbulanceActions) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
						end
					end
				end

				-- -- Pharmacies
				-- for k,v in ipairs(hospital.Pharmacies) do
				-- 	local distance = #(playerCoords - v)

				-- 	if distance < Config.DrawDistance then
				-- 		DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
				-- 		letSleep = false

				-- 		if distance < Config.Marker.x then
				-- 			isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
				-- 		end
				-- 	end
				-- end

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
						end
					end
				end

				-- Helicopter Spawners
				-- for k,v in ipairs(hospital.Helicopters) do
				-- 	local distance = #(playerCoords - v.Spawner)

				-- 	if distance < Config.DrawDistance then
				-- 		DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
				-- 		letSleep = false

				-- 		if distance < v.Marker.x then
				-- 			isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
				-- 		end
				-- 	end
				-- end

				-- Fast Travels (Prompt)
				-- for k,v in ipairs(hospital.FastTravelsPrompt) do
				-- 	local distance = #(playerCoords - v.From)

				-- 	if distance < Config.DrawDistance then
				-- 		DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
				-- 		letSleep = false

				-- 		if distance < v.Marker.x then
				-- 			isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'FastTravelsPrompt', k
				-- 		end
				-- 	end
				-- end
			end

			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Fast travels
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

-- 		for hospitalNum,hospital in pairs(Config.Hospitals) do
-- 			-- Fast Travels
-- 			for k,v in ipairs(hospital.FastTravels) do
-- 				local distance = #(playerCoords - v.From)

-- 				if distance < Config.DrawDistance then
-- 					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
-- 					letSleep = false

-- 					if distance < v.Marker.x then
-- 						FastTravel(v.To.coords, v.To.heading)
-- 					end
-- 				end
-- 			end
-- 		end

-- 		if letSleep then
-- 			Citizen.Wait(500)
-- 		end
-- 	end
-- end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	-- elseif part == 'Pharmacy' then
	-- 	CurrentAction = part
	-- 	CurrentActionMsg = _U('open_pharmacy')
	-- 	CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	-- elseif part == 'Helicopters' then
	-- 	CurrentAction = part
	-- 	CurrentActionMsg = _U('helicopter_prompt')
	-- 	CurrentActionData = {hospital = hospital, partNum = partNum}
	-- elseif part == 'FastTravelsPrompt' then
	-- 	local travelItem = Config.Hospitals[hospital][part][partNum]

	-- 	CurrentAction = part
	-- 	CurrentActionMsg = travelItem.Prompt
	-- 	CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				-- elseif CurrentAction == 'Pharmacy' then
				-- 	OpenPharmacyMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				-- elseif CurrentAction == 'Helicopters' then
				-- 	OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				-- elseif CurrentAction == 'FastTravelsPrompt' then
				-- 	FastTravel(CurrentActionData.to, CurrentActionData.heading)
				end

				CurrentAction = nil
			end

		-- elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and not isDead then
		-- 	if IsControlJustReleased(0, 167) then
		-- 		OpenMobileAmbulanceActionsMenu()
		-- 	end
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle = ESX.Game.GetClosestVehicle(coords)
	if DoesEntityExist(vehicle) then
		local vehicleCoords = GetEntityCoords(vehicle)
		if #(coords - vehicleCoords) < 3.0 then
			if IsVehicleSeatFree(vehicle, 1) then
				TaskWarpPedIntoVehicle(playerPed, vehicle, 1)
			elseif IsVehicleSeatFree(vehicle, 2) then
				TaskWarpPedIntoVehicle(playerPed, vehicle, 2)
			elseif IsVehicleSeatFree(vehicle, 0) then
				TaskWarpPedIntoVehicle(playerPed, vehicle, 0)
			else
				TriggerEvent('notification', 'Araç dolu!', 2)
			end
		else
			TriggerEvent('notification', 'Yakında araç yok!', 2)
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:takeFromVehicle')
AddEventHandler('esx_ambulancejob:takeFromVehicle', function()
    local playerPed = PlayerPedId()
    if not IsPedSittingInAnyVehicle(playerPed) then
        return
    end
    local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
	RequestAnimDict('dead')
	while not HasAnimDictLoaded('dead') do
		Citizen.Wait(100)
	end
	TaskPlayAnim(playerPed, 'dead', 'idle_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
end)

-- function OpenCloakroomMenu()
-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
-- 		title    = _U('cloakroom'),
-- 		align    = 'top-left',
-- 		elements = {
-- 			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
-- 			-- {label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
-- 	}}, function(data, menu)
-- 		if data.current.value == 'citizen_wear' then
-- 			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
-- 				TriggerEvent('skinchanger:loadSkin', skin)
-- 				-- isOnDuty = false

-- 				-- for playerId,v in pairs(deadPlayerBlips) do
-- 				-- 	RemoveBlip(v)
-- 				-- 	deadPlayerBlips[playerId] = nil
-- 				-- end
-- 			end)
-- 		-- elseif data.current.value == 'ambulance_wear' then
-- 		-- 	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
-- 		-- 		if skin.sex == 0 then
-- 		-- 			TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
-- 		-- 		else
-- 		-- 			TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
-- 		-- 		end

-- 		-- 		isOnDuty = true
-- 		-- 		-- TriggerEvent('esx_ambulancejob:setDeadPlayers', deadPlayers)
-- 		-- 	end)
-- 		end

-- 		menu.close()
-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room',{
		title    = 'Gardrop',
		align    = 'right',
		elements = {
			{label = 'Kıyafetler', value = 'player_dressing'},
			{label = 'Kıyafet Sil', value = 'remove_cloth'}
		}
	}, function(data, menu)

		if data.current.value == 'player_dressing' then 
			menu.close()
			ESX.TriggerServerCallback('m3:motel:server:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
				{
					title    = 'Kıyafetler',
					align    = 'right',
					elements = elements
				}, function(data2, menu2)

					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('m3:motel:server:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)

				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then
			menu.close()
			ESX.TriggerServerCallback('m3:motel:server:getPlayerDressing', function(dressing)
				elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = 'Kıyafet Sil',
					align    = 'right',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('m3:motel:server:removeOutfit', data2.current.value)
					TriggerEvent('notification', 'Kıyafet silindi', 1)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- function OpenPharmacyMenu()
-- 	ESX.UI.Menu.CloseAll()

-- 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
-- 		title    = _U('pharmacy_menu_title'),
-- 		align    = 'top-left',
-- 		elements = {
-- 			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
-- 			{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100}
-- 	}}, function(data, menu)
-- 		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.item, data.current.value)
-- 	end, function(data, menu)
-- 		menu.close()
-- 	end)
-- end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		TriggerEvent('notification', _U('healed'), 3)
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		-- for playerId,v in pairs(deadPlayerBlips) do
			-- RemoveBlip(v)
			-- deadPlayerBlips[playerId] = nil
		-- end

		isOnDuty = false
	end
end)

-- RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
-- AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
-- 	deadPlayers = _deadPlayers

-- 	if isOnDuty then
-- 		for playerId,v in pairs(deadPlayerBlips) do
-- 			RemoveBlip(v)
-- 			deadPlayerBlips[playerId] = nil
-- 		end

-- 		for playerId,status in pairs(deadPlayers) do
-- 			if status == 'distress' then
-- 				local player = GetPlayerFromServerId(playerId)
-- 				local playerPed = GetPlayerPed(player)
-- 				local blip = AddBlipForEntity(playerPed)

-- 				SetBlipSprite(blip, 303)
-- 				SetBlipColour(blip, 1)
-- 				SetBlipFlashes(blip, true)
-- 				SetBlipCategory(blip, 7)

-- 				BeginTextCommandSetBlipName('STRING')
-- 				AddTextComponentSubstringPlayerName(_U('blip_dead'))
-- 				EndTextCommandSetBlipName(blip)

-- 				deadPlayerBlips[playerId] = blip
-- 			end
-- 		end
-- 	end
-- end)

RegisterNetEvent('medic:emsRevive')
AddEventHandler('medic:emsRevive', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent('notification', _U('no_players'), 2)
	else
		revivePlayer(closestPlayer)
	end
end)

RegisterNetEvent('medic:emssmallheal')
AddEventHandler('medic:emssmallheal', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent('notification', _U('no_players'), 2)
	else
		ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
			if quantity > 0 then
				local closestPlayerPed = GetPlayerPed(closestPlayer)
				local health = GetEntityHealth(closestPlayerPed)

				if health > 0 then
					local playerPed = PlayerPedId()

					isBusy = true
					TriggerEvent('notification', _U('heal_inprogress'), 1)
					TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					Citizen.Wait(10000)
					ClearPedTasks(playerPed)

					TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
					TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
					isBusy = false
				else
					TriggerEvent('notification', _U('player_not_conscious'), 2)
				end
			else
				TriggerEvent('notification', _U('not_enough_bandage'), 2)
			end
		end, 'bandage')
	end
end)

RegisterNetEvent('medic:emsbigheal')
AddEventHandler('medic:emsbigheal', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent('notification', _U('no_players'), 2)
	else
		ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
			if quantity > 0 then
				local closestPlayerPed = GetPlayerPed(closestPlayer)
				local health = GetEntityHealth(closestPlayerPed)

				if health > 0 then
					local playerPed = PlayerPedId()

					isBusy = true
					TriggerEvent('notification', _U('heal_inprogress'), 1)
					TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
					Citizen.Wait(10000)
					ClearPedTasks(playerPed)

					TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
					TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
					isBusy = false
				else
					TriggerEvent('notification', _U('player_not_conscious'), 2)
				end
			else
				TriggerEvent('notification', _U('not_enough_bandage'), 2)
			end
		end, 'bandage')
	end
end)

RegisterNetEvent('medic:emsputinveh')
AddEventHandler('medic:emsputinveh', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent('notification', _U('no_players'), 2)
	else
		TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
	end
end)

RegisterNetEvent('medic:emstakeoutvehicle')
AddEventHandler('medic:emstakeoutvehicle', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	if closestPlayer == -1 or closestDistance > 1.0 then
		TriggerEvent('notification', _U('no_players'), 2)
	else
		TriggerServerEvent('esx_ambulancejob:takeFromVehicle', GetPlayerServerId(closestPlayer))
	end
end)

RegisterNetEvent('medic:bill')
AddEventHandler('medic:bill', function()
	local player, distance = ESX.Game.GetClosestPlayer()
  
	if player ~= -1 and distance <= 3.0 then
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', { title = 'Fatura kes'}, function(data, menu)
			local amount = tonumber(data.value)
		
				menu.close()
				
				if amount == nil then
					TriggerEvent('notification', 'Hatalı miktar!', 2)
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(player), 'society_ambulance', 'Tedavi Faturası', amount)
				end
		end,function(data, menu)
			menu.close()
		end)
	else
		TriggerEvent('notification', 'Yakınında kimse yok!', 2)
	end
end)