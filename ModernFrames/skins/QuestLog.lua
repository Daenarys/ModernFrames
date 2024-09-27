if QuestMapFrame.CampaignOverview.Header.BackButton then
	QuestMapFrame.CampaignOverview.Header.BackButton:ClearAllPoints()
	QuestMapFrame.CampaignOverview.Header.BackButton:SetPoint("RIGHT", QuestMapFrame.CampaignOverview.Header.Background, "RIGHT", -10, 7)
end

QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	self.Background:SetAtlas("QuestLogBackground")
end)