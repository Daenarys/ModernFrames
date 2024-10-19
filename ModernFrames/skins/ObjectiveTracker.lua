if not _G.ObjectiveTrackerFrame then return end

ObjectiveTrackerFrame.Header:Hide()

local function SetCollapsed(self, collapsed)
	self.MinimizeButton:SetNormalTexture("Interface/QuestFrame/QuestTracker")
	self.MinimizeButton:SetPushedTexture("Interface/QuestFrame/QuestTracker")
	if collapsed then
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.933594, 0.96875, 0.242188, 0.316406)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.324219, 0.398438)
	else
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.9375, 0.972656, 0.121094, 0.195312)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.242188, 0.316406)
	end
end

local trackers = {
	_G.AchievementObjectiveTracker,
	_G.AdventureObjectiveTracker,
	_G.BonusObjectiveTracker,
	_G.CampaignQuestObjectiveTracker,
	_G.MonthlyActivitiesObjectiveTracker,
	_G.ProfessionsRecipeTracker,
	_G.QuestObjectiveTracker,
	_G.ScenarioObjectiveTracker,
	_G.UIWidgetObjectiveTracker,
	_G.WorldQuestObjectiveTracker
}

for _, tracker in pairs(trackers) do
	tracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
	tracker.Header.Background:SetSize(290, 35)
	tracker.Header.Background:SetPoint("CENTER", 0, 1)
	tracker.Header.Text:SetPoint("LEFT", 14, 0)
	tracker.Header.MinimizeButton:SetSize(16, 17)
	tracker.Header.MinimizeButton:SetPoint("RIGHT", -8, 1)
	tracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Red-Highlight", "ADD")
	SetCollapsed(tracker.Header, _G.ObjectiveTrackerFrame.isCollapsed)
	hooksecurefunc(tracker.Header, 'SetCollapsed', SetCollapsed)
end

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	if not self.modules then
		return
	end
	local prevModule = nil
	for i, module in ipairs(self.modules) do
		local heightUsed = module:GetContentsHeight()
		if heightUsed > 0 then
			if prevModule then
				module:SetPoint("TOP", prevModule, "BOTTOM", 0, -self.moduleSpacing)
			else
				module:SetPoint("TOP")
			end
			prevModule = module
		end
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateWidgetRegistration", function(block)
	if block.WidgetContainer.widgetFrames then
		for _, widgetFrame in pairs(block.WidgetContainer.widgetFrames) do
			if widgetFrame.Frame then
				if (widgetFrame.Frame:GetAtlas() == "evergreen-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -2, 0)
				elseif (widgetFrame.Frame:GetAtlas() == "thewarwithin-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", 1, -2)
				elseif (widgetFrame.Frame:GetAtlas() == "delves-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -7, 2)
				end
			end
		end
	end
end)

if ScenarioObjectiveTracker.MawBuffsBlock.Container then
	ScenarioObjectiveTracker.MawBuffsBlock.Container:SetPoint("TOPRIGHT", -17, 3)
end