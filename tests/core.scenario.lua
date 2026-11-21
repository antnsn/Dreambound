--@moods: druid warlock
local T = dofile(wb.dir .. "/tests/_druid.lua")
if wb.mood == "druid" then
	T.druid({ 1126 })
	wb.login()
	wb.advance(7)
	wb.slash("/dream")
	wb.check(wb.shown("DreamboundOptions"), "/dream opens the options")
	local titles = {}
	for _, p in ipairs(wb.ns.optionsState.pages) do titles[#titles + 1] = p.title end
	wb.expect("pages", table.concat(titles, ", "), "Buffs, Reagents, Combo points, Travel, Extras, Skin")
else
	wb.state.player.classFile, wb.state.player.class = "WARLOCK", "Warlock"
	wb.login()
	wb.slash("/dream")
	wb.check(wb.printed("only does something on a druid"), "a warlock is told why")
end
