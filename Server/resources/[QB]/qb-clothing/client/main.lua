Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

ESX = nil
ilk_giris = 0
local PlayerData = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)



  
-- Code

RegisterCommand("yenile", function()
    local health = GetEntityHealth(PlayerPedId())
    TriggerServerEvent("qb-clothes:loadPlayerSkin")
    local armor = GetPedArmour(PlayerPedId())
    Citizen.Wait(350)
    SetPedArmour(PlayerPedId(), armor)
    SetEntityHealth(PlayerPedId(), health)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    end
end)

local creatingCharacter = false

local cam = -1
local heading = 332.219879
local zoom = "character"

local customCamLocation = nil

local isLoggedIn = true



local skinData = {
    ["face"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["pants"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["hair"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["eyebrows"] = {
        item = -1,
        texture = 1,
        defaultItem = -1,
        defaultTexture = 1,        
    },
    ["beard"] = {
        item = -1,
        texture = 1,
        defaultItem = -1,
        defaultTexture = 1,        
    },
    ["blush"] = {
        item = -1,
        texture = 1,
        defaultItem = -1,
        defaultTexture = 1,        
    },
    ["lipstick"] = {
        item = -1,
        texture = 1,
        defaultItem = -1,
        defaultTexture = 1,        
    },
    ["makeup"] = {
        item = -1,
        texture = 1,
        defaultItem = -1,
        defaultTexture = 1,        
    },
    ["ageing"] = {
        item = -1,
        texture = 0,
        defaultItem = -1,
        defaultTexture = 0,        
    },
    ["arms"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["t-shirt"] = {
        item = 1,
        texture = 0,
        defaultItem = 1,
        defaultTexture = 0,        
    },
    ["torso2"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["vest"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["bag"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["shoes"] = {
        item = 0,
        texture = 0,
        defaultItem = 1,
        defaultTexture = 0,        
    },
    ["mask"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,        
    },
    ["hat"] = {
        item = -1,
        texture = 0,
        defaultItem = -1,
        defaultTexture = 0, 
    },
    ["glass"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,
    },
    ["ear"] = {
        item = -1,
        texture = 0,
        defaultItem = -1,
        defaultTexture = 0,
    },
    ["watch"] = {
        item = -1,
        texture = 0,
        defaultItem = -1,
        defaultTexture = 0,
    },
    ["bracelet"] = {
        item = -1,
        texture = 0,
        defaultItem = -1,
        defaultTexture = 0,
    },
    ["accessory"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,      
    },
    ["decals"] = {
        item = 0,
        texture = 0,
        defaultItem = 0,
        defaultTexture = 0,      
    },
}

local previousSkinData = {}


local ckt = true
local mask = true
local tisort = true
local pantol = true
local ayakkabi = true
local gozluk = true

 
RegisterNetEvent('qb-clothing:client:kiyafet')
AddEventHandler('qb-clothing:client:kiyafet', function(tip, item, texture, kol_item, kol_texture, ceket_item, ceket_texture)
    
	
 
    local ped = GetPlayerPed(-1)
    RequestAnimDict("missheist_agency2ahelmet")
    RequestAnimDict("mp_masks@standard_car@ds@")
    RequestAnimDict("missmic4")
    RequestAnimDict("re@construction")
    RequestAnimDict("random@domestic")
    RequestAnimDict("clothingspecs")
 
    if tip == "sapka" then
     TaskPlayAnim(ped,"missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 600, 51, 0, false, false, false)
     Wait(1000)
  
         SetPedPropIndex(ped, 0, item, texture, true)
  
    elseif tip == "maske" then
        
        TaskPlayAnim(ped,"mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 800, 51, 0, false, false, false)
        Wait(1000)
 
            SetPedComponentVariation(ped, 1, item, 0, 2)
            SetPedComponentVariation(ped, 1, item, texture, 0)
     
    elseif tip == "tisort" then
        TaskPlayAnim(ped,"missmic4", "michael_tux_fidget", 3.0, 3.0, 1500, 51, 0, false, false, false)
        Wait(1000)
 
           SetPedComponentVariation(ped, 8, item, 0, 2)
           SetPedComponentVariation(ped, 8, item, texture, 0)
		   SetPedComponentVariation(ped, 3, kol_item, 0, 2)
           SetPedComponentVariation(ped, 3, kol_item, kol_texture, 0)
           SetPedComponentVariation(ped, 11, ceket_item, 0, 2)
           SetPedComponentVariation(ped, 11, ceket_item, ceket_texture, 0)
 
        
    elseif tip == "pantolon" then 
        TaskPlayAnim(ped,"re@construction", "out_of_breath", 3.0, 3.0, 1300, 51, 0, false, false, false)
        Wait(1000)
   
            SetPedComponentVariation(ped, 4, item, 0, 0)
            SetPedComponentVariation(ped, 4, item, texture, 0)
 
    elseif tip == "ayakkabi" then
        TaskPlayAnim(ped,"random@domestic", "pickup_low", 3.0, 3.0, 1200, 51, 0, false, false, false)
        Wait(1000) 
   
            SetPedComponentVariation(ped, 6, item, 0, 0)
            SetPedComponentVariation(ped, 6, item, texture, 0)
 
    elseif tip == "gozluk" then 
        TaskPlayAnim(ped,"clothingspecs", "take_off", 3.0, 3.0, 1400, 51, 0, false, false, false)
        Wait(1000) 
         
         
            SetPedPropIndex(ped, 1, item, texture, true)
   
 
    end
end)



RegisterNetEvent('qb-clothing:client:kiyafetCK')
AddEventHandler('qb-clothing:client:kiyafetCK', function(tip, item, texture, kol_item, kol_texture, ceket_item, ceket_texture)
    
    local ped = GetPlayerPed(-1)
    RequestAnimDict("missheist_agency2ahelmet")
    RequestAnimDict("mp_masks@standard_car@ds@")
    RequestAnimDict("missmic4")
    RequestAnimDict("re@construction")
    RequestAnimDict("random@domestic")
    RequestAnimDict("clothingspecs")
 
    if tip == "sapka" then
     TaskPlayAnim(ped,"missheist_agency2ahelmet", "take_off_helmet_stand", 3.0, 3.0, 600, 51, 0, false, false, false)
     Wait(1000)
          --SetPedPropIndex(ped, 0, item, texture, true)
     
         ClearPedProp(ped, 0)
     
    elseif tip == "maske" then
        
        TaskPlayAnim(ped,"mp_masks@standard_car@ds@", "put_on_mask", 3.0, 3.0, 800, 51, 0, false, false, false)
        Wait(1000)
        
        
           SetPedComponentVariation(ped, 1, -1, 0, 2)
        
    elseif tip == "tisort" then
        TaskPlayAnim(ped,"missmic4", "michael_tux_fidget", 3.0, 3.0, 1500, 51, 0, false, false, false)
        Wait(1000)
        
 
            if IsMpPed(ped) == "Male" then
              SetPedComponentVariation(ped, 11, 15, 0, 2)
            else 
              SetPedComponentVariation(ped, 11, 74, 0, 2)
            end
            SetPedComponentVariation(ped, 8, 15, 2, 2)
            SetPedComponentVariation(ped, 3, 15, 0, 2)
            SetPedComponentVariation(ped, 10, 0, 0, 2) 
    
    elseif tip == "pantolon" then 
        TaskPlayAnim(ped,"re@construction", "out_of_breath", 3.0, 3.0, 1300, 51, 0, false, false, false)
        Wait(1000)
       
      
             if IsMpPed(ped) == "Male" then
               SetPedComponentVariation(ped, 4, 14, 0, 2)
             else 
              SetPedComponentVariation(ped, 4, 14, 0, 2)
            end
       
    elseif tip == "ayakkabi" then
        TaskPlayAnim(ped,"random@domestic", "pickup_low", 3.0, 3.0, 1200, 51, 0, false, false, false)
        Wait(1000) 
        
        
             if IsMpPed(ped) == "Male" then
               SetPedComponentVariation(ped, 6, 34, 0, 2)
             else 
              SetPedComponentVariation(ped, 6, 34, 0, 2)
            end
        
    elseif tip == "gozluk" then 
        TaskPlayAnim(ped,"clothingspecs", "take_off", 3.0, 3.0, 1400, 51, 0, false, false, false)
        Wait(1000) 
         
        
          ClearPedProp(ped, 1)
      
    end
end)


function IsMpPed(ped)
	local Male = GetHashKey("mp_m_freemode_01") local Female = GetHashKey("mp_f_freemode_01")
	local CurrentModel = GetEntityModel(ped)
	if CurrentModel == Male then return "Male" elseif CurrentModel == Female then return "Female" else return false end
end


RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(JobInfo)
    PlayerData.job = JobInfo
end)

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    if onScreen then
        local factor = #text / 370
        SetTextScale(0.30, 0.30)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
        DrawRect(_x, _y + 0.0120, 0.006 + factor, 0.024, 0, 0, 0, 155)
    end
end

Citizen.CreateThread(function()
    for k, v in pairs (Config.Stores) do
        if Config.Stores[k].shopType == "clothing" then
            local clothingShop = AddBlipForCoord(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z)
            SetBlipSprite(clothingShop, 73)
            SetBlipColour(clothingShop, 47)
            SetBlipScale  (clothingShop, 0.7)
            SetBlipAsShortRange(clothingShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Kıyafetçi")
            EndTextCommandSetBlipName(clothingShop)
        end
        
        if Config.Stores[k].shopType == "barber" then
            local barberShop = AddBlipForCoord(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z)
            SetBlipSprite(barberShop, 71)
            SetBlipColour(barberShop, 0)
            SetBlipScale  (barberShop, 0.5)
            SetBlipAsShortRange(barberShop, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Berber")
            EndTextCommandSetBlipName(barberShop)
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		if isLoggedIn then

			local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local inRange = false

			for k, v in pairs(Config.Stores) do
				local dist = GetDistanceBetweenCoords(pos, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z, true)
				if dist < 10 then
					if not creatingCharacter then
						DrawMarker(2, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.3, 0.4, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
						if dist < 5 then
							if Config.Stores[k].shopType == "clothing" then
								DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Kıyafet Magazası')
							elseif Config.Stores[k].shopType == "barber" then
								DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Berber')
							end
							if IsControlJustPressed(0, Keys["E"]) then
								if Config.Stores[k].shopType == "clothing" then
									ESX.TriggerServerCallback('oph3z:MoneyCheck', function(data)
										if data then
											customCamLocation = nil
											ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
                                                TriggerServerEvent('oph3z:RemoveStoreMoney')
												openMenu({
													{menu = "character", label = "Kıyafetler", selected = true},
													{menu = "accessoires", label = "Aksesuarlar", selected = false},
													{menu = "myOutfits", label = "Kıyafetlerim", selected = false, outfits = result},
												})
											end)
										else -- data else #1
											exports['mythic_notify']:SendAlert('error', 'Üzerinde yeteri kadar para yok. Gereken: ' ..Config.StorePrice.. '$', 5000)
										end -- Data end #1
									end, 'cash') -- MoneyCheck kısmı
								elseif Config.Stores[k].shopType == "barber" then
									ESX.TriggerServerCallback('oph3z:MoneyCheck:Barber', function(data)
										if data then
									customCamLocation = nil
                                    TriggerServerEvent('oph3z:RemoveBarberMoney')
									openMenu({
										{menu = "clothing", label = "Haar", selected = true},
									})
								else
									exports['mythic_notify']:SendAlert('error', 'Üzerinde yeteri kadar para yok. Gereken: ' ..Config.BarberPrice.. '$', 5000)
								end
								end, 'cash')
								end -- Clothing kısmı kapatıyor
							end
						end
					else
					end
					inRange = true
				end
			end --
			if not inRange then

                Citizen.Wait(2000)
            end
		end
		Citizen.Wait(3)
	end
end)


-- Citizen.CreateThread(function()
-- 	while true do
-- 		if isLoggedIn then

-- 			local ped = PlayerPedId()
--             local pos = GetEntityCoords(ped)
--             local inRange = false

-- 			for k, v in pairs(Config.Stores) do
-- 				local dist = GetDistanceBetweenCoords(pos, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z, true)
-- 				if dist < 10 then
-- 					if not creatingCharacter then
-- 						DrawMarker(2, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.3, 0.4, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
-- 						if dist < 5 then
-- 							if Config.Stores[k].shopType == "clothing" then
--                                 DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Kıyafet Magazası')
-- 							elseif Config.Stores[k].shopType == "barber" then
-- 								DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Berber')
-- 							end
-- 							if IsControlJustPressed(0, Keys["E"]) then
-- 								ESX.TriggerServerCallback('oph3z:MoneyCheck', function(data)
-- 									if data then
-- 										if Config.Stores[k].shopType == "clothing" then
-- 											customCamLocation = nil
-- 											ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
--                                                 TriggerServerEvent('oph3z:RemoveStoreMoney')
-- 												openMenu({
-- 													{menu = "character", label = "Kıyafetler", selected = true},
-- 													{menu = "accessoires", label = "Aksesuarlar", selected = false},
-- 													{menu = "myOutfits", label = "Kıyafetlerim", selected = false, outfits = result},
-- 												})
-- 											end)
-- 										elseif Config.Stores[k].shopType == "barber" then
-- 											customCamLocation = nil
-- 											openMenu({
-- 												{menu = "clothing", label = "Haar", selected = true},
-- 											})
-- 										end
-- 									else
-- 										exports['mythic_notify']:SendAlert('error', 'Üzerinde yeteri kadar para yok. Gereken: ' ..Config.StorePrice.. '$', 5000)
-- 									end
-- 								end, 'cash')
-- 							end
-- 						end
-- 					else
-- 					end
-- 					inRange = true
-- 				end
-- 			end
-- 			if not inRange then

--                 Citizen.Wait(2000)
--             end
-- 		end
-- 		Citizen.Wait(3)
-- 	end
-- end)

YakindakiKiyafetci = false

Citizen.CreateThread(function()
    while true do

        if isLoggedIn then

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            local inRange = false
			YakindakiKiyafetci = false

            for k, v in pairs(Config.Stores) do
                local dist = GetDistanceBetweenCoords(pos, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z, true)

                if dist < 20 then
                    if not creatingCharacter then
                        if dist < 20 then
                            YakindakiKiyafetci = true
						 
						    
                        end
                    end
                    inRange = true
                end
            end
            if not inRange then
                Citizen.Wait(2000)
            end

        end

        Citizen.Wait(3)
    end
end)

function GetirKiyafetci()
  if YakindakiKiyafetci then 
    return true
  else 
    return false
  end
end

RegisterNetEvent('qb-clothing:client:StoreAc')
AddEventHandler('qb-clothing:client:StoreAc', function()
             
			local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            local inRange = false

            for k, v in pairs(Config.Stores) do
                local dist = GetDistanceBetweenCoords(pos, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z, true)

                if dist < 20 then
                    if not creatingCharacter then
                        --DrawMarker(2, Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        if dist < 20 then
                            if Config.Stores[k].shopType == "clothing" then
                                DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Kıyafet Magazası')
                            elseif Config.Stores[k].shopType == "barber" then
                                DrawText3Ds(Config.Stores[k].x, Config.Stores[k].y, Config.Stores[k].z + 1.25, '~g~E~w~ - Berber')
                            end
                           -- if IsControlJustPressed(0, Keys["E"]) then
                                if Config.Stores[k].shopType == "clothing" then
                                    customCamLocation = nil
                                    ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
                                        openMenu({
                                            {menu = "character", label = "Kıyafetler", selected = true},
                                            {menu = "accessoires", label = "Aksesuarlar", selected = false},
                                            {menu = "myOutfits", label = "Kıyafetlerim", selected = false, outfits = result},
                                        })
                                    end)
                                   
                                elseif Config.Stores[k].shopType == "barber" then
                                    customCamLocation = nil
                                    openMenu({
                                        {menu = "clothing", label = "Haar", selected = true},
                                    })
                                end
                             
                        end
                    end
                    inRange = true
                end
            end

end)

Citizen.CreateThread(function()
    while true do

        if isLoggedIn then

            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            if PlayerData == nil then
                PlayerData = ESX.GetPlayerData()
            end
            local inRange = false

            for k, v in pairs(Config.ClothingRooms) do
                local dist = GetDistanceBetweenCoords(pos, Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z, true)

                if dist < 15 then
                    if not creatingCharacter then
                        DrawMarker(2, Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                        if dist < 2 then
                            if PlayerData.job.name == Config.ClothingRooms[k].requiredJob then
                                DrawText3Ds(Config.ClothingRooms[k].x, Config.ClothingRooms[k].y, Config.ClothingRooms[k].z + 0.3, '~g~E~w~ - Kıyafetlerini Gör')
                                if IsControlJustPressed(0, Keys["E"]) then
                                    customCamLocation = Config.ClothingRooms[k].cameraLocation
                                    gender = "male"
                                    --if ESX.GetPlayerData().charinfo.gender == 1 then gender = "female" end
                                    ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
                                        openMenu({
                                            {menu = "roomOutfits", label = "Presets", selected = true, outfits = Config.Outfits[PlayerData.job.name][gender]},
                                            {menu = "myOutfits", label = "Kıyafetlerim", selected = false, outfits = result},
                                            {menu = "character", label = "Karakter", selected = false},
                                            {menu = "accessoires", label = "Aksesuarlar", selected = false}
                                        })
                                        
                                    end)
                                end
                            end
                        end
                        inRange = true
                    end
                end
            end

            if not inRange then
                Citizen.Wait(2000)
            end

        end

        Citizen.Wait(3)
    end
end)


RegisterNetEvent('qb-clothing:client:ccript')
AddEventHandler('qb-clothing:client:ccript', function(data)
    ilk_giris = data.ilk_giris
end)



function motelkiyafet()
    ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
                                        openMenu({
                                            {menu = "character", label = "Kıyafetler", selected = true},
                                            {menu = "accessoires", label = "Aksesuarlar", selected = false},
                                            {menu = "myOutfits", label = "Kıyafetlerim", selected = false, outfits = result},
                                        })
    end)
end

 

RegisterNetEvent('qb-clothing:client:openOutfitMenu')
AddEventHandler('qb-clothing:client:openOutfitMenu', function()
    ESX.TriggerServerCallback('qb-clothing:server:getOutfits', function(result)
        
        openMenu({
            {menu = "myOutfits", label = "Kıyafetlerim", selected = true, outfits = result},
        })
    end)
end)

RegisterNUICallback('selectOutfit', function(data)

    TriggerEvent('qb-clothing:client:loadOutfit', data)
end)

RegisterNUICallback('rotateRight', function()
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)

    SetEntityHeading(ped, heading + 30)
end)

RegisterNUICallback('rotateLeft', function()
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)

    SetEntityHeading(ped, heading - 30)
end)

firstChar = false

local clothingCategorys = {
    ["arms"]        = {type = "variation",  id = 3},
    ["t-shirt"]     = {type = "variation",  id = 8},
    ["torso2"]      = {type = "variation",  id = 11},
    ["pants"]       = {type = "variation",  id = 4},
    ["vest"]        = {type = "variation",  id = 9},
    ["shoes"]       = {type = "variation",  id = 6},
    ["bag"]         = {type = "variation",  id = 5},
    ["hair"]        = {type = "hair",       id = 2},
    ["eyebrows"]    = {type = "overlay",    id = 2},
    ["face"]        = {type = "face",       id = 2},
    ["beard"]       = {type = "overlay",    id = 1},
    ["blush"]       = {type = "overlay",    id = 5},
    ["lipstick"]    = {type = "overlay",    id = 8},
    ["makeup"]      = {type = "overlay",    id = 4},
    ["ageing"]      = {type = "ageing",     id = 3},
    ["mask"]        = {type = "mask",       id = 1},
    ["hat"]         = {type = "prop",       id = 0},
    ["glass"]       = {type = "prop",       id = 1},
    ["ear"]         = {type = "prop",       id = 2},
    ["watch"]       = {type = "prop",       id = 6},
    ["bracelet"]    = {type = "prop",       id = 7},
    ["accessory"]   = {type = "variation",  id = 7},
    ["decals"]      = {type = "variation",  id = 10},
}



RegisterNetEvent('qb-clothing:client:openMenu')
AddEventHandler('qb-clothing:client:openMenu', function()
    customCamLocation = nil
    
    openMenu({
        {menu = "character", label = "Karakter", selected = true},
        {menu = "clothing", label = "Kıyafetler", selected = false},
        {menu = "accessoires", label = "Aksesuarlar", selected = false}
    })
end)

function GetMaxValues()
    maxModelValues = {
        ["arms"]        = {type = "character", item = 0, texture = 0},
        ["t-shirt"]     = {type = "character", item = 0, texture = 0},
        ["torso2"]      = {type = "character", item = 0, texture = 0},
        ["pants"]       = {type = "character", item = 0, texture = 0},
        ["shoes"]       = {type = "character", item = 0, texture = 0},
        ["face"]        = {type = "character", item = 0, texture = 0},
        ["vest"]        = {type = "character", item = 0, texture = 0},
        ["accessory"]   = {type = "character", item = 0, texture = 0},
        ["decals"]      = {type = "character", item = 0, texture = 0},
        ["bag"]         = {type = "character", item = 0, texture = 0},
        ["hair"]        = {type = "hair", item = 0, texture = 0},
        ["eyebrows"]    = {type = "hair", item = 0, texture = 0},
        ["beard"]       = {type = "hair", item = 0, texture = 0},
        ["blush"]       = {type = "hair", item = 0, texture = 0},
        ["lipstick"]    = {type = "hair", item = 0, texture = 0},
        ["makeup"]      = {type = "hair", item = 0, texture = 0},
        ["ageing"]      = {type = "hair", item = 0, texture = 0},
        ["mask"]        = {type = "accessoires", item = 0, texture = 0},
        ["hat"]         = {type = "accessoires", item = 0, texture = 0},
        ["glass"]       = {type = "accessoires", item = 0, texture = 0},
        ["ear"]         = {type = "accessoires", item = 0, texture = 0},
        ["watch"]       = {type = "accessoires", item = 0, texture = 0},
        ["bracelet"]    = {type = "accessoires", item = 0, texture = 0},
    }
    local ped = PlayerPedId()
    for k, v in pairs(clothingCategorys) do
        if v.type == "variation" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id)) -1
        end

        if v.type == "hair" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "mask" then
            maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped, v.id, GetPedDrawableVariation(ped, v.id))
        end

        if v.type == "face" then
            maxModelValues[k].item = 42
            maxModelValues[k].texture = 15
        end

        if v.type == "ageing" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 0
        end

        if v.type == "overlay" then
            maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
            maxModelValues[k].texture = 45
        end

        if v.type == "prop" then
            maxModelValues[k].item = GetNumberOfPedPropDrawableVariations(ped, v.id)
            maxModelValues[k].texture = GetNumberOfPedPropTextureVariations(ped, v.id, GetPedPropIndex(ped, v.id))
        end
    end

    SendNUIMessage({
        action = "updateMax",
        maxValues = maxModelValues
    })
end

function openMenu(allowedMenus)
    previousSkinData = json.encode(skinData)
    creatingCharacter = true

    local PlayerData = ESX.GetPlayerData()
    --local trackerMeta = PlayerData.metadata["tracker"]
     
    GetMaxValues()
    Wait(100)
    SendNUIMessage({
        action = "open",
        menus = allowedMenus,
        currentClothing = skinData,
        ilk_giris = ilk_giris
        --hasTracker = trackerMeta,
    })
    SetNuiFocus(true, true)
    SetCursorLocation(0.9, 0.25)

    FreezeEntityPosition(PlayerPedId(), true)

    enableCam()
end

RegisterNUICallback('TrackerError', function()
    TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "You cannot remove your ankle bracelet..")
end)


RegisterNUICallback('saveOutfit', function(data, cb)
    local ped = PlayerPedId()
    local model = GetEntityModel(ped)
    TriggerServerEvent('qb-clothes:saveOutfit', data.outfitName, model, skinData)
end)

RegisterNetEvent('qb-clothing:client:reloadOutfits')
AddEventHandler('qb-clothing:client:reloadOutfits', function(myOutfits)
    SendNUIMessage({
        action = "reloadMyOutfits",
        outfits = myOutfits
    })
end)

function enableCam()
    -- Camera
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 2.0, 0)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    if(not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, false, 0, true, true)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.5)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(PlayerPedId()) + 180)
    end
    
    if customCamLocation ~= nil then
        SetCamCoord(cam, customCamLocation.x, customCamLocation.y, customCamLocation.z)
    end
