-- The travel panel (LibBound) beside the game menu: Teleport: Moonglade, Travel Form, Aquatic
-- Form and the Hearthstone.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")

local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end

local ROWS = {
	{ key = "moonglade", label = "Teleport: Moonglade", level = 10, learn = "from a druid trainer" },
	{ key = "travelForm", label = "Travel Form", level = 30, learn = "from a druid trainer" },
	{ key = "aquaticForm", label = "Aquatic Form", level = 16, learn = "from the druid quest for it" },
}
function ns.TravelRows()
	local out = {}
	for _, r in ipairs(ROWS) do
		local id = ns.DATA[r.key]
		out[#out + 1] = { spell = id, label = r.label, column = 1, known = Known(id), level = r.level,
			tip = r.label, help = ns.Help[r.key], learn = r.learn }
	end
	return out
end

Bound.InstallTravel(ns, { columns = { "DRUID" }, rows = ns.TravelRows, hearthHelp = ns.Help.hearthstone })
