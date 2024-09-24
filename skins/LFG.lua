if not _G.PVEFrame then return end

hooksecurefunc('LFGDungeonReadyPopup_Update', function()
	local proposalExists, id, typeID, subtypeID, name, backgroundTexture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader, _, _, isSilent = GetLFGProposal()
	
	if (LFGDungeonReadyDialog.filigree == nil) then
		LFGDungeonReadyDialog.filigree = LFGDungeonReadyDialog:CreateTexture(nil, "OVERLAY")
	end

	if ( subtypeID == LFG_SUBTYPEID_RAID ) then
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.00195313, 0.57617188, 0.58593750, 0.78125000)
		LFGDungeonReadyDialog.filigree:SetSize(294, 50)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -8)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.00195313, 0.55273438, 0.29296875, 0.57812500)
		LFGDungeonReadyDialog.bottomArt:SetSize(282, 73)
	else
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.02734, 0.59765, 0.578125, 1.0)
		LFGDungeonReadyDialog.filigree:SetSize(292, 54)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -3)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		if ( subtypeID == LFG_SUBTYPEID_SCENARIO or subtypeID == LFG_SUBTYPEID_FLEXRAID ) then
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.18, 0.0, 0.5625)
		else
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.5605, 0.0, 0.5625)
		end
		LFGDungeonReadyDialog.bottomArt:SetSize(287, 72)
	end

	if ( subtypeID == LFG_SUBTYPEID_SCENARIO ) then
		if ( LFG_IsHeroicScenario(id) ) then
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-HeroicScenario")
		else
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-RandomScenario")
		end
	end
end)

ScenarioQueueFrameRandomScrollFrame.ScrollBar:SetAlpha(0)

hooksecurefunc("ScenarioQueueFrameRandom_UpdateFrame", function()
	local dungeonID = ScenarioQueueFrame.type

	if ( LFG_IsHeroicScenario(dungeonID) ) then
		ScenarioQueueFrame.Bg:SetTexture("Interface\\LFGFrame\\UI-LFG-SCENARIO-Heroic-Old")
	else
		ScenarioQueueFrame.Bg:SetTexture("Interface\\LFGFrame\\UI-LFG-SCENARIO-Random-Old")
	end
end)

hooksecurefunc("ScenarioQueueFrame_SetTypeRandom", function()
	local queueFrame = ScenarioQueueFrame

	queueFrame.Bg:SetSize(512, 512)
	queueFrame.Bg:ClearAllPoints()
	queueFrame.Bg:SetPoint("TOPLEFT", 4, -75)
end)

hooksecurefunc("GroupFinderFrame_EvaluateButtonVisibility", function(self)
	if not PlayerGetTimerunningSeasonID() then
		self.groupButton1:SetPoint("TOPLEFT", 10, -101)
		self.groupButton2:SetPoint("TOP", self.groupButton1, "BOTTOM", 0, -30)
		self.groupButton3:SetPoint("TOP", self.groupButton2, "BOTTOM", 0, -30)
	end
end)