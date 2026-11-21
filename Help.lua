-- Every plain-word explanation in one place (tooltips show them while "Explain things" is on).
local _, ns = ...
if ns.disabled then return end

ns.Help = {
	markOfTheWild = "Mark of the Wild gives armor, all stats and resistances. Keep it on yourself and your group. Gift of the Wild counts.",
	thorns = "Thorns hurts anything that hits you in melee. Keep it up while you level or tank.",
	omenOfClarity = "Omen of Clarity (a talent) sometimes makes your next spell or ability free. Keep it up all the time.",
	giftReagent = "Gift of the Wild buffs your whole group at once and uses Wild Berries (rank 1) or Wild Thornroot (rank 2), sold by reagent vendors.",
	seeds = "Rebirth brings a dead player back to life, even in combat. Each rank uses its own seed (Maple, Stranglethorn, Ashwood, Hornbeam, Ironwood), sold by reagent vendors.",
	moonglade = "Teleport: Moonglade takes you to Moonglade, where druids learn some of their spells. Use your Hearthstone or the flight master to leave.",
	travelForm = "Travel Form makes you run 40% faster outdoors. You can't attack or cast spells in it.",
	aquaticForm = "Aquatic Form lets you swim faster and breathe under water.",
	hearthstone = "Your Hearthstone takes you back to the inn you set it to. Talk to an innkeeper to change it.",
}
