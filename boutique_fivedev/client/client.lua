ESX = nil

Citizen.CreateThread(function()
	TriggerServerEvent('boutique:getpoints')
	if pointjoueur == nil then pointjoueur = 0 end
	while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)

local menuColor = {9, 24, 118}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['boutique']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('boutique', v):SetRectangleBanner(9, 24, 118)
        end
    end)
end

RMenu.Add('boutique', 'main', RageUI.CreateMenu("~o~Hatalia ~q~Shop", "Menu boutique"))
RMenu.Add('boutique', 'vehiclemenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "~b~Véhicules", "Menu Véhicule"))
RMenu.Add('boutique', 'armesmenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "~r~Armes", "Menu d'armes"))
RMenu.Add('boutique', 'moneymenu', RageUI.CreateSubMenu(RMenu:Get('boutique', 'main'), "~y~Argent", "Menu d'argent"))

Citizen.CreateThread(function()
    while true do
		RageUI.IsVisible(RMenu:Get('boutique', 'main'), true, true, true, function()

                RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

                RageUI.Separator("~h~ID~s~ : ~h~" ..GetPlayerServerId(PlayerId()))
                
--                RageUI.Separator("Code boutique : " .. code)

				RageUI.ButtonWithStyle("🔧~g~Véhicules", "~g~Liste ~b~des ~r~véhicule ~y~de ~p~la ~o~boutique.", { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'vehiclemenu'))

				RageUI.ButtonWithStyle("~r~🔫 Armes", "~g~Liste ~b~des ~r~armes ~y~de ~p~la ~o~boutique.", { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'armesmenu'))

				RageUI.ButtonWithStyle("~y~💸Argent", "~g~Argent~b~-~r~IG.", { RightLabel = "→" },true, function() 
				end, RMenu:Get('boutique', 'moneymenu'))
				end)

-------------------------------------------------------------------------- Véhicules
		
        RageUI.IsVisible(RMenu:Get('boutique', 'vehiclemenu'), true, true, true, function()
            
            RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

			RageUI.ButtonWithStyle("Bugatti Super Sport 300", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
				if a then
					RenderSprite("RageUI", "SuperSport", 0, 565, 535, 290, 100)
				end
		
                if s then
                    ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                        if callback then
                            local veh = "bug300ss"
                            give_vehi(veh)
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                            else
                        ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                            end
            
                    end, "bug300ss")
                end
            end) 
		
		RageUI.ButtonWithStyle("La Voiture Noire", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
						RenderSprite("RageUI", "voiturenoire", 0, 565, 535, 290, 100)
					end
			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "blvn"
                        give_vehi(veh)   
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "blvn")
                    end
                end) 
		
		RageUI.ButtonWithStyle("Ducati D99", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
						RenderSprite("RageUI", "charger", 0, 565, 535, 290, 100)
					end
				
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "d99"
                        give_vehi(veh)    
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "d99")
                    end
                end) 
				
		RageUI.ButtonWithStyle("Audi Rs3 SportBack", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "f12", 0, 565, 535, 290, 100)
					end
					
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rs318"
                        give_vehi(veh)   
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "rs318")
                    end
                end) 
				
		RageUI.ButtonWithStyle("Bmw M5", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "f40", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "m5e60"
                        give_vehi(veh)  
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "m5e60")
                    end
                end) 
				
		RageUI.ButtonWithStyle("BMW M8", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "b63s", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "bmwm8"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "bmwm8")
                    end
                end) 

		RageUI.ButtonWithStyle("Yamaha Tmax", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "gtr", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "tmax"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                        end, "tmax")
                    end
                end) 

				RageUI.ButtonWithStyle("Jeep Rmod", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "jeep", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rmodjeep"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "rmodjeep")
                        end
                    end) 

				RageUI.ButtonWithStyle("Bmw M5 E34", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "m5", 0, 565, 535, 290, 100)
					end
						
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rmodm5e34"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "rmodm5e34")
                        end
                    end) 

				RageUI.ButtonWithStyle("Volkswagen MK7", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "golf", 0, 565, 535, 290, 100)
					end			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rmodmk7"
                        give_vehi(veh)
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "rmodmk7")
                        end
                    end) 

				RageUI.ButtonWithStyle("Nissan Skyline R34", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "skyline", 0, 565, 535, 290, 100)
					end			
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                            if callback then
                        local veh = "rmodskyline34"
                        give_vehi(veh) 
                        ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                    else
                ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                    end
    
                            end, "rmodskyline34")
                        end
                    end) 

				RageUI.ButtonWithStyle("Chevrolet Camaro ZL1", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
					if a then
							RenderSprite("RageUI", "zl1", 0, 565, 535, 290, 100)
					end	
                    if s then
                        ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                        if callback then
                    local veh = "rmodzl1"
                    give_vehi(veh)   
					ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                            else
                        ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                            end
            
                            end, "rmodzl1")
                        end
                    end) 

end)



