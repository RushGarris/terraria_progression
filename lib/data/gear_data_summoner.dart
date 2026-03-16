import '../models/gear_item.dart';
import '../models/gear_loadout.dart';

const Map<String, GearLoadout> summonerLoadouts = {
  'pre_eye': GearLoadout(
    weapons: [
      GearItem(name: 'Slime Staff'),
      GearItem(name: 'Flinx Staff'),
      GearItem(name: 'Finch Staff'),
      GearItem(name: 'Vampire Frog Staff'),
    ],
    armor: [
      GearItem(name: 'Flinx Fur Coat'),
    ],
    accessories: [
      GearItem(name: 'Dunerider Boots'),
      GearItem(name: 'Sandstorm in a Bottle / Fledgling Wings'),
      GearItem(name: 'Shark Tooth Necklace'),
      GearItem(name: 'Anklet of the Wind'),
      GearItem(name: 'Frog Leg / Shiny Red Balloon'),
      GearItem(name: 'Band of Regeneration'),
    ],
    permUpgrades: [
      GearItem(name: 'Life Crystal (15)'),
      GearItem(name: 'Vital Crystal'),
    ],
  ),

  'pre_evil_boss': GearLoadout(
    weapons: [
      GearItem(name: 'Vampire Frog Staff'),
      GearItem(name: 'Hornet Staff'),
      GearItem(name: 'Flinx Staff'),
      GearItem(name: 'Finch Staff'),
    ],
    armor: [
      GearItem(name: 'Flinx Fur Coat / Bee Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Frog Gear'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_skeletron': GearLoadout(
    weapons: [
      GearItem(name: 'Hornet Staff'),
      GearItem(name: 'Vampire Frog Staff'),
      GearItem(name: 'Imp Staff'),
      GearItem(name: 'Flinx Staff'),
    ],
    armor: [
      GearItem(name: 'Bee Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Worm Scarf / Brain of Confusion'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_wall_of_flesh': GearLoadout(
    weapons: [
      GearItem(name: 'Imp Staff'),
      GearItem(name: 'Hornet Staff'),
      GearItem(name: 'Vampire Frog Staff'),
      GearItem(name: 'Blade of Grass'),
    ],
    armor: [
      GearItem(name: 'Bee Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Obsidian Shield'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_mech_bosses': GearLoadout(
    weapons: [
      GearItem(name: 'Spider Staff'),
      GearItem(name: 'Pirate Staff'),
      GearItem(name: 'Sanguine Staff'),
      GearItem(name: 'Cool Whip / Spinal Tap'),
    ],
    armor: [
      GearItem(name: 'Spider Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T1 Wings', note: 'Fairy, Fin, Frozen, or Harpy Wings'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Frozen Turtle Shell / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'Demon Heart'),
    ],
  ),

  'pre_plantera': GearLoadout(
    weapons: [
      GearItem(name: 'Sanguine Staff'),
      GearItem(name: 'Spider Staff'),
      GearItem(name: 'Firecracker / Cool Whip'),
      GearItem(name: 'Optic Staff'),
    ],
    armor: [
      GearItem(name: 'Spider / Hallowed Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T2/T3 Wings', note: 'Bat, Bee, Butterfly, or Flame Wings'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Frozen Turtle Shell / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'Life Fruit (20)'),
      GearItem(name: 'Aegis Fruit'),
    ],
  ),

  'pre_golem': GearLoadout(
    weapons: [
      GearItem(name: 'Sanguine Staff / Tempest Staff'),
      GearItem(name: 'Optic Staff'),
      GearItem(name: 'Deadly Sphere Staff'),
      GearItem(name: 'Firecracker / Dark Harvest'),
    ],
    armor: [
      GearItem(name: 'Tiki / Spooky Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T4/T5 Wings', note: 'Hoverboard, Bone, Spectre, Beetle, Mothron, Festive, Spooky, or Tattered Fairy Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Frozen Shield / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_lunar_events': GearLoadout(
    weapons: [
      GearItem(name: 'Tempest Staff / Xeno Staff'),
      GearItem(name: 'Deadly Sphere Staff'),
      GearItem(name: 'Kaleidoscope / Dark Harvest'),
      GearItem(name: 'Stardust Cell Staff'),
    ],
    armor: [
      GearItem(name: 'Spooky Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Celestial Shell'),
      GearItem(name: 'Soaring Insignia'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_moon_lord': GearLoadout(
    weapons: [
      GearItem(name: 'Stardust Dragon Staff'),
      GearItem(name: 'Stardust Cell Staff'),
      GearItem(name: 'Xeno Staff'),
      GearItem(name: 'Kaleidoscope'),
    ],
    armor: [
      GearItem(name: 'Stardust Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Summoner Emblem'),
      GearItem(name: 'Papyrus Scarab'),
      GearItem(name: 'Celestial Shell'),
      GearItem(name: 'Soaring Insignia'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),
};
