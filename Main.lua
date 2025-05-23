local a,b,c=game:GetService("TeleportService"),game:GetService("Players"),game:GetService("Players").LocalPlayer
local d=Instance.new("ScreenGui",game.CoreGui)d.Name="AlchemistTeleportGui"
local e=Instance.new("Frame",d)e.Position=UDim2.new(.5,-150,.5,-100)e.Size=UDim2.new(0,300,0,200)e.BackgroundColor3=Color3.fromRGB(20,20,20)e.BorderSizePixel=0 e.Active=true e.Draggable=true
local f=Instance.new("TextLabel",e)f.Text="Alchemist's Teleport GUI"f.Size=UDim2.new(1,0,0,30)f.TextColor3=Color3.new(1,1,1)f.BackgroundColor3=Color3.fromRGB(40,40,40)f.BorderSizePixel=0 f.Font=Enum.Font.Gotham f.TextSize=16
local g=Instance.new("TextBox",e)g.PlaceholderText="Enter Place ID"g.Size=UDim2.new(1,-20,0,30)g.Position=UDim2.new(0,10,0,40)g.Text=""g.BackgroundColor3=Color3.fromRGB(30,30,30)g.TextColor3=Color3.new(1,1,1)g.Font=Enum.Font.Gotham g.TextSize=14
local h=Instance.new("TextBox",e)h.PlaceholderText="Enter Job ID"h.Size=UDim2.new(1,-20,0,30)h.Position=UDim2.new(0,10,0,80)h.Text=""h.BackgroundColor3=Color3.fromRGB(30,30,30)h.TextColor3=Color3.new(1,1,1)h.Font=Enum.Font.Gotham h.TextSize=14
local i=Instance.new("TextButton",e)i.Text="Teleport"i.Size=UDim2.new(1,-20,0,40)i.Position=UDim2.new(0,10,0,130)i.BackgroundColor3=Color3.fromRGB(0,170,0)i.TextColor3=Color3.new(1,1,1)i.Font=Enum.Font.GothamBold i.TextSize=16
local function j(k,l)local function m()local n,o=pcall(function()a:TeleportToPlaceInstance(tonumber(k),l,c)end)if not n then local p=o:lower()if p:find("full")or p:find("error")then warn("Server full or error. Retrying in 5 seconds...")wait(5)m()else warn("Teleport failed: "..tostring(o))end end end m()end
i.MouseButton1Click:Connect(function()local q,r=g.Text,h.Text if q~=""and r~=""then j(q,r)else warn("Please enter both Place ID and Job ID.")end end)
