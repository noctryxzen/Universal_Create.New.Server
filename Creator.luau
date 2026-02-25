local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = (cloneref and clonefunction(cloneref) or function(x) return x end)(clonefunction(game.GetService)(game, n))
		return s[n]
	end
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Block.Run/refs/heads/main/Module.luau"))()

for i, v in next, GetService.Players:GetPlayers() do
	if v ~= GetService.Players.LocalPlayer then
		if Block.IsBlocked(v) then
			GetService.TeleportService:Teleport(game.PlaceId)
		else
			task.delay(.2, function()
				Block.Run(v)
				GetService.TeleportService:Teleport(game.PlaceId)
			end)
		end
		break
	end
end
