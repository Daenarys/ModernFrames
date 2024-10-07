if not _G.WorldMapFrame then return end

for _, f in next, WorldMapFrame.overlayFrames do
	if WorldMapActivityTrackerMixin and f.OnLoad == WorldMapActivityTrackerMixin.OnLoad then
		hooksecurefunc(f, "Show", function()
			f:Hide()
		end)
	end
end

local Dropdown, Tracking, Pin, MapLegend = unpack(WorldMapFrame.overlayFrames)
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
	elseif style == POIButtonUtil.Style.QuestThreat  then
		if poiButton:IsSelected() then
			poiButton.NormalTexture:SetAtlas("UI-QuestPoi-QuestNumber-SuperTracked")
			poiButton.PushedTexture:SetAtlas("UI-QuestPoi-QuestNumber-Pressed-SuperTracked")
		else
			poiButton.NormalTexture:SetAtlas("UI-QuestPoi-QuestNumber")
			poiButton.PushedTexture:SetAtlas("UI-QuestPoi-QuestNumber-Pressed")
		end
		poiButton.HighlightTexture:SetAtlas("UI-QuestPoi-InnerGlow")
	elseif style == POIButtonUtil.Style.WorldQuest then
		local info = C_QuestLog.GetQuestTagInfo(questID)
		if info then
			if (poiButton.Display.Icon:GetAtlas() == "Worldquest-icon") then
				poiButton.Display.Icon:SetAtlas("worldquest-questmarker-questbang")
				poiButton.Display.Icon:SetSize(6, 15)
			elseif (poiButton.Display.Icon:GetAtlas() == "worldquest-icon-petbattle") then
				poiButton.Display.Icon:SetSize(11, 9)
			elseif (poiButton.Display.Icon:GetAtlas() == "worldquest-icon-race") then
				poiButton.Display.Icon:SetSize(17, 14)
			end
		end
	elseif style == POIButtonUtil.Style.AreaPOI then
		poiButton.Display.Icon:SetAtlas("UI-EventPoi-Horn-big")
		if poiButton.SubTypeIcon then
			poiButton.SubTypeIcon:SetAlpha(0)
		end
	end
end)

hooksecurefunc(BaseMapPoiPinMixin, "OnAcquired", function(self)
	if self.Texture then
		-- caves
		if (self.Texture:GetAtlas() == "CaveUnderground-Down") then
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
		-- dungeons & raids
		elseif (self.Texture:GetAtlas() == "Dungeon") then
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
		end
	end
end)