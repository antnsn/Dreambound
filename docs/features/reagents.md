---
title: Reagents
parent: Features
nav_order: 3
description: A card when your Wild Berries or Wild Thornroot for Gift of the Wild, or your seeds for Rebirth, run low.
---

# Reagents

Gift of the Wild uses Wild Berries or Wild Thornroot, and Rebirth uses a seed. Dreambound tells you before you run out, so you can stock up at the next reagent vendor.

## What it does

- One card, **Reagents running low**, shows when either reagent is at or below its limit.
- **Gift of the Wild:** once you know Gift of the Wild. With the first rank it counts **Wild Berries**; once you know the second rank it counts **Wild Thornroot**.
- **Rebirth seeds:** once you know Rebirth. It counts the seed for the best Rebirth rank you know:

| Rebirth rank | Seed |
| --- | --- |
| 1 | Maple Seeds |
| 2 | Stranglethorn Seeds |
| 3 | Ashwood Seeds |
| 4 | Hornbeam Seeds |
| 5 | Ironwood Seeds |

- The card shows the counts, for example `Wild Berries 3` or `Wild Thornroot 2 · Ashwood Seeds 1`. When one of them is at 0, the text turns to the warning color (red, or a warm orange in the Dream skin).
- The card is hidden in combat and comes back after the fight.
- It updates when your bags change, so it goes away as soon as you buy more.

## How to use it

1. Nothing to set up: both warnings are on by default.
2. When the card shows, visit a reagent vendor and buy berries, thornroot or seeds.
3. Want more warning? Raise the limits on the **Reagents** page.

Dreambound does not buy reagents for you.

## Settings

In `/dream`, page **Reagents**:

| Setting | Default | What it does |
| --- | --- | --- |
| Warn when Gift of the Wild reagents run low | On | The berries or thornroot part of the card. |
| Berries or Thornroot: warn at | 5 | Warns at this many or fewer, 0 to 40. |
| Warn when Rebirth seeds run low | On | The seed part of the card. |
| Seeds: warn at | 1 | Warns at this many seeds or fewer, 0 to 10. |

## Good to know

**I have Wild Berries but the card says Wild Thornroot 0.**
Once you know the second rank of Gift of the Wild, Dreambound counts Wild Thornroot, the reagent that rank uses. Wild Berries no longer count.

**I have Maple Seeds but the card says Stranglethorn Seeds 0.**
Dreambound only counts the seed for your best Rebirth rank. Seeds for lower ranks don't count.

**Set to 0, does it turn the warning off?**
No. At 0 it still warns when you have none left. Use the switch to turn a warning off.

**No card before I learn the spell.**
That is on purpose. The berries and thornroot warning starts once you know Gift of the Wild, the seed warning once you know Rebirth.
