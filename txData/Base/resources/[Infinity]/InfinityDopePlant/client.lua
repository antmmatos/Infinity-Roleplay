RegisterNetEvent('instance:onEnter')
RegisterNetEvent('instance:onLeave')
RegisterNetEvent('instance:onClose')
RegisterNetEvent('InfinityDopePlant:SyncPlant')
RegisterNetEvent('InfinityDopePlant:UseSeed')
RegisterNetEvent('InfinityDopePlant:UseItem')
RegisterNetEvent('InfinityDopePlant:UseBag')
RegisterNetEvent('InfinityDopePlant:UseRollingPapers')

local MFD = InfinityDopePlant

function MFD:Start()
  self.Plants = {}
  self.timer = GetGameTimer()
  ESX.TriggerServerCallback('InfinityDopePlant:GetLoginData', function(plants)  
    self.Plants = plants or {}
    for k = 1,#self.Plants,1 do
      local v = self.Plants[k]
      if v and not v.Instance then
        local hk      = Utils.GetHashKey(self.Objects[v.Stage])
        local load    = Utils.LoadModel(hk,true) 
        local zOffset = self:GetPlantZ(v) 
        v.Object = CreateObject(hk, v.Position.x, v.Position.y, v.Position.z + zOffset, false, false, false)   
        SetEntityAsMissionEntity(v.Object,true)
        FreezeEntityPosition(v.Object,true)
      end
    end
    self.iR = true
  end)
  while not self.iR do Citizen.Wait(10); end
  if self.dS and self.cS then
    Citizen.CreateThread(function(...) self:PerSecThread(...); end)
    Citizen.CreateThread(function(...) self:FiveSecThread(...); end)
    Citizen.CreateThread(function(...) self:PerFrameThread(...); end)
  end
end

function MFD:GetLoginData()
end

function MFD:PerSecThread()
  while true do
    Wait(3500)
    self:GrowthHandlerFast()
  end
end

function MFD:FiveSecThread()
  local tick = 0
  while true do
    Wait(5000)
    tick = tick + 1
    self:GrowthHandlerSlow()
    if tick % 4 == 0 then self:SyncCheck(); end
  end
end

local sleep = 1500
function MFD:PerFrameThread()
  if not self then return; end
  while true do
    Citizen.Wait(sleep)
    self:InputHandler()
    self:DrawCurText() 
  end
end

function MFD:InputHandler()
  if not self.Plants then return; end
  if not #self.Plants then return; end
  if self.CanHarvest or self.PolText then 
    sleep = 10
    if Utils:GetKeyPressed("E") and (GetGameTimer() - self.timer) > 200 and not self.CurInteracting then
      Citizen.CreateThread(function()
        self.CurInteracting = true
        local plyPed = PlayerPedId()
        TaskTurnPedToFaceEntity(plyPed, self.Plants[self.CurKey].Object, -1)
        Citizen.Wait(1500)
        TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
        exports['mythic_progbar']:Progress({
            name = "grandmas_house",
            duration = 20000,
            label = "A Recolher",
            useWhileDead = true,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {},
            prop = {},
            propTwo = {},
        }, function(status)
            if not status then
              ClearPedTasksImmediately(plyPed)
              local syncData = (self.CanHarvest or self.PolText)
              self.timer = GetGameTimer()
              SetEntityAsMissionEntity(self.Plants[self.CurKey].Object,false)
              FreezeEntityPosition(self.Plants[self.CurKey].Object,false)
              DeleteObject(self.Plants[self.CurKey].Object)
              self:Sync(self.Plants[self.CurKey],true)
              self.Plants[self.CurKey] = false
              self.CanHarvest = false
              self.PolText = false
              self:TextHandler()
              self.CurInteracting = false
            end
        end)
      end)
    end
  else
    sleep = 1000
  end
end

