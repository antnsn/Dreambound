--@moods: low moonglade forms
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
T.druid(({ low = {}, moonglade = { 18960 }, forms = { 18960, 783, 1066 } })[m])
wb.state.bags[6948] = 1
wb.login()
wb.advance(2)
wb.openGameMenu()
wb.expect("panel with the menu", wb.shown("DreamboundTravel"), true)
local rows = wb.ns.TravelRows()
local labels, levels = {}, {}
for _, r in ipairs(rows) do labels[#labels + 1] = r.label; levels[#levels + 1] = r.level end
wb.expect("rows", table.concat(labels, ", "), "Teleport: Moonglade, Travel Form, Aquatic Form")
wb.expect("levels", table.concat(levels, ", "), "10, 30, 16")
wb.expect("Moonglade known", rows[1].known, m ~= "low")
wb.expect("Travel Form known", rows[2].known, m == "forms")
wb.expect("Aquatic Form known", rows[3].known, m == "forms")
-- the game's font has no arrow (it draws a box): plain text between the stone and the inn
wb.expect("the Hearthstone row names the inn", wb.frame("DreamboundTravelHearth").text:GetText(), "Hearthstone: Orgrimmar")
