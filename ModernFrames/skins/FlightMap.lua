local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		hooksecurefunc(FlightMap_FlightPointPinMixin, "SetFlightPathStyle", function(self)
			local info = self.taxiNodeData
			if info then
				if (self.Icon:GetAtlas() == "Taxi_Frame_Gray") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.0683594, 0.212891)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Yellow") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.365234, 0.509766)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Green") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.216797, 0.361328)
				end
			end
		end)

		hooksecurefunc(FlightMap_FlightPointPinMixin, "OnMouseEnter", function(self)
			local info = self.taxiNodeData
			if info then
				if (self.Icon:GetAtlas() == "Taxi_Frame_Gray") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.0683594, 0.212891)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Yellow") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.365234, 0.509766)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Green") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.216797, 0.361328)
				end
			end
		end)

		hooksecurefunc(FlightMap_FlightPointPinMixin, "OnMouseLeave", function(self)
			local info = self.taxiNodeData
			if info then
				if (self.Icon:GetAtlas() == "Taxi_Frame_Gray") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.0683594, 0.212891)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Yellow") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.365234, 0.509766)
				elseif (self.Icon:GetAtlas() == "Taxi_Frame_Green") then
					self.Icon:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\taxiassets")
					self.Icon:SetTexCoord(0.0078125, 0.585938, 0.216797, 0.361328)
				end
			end
		end)
		
		FlightMapFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER")
		end)
	end
end)