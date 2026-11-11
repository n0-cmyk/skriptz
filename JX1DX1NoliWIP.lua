
function module()
	print("JX1DX1 Noli over redroomcurse wip")
	local Folder = game:GetService("ReplicatedStorage").Assets.Killers.Noli
	local plrs = game.Players
	local localthemes = game.SoundService:WaitForChild("LocalThemes",10) or workspace:WaitForChild("Themes",10)
	print(localthemes.Parent.Name)
	local config = require(Folder.Config)
	local config2 = Folder.Config
	local killerfolder = workspace.Players.Killers
	local map = workspace.Map.Ingame:FindFirstChild("Map") or workspace:FindFirstChild("SuperMap")
	local VoicelineSeting = game.SoundService:FindFirstChild("Voicelines")
	local environment = workspace.Map.Ingame
	local tracked = {}
	local currStars = {}
	local insert = game:GetService("InsertService")
	local starpos = {}
	local function import(link, name, tope)
		local path = "JX1DX1/" .. name
		local asset
		if not isfolder("JX1DX1") then
			makefolder("JX1DX1")
		end
		if not isfile(path) then
			writefile(path, game:HttpGet(link))
		end
		asset = getcustomasset(path)
		if tope == "Importinstance" then
			print("model load")
			task.delay(5, function()
				delfile(path)
			end)
			return insert:LoadLocalAsset(asset)
		end
		return asset
	end
	local function D(...)
		for _, v in ipairs({...}) do
			v:Destroy() 
		end
	end
	local Model = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/JX1DX1Noli-remake.rbxm", "JX1DX1ModelNew.rbxm", "Importinstance")
	Model.Humanoid.EvaluateStateMachine = false
	local themeRepce
	for _, thing in pairs(config.Sounds.TerrorRadiusThemes) do
					if thing.Chase then
						print(thing.ID)
						themeRepce = thing.ID
					end
				end
	local SoundRevovery = {
		Ambience = {og = config.Sounds.Ambience, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Breathing.ogg", "Breathing.ogg")},
		Footsteps = {og = config.Sounds.Footsteps, replac = {
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/footsteps1.mp3", "Footstep1.ogg"),
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/footsteps2.mp3", "Footstep2.ogg"),
		},
		},
		Swing = {og = config.Sounds.Swing, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/M1.ogg", "M1.ogg")},
		SwingHit = {og = config.Sounds.Hit, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/M1Hit.ogg", "M1Hit.ogg")},
		NovaThrow = {og = config.Sounds.Nova, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Nova.ogg", "Nova.ogg")},
		NovaDeton = {og = config.Sounds.Explosion, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/NovaDetonate.ogg", "Explosion.ogg")},
		NovaRespawn = {og = config.Sounds.VoidstarEnable, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/NovaRespawn.ogg", "NovaEnable.ogg")},
		Kill = {og = config.Sounds.Execution, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Kill.ogg", "Kill.ogg")},
		RushWindup = {og = config.Sounds.VoidRushLoop, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushStart.mp3", "RushStart.ogg")},
		RushRush = {og = config.Sounds.VoidRushDashLoop, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRush.ogg", "Rush.ogg")},
		RushReboundWind1 = {og = config.Sounds.VoidRushWindow.Survivors, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidrushRebounding2.ogg", "Swipe2.ogg")},
		RushReboundWind2 = {og = config.Sounds.VoidRushWindow.Killers, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidrushRebounding.ogg", "Swipe1.ogg")},
		Weakhit1 = {og = config.Sounds.VoidRushWeakHit1.Killers, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/RushHit1.ogg", "WeakHit1.ogg")},
		Weakhit1surv = {og = config.Sounds.VoidRushWeakHit1.Survivors, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/RushHit1.ogg", "WeakHit1.ogg")},
		Slam = {og = config.Sounds.VoidRushCutscene, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Slam.ogg", "Slam.ogg")},
		RushCancel = {og = config.Sounds.VoidRushCancel, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushCancel.ogg", "Cancel.ogg")},
		RushTimeout = {og = config.Sounds.VoidRushMissTimeout, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushCancel.ogg", "Cancel.ogg")},
		Crash = {og = config.Sounds.VoidRushMissCrashed, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushCrash.ogg", "Crash.ogg")},
		ObservantUse = {og = config.Sounds.ObservantOn, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantUse.ogg", "ObservantUse.ogg")},
		ObservantTP = {og = config.Sounds.ObservantTeleportChannel, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantTP.ogg", "ObservantOn.ogg")},
		ObservantPing = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantPingGenerator.ogg", "Ping.ogg"),
		ObservantLoop = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantLoopGenerator.ogg", "LoopObserv.ogg"),
		ObservantCancel = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantCancelGenerator.ogg", "CancelObserv.ogg"),
		ObservantWarn = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantWarningGenerator.ogg", "WarningObserv.ogg"),
		ChaseTheme = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/JX1DX1Chase.ogg", "Chase.ogg"),
	}

	local conns = {}
	local function add(kid)
		local humroot = kid:WaitForChild("HumanoidRootPart")
		local star = kid:WaitForChild("Voidstar")
		star.Cursor:FindFirstChildOfClass("ImageLabel").Visible = false
		if not table.find(tracked, kid) then
			table.insert(tracked, kid)
		end
		conns[kid] = {}
		kid.Noli:Destroy()
		--kid.Noli:Destroy()
		print("add")
		local rig = Model:Clone()
		rig.Name = "Noli"
		rig.Parent = kid

		--rig.Ey
		kid:WaitForChild("VoidstarCrown").Transparency = 1
		local currStar = rig.Voidstar
		currStars[kid] = currStar
		local c = math.random(1,5)
		if c == 1 then
			currStar:SetAttribute("Type", "Apple")
		elseif c == 2 then
			currStar:SetAttribute("Type", "Tie")
			currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=28463033"
			currStar.Mesh.TextureId = ""
			currStar.Mesh.Scale = Vector3.new(1.96, 1.68, 1.96)
			currStar.BrickColor = BrickColor.new("Really red")
			currStar.Size = Vector3.new(1.4,1.4,1.4)
		elseif c == 3 then
			currStar:SetAttribute("Type", "Horns")
			currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=15934744"
			currStar.Mesh.TextureId = "http://www.roblox.com/asset/?id=15934762"
			currStar.Mesh.Scale = Vector3.new(1.632, 1.632, 1.632)
			currStar.Size = Vector3.new(1.6,1.6,1.6)
		elseif c == 4 then
			currStar:SetAttribute("Type", "Tinpot")
			currStar.BrickColor = BrickColor.new("Cool yellow")
			currStar.Size = Vector3.new(1.2, 1.2, 1.2)
			currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=6837450"
			currStar.Mesh.TextureId = "http://www.roblox.com/asset/?id=6837452"
			currStar.Mesh.Scale = Vector3.new(1.333, 1.333, 1.333)
		else
			currStar:SetAttribute("Type", nil)
			currStar.Transparency = 1
			kid["Right Arm"].TentacleBase.Attachment.ParticleEmitter.Enabled = true
			for _, particle in (currStar.Main:GetChildren()) do
				if particle:IsA("ParticleEmitter") and particle.Enabled then
					particle.Enabled = false
				end
			end
		end
		for _, part in (rig:GetDescendants()) do
			if part:IsA("Motor6D") then
				if kid:FindFirstChild(part.Part1.Name) then
					part.Enabled = false
					part:Destroy()
				end
			elseif part:IsA("BasePart") then
				part.Massless = true
				part.CanCollide = false
				if kid:FindFirstChild(part.Name) then
					local zero = kid[part.Name]
					local weld = Instance.new("Weld", zero)
					if part.Name == "VoidstarCrown" then
						weld.C0 = weld.C0 * CFrame.new(-0.25, 0.35, -0.25)
					end
					weld.Part0 = part
					weld.Part1 = zero

				end
			end
		end
		for _, sound in (humroot:GetChildren()) do
			if sound:IsA("Sound") and sound.Playing then
				for _, thing in pairs(SoundRevovery) do
					if type(thing.og) == "table" then
						for _, id in ipairs(thing.og) do
							if sound.SoundId == id then
								sound.SoundId = thing.replac[math.random(1, #thing.replac)]
							end
						end
					else
						if sound.SoundId == thing.og then
							sound.SoundId = thing.replac
						end
					end
				end
			end
		end
		local A = humroot.ChildAdded:Connect(function(sound)
			if sound:IsA("Sound") then
				for _, thing in pairs(SoundRevovery) do
					if type(thing.og) == "table" then
						for _, id in ipairs(thing.og) do
							if sound.SoundId == id then
								sound.SoundId = thing.replac[math.random(1, #thing.replac)]
							end
						end
					else
						if sound.SoundId == thing.og then
							sound.SoundId = thing.replac
							task.wait(0.06)
							if humroot:FindFirstChild(config.Sounds.VoidRushStart.Survivors) then
								humroot[config.Sounds.VoidRushStart.Survivors].Volume = 0
							end
						end
					end
				end
			end
		end)
		local B = star.Cursor:GetPropertyChangedSignal("Enabled"):Connect(function()
			if star.Cursor.Enabled == false then
				currStar.Transparency = 1
				for _, particle in (currStar.Main:GetChildren()) do
					if particle:IsA("ParticleEmitter") and particle.Enabled then
						particle.Enabled = false
					end
				end
			end
			if star.Cursor.Enabled == true then
				local c = math.random(1,4)
				if c == 1 then
					currStar:SetAttribute("Type", "Apple")
					currStar.BrickColor = BrickColor.new("Medium stone grey")
					currStar.Size = Vector3.new(1, 1.2, 1)
					currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=16190555"
					currStar.Mesh.Scale = Vector3.new(2.5,2.5,2.5)
					currStar.Mesh.TextureId = "http://www.roblox.com/asset/?id=16190555"
				elseif c == 2 then
					currStar:SetAttribute("Type", "Tie")
					currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=28463033"
					currStar.Mesh.TextureId = ""
					currStar.Mesh.Scale = Vector3.new(1.96, 1.68, 1.96)
					currStar.BrickColor = BrickColor.new("Really red")
					currStar.Size = Vector3.new(1.4,1.4,1.4)
				elseif c == 3 then
					currStar.BrickColor = BrickColor.new("Medium stone grey")
					currStar:SetAttribute("Type", "Horns")
					currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=15934744"
					currStar.Mesh.TextureId = "http://www.roblox.com/asset/?id=15934762"
					currStar.Mesh.Scale = Vector3.new(1.632, 1.632, 1.632)
					currStar.Size = Vector3.new(1.6,1.6,1.6)
				elseif c == 4 then
					currStar:SetAttribute("Type", "Tinpot")
					currStar.BrickColor = BrickColor.new("Cool yellow")
					currStar.Size = Vector3.new(1.2, 1.2, 1.2)
					currStar.Mesh.MeshId = "http://www.roblox.com/asset/?id=6837450"
					currStar.Mesh.TextureId = "http://www.roblox.com/asset/?id=6837452"
					currStar.Mesh.Scale = Vector3.new(1.333, 1.333, 1.333)
				end
				rig.Voidstar.Transparency = 0
				for _, particle in (currStar.Main:GetChildren()) do
					if particle:IsA("ParticleEmitter") then
						particle.Enabled = true
					end
				end
			end
		end)
		local C = star.ChildAdded:Connect(function(sound)
			if sound:IsA("Sound") then
				for _, thing in pairs(SoundRevovery) do
					if type(thing.og) == "table" then
						for _, id in ipairs(thing.og) do
							if sound.SoundId == id then
								sound.SoundId = thing.replac[math.random(1, #thing.replac)]
							end
						end
					else
						if sound.SoundId == thing.og then
							sound.SoundId = thing.replac
						end
					end
				end
			end
		end)
					local char = kid
					if plrs.LocalPlayer.Character == char then
						print("Player is killer, chase theme will be replaced")
						for _, theme in (localthemes:GetChildren()) do
							if theme.SoundId == themeRepce then
								theme.SoundId = SoundRevovery.ChaseTheme
								end
							end
						local chaselistener = localthemes.ChildAdded:Connect(function(Theme)
							print("added")
							task.wait(0.03)
							print(Theme.SoundId)
							if Theme.SoundId == themeRepce then
								Theme.SoundId = SoundRevovery.ChaseTheme
							end
						end)
						table.insert(conns[kid], chaselistener)
					end 
		table.insert(conns[kid], A)
		table.insert(conns[kid], B)
		table.insert(conns[kid], C)
	end
	environment.ChildAdded:Connect(function(v)
		if v:FindFirstChild("Cursor") then
			local ppl = killerfolder:GetChildren()
			local torso
			local dist = math.huge
			local temp
			local person
			local human
			for i = 1, #ppl do
				person = ppl[i]
				if person:FindFirstChild("HumanoidRootPart") and person.Name == "Noli" then
					if person.Humanoid.Health > 0 and person:GetAttribute("SkinName") == "RedRoomNoli" then
						temp = person:FindFirstChild("HumanoidRootPart")
						if (temp.Position - v.Position).Magnitude < dist then
							torso = temp.Parent
							dist = (temp.Position - v.Position).Magnitude
						end
					end
				end
			end
			local star = currStars[torso]
			if star then
				starpos[v] = {}				
				task.spawn(function()
					while v:IsDescendantOf(environment) and task.wait(0.225) do
							table.insert(starpos[v], v.Position)
					end
					task.wait(0.8)
					starpos[v] = nil
				end)
				v.Cursor:FindFirstChildOfClass("ImageLabel").Visible = false
				local clone = star:Clone()
				clone.Parent = v
				clone.Transparency = 0
				clone.Name = "JX1DX1star"
				local weld = Instance.new("Weld", v)
				weld.Part0 = clone
				weld.Part1 = v
			end
		end
	end)
	killerfolder.ChildAdded:Connect(function(noli)
		if noli.Name == "Noli" and noli:GetAttribute("SkinName") then
			if noli:GetAttribute("SkinName") == "RedRoomNoli" then
				add(noli)
			end
		end
	end)

	killerfolder.ChildRemoved:Connect(function(noli)
		if table.find(tracked, noli) then
			table.remove(tracked, table.find(tracked, noli))
			print("remove dd")
			if conns[noli] then
				print("clered cons for noli person")
				for _, con in ipairs(conns[noli]) do con:Disconnect() end
			end
			currStars[noli] = nil
		end
	end)

	for _, devo in (killerfolder:GetChildren()) do
		if devo.Name == "Noli" and devo:GetAttribute("SkinName") then
			if devo:GetAttribute("SkinName") == "RedRoomNoli" then
				add(devo)
			end
		end
	end
	local Explposionconn = workspace.Terrain.ChildAdded:Connect(function(child)
		if child.Name == "Explosion" then
			local magnum = math.huge
			local pposs
			for _, pos in pairs(starpos) do
				for _, diststar in ipairs(pos) do
					if (diststar - child.Position).Magnitude < magnum then
						magnum = (diststar - child.Position).Magnitude
						pposs = diststar
					end
				end
			end
			if pposs and (pposs - child.CFrame.Position).Magnitude < 20 then
				print("explonearJX1DX1")
				for _, sound in ipairs(child:GetChildren()) do 
					if sound:IsA("Sound") then
						for _, thing in pairs(SoundRevovery) do
							if type(thing.og) == "table" then
								for _, id in ipairs(thing.og) do
									if sound.SoundId == id then
										sound.SoundId = thing.replac[math.random(1, #thing.replac)]
									end
								end
							else
								if sound.SoundId == thing.og then
									sound.SoundId = thing.replac
								end
							end
						end
					end
				end
			end

		end
	end)
	local genconn = game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(gui)
		if gui.Name == "GeneratorTeleportButton" then
			print("hello")
			local JIcon = Instance.new("ImageButton")
		end
	end)

	
	for _, generator in (map:GetChildren()) do
		if generator.Name == "Generator" then
			generator.ChildAdded:Connect(function(WarnSound)
				WarnSound.Changed:Once(function()
					task.wait(0.06)
					for _, sond in (WarnSound:GetChildren()) do
						if sond:IsA"Sound" then
							if sond.SoundId == config.Sounds.ObservantGeneratorEnd then
								sond.SoundId = SoundRevovery.ObservantCancel
							elseif sond.SoundId == config.Sounds.ObservantGeneratorWarning then
								sond.SoundId = SoundRevovery.ObservantWarn
							end
						end
					end
				end)
				task.wait(0.06)
				for _, sond in (WarnSound:GetChildren()) do

					if sond:IsA"Sound" then
						if sond.SoundId == config.Sounds.ObservantGeneratorStart then
							sond.SoundId = SoundRevovery.ObservantPing
						elseif sond.SoundId == config.Sounds.ObservantGeneratorLoop then
							sond.SoundId = SoundRevovery.ObservantLoop
						elseif sond.SoundId == config.Sounds.ObservantGeneratorWarning then
							sond.SoundId = SoundRevovery.ObservantWarn
						end
					end
				end
			end)
		end
	end 
	
end
module()
