<!-- summary (CurseForge "Summary" field, at most 256 characters):
Druid helper for WoW: Forever: one-click cards when Mark of the Wild, Thorns or Omen of Clarity is missing or ending, reagent and Rebirth seed warnings, combo points in Cat Form, a rage bar in Bear Form, and Moonglade and forms beside the Escape menu.
-->

# Dreambound

**The druid helper for World of Warcraft: Forever: your buffs and reagents, explained.**

Dreambound keeps your druid buffs up and your reagents stocked: a card when Mark of the Wild, Thorns or Omen of Clarity is missing or running out, and a warning before your Gift of the Wild reagents or Rebirth seeds run out.

**Full guide:** https://antnsn.github.io/Dreambound/

**Beta:** Dreambound is new. Spell IDs come from Classic and are checked on Forever before 0.1.0; tell us what doesn't work.

## Buffs
- **Mark of the Wild, Thorns** and **Omen of Clarity** (talent): a card when one is missing or about to run out. Click it to cast.
- **Gift of the Wild** counts as Mark of the Wild, so you don't overwrite it.

## Reagents
- Says when your **Wild Berries or Wild Thornroot** (for Gift of the Wild) run low.
- Says when the **seed for your best Rebirth rank** (Maple, Stranglethorn, Ashwood, Hornbeam or Ironwood) runs low.

## Cure
- A **grid of your group** that lights up when someone has Curse or Poison you can remove: click for Remove Curse, right-click for Cure Poison. Works in combat.
- A key for each that casts on whoever is under your mouse, in any raid frame too.

## Combo points
- **In Cat Form, five claws**, one lit for each combo point on your target. Shown while you have points or are in combat.
- **A flash at 5**: time for a finisher.
- Move and resize it like the cards.

## Rage bar
- **In Bear Form, your rage in a bar of its own**, with the number on it and a glow at full rage.
- **Horizontal or vertical**, movable and resizable like the cards.
- Painted in the Dream skin; a plain bar in the Blizzard and Flat skins.

## Travel
- **Press Escape**: beside the game menu you get Teleport: Moonglade, Travel Form, Aquatic Form and your Hearthstone.

## Also in it
- **Buff key** (Extras page): out of combat, each press casts the next thing a card asks for, then Mark of the Wild on the next group member in range who is missing it.
- **Well Rested and Well Fed**: a countdown before they run out, with a sound if you like.
- **Camp Benefits**: a countdown before the campfire buff runs out, and which ticked camp features it lacks.
- **Carrot on a Stick** (Extras page, off by default): worn while you ride, in the trinket slot you pick; your own trinket goes back on when you get off. Not in instances, and never in combat.
- **Explained**: hover over a card or button for a plain-word explanation of what it does and why (can be turned off).
- **Your layout**: every frame can be moved, snapped to a grid and scaled (`/dream unlock`).
- **Three skins**: the druid look (Emerald Dream), Blizzard and Flat.
- Loads on druids only.

## Commands
- `/dream`: open the options
- `/dream help`: list every command
- `/dream unlock`: show every frame so you can drag it into place
- `/dream lock`: lock the frames again
- `/dream reset`: put every frame back where it started
- `/dream grid [size]`: snap to a grid while moving, or set its size
- `/dream minimap`: show or hide the minimap button
- `/dream explain`: turn the plain-word explanations in tooltips on or off

## Ideas and contributions
- **Missing something?** New features are added on request: leave a comment here.
- **Feel free to contribute**: the code is on GitHub, https://github.com/antnsn/Dreambound (issues and pull requests welcome).
- **Want a Bound addon for another class?** The shared core, LibBound, has a guide and API reference: https://antnsn.github.io/LibBound/

## The Bound family
Dreambound is one of the Bound addons, one per class, built on the same core: Lightbound (paladin), Chronobound (mage), Stormbound (shaman), Packbound (hunter), Spiritbound (priest), Felbound (warlock), Dreambound (druid), Ragebound (warrior) and Shadowbound (rogue). They look like their class but work the same way, so if you know one, you know them all.

## Changelog
<!-- changelog:start -->
### 0.1.0 beta 5

- **Buff key: the right rank for lower-level players**: someone more than 10 levels below a rank gets the best Mark of the Wild they can take (a level 22 gets rank 2).
- **Carrot on a Stick** (Extras page, off by default): put it on when you mount, in the trinket slot you pick, and your own trinket back when you get off. Not in instances; in combat it waits until the fight is over. From LibBound, the same as in Lightbound.
- The Extras page is tidier: the Well-Rested and Well Fed switches sit in one row each.

### 0.1.0 beta 4

- Built on the latest LibBound, the shared core of the Bound addons, with its small fixes. Published on CurseForge straight from GitHub now.

### 0.1.0 beta 3

- **Rage bar** in Bear Form: Marius' painted bar with the stone and bear claws, the number on it, a glow at full rage. Horizontal or vertical, movable and resizable; settings on the new Rage bar page.
- In the Blizzard and Flat skins the rage bar and the combo points take a plain look.

### 0.1.0 beta 2

- **Combo point bar** in Cat Form: five claws, one lit with a warm glow for each combo point on your target, shown while you have points or are in combat, a few flashes when you reach 5. Movable and resizable; settings on the new Combo points page.

### 0.1.0 beta 1

- First test build: Mark of the Wild, Thorns and Omen of Clarity cards (click to cast), Gift of the Wild reagent and Rebirth seed warnings, Teleport: Moonglade, Travel Form and Aquatic Form beside the Escape menu, the buff key (Mark of the Wild on your group), Well-Rested and Well Fed, explanations, movable frames, Dream, Blizzard and Flat skins. Built on LibBound-1.0.
<!-- changelog:end -->
