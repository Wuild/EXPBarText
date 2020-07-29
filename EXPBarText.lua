SimpleEXPBar = {};

local TextOnXPBar = MainMenuExpBar:CreateFontString("ExperienceLeft", "OVERLAY", "GameTooltipText")

function SimpleEXPBar:OnLoad()
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("CVAR_UPDATE");

    self:RegisterEvent("ADDON_LOADED")
    self:RegisterEvent("PLAYER_XP_UPDATE")
    self:RegisterEvent("PLAYER_LEVEL_UP")
    self:RegisterEvent("UPDATE_EXHAUSTION")
    self:RegisterEvent("UNIT_PET")
    self:RegisterEvent("UNIT_PET_EXPERIENCE")

    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("PLAYER_CONTROL_LOST")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("PLAYER_LEAVING_WORLD")
    self:RegisterEvent("CINEMATIC_START")
    self:RegisterEvent("CINEMATIC_STOP")

    print("loaded exp bar");
end

function SimpleEXPBar:OnUpdate()
    SimpleEXPBar:UpdateText();
end

function SimpleEXPBar:UpdateText()
    local restid, restname, mult = GetRestState();
    local retVal = GetXPExhaustion();

    local currXP = UnitXP("player");
    local nextXP = UnitXPMax("player");
    local percentXP = math.ceil(currXP / nextXP * 100);
    local XPText = format("XP %s / %s (%s%%)", BreakUpLargeNumbers(currXP), BreakUpLargeNumbers(nextXP), percentXP);

    --if restid == 2 or restid == 3 then
    --    XPText = format("XP %s / %s (%s%%) | %s (%s%%)", BreakUpLargeNumbers(currXP), BreakUpLargeNumbers(nextXP), percentXP, restname, retVal);
    --end

    MainMenuBarExpText:SetText(XPText);
    MainMenuBarExpText:Show();
end
