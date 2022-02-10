collectgarbage()

local vehicles = {}
local threads = {}

Citizen.CreateThread(function()
  DecorRegister(Constants.Decor, 3)
  while true do
    Citizen.Wait(1e3)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
      local vehicle = GetVehiclePedIsIn(ped)
      if NetworkIsEntityOwner(vehicle) and DecorExistOn(vehicle, Constants.Decor) then
        if #vehicles == 0 then
          Citizen.CreateThread(function()
            repeat
              Citizen.Wait(50)
              -- validate vehicles
              local validated = {}
              for _, vehicle in pairs(vehicles) do
                if
                  DoesEntityExist(vehicle) and
                  NetworkIsEntityOwner(vehicle) and
                  DecorExistOn(vehicle, Constants.Decor)
                then
                  table.insert(validated, vehicle)
                end
              end
              vehicles = validated
              validated = nil

              for _, vehicle in pairs(vehicles) do
                if threads[vehicle] == nil then
                  local handle = DecorGetInt(vehicle, Constants.Decor)
                  if type(handle) == 'number' and handle > 0 then
                    -- assume this accesses an animation config, otherwise will naturally throw an error
                    local animation = Config.Animations[handle]
                    Citizen.CreateThread(function()
                      threads[vehicle] = true
                      while true do
                        for _, pattern in pairs(animation.patterns) do
                          for i, state in pairs(pattern) do
                            SetVehicleNeonLightEnabled(vehicle, i, state)
                          end
                          Citizen.Wait(750)
                          if handle ~= DecorGetInt(vehicle, Constants.Decor) then
                            threads[vehicle] = nil
                            goto continue
                          end
                        end
                      end
                      ::continue::
                    end)
                  end
                end
              end
            until #vehicles == 0
          end)
        end
        table.insert(vehicles, vehicle)
      end
    end
  end
end)