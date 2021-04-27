-- constants
local ModFunctions = {}
local Mod = RegisterMod("Monster Hunteri Rebirth", 1);

local Enemies = {
    Mosquito = Isaac.GetEntityVariantByName("Mosquito")
}

-- state
local debugText = 'default'
local boneKnightSpawned = false

function ModFunctions:Render()
    Isaac.RenderText(debugText, 150, 150, 255, 0, 0, 50);
end

function ModFunctions:EnemyMosquito(entityNPC)
    local npcData = entityNPC:GetData()

    if not boneKnightSpawned then
        debugText = 'the enemy should now be spawned'
        Isaac.Spawn(EntityType.ENTITY_MAW, Enemies.Mosquito, 0, entityNPC.Position, Vector(0,0), entityNPC.SpawnerEntity)
        boneKnightSpawned = true
    end

    -- if (entityNPC:IsActiveEnemy()) then
    --     debugText = entityNPC.StateFrame
    -- end
end

Mod:AddCallback(ModCallbacks.MC_POST_RENDER, ModFunctions.Render);

Mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, ModFunctions.EnemyMosquito); -- TODO: not sure which EntityType to pick