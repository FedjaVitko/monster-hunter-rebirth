-- constants
local ModFunctions = {}
local Mod = RegisterMod("Monster Hunter Rebirth", 1);

local Enemies = {
    Mosquito = Isaac.GetEntityVariantByName("Mosquito")
}

-- state
local debugText = 'default'
local enemySpawned = false

function ModFunctions:Render()
    Isaac.RenderText(debugText, 150, 150, 255, 0, 0, 50);
end
Mod:AddCallback(ModCallbacks.MC_POST_RENDER, ModFunctions.Render);

function ModFunctions:EnemyMosquito(npc)
    local npcData = npc:GetData()

    if not enemySpawned then
        local enemy = Isaac.Spawn(888, 1, 0, npc.Position, Vector(4, 0):Rotated(math.random(360)), npc):ToNPC()
        enemySpawned = true
    end

    -- if (entityNPC:IsActiveEnemy()) then
    --     debugText = entityNPC.StateFrame
    -- end
end
Mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, ModFunctions.EnemyMosquito); -- TODO: not sure which EntityType to pick

function ModFunctions.OnNewRoom()
    enemySpawned = false;
end
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, ModFunctions.OnNewRoom); -- TODO: not sure which EntityType to pick