-- Dreambound: the Druid addon of the Bound family, built on LibBound-1.0 (the shared core).
-- This file sets the addon up; every other file returns at once on a non-druid (ns.disabled).
local addonName, ns = ...
local Bound = LibStub("LibBound-1.0")

-- Spells and items, lowest rank first. Classic IDs; Forever follows Classic content.
-- Checked in game before each release.
ns.DATA = {
	markOfTheWild = { 1126, 5232, 6756, 5234, 8907, 9884, 9885 },
	giftOfTheWild = { 21849, 21850 },
	thorns = { 467, 782, 1075, 8914, 9756, 9910 },
	omenOfClarity = { 16864 },
	-- Rebirth ranks and the seed each one uses (same index)
	rebirth = { 20484, 20739, 20742, 20747, 20748 },
	seeds = { 17034, 17035, 17036, 17037, 17038 },
	seedNames = { "Maple Seeds", "Stranglethorn Seeds", "Ashwood Seeds", "Hornbeam Seeds", "Ironwood Seeds" },
	wildBerries = 17021, wildThornroot = 17026,
	moonglade = 18960, travelForm = 783, aquaticForm = 1066,
}

local function Timer(key, x, y, keep)
	return key, true, key .. "Minutes", 2, key .. "Sound", false, key .. "Icon", true, key .. "Keep", keep,
		key .. "Point", { "CENTER", "UIParent", "CENTER", x, y }
end
local defaults = {
	skin = "dream",
	giftReagent = true, giftLow = 5, seeds = true, seedLow = 1,
	rgPoint = { "CENTER", "UIParent", "CENTER", 250, 200 },
	travel = true,
	wrPoint = { "CENTER", "UIParent", "CENTER", 0, 320 },
	wfPoint = { "CENTER", "UIParent", "CENTER", 0, 260 },
}
-- one block of settings per buff card: <key>, <key>Minutes, Sound, Icon, Keep and its place
for _, t in ipairs({ { "markOfTheWild", -250, 200, true }, { "thorns", -250, 140, true },
	{ "omenOfClarity", -250, 80, true } }) do
	local kv = { Timer(t[1], t[2], t[3], t[4]) }
	for i = 1, #kv, 2 do defaults[kv[i]] = kv[i + 1] end
end

ns.disabled = Bound:NewAddon(addonName, ns, {
	class = "DRUID",
	title = "Dreambound",
	prefix = "9fe8c0",
	db = "DreamboundDB",
	slash = { "/dream", "/dreambound" },
	media = "Interface\\AddOns\\Dreambound\\Media\\",
	defaults = defaults,
})
