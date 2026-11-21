--@moods: fresh missing buffed gift rank talent off foreign
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
local known = ({ fresh = {}, missing = { 1126, 467 }, buffed = { 1126, 467 }, gift = { 1126, 467 },
	rank = { 1126, 5232, 467, 782 }, talent = { 1126, 467, 16864 }, off = { 1126, 467 }, foreign = {} })[m]
T.druid(known)
local s = wb.state
-- a different name for rank 2 shows which rank a click casts (the game's /cast by name does the same)
if m == "rank" then s.spells[5232] = "Mark of the Wild (Rank 2)"; s.spells[782] = "Thorns (Rank 2)" end
if m == "buffed" then s.auras.player = { wb.aura("Mark of the Wild", 1126, 1800), wb.aura("Thorns", 467, 600) } end
if m == "gift" then s.auras.player = { wb.aura("Gift of the Wild", 21849, 3600), wb.aura("Thorns", 467, 600) } end
if m == "foreign" then s.auras.player = { wb.aura("Mark of the Wild", 1126, 30) } end -- from another druid
local db = {}
if m == "off" then db.thorns = false end
wb.login({ saved = { DreamboundDB = db } })
wb.advance(7)
local mark, thorns = wb.shown("DreamboundMarkOfTheWildFrame"), wb.shown("DreamboundThornsFrame")
local omen = wb.shown("DreamboundOmenOfClarityFrame")
if m == "fresh" or m == "foreign" then
	wb.expect("nothing before it's learned", mark or thorns or omen, false)
elseif m == "buffed" or m == "gift" then
	wb.expect("mark up (gift counts too): no card", mark, false)
	wb.expect("thorns up: no card", thorns, false)
else
	wb.expect("mark card", mark, true)
	wb.check(T.macroFor("Mark of the Wild"), "a click casts Mark of the Wild")
	wb.expect("thorns card unless turned off", thorns, m ~= "off")
	if m ~= "off" then wb.check(T.macroFor("Thorns"), "a click casts Thorns") end
	wb.expect("omen of clarity only with the talent", omen, m == "talent")
	if m == "talent" then wb.check(T.macroFor("Omen of Clarity"), "a click casts Omen of Clarity") end
	if m == "rank" then
		wb.check(T.macroFor("Mark of the Wild (Rank 2)"), "a click casts the best Mark of the Wild known")
		wb.check(T.macroFor("Thorns (Rank 2)"), "and the best Thorns known")
	end
end
