--@moods: dream blizzard flat
local T = dofile(wb.dir .. "/tests/_druid.lua")
T.druid({ 1126 })
wb.login({ saved = { DreamboundDB = { skin = wb.mood } } })
wb.advance(7)
local want = ({ dream = "Dream", blizzard = "Blizzard", flat = "Flat" })[wb.mood]
wb.expect("active skin", wb.ns.UI.Active().name, want)
wb.check(wb.shown("DreamboundMarkOfTheWildFrame"), "a card builds in this skin")
wb.slash("/dream")
wb.check(wb.shown("DreamboundOptions"), "the options build in this skin")
