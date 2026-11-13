function module()
local killerfolder = workspace.Players.Killers
local Folder = game:GetService("ReplicatedStorage").Assets.Skins.Killers.c00lkidd.ColorAndElectricityC00l
local map = workspace.Map.Ingame:FindFirstChild("Map") or workspace:FindFirstChild("SuperMap")
local VoicelineSeting = game.SoundService:FindFirstChild("Voicelines")
local tracked = {}
local config = require(Folder.Config)
local config2 = Folder.Config
local insert = game:GetService("InsertService")
local render = "rbxassetid://120025547777397"
config.DisplayName = "FF9CAE"
config.RenderImage = render

local function import(link, name, parent)
	local path = "FF9CAE/" .. name
	  local file
    local asset
    if not isfolder("FF9CAE") then
    	makefolder("FF9CAE")
    end
    if not isfile(path) then
    	writefile(path, game:HttpGet(link))
    end
    asset = getcustomasset(path)
    if parent then
    	local inserted = insert:LoadLocalAsset(asset)
      inserted.Parent = parent
      print("parented to"..parent.Name)
      inserted:SetAttribute("Imported", true)
      return inserted
    end
    return insert:LoadLocalAsset(asset)
end

local function D(...)
  for _, v in ipairs({...}) do
    v:Destroy() 
  end
end

local Model = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/Colorsc00l/FF9CAEc00lkidd.rbxm", "FF9CAEc00lkidd.rbxm")
--D(config2.Minions.PurpleGuy,config2.Minions.RedGuy, config2.Minions.GreenGuy, config2.Minions.BlueGuy)

Model.Humanoid.EvaluateStateMachine = false

local Minions = {
  Blue = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/Colorsc00l/BlueGurl.rbxm", "BlueGurl.rbxm"),
  Green = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/Colorsc00l/GreenGui.rbxm", "GreenGuy.rbxm"),
  Red = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/Colorsc00l/RedGuy.rbxm", "RedGuy.rbxm"),
  Purple = import("https://github.com/n0-cmyk/Stuffs/raw/refs/heads/main/Colorsc00l/PurpleGurl.rbxm", "PurpleGurl.rbxm")
}
  task.delay(5, function()
  	if isfolder("FF9CAE") then
      delfolder("FF9CAE")
      end
    end)

local conns = {}
print("updated Colors and electricity C00lkidd over old c&e c00lkidd")

local function add(kid)
	local humroot = kid:WaitForChild("HumanoidRootPart")
	if not table.find(tracked, kid) then
		table.insert(tracked, kid)
	end
	conns[kid] = {}
  print("added "..kid.Name)
  local rig = Model:Clone()
  rig.Parent = kid
  rig.Name = "coolkiddrblx"
  
  --rig.Ey
  rig.Head.Eyes.C0 = rig.Head.Eyes.C0 * CFrame.new(0,-0.240,0)
  kid.coolkiddrblx:Destroy()
    for _, part in (rig:GetDescendants()) do
    	if part:IsA("Motor6D") then
    		if kid:FindFirstChild(part.Part1.Name) then
    			part.Enabled = false
				part:Destroy()
    		end
			elseif part:IsA("BasePart") then
				part.Massless, part.CanCollide = true, false
				if kid:FindFirstChild(part.Name) then
					local zero = kid[part.Name]
					local weld = Instance.new("Weld", zero)
					if zero.Name == "Head" then
						weld.C0 = weld.C0 * CFrame.new(0, -0.2, 0)
					end
					weld.Part0 = part
					weld.Part1 = zero

				end
    	end
    end
end

killerfolder.ChildAdded:Connect(function(kid)
	if kid.Name == "c00lkidd" and kid:GetAttribute("SkinName") then
		if kid:GetAttribute("SkinName") == "ColorAndElectricityC00l" then
			add(kid)
		end
	end
end)

killerfolder.ChildRemoved:Connect(function(kid)
	if table.find(tracked, kid) then
		table.remove(tracked, table.find(tracked, kid))
		print("remove dd")
		if conns[kid] then
			print("clered cons for c00lkidd person")
			for _, con in ipairs(conns[kid]) do con:Disconnect() end
		end
	end
end)

for _, devo in (killerfolder:GetChildren()) do
	if devo.Name == "c00lkidd" and devo:GetAttribute("SkinName") then
		if devo:GetAttribute("SkinName") == "ColorAndElectricityC00l" then
			add(devo)
		end
	end
end
end
module()