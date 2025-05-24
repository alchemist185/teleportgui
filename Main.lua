local tps, plrs, lp = game:GetService("\84\101\108\101\112\111\114\116\83\101\114\118\105\99\101"), game:GetService("\80\108\97\121\101\114\115"), game:GetService("\80\108\97\121\101\114\115").LocalPlayer
local gui = Instance.new("\83\99\114\101\101\110\71\117\105", game.CoreGui) gui.Name = "\65\108\99\104\101\109\105\115\116\84\101\108\101\112\111\114\116\71\117\105"
local frame = Instance.new("\70\114\97\109\101", gui) frame.Position = UDim2.new(.5, -150, .5, -100) frame.Size = UDim2.new(0, 300, 0, 200) frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) frame.BorderSizePixel = 0 frame.Active = true frame.Draggable = true
local title = Instance.new("\84\101\120\116\76\97\98\101\108", frame) title.Text = "\65\108\99\104\101\109\105\115\116\39\115\32\84\101\108\101\112\111\114\116\32\71\85\73" title.Size = UDim2.new(1, 0, 0, 30) title.TextColor3 = Color3.new(1,1,1) title.BackgroundColor3 = Color3.fromRGB(40,40,40) title.BorderSizePixel = 0 title.Font = Enum.Font.Gotham title.TextSize = 16
local placeBox = Instance.new("\84\101\120\116\66\111\120", frame) placeBox.PlaceholderText = "\69\110\116\101\114\32\80\108\97\99\101\32\73\68" placeBox.Size = UDim2.new(1, -20, 0, 30) placeBox.Position = UDim2.new(0, 10, 0, 40) placeBox.Text = "" placeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) placeBox.TextColor3 = Color3.new(1,1,1) placeBox.Font = Enum.Font.Gotham placeBox.TextSize = 14
local jobBox = Instance.new("\84\101\120\116\66\111\120", frame) jobBox.PlaceholderText = "\69\110\116\101\114\32\74\111\98\32\73\68" jobBox.Size = UDim2.new(1, -20, 0, 30) jobBox.Position = UDim2.new(0, 10, 0, 80) jobBox.Text = "" jobBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30) jobBox.TextColor3 = Color3.new(1,1,1) jobBox.Font = Enum.Font.Gotham jobBox.TextSize = 14
local teleportBtn = Instance.new("\84\101\120\116\66\117\116\116\111\110", frame) teleportBtn.Text = "\84\101\108\101\112\111\114\116" teleportBtn.Size = UDim2.new(1, -20, 0, 40) teleportBtn.Position = UDim2.new(0, 10, 0, 130) teleportBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0) teleportBtn.TextColor3 = Color3.new(1,1,1) teleportBtn.Font = Enum.Font.GothamBold teleportBtn.TextSize = 16

local function teleportWithRetry(placeId, jobId)
	local function attempt()
		local ok, err = pcall(function()
			tps:TeleportToPlaceInstance(tonumber(placeId), jobId, lp)
		end)
		if not ok then
			local e = tostring(err):lower()
			if e:find("full") or e:find("error") then
				warn("\83\101\114\118\101\114\32\102\117\108\108\32\111\114\32\101\114\114\111\114\46\32\82\101\116\114\121\105\110\103\32\105\110\32\53\115\101\99\111\110\100\115\46\46\46")
				task.wait(5)
				attempt()
			else
				warn("\84\101\108\101\112\111\114\116\32\102\97\105\108\101\100\58 "..tostring(err))
			end
		end
	end
	attempt()
end

teleportBtn.MouseButton1Click:Connect(function()
	local pid, jid = placeBox.Text, jobBox.Text
	if pid ~= "" and jid ~= "" then
		teleportWithRetry(pid, jid)
	else
		warn("\80\108\101\97\115\101\32\101\110\116\101\114\32\98\111\116\104\32\80\108\97\99\101\32\73\68 \97\110\100 \74\111\98 \73\68\46")
	end
end)


task.spawn(function()
	while true do
		task.wait(2)
		if placeBox.Text ~= "" and jobBox.Text ~= "" then
			teleportBtn:Activate()
			break
		end
	end
end)