end

RegisterNUICallback('rotateCam', function(data)
    local rotType = data.type
    local ped = PlayerPedId()
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0, 2.0, 0)

    if rotType == "left" then
        SetEntityHeading(ped, GetEntityHeading(ped) - 10)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.5)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(ped) + 180)
    else
        SetEntityHeading(ped, GetEntityHeading(ped) + 10)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.5)
        SetCamRot(cam, 0.0, 0.0, GetEntityHeading(ped) + 180)
    end
end)

RegisterNUICallback('setupCam', function(data)
    local value = data.value

    if value == 1 then
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 0.75, 0)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.65)
    elseif value == 2 then
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.0, 0)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.2)
    elseif value == 3 then
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 1.0, 0)
        SetCamCoord(cam, coords.x, coords.y, coords.z + -0.5)
    else
        local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 2.0, 0)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.5)
    end
end)

function disableCam()
    RenderScriptCams(false, true, 250, 1, 0)
    DestroyCam(cam, false)

    FreezeEntityPosition(PlayerPedId(), false)
end

function closeMenu()
    SendNUIMessage({
        action = "close",
    })
    disableCam()
end

RegisterNUICallback('resetOutfit', function()
    resetClothing(json.decode(previousSkinData))
    skinData = json.decode(previousSkinData)
    previousSkinData = {}
end)

