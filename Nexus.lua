task.spawn(function()
    _G.Api = "http://localhost:8899"
    loadstring(game:HttpGet("https://api.genhubs.com/v2/loadscript_log/?script_key=Vcfm0uDBvASKzIfoexHgsMXYLvdEi3Vz", true))()
end)

task.spawn(function()
    local currentPosition = nil;
    local currentLevel = 0;
    local bugCheck = tick();
    
    while task.wait(1) do
        pcall(function()
            if game.Players.LocalPlayer.Data.Level.Value >= 2000 then
                bugCheck = tick()
            end
                    
            if (currentPosition ~= game.Players.LocalPlayer.Character.HumanoidRootPart.Position) then
                currentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
            end

            if (currentLevel ~= game.Players.LocalPlayer.Data.Level.Value) then
                currentLevel = game.Players.LocalPlayer.Data.Level.Value
                bugCheck = tick()
            end

            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - currentPosition.Position).Magnitude > 300 then
                bugCheck = tick()
            end
        end)

        pcall(function()
            if tick() - bugCheck > 300 then
                game.Players.LocalPlayer:Kick("[FixedBug] Porlnwza007 seller no.1")
                bugCheck = tick()
            end
        end)
    end
end)