function MFD:DrawCurText()
  sleep = 1000
  if not self.CurText then return; end
  local closest = self.CurText.closest
  local plyPos = GetEntityCoords(PlayerPedId())
  if Utils.GetXYDist(plyPos.x,plyPos.y,plyPos.z,closest.Position.x,closest.Position.y,closest.Position.z) > self.InteractDist then self.CurText = false; self:TextHandler() return; end
  sleep = 7
  local strA = self.CurText.strA
  local strB = self.CurText.strB
  self:DrawText3D(closest.Position.x,closest.Position.y,closest.Position.z, strA)
  self:DrawText3D(closest.Position.x,closest.Position.y,closest.Position.z - 0.07, strB)
  if not self.PolText then return; end
  local closestPol = self.PolText.closest
  local strC = self.PolText.strA
  self:DrawText3D(closestPol.Position.x,closestPol.Position.y,closestPol.Position.z - 0.17, strC)
end

function MFD:TextHandler()
  if not self.Plants then self.CanHarvest = false; self.CurText = false; self.PolText = false; self.CurKey = false; return; end
  if not #self.Plants then self.CanHarvest = false; self.CurText = false; self.PolText = false; self.CurKey = false; return; end
  local plyPed = PlayerPedId()
  local plyPos = GetEntityCoords(plyPed)
  local closest,closestDist,closestKey
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v then
      if (self.Instance and v.Instance and v.Instance == self.Instance) or (not self.Instance and not v.Instance) then
        local dist = Utils:GetVecDist(plyPos,v.Position)
        if not closest or dist < closestDist then
          closestDist = dist
          closest = v
          closestKey = k
        end
      end
    end
  end

  if not closest then self.CanHarvest = false; self.CurText = false; self.PolText = false; self.CurKey = false; return; end
  if closestDist > self.InteractDist then self.CanHarvest = false; self.CurText = false; self.PolText = false; self.CurKey = false; return; end

  local strA
  if closest.Gender == "Male" then
    strA = "[ Macho ] "
  else
    strA = "[ Feminino ] "
  end

  local colGrowth = self:GetValColour(closest.Growth)
  strA = strA .. colGrowth .. math.ceil(closest.Growth) .. "~s~ % Crescimento ] " -- 
  local plyData = ESX.GetPlayerData()
  if closest.Growth >= 99.99 then 
    --if closest.Owner == plyId  then
      strA = strA .. "[ Pressiona [ ~g~E~w~ ] para cultivar ] " 
      self.CanHarvest = closest
    --[[else
      self.CanHarvest = false
    end]]
  end
  local colQual = self:GetValColour(closest.Quality)
  strA = strA  .. colQual .. "Qualidade~s~ ]"  

  local colFert = self:GetValColour(closest.Food)
  local strB = colFert .. "Fertilizante~s~ ] " 
  local colWater = self:GetValColour(closest.Water)
  strB = strB .. colWater .. "Agua~s~ ]"  

  self.CurText = { closest = closest, strA = strA, strB = strB }
  if (plyData.job and plyData.job.label and plyData.job.label == self.PoliceJobLabel) then
    self.PolText = { closest = closest, strA = "[ Pressiona [~r~ E ~s~] para destruir ]" }
  end
  self.CurKey = closestKey
end

function MFD:GetValColour(v)
  if not v then return "[ ~s~"; end
  if v>=95.0 then return "[ ~p~"
  elseif v>=80.0 then return "[ ~b~"
  elseif v>=60.0 then return "[ ~g~"
  elseif v>=40.0 then return "[ ~y~"
  elseif v>=20.0 then return "[ ~o~"
  elseif v>=0.0 then return "[ ~r~"
  else return "[ ~s~"
  end
end

function MFD:GetQualColour(v)
  if not v then return "~s~"; end
  if v>=5.0 then return "~b~"
  elseif v>=4.0 then return "~g~"
  elseif v>=3.0 then return "~y~"
  elseif v>=2.0 then return "~o~"
  elseif v>=1.0 then return "~y~"
  elseif v>=0.0 then return "~r~"
  else return "~s~"
  end
end

function MFD:GrowthHandlerSlow()
  if not self.Plants then return; end
  if not #self.Plants then return; end
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v then
      self:GrowPlantSlow(v,k)
    end
  end
end

