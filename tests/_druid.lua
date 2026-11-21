-- shared setup: a druid with the given spells known (loaded with dofile)
local M = {}
local NAMES = {
	[1126] = "Mark of the Wild", [5232] = "Mark of the Wild", [9885] = "Mark of the Wild",
	[21849] = "Gift of the Wild", [21850] = "Gift of the Wild",
	[467] = "Thorns", [782] = "Thorns", [16864] = "Omen of Clarity",
	[20484] = "Rebirth", [20739] = "Rebirth", [20742] = "Rebirth", [20747] = "Rebirth", [20748] = "Rebirth",
	[18960] = "Teleport: Moonglade", [783] = "Travel Form", [1066] = "Aquatic Form", [429959] = "Well-Rested",
}
function M.druid(known)
	local s = wb.state
	s.player.classFile, s.player.class, s.player.classId = "DRUID", "Druid", 11
	for id, n in pairs(NAMES) do s.spells[id] = n; s.known[id] = false end
	for _, id in ipairs(known or {}) do s.known[id] = nil end
	s.known[429959] = nil
end
function M.macroFor(text)
	for _, f in ipairs(wb.frames()) do
		local m = f:GetAttribute("macrotext")
		if m and f.__shown and m:find(text, 1, true) then return f end
	end
end
return M
