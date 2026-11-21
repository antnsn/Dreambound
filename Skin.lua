-- Dreambound's look, "Dream": the Emerald Dream, deep green-teal panels with a soft green edge,
-- a drifting mist layer, leaves in the corners, a slow pale rim while a card needs you.
-- LibBound derives the Blizzard and Flat skins from it.
-- Textures: tools/make_media.py.
local _, ns = ...
if ns.disabled then return end
local Bound = LibStub("LibBound-1.0")
local F = Bound.FONTS

local dream = {
	name = "Dream",
	font = { ui = F.friz, title = F.friz, narrow = F.arialn, card = F.morpheus },
	color = {
		bg = { 0, 0, 0, 0 },
		side = { 0.02, 0.06, 0.05, 0.40 },
		header = { 0.02, 0.06, 0.05, 0.35 },
		border = { 0.52, 0.78, 0.60, 0.9 },
		hover = { 0.10, 0.24, 0.19, 1 },
		selected = { 0.09, 0.21, 0.17, 1 },
		text = { 0.92, 1.00, 0.94 },
		dim = { 0.64, 0.78, 0.70 },
		accent = { 0.62, 0.95, 0.68 },
		track = { 0.07, 0.16, 0.13, 1 },
		button = { 0.04, 0.09, 0.08, 1 },
		navGlow = { 0.56, 0.95, 0.66, 0.60 },
		row = { 0.06, 0.14, 0.11, 0.8 },
		rowWarn = { 0.40, 0.30, 0.05, 0.5 },
		rowBad = { 0.45, 0.08, 0.10, 0.55 },
		highlight = { 0.80, 1, 0.86, 0.08 },
		cell = { 0.06, 0.13, 0.11, 0.85 },
		cdText = { 0.90, 1, 0.92 },
		glow = { 0.62, 0.98, 0.70 },
		gridLine = { 0.80, 1, 0.86, 0.08 },
		gridCentre = { 0.56, 0.95, 0.66, 0.45 },
	},
	box = {
		backdrop = {
			bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
			tile = true, tileSize = 16, edgeSize = 14,
			insets = { left = 3, right = 3, top = 3, bottom = 3 },
		},
		bg = { 0.03, 0.08, 0.07 },
		border = { 0.66, 0.90, 0.72, 1 },
	},
	dialog = {
		backdrop = {
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
			tile = true, tileSize = 32, edgeSize = 32,
			insets = { left = 11, right = 11, top = 12, bottom = 11 },
		},
		outset = 10,
		border = { 0.70, 0.95, 0.76, 1 },
		under = { 0.02, 0.06, 0.05, 1 },
		plate = false,
	},
	tex = Bound.STOCK_TEX,
	card = {
		panel = { 0.04, 0.11, 0.09, 0.94 },
		gilt = { 0.50, 0.76, 0.58, 1 },
		giltFaint = { 0.30, 0.50, 0.40, 0.9 },
		light = { 0.80, 1, 0.86, 0.08 },
		rays = { 0.78, 1, 0.84 },
		raysFaded = { 0.50, 0.66, 0.56 },
		title = { 0.88, 1, 0.90 },
		status = { 0.76, 0.92, 0.80 },
		urgent = { 1, 0.62, 0.42 },
		glowEdge = { 0.70, 1, 0.76, 1 },
		iconEdge = { 0.56, 0.82, 0.64, 0.9 },
		frost = "Mist", frostTint = { 0.60, 1, 0.80, 0.12 },
		crest = "Crest", crestTint = { 0.66, 1, 0.74, 0.15 },
		shards = "Leaf", shardTint = { 0.66, 0.96, 0.62, 0.9 },
		rim = "Rim", breathe = true, breatheTime = 3.2,
		burst = false, studs = false, ring = false, round = false,
	},
	widgets = "blizzard",
}

Bound.InstallSkin(ns, {
	skins = { dream = dream },
	order = { "dream", "blizzard", "flat" },
	default = "dream",
	about = { dream = "Emerald Dream green with a soft edge, mist and leaves." },
})
Bound.InstallBuffTimers(ns)
Bound.InstallMinimap(ns)
