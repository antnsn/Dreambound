-- Dreambound's option pages; LibBound adds Extras and Skin, and builds the window.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function BuffPage(UI)
	local p = UI.NewPage("Buffs", "A card when a buff is missing or running out. Click it to cast (out of combat).")
	local W = UI.CONTENT_W
	local third = math.floor(W / 3)
	for _, b in ipairs(ns.BUFFS) do
		p:Add(UI.Section(p, p.y - 2, b.label) + 2)
		UI.DBToggle(p, 0, p.y, third, b.key, "Show")
		UI.DBToggle(p, third, p.y, third, b.key .. "Sound", "Sound")
		UI.DBToggle(p, third * 2, p.y, third, b.key .. "Keep", "When missing", nil, function() ns.UpdateBuffTimers() end)
		p:Add(34)
	end
	p:Add(UI.Note(p, p.y, "Omen of Clarity is a Restoration talent. Gift of the Wild counts as Mark of the Wild."))
end

local function ReagentPage(UI)
	local p = UI.NewPage("Reagents", "Wild Berries or Wild Thornroot for Gift of the Wild, and the seed for Rebirth.")
	local W = UI.CONTENT_W
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "giftReagent", "Warn when Gift of the Wild reagents run low", "Once you know Gift of the Wild.")) + 6)
	p:Add(select(2, UI.Slider(p, p.y, "Berries or Thornroot: warn at", "giftLow", 0, 40, 1, " left")) + 8)
	p:Add(select(2, UI.DBToggle(p, 0, p.y, W, "seeds", "Warn when Rebirth seeds run low", "The seed for your best Rebirth rank.")) + 6)
	p:Add(select(2, UI.Slider(p, p.y, "Seeds: warn at", "seedLow", 0, 10, 1, " left")) + 8)
end

local function TravelPage(UI)
	local p = UI.NewPage("Travel", "Teleport: Moonglade, Travel Form, Aquatic Form and your Hearthstone beside the game menu (Escape).")
	p:Add(select(2, UI.DBToggle(p, 0, p.y, UI.CONTENT_W, "travel", "Show the travel panel when the game menu opens")) + 8)
end

ns.optionPages[#ns.optionPages + 1] = BuffPage
ns.optionPages[#ns.optionPages + 1] = ReagentPage
if ns.CleansePage then ns.optionPages[#ns.optionPages + 1] = ns.CleansePage end -- Cure (Cure.lua)
-- the combo point bar (LibBound), in Cat Form only: Marius' claws with a warm glow
Bound.InstallComboBar(ns, {
	glow = { 1, 0.62, 0.25, 0.85 },
	about = "Five claws, one lit for each combo point on your target. In Cat Form only.",
	active = function() -- Cat Form runs on energy; caster form on mana, Bear Form on rage
		local t = UnitPowerType("player")
		return not ns.IsSecret(t) and t == 3
	end,
})
-- the rage bar (LibBound), in Bear Form only: Marius' bar with the stone and claws
Bound.InstallPowerBar(ns, {
	power = 1, title = "Rage bar", noun = "rage", overlay = true,
	about = "Your rage in a bar of its own. In Bear Form only.",
	active = function() -- Bear Form runs on rage
		local t = UnitPowerType("player")
		return not ns.IsSecret(t) and t == 1
	end,
})
ns.optionPages[#ns.optionPages + 1] = TravelPage
Bound.InstallOptions(ns, { header = "Druid helper", launcher = "Druid helper: buffs, reagents, travel." })
