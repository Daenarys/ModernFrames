if not _G.WorldMapFrame then return end

for _, f in next, WorldMapFrame.overlayFrames do
	if WorldMapActivityTrackerMixin and f.OnLoad == WorldMapActivityTrackerMixin.OnLoad then
		hooksecurefunc(f, "Show", function()
			f:Hide()
		end)
	end
end

local Dropdown, Tracking, Pin, MapLegend = unpack(WorldMapFrame.overlayFrames)
Tracking.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
Tracking.Icon:SetPoint("TOPLEFT", 6, -6)
if (Tracking.IconOverlay == nil) then
	Tracking.IconOverlay = Tracking:CreateTexture(nil, "OVERLAY")
	Tracking.IconOverlay:SetPoint("TOPLEFT", Tracking.Icon)
	Tracking.IconOverlay:SetPoint("BOTTOMRIGHT", Tracking.Icon)
	Tracking.IconOverlay:SetColorTexture(0, 0, 0, 0.5)
	Tracking.IconOverlay:Hide()
end
Tracking:HookScript("OnMouseDown", function(self)
	self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
	self.Icon:SetPoint("TOPLEFT", 8, -8)
	self.IconOverlay:Show()
end)
Tracking:HookScript("OnMouseUp", function(self)
	self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
	self.Icon:SetPoint("TOPLEFT", 6, -6)
	self.IconOverlay:Hide()
end)
MapLegend:Hide()

hooksecurefunc(POIButtonMixin, "UpdateButtonStyle", function(poiButton)
	local style = poiButton:GetStyle()
	local questID = poiButton:GetQuestID()

	if poiButton.TimeLowFrame then
		poiButton.TimeLowFrame:SetSize(18, 18)
		poiButton.TimeLowFrame:SetPoint("CENTER", -8, -7)
	end

	if poiButton.Glow then
		poiButton.Glow:SetSize(45, 45)
		poiButton.Glow:SetTexture("Interface\\WorldMap\\UI-QuestPoi-IconGlow")
	end

	if style == POIButtonUtil.Style.BonusObjective then
		poiButton.Display:SetAlpha(0)
		poiButton:SetNormalTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetNormalTexture():SetTexCoord(0.807617, 0.838867, 0.331055, 0.362305)
		poiButton:GetNormalTexture():SetSize(25, 25)
		poiButton:SetPushedTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetPushedTexture():SetTexCoord(0.807617, 0.838867, 0.331055, 0.362305)
		poiButton:GetPushedTexture():SetSize(25, 25)
		poiButton.HighlightTexture:SetAlpha(0)
		poiButton:SetMouseClickEnabled(false)
	elseif style == POIButtonUtil.Style.QuestThreat  then
		poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
		poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
		if poiButton:IsSelected() then
			poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.375, 0.5)
			poiButton:GetPushedTexture():SetTexCoord(0.375, 0.500, 0.375, 0.5)
		else
			poiButton:GetNormalTexture():SetTexCoord(0.875, 1, 0.375, 0.5)
			poiButton:GetPushedTexture():SetTexCoord(0.750, 0.875, 0.375, 0.5)
		end
		poiButton.HighlightTexture:SetSize(32, 32)
		poiButton.HighlightTexture:SetTexture("Interface\\WorldMap\\UI-QuestPoi-NumberIcons")
		poiButton.HighlightTexture:SetTexCoord(0.625, 0.750, 0.375, 0.5)
	elseif style == POIButtonUtil.Style.WorldQuest then
		local info = C_QuestLog.GetQuestTagInfo(questID)
		if info then
			if (poiButton.Display.Icon:GetAtlas() == "Worldquest-icon" or poiButton.Display.Icon:GetAtlas() == "worldquest-icon-boss") then
				poiButton.Display.Icon:SetSize(6, 15)
				poiButton.Display.Icon:SetAtlas("worldquest-questmarker-questbang")
			elseif (poiButton.Display.Icon:GetAtlas() == "worldquest-icon-petbattle") then
				poiButton.Display.Icon:SetSize(11, 9)
			end
			poiButton.HighlightTexture:SetSize(32, 32)
			poiButton.HighlightTexture:SetTexture("Interface\\WorldMap\\UI-QuestPoi-NumberIcons")
			poiButton.HighlightTexture:SetTexCoord(0.625, 0.750, 0.375, 0.5)
			if info.quality == Enum.WorldQuestQuality.Rare then
				if poiButton:IsSelected() then
					poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
					poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
					poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.375, 0.5)
					poiButton:GetPushedTexture():SetTexCoord(0.375, 0.500, 0.375, 0.5)
				else
					poiButton:SetNormalTexture("Interface\\AddOns\\ModernFrames\\icons\\WorldQuest")
					poiButton:GetNormalTexture():SetTexCoord(0.955078, 0.994141, 0.177734, 0.216797)
					poiButton:GetNormalTexture():SetSize(18, 18)
					poiButton:SetPushedTexture("Interface\\AddOns\\ModernFrames\\icons\\WorldQuest")
					poiButton:GetPushedTexture():SetTexCoord(0.955078, 0.994141, 0.220703, 0.259766)
					poiButton:GetPushedTexture():SetSize(18, 18)
				end
			elseif info.quality == Enum.WorldQuestQuality.Epic then
				if poiButton:IsSelected() then
					poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
					poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
					poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.375, 0.5)
					poiButton:GetPushedTexture():SetTexCoord(0.375, 0.500, 0.375, 0.5)
				else
					poiButton:SetNormalTexture("Interface\\AddOns\\ModernFrames\\icons\\WorldQuest")
					poiButton:GetNormalTexture():SetTexCoord(0.955078, 0.994141, 0.0917969, 0.130859)
					poiButton:GetNormalTexture():SetSize(18, 18)
					poiButton:SetPushedTexture("Interface\\AddOns\\ModernFrames\\icons\\WorldQuest")
					poiButton:GetPushedTexture():SetTexCoord(0.955078, 0.994141, 0.134766, 0.173828)
					poiButton:GetPushedTexture():SetSize(18, 18)
				end
			else
				poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				if poiButton:IsSelected() then
					poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.375, 0.5)
					poiButton:GetPushedTexture():SetTexCoord(0.375, 0.500, 0.375, 0.5)
				else
					poiButton:GetNormalTexture():SetTexCoord(0.875, 1, 0.375, 0.5)
					poiButton:GetPushedTexture():SetTexCoord(0.750, 0.875, 0.375, 0.5)
				end
			end
			if info.isElite then
				poiButton.UnderlayAtlas:SetSize(34, 34)
				poiButton.UnderlayAtlas:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\WorldQuest")
				poiButton.UnderlayAtlas:SetTexCoord(0.548828, 0.673828, 0.435547, 0.560547)
				poiButton.UnderlayAtlas:SetPoint("CENTER", 0, -1)
			end
		end
	elseif style == POIButtonUtil.Style.AreaPOI then
		poiButton.Display:SetAlpha(0)
		poiButton:SetNormalTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetNormalTexture():SetTexCoord(0.0654297, 0.12793, 0.643555, 0.706055)
		poiButton:GetNormalTexture():SetSize(24, 24)
		poiButton:SetPushedTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetPushedTexture():SetTexCoord(0.0654297, 0.12793, 0.643555, 0.706055)
		poiButton:GetPushedTexture():SetSize(24, 24)
		poiButton:SetMouseClickEnabled(false)
		if poiButton.SubTypeIcon then
			poiButton.SubTypeIcon:SetAlpha(0)
		end
	end