function resetClothing(data)
    local ped = PlayerPedId()

    -- Face
    SetPedHeadBlendData(ped, data["face"].item, data["face"].item, data["face"].item, data["face"].texture, data["face"].texture, data["face"].texture, 1.0, 1.0, 1.0, true)

    -- Pants
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Hair
    SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
    SetPedHairColor(ped, data["hair"].texture, data["hair"].texture)

    -- Eyebrows
    SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

    -- Beard
    SetPedHeadOverlay(ped, 1, data["beard"].item, 1.0)
    SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

    -- Blush
    SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
    SetPedHeadOverlayColor(ped, 5, 1, data["blush"].texture, 0)

    -- Lipstick
    SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].item, 0)

    -- Makeup
    SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
    SetPedHeadOverlayColor(ped, 4, 1, data["makeup"].texture, 0)

    -- Ageing
    SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
    SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

    -- Arms
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

    -- T-Shirt
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

    -- Vest
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

    -- Torso 2
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

    -- Shoes
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Badge
    SetPedComponentVariation(ped, 10, data["decals"].item, 0, 2)
    SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)

    -- Accessory
    SetPedComponentVariation(ped, 7, data["accessory"].item, 0, 2)
    SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)

    -- Bag
    SetPedComponentVariation(ped, 5, data["bag"].item, 0, 2)
    SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)

    -- Hat
    if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
        SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
    else
        ClearPedProp(ped, 0)
    end

    -- Glass
    if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
        SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
    else
        ClearPedProp(ped, 1)
    end

    -- Ear
    if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
        SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
    else
        ClearPedProp(ped, 2)
    end

    -- Watch
    if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
        SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)
    else
        ClearPedProp(ped, 6)
    end

    -- Bracelet
    if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
        SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)
    else
        ClearPedProp(ped, 7)
    end
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
    creatingCharacter = false
    disableCam()
    
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNUICallback('getCatergoryItems', function(data, cb)
    cb(Config.Menus[data.category])
end)

