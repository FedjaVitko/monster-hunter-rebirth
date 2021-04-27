local ModFunctions = {}
local Mod = RegisterMod("Monster Hunteri Rebirth", 1);

local debugText = 'default'

local Enemies = {
    Mosquito = Isaac.GetEntityVariantByName("Mosquito")
}

function ModFunctions:render()
    Isaac.RenderText(debugText, 150, 150, 255, 0, 0, 50);
end

function ModFunctions:EnemyMosquito(entityNPC)
    local npcData = entityNPC:GetData()

    Isaac.Spawn(EntityType.ENTITY_STONEY, Enemies.Mosquito, 0, entityNPC.Position, Vector(0,0), entityNPC.SpawnerEntity)

    -- if (entityNPC:IsActiveEnemy()) then
    --     debugText = entityNPC.StateFrame
    -- end
end

Mod:AddCallback(ModCallbacks.MC_POST_RENDER, ModFunctions.render);

Mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, ModFunctions.EnemyMosquito); -- TODO: not sure which EntityType to pick