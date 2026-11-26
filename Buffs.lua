-- Self-buff cards (LibBound buff timers): Mark of the Wild, Thorns and Omen of Clarity (talent).
-- Gift of the Wild on you counts as Mark of the Wild. Click a card to cast (out of combat).
-- Nothing shows while the spell isn't learned.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Name(list) local id = ns.BestRank(list) return id and ns.SpellName(id) end
local function BuffName(list, english) return ns.SpellName(list[1]) or english end

local BUFFS = {
	{ key = "markOfTheWild", frame = "DreamboundMarkOfTheWildFrame", label = "Mark of the Wild", icon = 136078,
		list = D.markOfTheWild, group = D.giftOfTheWild, groupName = "Gift of the Wild", party = true,
		levels = { 1, 10, 20, 30, 40, 50, 60 } }, -- each rank's spell level (Classic)
	{ key = "thorns", frame = "DreamboundThornsFrame", label = "Thorns", icon = 136104, list = D.thorns },
	{ key = "omenOfClarity", frame = "DreamboundOmenOfClarityFrame", label = "Omen of Clarity", icon = 136017,
		list = D.omenOfClarity },
}
ns.BUFFS = BUFFS

local function Names(b)
	local n = { BuffName(b.list, b.label) }
	if b.group then n[#n + 1] = BuffName(b.group, b.groupName) end
	return n
end

for _, b in ipairs(BUFFS) do
	ns.MakeBuffTimer({
		key = b.key, point = b.key .. "Point", frameName = b.frame,
		label = b.label, icon = b.icon,
		names = function() return Names(b) end,
		active = function() return ns.BestRank(b.list) ~= nil end,
		cast = function() return Name(b.list) end,
		explain = ns.Help[b.key],
		goneText = "Missing: click to cast",
	})
end

-- the buff key (LibBound) also gives Mark of the Wild to the group, on the next member in range
-- missing it (Gift of the Wild counts), while its card is turned on. Thorns stays on you.
for _, b in ipairs(BUFFS) do
	if b.party then
		ns.groupBuffs[#ns.groupBuffs + 1] = { list = b.list, levels = b.levels,
			names = function() return Names(b) end,
			enabled = function() return ns.db[b.key] ~= false end }
	end
end