RegisterNUICallback('updateSkin', function(data)
    ChangeVariation(data)
end)

RegisterNUICallback('updateSkinOnInput', function(data)
    ChangeVariation(data)
end)

RegisterNUICallback('removeOutfit', function(data, cb)
    TriggerServerEvent('qb-clothing:server:removeOutfit', data.outfitName, data.outfitId)
    --TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "U removed "..data.outfitName.." !")
    TriggerEvent("notification",'Kıyafet silindi')
end)

function ChangeVariation(data)
    local ped = PlayerPedId()
    local clothingCategory = data.clothingType
    local type = data.type
    local item = data.articleNumber

    if clothingCategory == "pants" then
        if type == "item" then
            SetPedComponentVariation(ped, 4, item, 0, 0)
            skinData["pants"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 4)
            SetPedComponentVariation(ped, 4, curItem, item, 0)
            skinData["pants"].texture = item
        end
    elseif clothingCategory == "face" then
        if type == "item" then
            SetPedHeadBlendData(ped, tonumber(item), tonumber(item), tonumber(item), skinData["face"].texture, skinData["face"].texture, skinData["face"].texture, 1.0, 1.0, 1.0, true)
            skinData["face"].item = item
        elseif type == "texture" then
            SetPedHeadBlendData(ped, skinData["face"].item, skinData["face"].item, skinData["face"].item, item, item, item, 1.0, 1.0, 1.0, true)
            skinData["face"].texture = item
        end
    elseif clothingCategory == "hair" then
        SetPedHeadBlendData(ped, skinData["face"].item, skinData["face"].item, skinData["face"].item, skinData["face"].texture, skinData["face"].texture, skinData["face"].texture, 1.0, 1.0, 1.0, true)
        if type == "item" then
            SetPedComponentVariation(ped, 2, item, 0, 0)
            skinData["hair"].item = item
        elseif type == "texture" then
            SetPedHairColor(ped, item, item)
            skinData["hair"].texture = item
        end
    elseif clothingCategory == "eyebrows" then
        if type == "item" then
            SetPedHeadOverlay(ped, 2, item, 1.0)
            skinData["eyebrows"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 2, 1, item, 0)
            skinData["eyebrows"].texture = item
        end
    elseif clothingCategory == "beard" then
        if type == "item" then
            SetPedHeadOverlay(ped, 1, item, 1.0)
            skinData["beard"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 1, 1, item, 0)
            skinData["beard"].texture = item
        end
    elseif clothingCategory == "blush" then
        if type == "item" then
            SetPedHeadOverlay(ped, 5, item, 1.0)
            skinData["blush"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 5, 1, item, 0)
            skinData["blush"].texture = item
        end
    elseif clothingCategory == "lipstick" then
        if type == "item" then
            SetPedHeadOverlay(ped, 8, item, 1.0)
            skinData["lipstick"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 8, 1, item, 0)
            skinData["lipstick"].texture = item
        end
    elseif clothingCategory == "makeup" then
        if type == "item" then
            SetPedHeadOverlay(ped, 4, item, 1.0)
            skinData["makeup"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 4, 1, item, 0)
            skinData["makeup"].texture = item
        end
    elseif clothingCategory == "ageing" then
        if type == "item" then
            SetPedHeadOverlay(ped, 3, item, 1.0)
            skinData["ageing"].item = item
        elseif type == "texture" then
            SetPedHeadOverlayColor(ped, 3, 1, item, 0)
            skinData["ageing"].texture = item
        end
    elseif clothingCategory == "arms" then
        if type == "item" then
            SetPedComponentVariation(ped, 3, item, 0, 2)
            skinData["arms"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 3)
            SetPedComponentVariation(ped, 3, curItem, item, 0)
            skinData["arms"].texture = item
        end
    elseif clothingCategory == "t-shirt" then
        if type == "item" then
            SetPedComponentVariation(ped, 8, item, 0, 2)
            skinData["t-shirt"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 8)
            SetPedComponentVariation(ped, 8, curItem, item, 0)
            skinData["t-shirt"].texture = item
        end
    elseif clothingCategory == "vest" then
        if type == "item" then
            SetPedComponentVariation(ped, 9, item, 0, 2)
            skinData["vest"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 9, skinData["vest"].item, item, 0)
            skinData["vest"].texture = item
        end
    elseif clothingCategory == "bag" then
        if type == "item" then
            SetPedComponentVariation(ped, 5, item, 0, 2)
            skinData["bag"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 5, skinData["bag"].item, item, 0)
            skinData["bag"].texture = item
        end
    elseif clothingCategory == "decals" then
        if type == "item" then
            SetPedComponentVariation(ped, 10, item, 0, 2)
            skinData["decals"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 10, skinData["decals"].item, item, 0)
            skinData["decals"].texture = item
        end
    elseif clothingCategory == "accessory" then
        if type == "item" then
            SetPedComponentVariation(ped, 7, item, 0, 2)
            skinData["accessory"].item = item
        elseif type == "texture" then
            SetPedComponentVariation(ped, 7, skinData["accessory"].item, item, 0)
            skinData["accessory"].texture = item
        end
    elseif clothingCategory == "torso2" then
        if type == "item" then
            SetPedComponentVariation(ped, 11, item, 0, 2)
            skinData["torso2"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 11)
            SetPedComponentVariation(ped, 11, curItem, item, 0)
            skinData["torso2"].texture = item
        end
    elseif clothingCategory == "shoes" then
        if type == "item" then
            SetPedComponentVariation(ped, 6, item, 0, 2)
            skinData["shoes"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 6)
            SetPedComponentVariation(ped, 6, curItem, item, 0)
            skinData["shoes"].texture = item
        end
    elseif clothingCategory == "mask" then
        if type == "item" then
            SetPedComponentVariation(ped, 1, item, 0, 2)
            skinData["mask"].item = item
        elseif type == "texture" then
            local curItem = GetPedDrawableVariation(ped, 1)
            SetPedComponentVariation(ped, 1, curItem, item, 0)
            skinData["mask"].texture = item
        end
    elseif clothingCategory == "hat" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 0, item, skinData["hat"].texture, true)
            else
                ClearPedProp(ped, 0)
            end
            skinData["hat"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 0, skinData["hat"].item, item, true)
            skinData["hat"].texture = item
        end
    elseif clothingCategory == "glass" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 1, item, skinData["glass"].texture, true)
                skinData["glass"].item = item
            else
                ClearPedProp(ped, 1)
            end
        elseif type == "texture" then
            SetPedPropIndex(ped, 1, skinData["glass"].item, item, true)
            skinData["glass"].texture = item
        end
    elseif clothingCategory == "ear" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 2, item, skinData["ear"].texture, true)
            else
                ClearPedProp(ped, 2)
            end
            skinData["ear"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 2, skinData["ear"].item, item, true)
            skinData["ear"].texture = item
        end
    elseif clothingCategory == "watch" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 6, item, skinData["watch"].texture, true)
            else
                ClearPedProp(ped, 6)
            end
            skinData["watch"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 6, skinData["watch"].item, item, true)
            skinData["watch"].texture = item
        end
    elseif clothingCategory == "bracelet" then
        if type == "item" then
            if item ~= -1 then
                SetPedPropIndex(ped, 7, item, skinData["bracelet"].texture, true)
            else
                ClearPedProp(ped, 7)
            end
            skinData["bracelet"].item = item
        elseif type == "texture" then
            SetPedPropIndex(ped, 7, skinData["bracelet"].item, item, true)
            skinData["bracelet"].texture = item
        end
    end

    GetMaxValues()
