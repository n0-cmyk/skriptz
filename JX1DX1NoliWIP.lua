
function module()
	print("JX1DX1 Noli over redroomcurse wip")
	local Folder = game:GetService("ReplicatedStorage").Assets.Killers.Noli
	local plrs = game.Players
	local config2 = Folder.Config
	local killerfolder = workspace.Players.Killers
	local map = workspace.Map.Ingame:FindFirstChild("Map") or workspace:FindFirstChild("SuperMap")
	local localthemes
	if map.Name == "Map" then
		print("localtheme waiting")
		localthemes = game.SoundService:WaitForChild("LocalThemes")
	else
		print("waiting for Themes")
		localthemes = workspace:WaitForChild("Themes")
	end
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
	local SoundRevovery = {
		Ambience = {Ids = {"rbxassetid://124740971952870", "rbxassetid://137049749546086"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Breathing.ogg", "Breathing.ogg")
		},
		Footsteps = {Ids = {"rbxassetid://108513737387821", "rbxassetid://131534727129688", "rbxassetid://125697729216558", "rbxassetid://73404827157016"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/footsteps1.mp3", "Footstep1.ogg"),
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/footsteps2.mp3", "Footstep2.ogg"),
		},
		Swing = {Ids = {"rbxassetid://128582078327464", "rbxassetid://128582078327464"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/M1.ogg", "M1.ogg")},
		SwingHit = {
			Ids = {"rbxassetid://70669813081037", "rbxassetid://112720019526990"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/M1Hit.ogg", "M1Hit.ogg")},
		NovaThrow = {Ids = {"rbxassetid://128545807633997", "rbxassetid://128545807633997"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Nova.ogg", "Nova.ogg")},
		NovaDeton = {Ids = {"rbxassetid://79864918578301", "rbxassetid://129348391963127"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/NovaDetonate.ogg", "Explosion.ogg")},
		NovaRespawn = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/NovaRespawn.ogg", "NovaEnable.ogg"),
		Kill = {Ids = {"rbxassetid://79270016323899", "rbxassetid://78344423946580"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Kill.ogg", "Kill.ogg")},
		RushWindup = {Ids = {"rbxassetid://137415646881196", "rbxassetid://117379573546526"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushStart.mp3", "RushStart.ogg")},
		RushRush = {Ids = {"rbxassetid://71729812996802", "rbxassetid://71729812996802"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRush.ogg", "Rush.ogg")},
		RushReboundWind2 = {Ids = {"rbxassetid://123051542178150", "rbxassetid://122608409755938"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidrushRebounding2.ogg", "Swipe2.ogg")},
		RushReboundWind1 = {Ids = {"rbxassetid://101456681309426", "rbxassetid://134758515014817"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidrushRebounding.ogg", "Swipe1.ogg")},
		--Weakhit1 = {og = config.Sounds.VoidRushWeakHit1.Killers, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/RushHit1.ogg", "WeakHit1.ogg")},
		--Weakhit1surv = {og = config.Sounds.VoidRushWeakHit1.Survivors, replac = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/RushHit1.ogg", "WeakHit1.ogg")},
		Slam = {Ids = {"rbxassetid://108778157992447", "rbxassetid://108778157992447"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/Slam.ogg", "Slam.ogg")},
		RushCancel = {Ids = {"rbxassetid://131300462755491", "rbxassetid://74143111617922", "rbxassetid://105484443350662", "rbxassetid://74143111617922"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushCancel.ogg", "Cancel.ogg")},
		Crash = {Ids = {"rbxassetid://77652597584455", "rbxassetid://103663758796757"}, 
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/VoidRushCrash.ogg", "Crash.ogg")},
		ObservantUse = {Ids = {"rbxassetid://78197771301580", "rbxassetid://115250466712823"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantUse.ogg", "ObservantUse.ogg")},
		ObservantTP = {Ids = {"rbxassetid://137564996003608", "rbxassetid://85416883316015"},
			import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/JX1DX1New/ObservantTP.ogg", "ObservantTP.ogg")},
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
			if sound:IsA("Sound") and sound.Playing == true then
				for _, tabl in pairs(SoundRevovery) do
					if type(tabl) == "table" and table.find(tabl.Ids, sound.SoundId) then
						if #tabl >= 1 then
							sound.SoundId = tabl[math.random(1, #tabl)]
						end
						break
					end
				end

			end
		end
		local A = humroot.ChildAdded:Connect(function(sound)
			if sound:IsA("Sound") and sound.Playing == true then
				for _, tabl in pairs(SoundRevovery) do
					if type(tabl) == "table" and table.find(tabl.Ids, sound.SoundId) then
						if #tabl >= 1 then
							sound.SoundId = tabl[math.random(1, #tabl)]
						end
						break
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
				if sound.SoundId == "rbxassetid://79252746303454" or sound.SoundId == "rbxassetid://93854019010858" then
					sound.SoundId = SoundRevovery.NovaRespawn
				end
			end
		end)
		local char = kid
		if plrs.LocalPlayer.Character == char then
			print("Player is killer, chase theme will be replaced")
			for _, theme in (localthemes:GetChildren()) do
				if theme.SoundId == "rbxassetid://114751819376426" or theme.SoundId == "rbxassetid://124371357168863" then
					theme.SoundId = SoundRevovery.ChaseTheme
				end
			end
			local chaselistener = localthemes.ChildAdded:Connect(function(Theme)
				if Theme.SoundId == "rbxassetid://114751819376426" or Theme.SoundId == "rbxassetid://124371357168863" then
					Theme.SoundId = SoundRevovery.ChaseTheme
				end
			end)
			table.insert(conns[kid], chaselistener)
		end 
		for _, generator in (map:GetChildren()) do
			if generator.Name == "Generator" then
				local D = generator.ChildAdded:Connect(function(WarnSound)
					if string.find(WarnSound.Name, kid:GetAttribute("Username")) then
					WarnSound.Changed:Once(function()
						task.wait(0.06)
						for _, sond in (WarnSound:GetChildren()) do
							if sond:IsA"Sound" then
								if sond.SoundId == "rbxassetid://106145041472451" or sond.SoundId == "rbxassetid://130010470361107" then
									sond.SoundId = SoundRevovery.ObservantCancel
								elseif sond.SoundId == "rbxassetid://127394174003526" or sond.SoundId == "rbxassetid://85416883316015" then
									sond.SoundId = SoundRevovery.ObservantWarn
								end
							end
						end
					end)
					task.wait(0.06)
					for _, sond in (WarnSound:GetChildren()) do

						if sond:IsA"Sound" then
							if sond.SoundId == "rbxassetid://7112391013" then
								sond.SoundId = SoundRevovery.ObservantPing
							elseif sond.SoundId == "rbxassetid://99769633154277" or sond.SoundId == "rbxassetid://126044235952493" then
								sond.SoundId = SoundRevovery.ObservantLoop
							elseif sond.SoundId == "rbxassetid://127394174003526" or sond.SoundId == "rbxassetid://85416883316015" then
								sond.SoundId = SoundRevovery.ObservantWarn
							end
						end
					end
					end
				end)
				table.insert(conns[kid], D)
			end
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
					while v:IsDescendantOf(environment) and task.wait(0.2) do
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
	workspace.Terrain.ChildAdded:Connect(function(child)
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
			if pposs and (pposs - child.CFrame.Position).Magnitude < 10 then
				print("explonearJX1DX1")
				if child:FindFirstChildOfClass("Sound") then
					child:FindFirstChildOfClass("Sound").SoundId = SoundRevovery.NovaDeton[math.random(1, #SoundRevovery.NovaDeton)]
				end
			end

		end
	end)
	game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(gui)
		if gui.Name == "GeneratorTeleportButton" then
			print("gui logic gone fishin'")
			local JIcon = Instance.new("ImageButton")
		end
	end)


	
end
module()
