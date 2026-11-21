--@moods: bear caster cat bearcombat shift flat
-- the rage bar (LibBound) in Bear Form only: Marius' bar with the stone and claws, filled to your
-- rage; nothing in caster or Cat Form
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
T.druid({ 1126 })
local p = wb.state.player
-- Bear Form runs on rage (power type 1), Cat Form on energy (3), caster form on mana (0)
p.powerType = ({ bear = 1, bearcombat = 1, cat = 3, flat = 1 })[m] or 0
p.power, p.powerMax = ({ bearcombat = 0 })[m] or 30, 100
local db = {}
if m == "flat" then db.skin = "flat" end
wb.login({ saved = { DreamboundDB = db } })
if m == "bearcombat" then wb.combat(true) end
wb.advance(1)

local bar = wb.frame("DreamboundPowerBar")
wb.check(bar ~= nil, "the bar exists")
local shown = wb.shown("DreamboundPowerBar")
if m == "bear" then
	wb.expect("Bear Form with rage: shown", shown, true)
	wb.expect("filled to it", bar.status:GetValue(), 30)
	wb.check(bar.overlay ~= nil, "with the bear's claws on it")
	wb.expect("the painted look in the Dream skin", bar.look, "painted")
elseif m == "bearcombat" then
	wb.expect("Bear Form in combat: shown, even with no rage", shown, true)
elseif m == "caster" or m == "cat" then
	wb.expect("not in Bear Form (" .. m .. "): hidden", shown, false)
elseif m == "shift" then
	wb.expect("caster form: hidden", shown, false)
	p.powerType = 1
	wb.fire("UPDATE_SHAPESHIFT_FORM")
	wb.expect("shift to Bear Form: shown", wb.shown("DreamboundPowerBar"), true)
	p.powerType = 0
	wb.fire("UPDATE_SHAPESHIFT_FORM")
	wb.expect("back to caster form: hidden", wb.shown("DreamboundPowerBar"), false)
elseif m == "flat" then
	wb.expect("the Flat skin: the plain bar", bar.look, "flat")
	wb.expect("without the claws", bar.overlay, nil)
	wb.expect("shown in Bear Form", shown, true)
end
