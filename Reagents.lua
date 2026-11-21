-- One reagent card: Wild Berries or Wild Thornroot for Gift of the Wild (once it is known) and
-- the seed for your best Rebirth rank (once Rebirth is known), each below its threshold.
-- Quiet in combat.
local _, ns = ...
if ns.disabled then return end
local D = ns.DATA

local function Count(id)
	local ok, n = pcall(C_Item.GetItemCount, id)
	return (ok and not ns.IsSecret(n) and n) or 0
end
local function Known(id)
	local ok, k = pcall(IsPlayerSpell, id)
	return ok and not ns.IsSecret(k) and k and true or false
end

-- the index of the best Rebirth rank you know, or nil
local function RebirthRank()
	for i = #D.rebirth, 1, -1 do
		if Known(D.rebirth[i]) then return i end
	end
end

-- what runs low: list of { text, urgent }
function ns.LowReagents()
	local out = {}
	if ns.db.giftReagent and ns.BestRank(D.giftOfTheWild) then
		-- rank 2 uses Wild Thornroot, rank 1 Wild Berries
		local thorn = Known(D.giftOfTheWild[2])
		local n = Count(thorn and D.wildThornroot or D.wildBerries)
		if n <= ns.db.giftLow then
			out[#out + 1] = { (thorn and "Wild Thornroot " or "Wild Berries ") .. n, n == 0 }
		end
	end
	local rank = ns.db.seeds and RebirthRank()
	if rank then
		local n = Count(D.seeds[rank])
		if n <= ns.db.seedLow then out[#out + 1] = { D.seedNames[rank] .. " " .. n, n == 0 } end
	end
	return out
end

local M = {}
ns.modules[#ns.modules + 1] = M
local card

function M:Update()
	if not card then return end
	if ns.unlocked then card:SetStatus("Wild Berries: 3"); card:Show(); card:Glow(false) return end
	local low = (not ns.InCombat()) and ns.LowReagents() or {}
	if #low > 0 then
		local parts, urgent = {}, false
		for _, r in ipairs(low) do parts[#parts + 1] = r[1]; urgent = urgent or r[2] end
		card:SetStatus(table.concat(parts, " · "), urgent)
		card:Show(); card:Glow(true)
	else
		card:Glow(false); card:Hide()
	end
end

function M:Init()
	card = ns.MakeCard("DreamboundReagentsFrame", { width = 300 }) -- room for both counts on one line
	card:SetIcon(136038) -- Gift of the Wild
	card:SetTitle("Reagents running low")
	card:SetExplain(ns.Help.giftReagent .. " " .. ns.Help.seeds)
	ns.MakeMovable(card, "rgPoint")
	ns.ApplyPoint(card, "rgPoint")
	local f = CreateFrame("Frame")
	for _, e in ipairs({ "BAG_UPDATE_DELAYED", "SPELLS_CHANGED", "PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED",
		"PLAYER_ENTERING_WORLD" }) do f:RegisterEvent(e) end
	f:SetScript("OnEvent", function() M:Update() end)
	M:Update()
end
