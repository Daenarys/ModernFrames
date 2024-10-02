if not _G.QuestScrollFrame then return end

if QuestMapFrame.CampaignOverview.Header.BackButton then
	QuestMapFrame.CampaignOverview.Header.BackButton:ClearAllPoints()
	QuestMapFrame.CampaignOverview.Header.BackButton:SetPoint("RIGHT", QuestMapFrame.CampaignOverview.Header.Background, "RIGHT", -10, 7)
end

QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.BorderFrame.Shadow:SetAlpha(0)
QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.SettingsDropdown:Hide()

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT", -3, 3)

QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 8, -4)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 8, -4)

QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 13, 40)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 13, -27)

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Text then
				button.Text:ClearAllPoints()
				button.Text:SetPoint("BOTTOMLEFT", button.Background, "LEFT", 31, 5)
			end
			if button.Progress then
				button.Progress:ClearAllPoints()
				button.Progress:SetPoint("TOPLEFT", button.Text, "BOTTOMLEFT", 0, -4)
			end
			if button.NextObjective.Text then
				button.NextObjective.Text:ClearAllPoints()
				button.NextObjective.Text:SetPoint("TOP", button.NextObjective, "TOP")
			end
			if button.LoreButton then
				button.LoreButton:ClearAllPoints()
				button.LoreButton:SetPoint("RIGHT", button.Background, "RIGHT", -10, 7)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", button.Background, "LEFT", 8, 6)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.headerFramePool:EnumerateActive() do
		if not button.IsSkinned then
			button:GetNormalTexture():SetAlpha(0)
			button:GetHighlightTexture():SetAlpha(0)
			if button.ButtonText then
				button.ButtonText:ClearAllPoints()
				button.ButtonText:SetPoint("LEFT", 21, 1)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", -1, 0)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.titleFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Checkbox then
				button.Checkbox:Hide()
			end
			if button.TagTexture then
				button.TagTexture:ClearAllPoints()
				button.TagTexture:SetPoint("RIGHT", 8, 0)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.campaignHeaderMinimalFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Background then
				button.Background:SetAlpha(0)
			end
			if button.Highlight then
				button.Highlight:SetAlpha(0)
			end
			if button.Text then
				button.Text:ClearAllPoints()
				button.Text:SetPoint("LEFT", button.Background, "LEFT", 21, 1)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", button.Background, -1, 0)
			end
			button.IsSkinned = true
		end
	end
end)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	if (self.Background:GetAtlas() == "QuestLog-main-background") then
		self.Background:SetAtlas("QuestLogBackground")
	elseif (self.Background:GetAtlas() == "QuestLog-empty-quest-background") then
		self.Background:SetAtlas("NoQuestsBackground")
	end
end)