if not _G.TargetFrame then return end

hooksecurefunc(TargetFrame, "CheckClassification", function(self)
	local classification = UnitClassification(self.unit)
	local bossPortraitFrameTexture = self.TargetFrameContainer.BossPortraitFrameTexture
	if (UnitIsBossMob(self.unit) and not UnitIsFriend("player", self.unit)) then
		bossPortraitFrameTexture:SetAtlas("UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold-Winged", TextureKitConstants.UseAtlasSize)
		bossPortraitFrameTexture:SetPoint("TOPRIGHT", 8, -7)
	elseif (UnitIsBossMob(self.unit) and UnitIsFriend("player", self.unit) or classification == "elite") then
		bossPortraitFrameTexture:SetAtlas("UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold", TextureKitConstants.UseAtlasSize)
		bossPortraitFrameTexture:SetPoint("TOPRIGHT", -11, -8)
	elseif (classification == "rare") then
		bossPortraitFrameTexture:SetAtlas("ui-hud-unitframe-target-portraiton-boss-rare-silver", TextureKitConstants.UseAtlasSize)
		bossPortraitFrameTexture:SetPoint("TOPRIGHT", -11, -8)
		bossPortraitFrameTexture:Show()
	elseif (classification == "rareelite") then
		bossPortraitFrameTexture:SetAtlas("UI-HUD-UnitFrame-Target-PortraitOn-Boss-Gold-Winged", TextureKitConstants.UseAtlasSize)
		bossPortraitFrameTexture:SetPoint("TOPRIGHT", 8, -7)
	end
	self.TargetFrameContent.TargetFrameContentContextual.BossIcon:Hide()
end)