end

function LoadPlayerModel(skin)
    RequestModel(skin)
    while not HasModelLoaded(skin) do
        Citizen.Wait(0)
    end
end

local blockedPeds = {
    "mp_m_freemode_01",
    "mp_f_freemode_01",
    "tony",
    "g_m_m_chigoon_02_m",
    "u_m_m_jesus_01",
    "a_m_y_stbla_m",
    "ig_terry_m",
    "a_m_m_ktown_m",
    "a_m_y_skater_m",
    "u_m_y_coop",
    "ig_car3guy1_m",
}

function isPedAllowedRandom(skin)
    local retval = false
    for k, v in pairs(blockedPeds) do
        if v ~= skin then
            retval = true
        end
    end
    return retval
end

function ChangeToSkinNoUpdate(skin)
    local ped = PlayerPedId()
    local model = GetHashKey(skin)
    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)

        for k, v in pairs(skinData) do
            if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
                ChangeVariation({
                    clothingType = k,
                    articleNumber = v.defaultItem,
                    type = "item",
                })
            else
                if k ~= "face" and k ~= "hair" then
                    ChangeVariation({
                        clothingType = k,
                        articleNumber = v.defaultItem,
                        type = "item",
                    })
                end
            end
            
            if skin == "mp_m_freemode_01" or skin == "mp_f_freemode_01" then
                ChangeVariation({
                    clothingType = k,
                    articleNumber = v.defaultTexture,
                    type = "texture",
                })
            else
                if k ~= "face" and k ~= "hair" then
                    ChangeVariation({
                        clothingType = k,
                        articleNumber = v.defaultTexture,
                        type = "texture",
                    })
                end
            end
        end
    end)

    -- SetEntityInvincible(ped, true)
    -- if IsModelInCdimage(model) and IsModelValid(model) then
    --     LoadPlayerModel(model)
    --     SetPlayerModel(PlayerId(), model)

    --     for k, v in pairs(skinData) do
    --         skinData[k].item = skinData[k].defaultItem
    --         skinData[k].texture = skinData[k].defaultTexture
    --     end

    --     if isPedAllowedRandom() then
    --         SetPedRandomComponentVariation(ped, true)
    --     end
        
    --     SendNUIMessage({action = "toggleChange", allow = true})
	-- 	SetModelAsNoLongerNeeded(model)
	-- end
	-- SetEntityInvincible(ped, false)
    -- GetMaxValues()
