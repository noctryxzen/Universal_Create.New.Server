local GetService = setmetatable({}, {
	__index = function(s, n)
		s[n] = (cloneref and clonefunction(cloneref) or function(x) return x end)(clonefunction(game.GetService)(game, n))
		return s[n]
	end
})

if queue_on_teleport then
	queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Universal_Create.New.Server/refs/heads/main/Creator.luau"))()]])
else
	GetService.StarterGui:SetCore("SendNotification", {Title = "queue_on_teleport not supported", Text = "Please put the loadstring to your autoexec!", Duration = 5})
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/noctryxzen/Block.Run/refs/heads/main/Module.luau"))()

for i, v in next, GetService.Players:GetPlayers() do
	if v ~= GetService.Players.LocalPlayer then
		if getgenv().exclude_friends and GetService.Players.LocalPlayer:IsFriendsWith(v.UserId) then continue end
		if Block.IsBlocked(v) then
			task.delay(.7, function()
				Block.Run(v)
				GetService.TeleportService:Teleport(game.PlaceId)
			end)
		end
	end
end
GetService.Players.PlayerAdded:Connect(function(v)
	if getgenv().exclude_friends and GetService.Players.LocalPlayer:IsFriendsWith(v.UserId) then return end
	if Block.IsBlocked(v) then
		task.delay(.7, function()
			Block.Run(v)
			GetService.TeleportService:Teleport(game.PlaceId)
		end)
	end
end)
