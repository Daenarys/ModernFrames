if (C_AddOns.IsAddOnLoaded("SexyMap")) then return end

hooksecurefunc(QueueStatusButton, "UpdatePosition", function(self)
	self:SetParent(MinimapBackdrop)
	self:SetFrameLevel(6)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", MinimapBackdrop, "TOPLEFT", -8, -175)
	self:SetScale(0.75)
end)

hooksecurefunc(QueueStatusFrame, "UpdatePosition", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", QueueStatusButton, "TOPLEFT")
end)

hooksecurefunc(AddonCompartmentFrame, "UpdateDisplay", function(self)
	self:SetShown(false)
end)