end

RegisterNUICallback('setCurrentPed', function(data, cb)
    local playerData = ESX.GetPlayerData()

    if playerData.gender == 0 then
        cb(Config.Models[data.ped])
        ChangeToSkinNoUpdate(Config.Models[data.ped])
    else
        cb(Config.Models[data.ped])
        ChangeToSkinNoUpdate(Config.Models[data.ped])
    end
end)

RegisterNUICallback('saveClothing', function(data)
    SaveSkin()
end)

RegisterNUICallback('saveClothing_item', function(data)
	local model = GetEntityModel(PlayerPedId())
    clothing = json.encode(skinData)
    if ft == 0 then 
      previousSkinData = clothing 
      ft = 1
    end
	TriggerServerEvent("qb-clothing:saveSkin_item", model, clothing, previousSkinData)
end)

local ft = 0

RegisterNetEvent('qb-clothes:client:refreshPrevSkin')
AddEventHandler('qb-clothes:client:refreshPrevSkin', function(previousSkinData)
    previousSkinData = previousSkinData
end)

function SaveSkin()
	local model = GetEntityModel(PlayerPedId())
    clothing = json.encode(skinData)
    if ft == 0 then 
      previousSkinData = clothing 
      ft = 1
    end
	TriggerServerEvent("qb-clothing:saveSkin", model, clothing, previousSkinData)
end

RegisterNetEvent('qb-clothes:client:CreateFirstCharacter')
AddEventHandler('qb-clothes:client:CreateFirstCharacter', function()
        local skin = "mp_m_freemode_01"
        openMenu({
            {menu = "character", label = "Karakter", selected = true},
            {menu = "clothing", label = "Kıyafet", selected = false},
            {menu = "accessoires", label = "Aksesuarlar", selected = false}
        })

        
        ChangeToSkinNoUpdate(skin)
        SendNUIMessage({
            action = "ResetValues",
    })
end)


