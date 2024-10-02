if not _G.QuestFrame then return end

QuestFrameTitleText:SetTextColor(255, 255, 255, 1)

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 8, -4)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 8, -4)

QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 13, 40)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 13, -27)