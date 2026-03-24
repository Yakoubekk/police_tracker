local activeVehBlips = {}

Citizen.CreateThread(function()
    while true do
        local sleep = Config.RefreshTime
        local PlayerData = exports['es_extended']:getSharedObject().GetPlayerData()
        
        if PlayerData.job and Config.AllowedJobs[PlayerData.job.name] then
            local vehicles = GetGamePool('CVehicle')
            
            for _, veh in ipairs(vehicles) do
                local model = GetEntityModel(veh)
                local modelName = string.lower(GetDisplayNameFromVehicleModel(model))
                
                if Config.TrackedVehicles[modelName] then
                    local vehicleData = Config.TrackedVehicles[modelName]
                    
                    if not activeVehBlips[veh] then
                        local blip = AddBlipForEntity(veh)
                        SetBlipSprite(blip, 56) 
                        SetBlipColour(blip, vehicleData.color)
                        SetBlipScale(blip, 0.80)
                        SetBlipAsShortRange(blip, true)
                        
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(vehicleData.label)
                        EndTextCommandSetBlipName(blip)
                        
                        activeVehBlips[veh] = blip
                    end
                end
            end

            for veh, blip in pairs(activeVehBlips) do
                if not DoesEntityExist(veh) then
                    RemoveBlip(blip)
                    activeVehBlips[veh] = nil
                end
            end
        else
            for veh, blip in pairs(activeVehBlips) do
                RemoveBlip(blip)
                activeVehBlips[veh] = nil
            end
            sleep = 5000
        end
        
        Citizen.Wait(sleep)
    end
end)