end)

hooksecurefunc(BaseMapPoiPinMixin, "OnAcquired", function(self)
	self:SetMouseClickEnabled(false)
	if self.Texture then
		-- dungeons & raids
		if (self.Texture:GetAtlas() == "Dungeon") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.508789, 0.530273, 0.104492, 0.125977)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.508789, 0.530273, 0.104492, 0.125977)
		elseif (self.Texture:GetAtlas() == "Raid") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.532227, 0.553711, 0.104492, 0.125977)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.532227, 0.553711, 0.104492, 0.125977)
		-- taxis
		elseif (self.Texture:GetAtlas() == "TaxiNode_Alliance") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.821289, 0.838867, 0.102539, 0.120117)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.821289, 0.838867, 0.102539, 0.120117)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Horde") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.34375, 0.361328, 0.170898, 0.188477)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.34375, 0.361328, 0.170898, 0.188477)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Neutral") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.400391, 0.417969, 0.168945, 0.186523)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.400391, 0.417969, 0.168945, 0.186523)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Undiscovered") then
			self.Texture:SetSize(18, 18)
			self.HighlightTexture:SetSize(18, 18)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Alliance") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.741211, 0.767578, 0.430664, 0.457031)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.741211, 0.767578, 0.430664, 0.457031)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Horde") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.769531, 0.795898, 0.430664, 0.457031)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.769531, 0.795898, 0.430664, 0.457031)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Neutral") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.797852, 0.824219, 0.430664, 0.457031)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.797852, 0.824219, 0.430664, 0.457031)
		-- caves
		elseif (self.Texture:GetAtlas() == "CaveUnderground-Down") then
			self.Texture:SetSize(25, 25)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.000976562, 0.0634766, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(25, 25)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.000976562, 0.0634766, 0.12793, 0.19043)
		elseif (self.Texture:GetAtlas() == "CaveUnderground-Up") then
			self.Texture:SetSize(25, 25)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.000976562, 0.0634766, 0.192383, 0.254883)
			self.HighlightTexture:SetSize(25, 25)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.000976562, 0.0634766, 0.192383, 0.254883)
		-- vignettes
		elseif (self.Texture:GetAtlas() == "VignetteEvent") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteEventElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKill") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKillElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
		end
	end
end)

hooksecurefunc(VignettePinMixin, "OnAcquired", function(self)
	if self.Texture then
		if (self.Texture:GetAtlas() == "VignetteEvent") then
			self.Texture:SetSize(24, 24)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(24, 24)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteEventElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKill") then
			self.Texture:SetSize(24, 24)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(24, 24)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKillElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ModernFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
		end
	end
end)