function MFD:GrowPlantSlow(plant,key)
  if not self.Plants then return; end
  if not self.Plants[key] then return; end
  if self.Plants[key] ~= plant then return; end

  local divider = 95.0 / #self.Objects
  local targetStage = math.max(1,math.floor(plant.Growth / divider))

  if plant.Stage ~= math.min(targetStage,7) then
    plant.Stage = targetStage
    SetEntityAsMissionEntity(plant.Object,false)
    FreezeEntityPosition(plant.Object,false)

    local hk      = Utils.GetHashKey(self.Objects[plant.Stage])
    local zOffset = self:GetPlantZ(plant) 
    DeleteObject(plant.Object)
    plant.Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)   
    SetEntityAsMissionEntity(plant.Object,true)
    FreezeEntityPosition(plant.Object,true)

    self:Sync(plant,false)
  end
end

function MFD:GrowthHandlerFast()
  if not self.Plants then return; end
  if not #self.Plants then return; end
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v then
      self:GrowPlantFast(v,k)
    end
  end
end

function MFD:GrowPlantFast(plant,key)
  if not self.Plants then return; end
  if not self.Plants[key] then return; end
  if self.Plants[key] ~= plant then return; end

  plant.Food = math.max(0.0,plant.Food - self.FoodDrainSpeed)
  plant.Water = math.max(0.0,plant.Water - self.WaterDrainSpeed)

  if plant.Food > 80.0 and plant.Water > 80.0 then
    plant.Quality = math.min(100.0,plant.Quality + (self.QualityGainSpeed * 2))
    plant.Growth = math.min(100.0,plant.Growth + (self.GrowthGainSpeed * 2))
  elseif plant.Food > 50 and plant.Water > 50 then
    plant.Quality = math.min(100.0,plant.Quality + (self.QualityGainSpeed / 2))
    plant.Growth = math.min(100.0,plant.Growth + self.GrowthGainSpeed)  
  elseif plant.Food > 0.5 and plant.Water > 0.5 then
    plant.Growth = math.min(100.0,plant.Growth + (self.GrowthGainSpeed / 2))
  end

  if (plant.Food+20.0) < plant.Quality or (plant.Water+20.0) < plant.Quality then
    plant.Quality = math.max(0.0,plant.Quality - self.QualityDrainSpeed)
  end
end

function MFD:SyncCheck()
  if not self.Plants then return; end
    for k = 1,#self.Plants,1 do
      local v = self.Plants[k]
      if v then 
        self:Sync(v)
        local str = "SyncPlant-Send-"..k
        Citizen.Wait(150)
      end
    end
end

function MFD:EnterInstance(instance)
  self.Instance = instance.data.owner
  print("Enter Instance : MFD")
  if not self.Plants then return; end
  if not #self.Plants then return; end
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v and v.Instance then
      if v.Instance == self.Instance then
        MFD:SpawnInstance(v,k)
      end
    end
  end
end

RegisterCommand('examinar', function()
  MFD:TextHandler()
end, false)

function MFD:LeaveInstance(instance)
  print("Leave Instance : MFD")
  if not self.Plants then return; end
  if not #self.Plants then return; end
  self.Instance = false
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v and v.Instance then
      local plyData = ESX.GetPlayerData()
      FreezeEntityPosition(self.Plants[k].Object,false)
      SetEntityAsMissionEntity(self.Plants[k].Object,false)
      DeleteObject(self.Plants[k].Object)
      --if v.Owner ~= plyData.identifier then
        self.Plants[k] = false
      --end
    end
  end
end

function MFD:SpawnInstance(plant,k)
  if not self.Instance then return; end
  if plant.Instance ~= self.Instance then return; end
  self.Plants = self.Plants or {}
  if self.Plants[k] then
    local hk   = Utils.GetHashKey(self.Objects[plant.Stage])
    local load = Utils.LoadModel(hk,true) 
    local zOffset = self:GetPlantZ(self.Plants[k]) 
    self.Plants[k].Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)            
    FreezeEntityPosition(self.Plants[k].Object,true)
    SetEntityAsMissionEntity(self.Plants[k].Object,true)
  else 
    self.Plants[k] = plant
    local hk   = Utils.GetHashKey(self.Objects[plant.Stage])
    local load = Utils.LoadModel(hk,true)  
    local zOffset = self:GetPlantZ(self.Plants[k])
    self.Plants[k].Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)            
    FreezeEntityPosition(self.Plants[k].Object,true)
    SetEntityAsMissionEntity(self.Plants[k].Object,true)
  end
