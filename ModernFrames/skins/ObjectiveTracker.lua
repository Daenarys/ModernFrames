if not _G.ObjectiveTrackerFrame then return end

local TrackerFrame = _G.ObjectiveTrackerFrame
local TrackerHeader = TrackerFrame and TrackerFrame.Header
local MinimizeButton = TrackerFrame.Header and TrackerHeader.MinimizeButton

local function SetCollapsed(header, collapsed)
	local MinimizeButton = header.MinimizeButton
	MinimizeButton:SetNormalTexture("Interface/QuestFrame/QuestTracker")
	MinimizeButton:SetPushedTexture("Interface/QuestFrame/QuestTracker")
	MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

	if collapsed then
		MinimizeButton:GetNormalTexture():SetTexCoord(0.933594, 0.96875, 0.242188, 0.316406)
		MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.324219, 0.398438)
	else
		MinimizeButton:GetNormalTexture():SetTexCoord(0.9375, 0.972656, 0.121094, 0.195312)
		MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.242188, 0.316406)
	end
end

if MinimizeButton then
	SetCollapsed(TrackerHeader, TrackerFrame.isCollapsed)
	hooksecurefunc(TrackerHeader, 'SetCollapsed', SetCollapsed)
end