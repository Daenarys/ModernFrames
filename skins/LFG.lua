if not _G.PVEFrame then return end

hooksecurefunc('LFGDungeonReadyPopup_Update', function()
	local proposalExists, id, typeID, subtypeID, name, backgroundTexture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader, _, _, isSilent = GetLFGProposal()
	
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