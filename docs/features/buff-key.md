---
title: Buff key
parent: Features
nav_order: 2
description: One key that casts what a card asks for, then Mark of the Wild on the next group member who needs it.
---

# Buff key

Press one key, out of combat, and Dreambound casts the next buff that is needed: first your own, then the group's.

## What it does

- Each press casts **one** spell: the next thing that is needed.
- The order is always the same:
  1. **The top card.** If a [buff card](buffs.html) is offering a cast (a buff with 2 minutes or less left, or a missing buff with **When missing** on), the key casts that, the same as clicking the card. With several cards up, the order is Mark of the Wild, Thorns, Omen of Clarity.
  2. **Mark of the Wild** on the next group member in range who is missing it.
- Thorns stays on you. The key never casts it on the group.
- It works in a party and in a raid. You are covered by the cards, so the group step skips you.
- A buff with less than 1 minute left counts as missing.
- **Lower-level players get the rank they can take.** A buff only goes on someone at most 10 levels below the rank's spell level, so a level 22 gets Mark of the Wild rank 2, not rank 7.
- Gift of the Wild counts: someone who has it doesn't get Mark of the Wild on top. The key itself casts Mark of the Wild, highest rank you know.
- It skips players who are offline, dead, not friendly, too far away or out of range of the spell.
- With **Show** off for Mark of the Wild on the **Buffs** page, the group step is skipped.
- When there is nothing to do, a press says `nothing to buff right now.` in chat.

## How to use it

1. Type `/dream` and open the **Extras** page.
2. Under **Buff key**, click the button next to **Key**, then press the key you want (for example a mouse button). Esc cancels.
3. Out of combat, press the key until it says there is nothing to buff. Each press casts one buff.

## Settings

In `/dream`, page **Extras**, section **Buff key**:

| Setting | Default | What it does |
| --- | --- | --- |
| Key | Not set | The key itself. **Clear** removes it. |

Whether the key buffs the group follows the **Show** switch for Mark of the Wild on the **Buffs** page. See [Buffs](buffs.html#settings).

## Good to know

**Does it work in combat?**
No. The game does not let addons pick targets for you in combat, so the key does nothing until combat ends. Buff before the pull.

**Someone is missing Mark of the Wild but the key says there is nothing to buff.**
Common reasons: the player is out of range, or Dreambound can't read their buffs. When some of a player's buffs are hidden from addons, Dreambound counts that player as buffed rather than nag you.

**Does it use Gift of the Wild?**
No. The key casts Mark of the Wild one player at a time. Cast Gift of the Wild yourself.

**My key does something else in the game too.**
Dreambound binds the key on top of your normal bindings while it is set. Pick a key you don't use for anything else, or **Clear** it to get the old binding back.
