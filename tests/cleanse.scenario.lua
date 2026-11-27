--@moods: first second abolish none keys
-- Cure (LibBound Cleanse.lua): a group member with a debuff this class removes gets a row that
-- casts on them, a key per spell. The stand-in client has no SecureGroupHeader: the frame is the list.
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
local known = { 2782, 8946 }
if m == "abolish" then known[#known + 1] = 2893 end
if m == "none" then known = {} end
T.druid(known)
local s = wb.state
wb.login()
local G = wb.G
local bound = {}
G.SetOverrideBindingClick = function(owner, prio, key, button) bound[key] = button end
G.ClearOverrideBindings = function() bound = {} end
wb.join({ { unit = "party1", name = "Friend", classFile = "WARRIOR" } })
local second = { name = "Bad Poison", spellId = 222, dispelName = "Poison", icon = 136207 }
s.auras.party1 = { (m == "second" or m == "abolish") and second or { name = "Bad Curse", spellId = 111, dispelName = "Curse", icon = 136139 } }
wb.fire("UNIT_AURA", "party1")
wb.advance(2)
if m == "none" then
	wb.check(not wb.shown("DreamboundCleanseFrame"), "no spell to remove debuffs yet: no frame")
	return
end
local row = wb.frame("DreamboundCleanseRow1")
wb.check(row ~= nil and row.data ~= nil, "the afflicted member gets a row")
wb.expect("on them", row:GetAttribute("unit"), "party1")
wb.expect("left click: Remove Curse", row:GetAttribute("spell1"), "Remove Curse")
if m == "first" then
	wb.expect("as a spell", row:GetAttribute("type1"), "spell")
elseif m == "second" or m == "abolish" then
	wb.expect("right click: the Cure Poison", row:GetAttribute("spell2"), m == "abolish" and "Abolish Poison" or "Cure Poison")
	wb.check(row.data.names[1]:find("right%-click") ~= nil, "the tooltip says right-click: " .. row.data.names[1])
elseif m == "keys" then
	wb.ns.db.clKey, wb.ns.db.clKey2 = "F", "G"
	wb.ns.ApplyCleanseKey()
	wb.expect("F: the first key", bound.F, "DreamboundCleanseKeyButton")
	wb.expect("G: the second key", bound.G, "DreamboundCleanseKeyButton2")
	wb.expect("which casts on the mouseover", wb.frame("DreamboundCleanseKeyButton"):GetAttribute("macrotext"),
		"/cast [@mouseover,help,nodead][help,nodead] Remove Curse")
	wb.slash("/dream")
	local page
	for _, p in ipairs(wb.ns.optionsState.pages) do if p.title == "Cure" then page = p.frame end end
	wb.check(page and -page.cleanseBottom <= page:GetHeight(), "the Cure page fits: " .. tostring(page and page.cleanseBottom))
	wb.slash("/dream ignore Bad Curse")
	wb.check(wb.ns.db.clIgnore["bad curse"], "/dream ignore keeps a debuff name")
end