RegisterNetEvent("qb-clothes:loadSkin")
AddEventHandler("qb-clothes:loadSkin", function(new, model, data)
    model = model ~= nil and tonumber(model) or false
    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 2)
        data = json.decode(data)
        TriggerEvent('qb-clothing:client:loadPlayerClothing', data, PlayerPedId())
    end)
end)

RegisterNetEvent('qb-clothing:client:loadPlayerClothing')
AddEventHandler('qb-clothing:client:loadPlayerClothing', function(data, ped)
    if ped == nil then ped = PlayerPedId() end

    for i = 0, 11 do
        SetPedComponentVariation(ped, i, 0, 0, 0)
    end

    for i = 0, 7 do
        ClearPedProp(ped, i)
    end

    -- Face
    SetPedHeadBlendData(ped, data["face"].item, data["face"].item, data["face"].item, data["face"].texture, data["face"].texture, data["face"].texture, 1.0, 1.0, 1.0, true)

    -- Pants
    SetPedComponentVariation(ped, 4, data["pants"].item, 0, 0)
    SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)

    -- Hair
    SetPedComponentVariation(ped, 2, data["hair"].item, 0, 0)
    SetPedHairColor(ped, data["hair"].texture, data["hair"].texture)

    -- Eyebrows
    SetPedHeadOverlay(ped, 2, data["eyebrows"].item, 1.0)
    SetPedHeadOverlayColor(ped, 2, 1, data["eyebrows"].texture, 0)

    -- Beard
    SetPedHeadOverlay(ped, 1, data["beard"].item, 1.0)
    SetPedHeadOverlayColor(ped, 1, 1, data["beard"].texture, 0)

    -- Blush
    SetPedHeadOverlay(ped, 5, data["blush"].item, 1.0)
    SetPedHeadOverlayColor(ped, 5, 1, data["blush"].texture, 0)

    -- Lipstick
    SetPedHeadOverlay(ped, 8, data["lipstick"].item, 1.0)
    SetPedHeadOverlayColor(ped, 8, 1, data["lipstick"].texture, 0)

    -- Makeup
    SetPedHeadOverlay(ped, 4, data["makeup"].item, 1.0)
    SetPedHeadOverlayColor(ped, 4, 1, data["makeup"].texture, 0)

    -- Ageing
    SetPedHeadOverlay(ped, 3, data["ageing"].item, 1.0)
    SetPedHeadOverlayColor(ped, 3, 1, data["ageing"].texture, 0)

    -- Arms
    SetPedComponentVariation(ped, 3, data["arms"].item, 0, 2)
    SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)

    -- T-Shirt
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, 0, 2)
    SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)

    -- Vest
    SetPedComponentVariation(ped, 9, data["vest"].item, 0, 2)
    SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)

    -- Torso 2
    SetPedComponentVariation(ped, 11, data["torso2"].item, 0, 2)
    SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)

    -- Shoes
    SetPedComponentVariation(ped, 6, data["shoes"].item, 0, 2)
    SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)

    -- Mask
    SetPedComponentVariation(ped, 1, data["mask"].item, 0, 2)
    SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)

    -- Badge
    SetPedComponentVariation(ped, 10, data["decals"].item, 0, 2)
    SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)

    -- Accessory
    SetPedComponentVariation(ped, 7, data["accessory"].item, 0, 2)
    SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)

    -- Bag
    SetPedComponentVariation(ped, 5, data["bag"].item, 0, 2)
    SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)

    -- Hat
    if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
        SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
    else
        ClearPedProp(ped, 0)
    end

    -- Glass
    if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
        SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
    else
        ClearPedProp(ped, 1)
    end

    -- Ear
    if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
        SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
    else
        ClearPedProp(ped, 2)
    end

    -- Watch
    if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
        SetPedPropIndex(ped, 6, data["watch"].item, data["watch"].texture, true)
    else
        ClearPedProp(ped, 6)
    end

    -- Bracelet
    if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
        SetPedPropIndex(ped, 7, data["bracelet"].item, data["bracelet"].texture, true)
    else
        ClearPedProp(ped, 7)
    end

    skinData = data
    Citizen.Wait(1500)
    -- ESX.TriggerServerCallback('fizzfau-armor:getArmor',function(armourcount)
    --     SetPedArmour(PlayerPedId(),armourcount)
    --     TriggerEvent('armourdb-setarmour',armourcount)
    -- end)
end)

function typeof(var)
    local _type = type(var);
    if(_type ~= "table" and _type ~= "userdata") then
        return _type;
    end
    local _meta = getmetatable(var);
    if(_meta ~= nil and _meta._NAME ~= nil) then
        return _meta._NAME;
    else
        return _type;
    end
end

RegisterNetEvent('qb-clothing:client:loadOutfit')
AddEventHandler('qb-clothing:client:loadOutfit', function(oData)
    local ped = PlayerPedId()

    data = oData.outfitData

    if typeof(data) ~= "table" then data = json.decode(data) end

    for k, v in pairs(data) do
        skinData[k].item = data[k].item
        skinData[k].texture = data[k].texture
    end

    -- Pants
    if data["pants"] ~= nil then
        SetPedComponentVariation(ped, 4, data["pants"].item, data["pants"].texture, 0)
    end

    -- Arms
    if data["arms"] ~= nil then
        SetPedComponentVariation(ped, 3, data["arms"].item, data["arms"].texture, 0)
    end

    -- T-Shirt
    if data["t-shirt"] ~= nil then
        SetPedComponentVariation(ped, 8, data["t-shirt"].item, data["t-shirt"].texture, 0)
    end

    -- Vest
    if data["vest"] ~= nil then
        SetPedComponentVariation(ped, 9, data["vest"].item, data["vest"].texture, 0)
    end

    -- Torso 2
    if data["torso2"] ~= nil then
        SetPedComponentVariation(ped, 11, data["torso2"].item, data["torso2"].texture, 0)
    end

    -- Shoes
    if data["shoes"] ~= nil then
        SetPedComponentVariation(ped, 6, data["shoes"].item, data["shoes"].texture, 0)
    end

    -- Bag
    if data["bag"] ~= nil then
        SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)
    end

    -- Badge
    if data["badge"] ~= nil then
        SetPedComponentVariation(ped, 10, data["decals"].item, data["decals"].texture, 0)
    end

    -- Accessory
    if data["accessory"] ~= nil then
        --if ESX.GetPlayerData().metadata["tracker"] then
          --  SetPedComponentVariation(ped, 7, 13, 0, 0)
        --else
            SetPedComponentVariation(ped, 7, data["accessory"].item, data["accessory"].texture, 0)
        --end
    else
        --if ESX.GetPlayerData().metadata["tracker"] then
         --   SetPedComponentVariation(ped, 7, 13, 0, 0)
        --else
            SetPedComponentVariation(ped, 7, -1, 0, 2)
        --end
    end

    -- Mask
    if data["mask"] ~= nil then
        SetPedComponentVariation(ped, 1, data["mask"].item, data["mask"].texture, 0)
    end

    -- Bag
    if data["bag"] ~= nil then
        SetPedComponentVariation(ped, 5, data["bag"].item, data["bag"].texture, 0)
    end

    -- Hat
    if data["hat"] ~= nil then
        if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
            SetPedPropIndex(ped, 0, data["hat"].item, data["hat"].texture, true)
        else
            ClearPedProp(ped, 0)
        end
    end

    -- Glass
    if data["glass"] ~= nil then
        if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
            SetPedPropIndex(ped, 1, data["glass"].item, data["glass"].texture, true)
        else
            ClearPedProp(ped, 1)
        end
    end

    -- Ear
    if data["ear"] ~= nil then
        if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
            SetPedPropIndex(ped, 2, data["ear"].item, data["ear"].texture, true)
        else
            ClearPedProp(ped, 2)
        end
    end

    if oData.outfitName ~= nil then
       -- TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, "The outfit "..oData.outfitName.." is chosen! Press Confirm to confirm outfit.")
        TriggerEvent("notification",oData.outfitName..' isimli kıyafet seçildi onayla butonuna basınız')
    end
