--@moods: cat caster bear catcombat casterbuff shift unreadable
-- the combo point bar (LibBound) in Cat Form only: five claws, one lit with a glow for each combo
-- point on your target; nothing in caster or Bear Form, even in combat
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
T.druid({ 1126 })
local p = wb.state.player
-- Cat Form runs on energy (power type 3), Bear Form on rage (1), caster form on mana (0)
p.powerType = ({ cat = 3, catcombat = 3, bear = 1, shift = 0, unreadable = 3 })[m] or 0
local db = {}
if m == "casterbuff" then db.comboAlways = true end
wb.login({ saved = { DreamboundDB = db } })
local G = wb.G
local points = ({ cat = 3, caster = 3, bear = 3, catcombat = 0, casterbuff = 0, shift = 4, unreadable = 3 })[m]
G.GetComboPoints = function(unit, target)
	if unit ~= "player" or target ~= "target" then return 0 end
	return points
end
if m == "unreadable" then G.UnitPowerType = function() return wb.SECRET end end
if m == "catcombat" or m == "bear" then wb.combat(true) end
wb.fire("PLAYER_TARGET_CHANGED")
wb.advance(1)

local bar = wb.frame("DreamboundComboFrame")
wb.check(bar ~= nil, "the bar exists")
local shown = wb.shown("DreamboundComboFrame")
local function Lit()
	local n = 0
	for _, pip in ipairs(bar.pips) do if pip.lit then n = n + 1 end end
	return n
end

if m == "cat" then
	wb.expect("Cat Form with points: shown", shown, true)
	wb.expect("three lit", Lit(), 3)
	local c = bar.pips[1].glow.__color or {}
	wb.check((c[1] or 0) > (c[3] or 0), "a warm glow round the claws")
elseif m == "catcombat" then
	wb.expect("Cat Form in combat: shown, even with no points", shown, true)
elseif m == "caster" or m == "bear" then
	wb.expect("not in Cat Form (" .. m .. "): hidden", shown, false)
elseif m == "casterbuff" then
	wb.expect("'always show' still only in Cat Form", shown, false)
elseif m == "shift" then
	wb.expect("caster form: hidden", shown, false)
	p.powerType = 3
	wb.fire("UPDATE_SHAPESHIFT_FORM")
	wb.expect("shift to Cat Form: shown", wb.shown("DreamboundComboFrame"), true)
	wb.expect("four lit", Lit(), 4)
	p.powerType = 0
	wb.fire("UPDATE_SHAPESHIFT_FORM")
	wb.expect("back to caster form: hidden", wb.shown("DreamboundComboFrame"), false)
elseif m == "unreadable" then
	wb.expect("a form the addon can't read: hidden", shown, false)
	wb.expect("and no error", #wb.takeErrors(), 0)
end
