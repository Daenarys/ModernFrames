if (C_AddOns.IsAddOnLoaded("SexyMap")) then return end

Minimap:HookScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		if (ExpansionLandingPageMinimapButton:GetNormalTexture():GetAtlas() == "dragonflight-landingbutton-up") then
			ExpansionLandingPageMinimapButton:ClearAllPoints()
			ExpansionLandingPageMinimapButton:SetPoint("TOPLEFT", 8, -156)
		end

		hooksecurefunc(ExpansionLandingPageMinimapButton, "UpdateIcon", function(self)
			if (self:GetNormalTexture():GetAtlas() == "dragonflight-landingbutton-up") then
				self:ClearAllPoints()
				self:SetPoint("TOPLEFT", 8, -156)
			end
		end)
	end
end)

hooksecurefunc(QueueStatusButton, "UpdatePosition", function(self)
	self:SetParent(MinimapBackdrop)
	self:SetFrameLevel(6)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", MinimapBackdrop, "TOPLEFT", -10, -165)
	self:SetScale(0.8)
end)

hooksecurefunc(QueueStatusFrame, "UpdatePosition", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", QueueStatusButton, "TOPLEFT")
end)