local mhMod = RegisterMod("Monster Hunteri Rebirth", 1);

function mhMod:render()
    Isaac.RenderText('Monster Hunter Rebirth', 150, 150, 255, 0, 0, 50);
end

mhMod:AddCallback(ModCallbacks.MC_POST_RENDER, mhMod.render);