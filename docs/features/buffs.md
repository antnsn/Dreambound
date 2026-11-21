---
title: Buffs
parent: Features
nav_order: 1
description: A card when Mark of the Wild, Thorns or Omen of Clarity is missing or running out. Click it to cast.
---

# Buffs

Your long druid buffs, watched for you. When one runs low or drops off, a card shows up, and one click puts it back.

## What it does

Dreambound watches three buffs on you:

| Buff | On by default | Group version that also counts |
| --- | --- | --- |
| Mark of the Wild | Yes | Gift of the Wild |
| Thorns | Yes | |
| Omen of Clarity | Yes | |

For each one:

- **Running out.** With 2 minutes left, a message shows in the middle of the screen and in chat, for example `Thorns: 2 min left`, and a card appears with a countdown.
- **Gone.** When the buff is missing, the card shows **Missing: click to cast**, faded. Once, out of combat and while you are alive, a message says `Mark of the Wild is gone, rebuff`.
- **Click to cast.** Out of combat, click the card and Dreambound casts the highest rank you know on yourself.
- **Gift of the Wild counts.** A Gift of the Wild on you, from you or another druid, counts as Mark of the Wild, so the card doesn't ask you to overwrite it. The click always casts Mark of the Wild.
- **Not learned, not shown.** A buff you don't know yet never shows a card or a warning. Omen of Clarity is a Restoration talent, so its card only appears once you have the talent.

The card goes away as soon as the buff is back.

## How to use it

1. Play as usual. Nothing shows while all your buffs have more than 2 minutes left.
2. When a card shows, click it out of combat. Hover over it first if you want to see which spell it will cast.
3. Don't want a buff watched? Open `/dream`, page **Buffs**, and untick **Show** under that buff.

To move the cards, see [Frames and minimap](frames-and-minimap.html).

## Settings

In `/dream`, page **Buffs**. Each buff has its own row with three switches:

| Setting | Default | What it does |
| --- | --- | --- |
| Show | On | Watches this buff at all. Off means no card and no messages for it. For Mark of the Wild it also stops the [buff key](buff-key.html) from casting it on the group. |
| Sound | Off | Plays the raid warning sound with the messages. |
| When missing | On | Shows the **Missing: click to cast** card and the one-time "is gone, rebuff" message when the buff is gone. Off: you only get the warning and countdown before it runs out. |

## Good to know

**Can I click the card in combat?**
No. The game does not let addons cast for you in combat, so the click only works out of combat. The card stays visible, so you know what to do after the fight.

**Can I change the 2 minutes?**
Not for the druid buffs. The time is fixed at 2 minutes. Well-Rested and Well Fed have a slider (see [Well-Rested and Well Fed](well-rested-and-well-fed.html)).

**Does the card cast Gift of the Wild?**
No. The card always casts Mark of the Wild on you. Cast Gift of the Wild yourself; the [reagents card](reagents.html) tells you when its berries or thornroot run low.

**I turned When missing off and now the card never shows for a missing buff.**
That is what the switch does. With it off, the card only shows for the last 2 minutes of a buff. The [buff key](buff-key.html) also skips a missing buff then, since it casts what the cards ask for.

**Right after login or a loading screen, nothing shows for a few seconds.**
Dreambound waits about 5 seconds after you enter the world, so it doesn't call a buff missing before the game has filled in your buffs.

**In combat a buff dropped and no card came up.**
Forever hides some buffs from addons in combat. Dreambound doesn't call a buff missing when it can't see it, and checks again after the fight.