end

function MFD:SpawnWorld(plant,k)
  if self.Instance or (not plant or plant.Instance) then return; end
  self.Plants = self.Plants or {}
  if self.Plants[k] then
    local hk   = Utils.GetHashKey(self.Objects[plant.Stage])
    local load = Utils.LoadModel(hk,true)  
    local zOffset = self:GetPlantZ(self.Plants[k])
    self.Plants[k].Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)            
    FreezeEntityPosition(self.Plants[k].Object,true)
    SetEntityAsMissionEntity(self.Plants[k].Object,true)
  else 
    self.Plants[k] = plant
    local hk   = Utils.GetHashKey(self.Objects[plant.Stage])
    local load = Utils.LoadModel(hk,true)  
    local zOffset = self:GetPlantZ(self.Plants[k])
    self.Plants[k].Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)            
    FreezeEntityPosition(self.Plants[k].Object,true)
    SetEntityAsMissionEntity(self.Plants[k].Object,true)
  end
end

function MFD:SyncHandler(plant,delete)
  if not plant and not delete then return; end
  local plyPed = PlayerPedId()
  local plyPos = GetEntityCoords(plyPed)

  if delete then
    if self.Plants then
      if #self.Plants then
        for k = 1,#self.Plants,1 do
          local v = self.Plants[k]
          if v and v.Position then
            if (math.floor(v.Position.x) == math.floor(plant.Position.x)) and (math.floor(v.Position.y) == math.floor(plant.Position.y)) then
              DeleteObject(self.Plants[k].Object)
              self.Plants[k] = false
              return
            end
          end
        end
      end
    end
  else
    local dist = Utils:GetVecDist(plyPos,plant.Position)
    if dist < self.SyncDist then
      if self.Plants and #self.Plants and #self.Plants > 0 then
        local didSpawn = false
        for k = 1,#self.Plants,1 do
          if self.Plants[k] then
            local v = self.Plants[k]   
            if v then     
              if v.Position.x == plant.Position.x and v.Position.y == plant.Position.y then
                if ((v.Instance and self.Instance and self.Instance == v.Instance) or (not self.Instance and not v.Instance)) --[[and plant.Owner ~= plyData.identifier]] then
                  local zOffset = self:GetPlantZ(plant)
                  FreezeEntityPosition(self.Plants[k].Object,false)
                  SetEntityAsMissionEntity(self.Plants[k].Object,false)
                  DeleteObject(self.Plants[k].Object)
                  local hk   = Utils.GetHashKey(self.Objects[plant.Stage])
                  self.Plants[k] = plant
                  self.Plants[k].Object = CreateObject(hk, plant.Position.x, plant.Position.y, plant.Position.z + zOffset, false, false, false)      
                  FreezeEntityPosition(self.Plants[k].Object,true)
                  SetEntityAsMissionEntity(self.Plants[k].Object,true)
                  didSpawn = true
                else 
                  didSpawn = true
                end
              end
            end
          end
        end
        if not didSpawn then 
          if self.Instance then
            self:SpawnInstance(plant,#self.Plants+1)
          else
            self:SpawnWorld(plant,#self.Plants+1)
          end
        end
      else
        if self.Instance then
          --if plant.Owner == self.Instance then
            self:SpawnInstance(plant,1)
          --end
        else
          self:SpawnWorld(plant,1)
        end
      end
    end
  end
end

function MFD:Awake(...)
    while not ESX do Citizen.Wait(10); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(10); end
    ESX.TriggerServerCallback('InfinityDopePlant:GetStartData', function(retVal) self.dS = true; self.cS = retVal; end)
    while not self.dS do Citizen.Wait(10); end
    self:Start()
end

function MFD:GetPlantZ(plant)
  if plant.Stage <= 3 then return -1.0
  else return -3.5
  end
end

function MFD:UseItem(item)
  if not self.Plants then return; end
  if not #self.Plants then return; end
  local ped = PlayerPedId()
  local closest,closestDist
  for k = 1,#self.Plants,1 do
    local v = self.Plants[k]
    if v then
      local dist = Utils:GetVecDist(v.Position,GetEntityCoords(ped))
      if not closestDist or dist < closestDist then
        closestDist = dist
        closest = v
      end
    end
  end
  if not closest or not closestDist then return; end
  if closestDist < self.InteractDist then 
    if item.Type == "Water" then
      closest.Water = closest.Water + (item.Quality * 100)
    elseif item.Type == "Food" then
      closest.Food = closest.Food + (item.Quality * 100)
    end
    closest.Quality = closest.Quality + item.Quality
  end

  self:Sync(closest)
  self:TextHandler()
end

function MFD:UseSeed(seed)
  if not seed then return; end
  self.Plants       = self.Plants or {}
  local ply         = PlayerPedId()
  local plyPos      = GetEntityCoords(ply)
  local k           = math.max(1,#self.Plants+1)
  local hk          = Utils.GetHashKey(self.Objects[1])
  local dmin,dmax   = GetModelDimensions(hk)
  local pos         = GetOffsetFromEntityInWorldCoords(ply,0,dmax.y*5,0)
  local npos        = {x=pos.x,y=pos.y,z=plyPos.z}
  local go          = CreateObject(hk,npos.x,npos.y,npos.z - 1.0,false,false,false)  
  local plyData     = ESX.GetPlayerData()
  self.Plants[k]             = seed
  self.Plants[k]["Object"]   = go
  self.Plants[k]["Position"] = npos
  self.Plants[k]["Instance"] = (self.Instance or false)
  self.Plants[k]["Owner"]    = (plyData.identifier)
  self:Sync(self.Plants[k])

  Utils.ReleaseModel(hk)
  self:TextHandler()
end

function MFD:Sync(plant,delete)
  TriggerServerEvent('InfinityDopePlant:SyncPlant',plant,delete)
end

function MFD:UseBag(canUse, msg)
  Citizen.CreateThread(function(...)
    local plyPed = PlayerPedId()
    if canUse then TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_PARKING_METER", 0, true); end
    ESX.ShowNotification("Erva", msg, 2000, "success") 
    Wait(5000)
    ClearPedTasksImmediately(plyPed)
  end)
end

---------------------
--#################--
--##   3D TEXT   ##--
--#################--
---------------------
local color = { r = 220, g = 220, b = 220, alpha = 255 } -- Color of the text 
local font = 4 -- Font of the text

function MFD:DrawText3D(x,y,z, text)
  local onScreen,_x,_y = World3dToScreen2d(x,y,z)
  local px,py,pz = table.unpack(GetGameplayCamCoord())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
  local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*100
  if onScreen then
    SetTextColour(color.r, color.g, color.b, color.alpha)
    SetTextScale(0.3, 0.3)
    SetTextFont(font)
    SetTextProportional(1)
    SetTextCentre(true)
    --if dropShadow then SetTextDropshadow(10, 100, 100, 100, 255); end
    SetTextOutline()
    BeginTextCommandWidth("STRING")
    --AddTextComponentString(text)
    local height = GetTextScaleHeight(0.45*scale, font)
    local width = EndTextCommandGetWidth(font)

    SetTextEntry("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(_x, _y)

    --if background.enable then DrawRect(_x, _y+scale/73, width, height, background.color.r, background.color.g, background.color.b , background.color.alpha); end
  end
end

AddEventHandler('instance:onEnter', function(instance) while not MFD.iR do Citizen.Wait(10); end MFD:EnterInstance(instance); end)
AddEventHandler('instance:onLeave', function(instance) if MFD.iR then MFD:LeaveInstance(instance); else MFD.Instance = false; end; end)
AddEventHandler('InfinityDopePlant:UseSeed', function(seed) if MFD.iR then MFD:UseSeed(seed); end; end)
AddEventHandler('InfinityDopePlant:UseItem', function(item) if MFD.iR then MFD:UseItem(item); end; end)
AddEventHandler('InfinityDopePlant:SyncPlant', function(plant,del) if MFD.iR then MFD:SyncHandler(plant,del); end; end)
AddEventHandler('InfinityDopePlant:UseBag', function(canUse,msg) MFD:UseBag(canUse,msg); end)

Citizen.CreateThread(function(...) MFD:Awake(...); end)