end)

local faceProps = {
	[1] = { ["Prop"] = -1, ["Texture"] = -1 },
	[2] = { ["Prop"] = -1, ["Texture"] = -1 },
	[3] = { ["Prop"] = -1, ["Texture"] = -1 },
	[4] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
	[5] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
	[6] = { ["Prop"] = -1, ["Palette"] = -1, ["Texture"] = -1 }, -- this is actually a pedtexture variations, not a prop
}

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent("qb-clothing:client:adjustfacewear")
AddEventHandler("qb-clothing:client:adjustfacewear",function(type)
    if ESX.GetPlayerData().metadata["ishandcuffed"] then return end
	removeWear = not removeWear
	local AnimSet = "none"
	local AnimationOn = "none"
	local AnimationOff = "none"
	local PropIndex = 0

	local AnimSet = "mp_masks@on_foot"
	local AnimationOn = "put_on_mask"
	local AnimationOff = "put_on_mask"

	faceProps[6]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 0)
	faceProps[6]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 0)
	faceProps[6]["Texture"] = GetPedTextureVariation(PlayerPedId(), 0)

	for i = 0, 3 do
		if GetPedPropIndex(PlayerPedId(), i) ~= -1 then
			faceProps[i+1]["Prop"] = GetPedPropIndex(PlayerPedId(), i)
		end
		if GetPedPropTextureIndex(PlayerPedId(), i) ~= -1 then
			faceProps[i+1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), i)
		end
	end

	if GetPedDrawableVariation(PlayerPedId(), 1) ~= -1 then
		faceProps[4]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 1)
		faceProps[4]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 1)
		faceProps[4]["Texture"] = GetPedTextureVariation(PlayerPedId(), 1)
	end

	if GetPedDrawableVariation(PlayerPedId(), 11) ~= -1 then
		faceProps[5]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 11)
		faceProps[5]["Palette"] = GetPedPaletteVariation(PlayerPedId(), 11)
		faceProps[5]["Texture"] = GetPedTextureVariation(PlayerPedId(), 11)
	end

	if type == 1 then
		PropIndex = 0
	elseif type == 2 then
		PropIndex = 1

		AnimSet = "clothingspecs"
		AnimationOn = "take_off"
		AnimationOff = "take_off"

	elseif type == 3 then
		PropIndex = 2
	elseif type == 4 then
		PropIndex = 1
		if removeWear then
			AnimSet = "missfbi4"
			AnimationOn = "takeoff_mask"
			AnimationOff = "takeoff_mask"
		end
	elseif type == 5 then
		PropIndex = 11
		AnimSet = "oddjobs@basejump@ig_15"
		AnimationOn = "puton_parachute"
		AnimationOff = "puton_parachute"	
		--mp_safehouseshower@male@ male_shower_idle_d_towel
		--mp_character_creation@customise@male_a drop_clothes_a
		--oddjobs@basejump@ig_15 puton_parachute_bag
	end

	loadAnimDict( AnimSet )
	if type == 5 then
		if removeWear then
			SetPedComponentVariation(PlayerPedId(), 3, 2, faceProps[6]["Texture"], faceProps[6]["Palette"])
		end
	end
	if removeWear then
		TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOff, 4.0, 3.0, -1, 49, 1.0, 0, 0, 0 )
		Citizen.Wait(500)
		if type ~= 5 then
			if type == 4 then
				SetPedComponentVariation(PlayerPedId(), PropIndex, -1, -1, -1)
			else
				if type ~= 2 then
					ClearPedProp(PlayerPedId(), tonumber(PropIndex))
				end
			end
		end
	else
		TaskPlayAnim( PlayerPedId(), AnimSet, AnimationOn, 4.0, 3.0, -1, 49, 1.0, 0, 0, 0 )
		Citizen.Wait(500)
		if type ~= 5 and type ~= 2 then
			if type == 4 then
				SetPedComponentVariation(PlayerPedId(), PropIndex, faceProps[type]["Prop"], faceProps[type]["Texture"], faceProps[type]["Palette"])
			else
				SetPedPropIndex( PlayerPedId(), tonumber(PropIndex), tonumber(faceProps[PropIndex+1]["Prop"]), tonumber(faceProps[PropIndex+1]["Texture"]), false)
			end
		end
	end
	if type == 5 then
		if not removeWear then
			SetPedComponentVariation(PlayerPedId(), 3, 1, faceProps[6]["Texture"], faceProps[6]["Palette"])
			SetPedComponentVariation(PlayerPedId(), PropIndex, faceProps[type]["Prop"], faceProps[type]["Texture"], faceProps[type]["Palette"])
		else
			SetPedComponentVariation(PlayerPedId(), PropIndex, -1, -1, -1)
		end
		Citizen.Wait(1800)
	end
	if type == 2 then
		Citizen.Wait(600)
		if removeWear then
			ClearPedProp(PlayerPedId(), tonumber(PropIndex))
		end

		if not removeWear then
			Citizen.Wait(140)
			SetPedPropIndex( PlayerPedId(), tonumber(PropIndex), tonumber(faceProps[PropIndex+1]["Prop"]), tonumber(faceProps[PropIndex+1]["Texture"]), false)
		end
	end
	if type == 4 and removeWear then
		Citizen.Wait(1200)
	end
	ClearPedTasks(PlayerPedId())
end)