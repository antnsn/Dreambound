--@moods: none berries thornroot nogift seed bestseed both enough off
local T = dofile(wb.dir .. "/tests/_druid.lua")
local m = wb.mood
local known = ({ none = { 1126 }, berries = { 21849 }, thornroot = { 21849, 21850 }, nogift = { 1126 },
	seed = { 20484 }, bestseed = { 20484, 20739, 20742 }, both = { 21849, 20748 }, enough = { 21849, 20748 },
	off = { 21849, 20484 } })[m]
T.druid(known)
local b = wb.state.bags
if m == "berries" then b[17021] = 2 end
if m == "thornroot" then b[17021] = 50; b[17026] = 1 end
if m == "nogift" then b[17021] = 0; b[17026] = 0 end -- reagents don't matter without Gift of the Wild
if m == "seed" then b[17034] = 0 end
if m == "bestseed" then b[17034] = 20; b[17035] = 20; b[17036] = 1 end -- only the best rank's seed counts
if m == "both" then b[17021] = 1; b[17038] = 0 end
if m == "enough" then b[17021] = 40; b[17038] = 10 end
local db = {}
if m == "off" then db.giftReagent = false; db.seeds = false end
wb.login({ saved = { DreamboundDB = db } })
wb.advance(3)
local card = wb.frame("DreamboundReagentsFrame")
local shown = wb.shown("DreamboundReagentsFrame")
if m == "none" or m == "nogift" or m == "enough" or m == "off" then
	wb.expect("no reagent card", shown, false)
else
	wb.expect("reagent card", shown, true)
	local want = ({ berries = "Wild Berries 2", thornroot = "Wild Thornroot 1", seed = "Maple Seeds 0",
		bestseed = "Ashwood Seeds 1", both = "Wild Berries 1 · Ironwood Seeds 0" })[m]
	wb.expect("says what runs low", card.statusText:GetText(), want)
end
if m == "both" then wb.expect("a wider card for both", card:GetWidth(), 300) end