-------------------------------------------------------------------------- Armes


    RageUI.IsVisible(RMenu:Get('boutique', 'armesmenu'), true, true, true, function()
        
        RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)


		RageUI.ButtonWithStyle("~g~Couteau", nil, { RightLabel = "~r~250 "..moneypoints }, true,function(h,a,s)
			if a then
				RenderSprite("RageUI", "Screenshot_127", 0, 565, 535, 290, 100)
			end
			if s then
				ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
					if callback == true then
						local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
						ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
					else
						ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
					end
				end, "couteau")
			end
		end)

    RageUI.ButtonWithStyle("~b~Bat de baseball", nil, { RightLabel = "~r~250 " ..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "baseball-bat", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "bat")            
        end
	end)
	
	RageUI.ButtonWithStyle("~r~Hachette", nil, { RightLabel = "~r~250 " ..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "hachet", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "hachet")            
        end
	end)
	
	RageUI.ButtonWithStyle("~y~Hachette en pierre", nil, { RightLabel = "~r~250 " ..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "hachettepierre", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "hachpierre")            
        end
    end)

	
	RageUI.ButtonWithStyle("~p~Pétoire", nil, { RightLabel = "~r~500 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "cal50", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "snspistol")
        end
    end)

    RageUI.ButtonWithStyle("~o~Pistolet", nil, { RightLabel = "~r~600 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "pistol", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "pistol")
        end
	end)

   RageUI.ButtonWithStyle("~g~Pistolet Vintage", nil, { RightLabel = "~r~1000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "vintagepistol", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "vintage")
        end
	end) 

	RageUI.ButtonWithStyle("~b~Mini-SMG", nil, { RightLabel = "~r~2000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "minismg", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "msmg")
        end
    end) 
	
    RageUI.ButtonWithStyle("~r~Pistolet Mitrailleur", nil, { RightLabel = "~r~2000 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "pistolet-mitrailleur", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "pm")
        end
	end) 
	
	RageUI.ButtonWithStyle("~y~AK-47", nil, { RightLabel = "~r~2500 "..moneypoints }, true,function(h,a,s)
        if a then
            RenderSprite("RageUI", "assault-rifle-mk2", 0, 565, 535, 290, 100)
        end
        if s then
            ESX.TriggerServerCallback('RedMenu:BuyItem', function(callback)
                if callback == true then
                    local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
                    ESX.ShowNotification("~h~⭐ ~g~Merci pour votre achat dans la boutique !")
                else
                    ESX.ShowNotification("~r~Vous n'avez pas assez de fond pour acheter ceci !")
                end
            end, "ak47")
        end
	end) 
end) --- Fin Armes

-------------------------------------------------------------------------- Argent

        RageUI.IsVisible(RMenu:Get('boutique', 'moneymenu'), true, true, true, function()
            
            RageUI.Separator("~g~~h~Tu as ~r~"..pointjoueur.." "..moneypoints, nil, {}, true, function(_, _, _) end)

			for k, itemmoy in pairs(itemmoney) do
                RageUI.ButtonWithStyle(itemmoy.name, itemmoy.desc, {RightLabel = "~r~"..tostring(itemmoy.point).." ~b~"..moneypoints}, true, function(Hovered, Active, Selected)
					if (Selected) then

						curentvehicle_name = itemmoy.name
						curentvehicle_model = itemmoy.model
						curentvehicle_point = itemmoy.point
						curentvehicle_finalpoint = itemmoy.point

						if pointjoueur >= curentvehicle_finalpoint then
							buying(curentvehicle_finalpoint)
							gmoney(curentvehicle_model, curentvehicle_name)
						else 
							TriggerEvent('esx:showNotification', '~r~Vous n\'avez pas assez de fond pour acheter ceci !')
						end
					end
				end)
			end
		end)
		
        Citizen.Wait(0)
    end
end)

--------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsControlJustPressed(0, touche_open_menu) then
			TriggerServerEvent('boutique:getpoints')
			RageUI.Visible(RMenu:Get('boutique', 'main'), not RageUI.Visible(RMenu:Get('boutique', 'main')))
		end -- Touche F1
	end
end)


function buying(point)
	if pointjoueur >= point then
		TriggerServerEvent('boutique:deltniop', point)
		Citizen.Wait(300)
		TriggerServerEvent('boutique:getpoints')
	else
		TriggerEvent('esx:showNotification', '~r~Tu ne peut pas acheter cet article.')
	end
end

RegisterNetEvent('boutique:retupoints')
AddEventHandler('boutique:retupoints', function(point)
	pointjoueur = point
end)

local voituregive = {}

function give_vehi(veh)
    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
    
    Citizen.Wait(10)
    ESX.Game.SpawnVehicle(veh, {x = plyCoords.x+2 ,y = plyCoords.y, z = plyCoords.z+2}, 313.4216, function (vehicle)
            local plate = exports.esx_vehicleshop:GeneratePlate()
            table.insert(voituregive, vehicle)		
            print(plate)
            local vehicleProps = ESX.Game.GetVehicleProperties(voituregive[#voituregive])
            vehicleProps.plate = plate
            SetVehicleNumberPlateText(voituregive[#voituregive] , plate)
			TriggerServerEvent('shop:vehicule', vehicleProps, plate)
		
	end)
end

function gmoney(w,n)
    TriggerEvent('esx:showNotification', '~h~⭐ ~g~Merci pour votre achat dans la boutique !')
	TriggerServerEvent('give:money', w)
end

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

