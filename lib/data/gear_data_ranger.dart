import '../models/gear_item.dart';
import '../models/gear_loadout.dart';

const Map<String, GearLoadout> rangerLoadouts = {
  'pre_eye': GearLoadout(
    weapons: [
      GearItem(name: 'Minishark / Boomstick'),
      GearItem(name: 'Blood Rain Bow'),
      GearItem(name: 'Sandgun'),
      GearItem(name: 'Platinum Bow / Gold Bow'),
    ],
    armor: [
      GearItem(name: 'Fossil Armor'),
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
      GearItem(name: 'Minishark / Boomstick'),
      GearItem(name: 'Blood Rain Bow'),
      GearItem(name: 'Sandgun'),
      GearItem(name: 'Bee\'s Knees'),
    ],
    armor: [
      GearItem(name: 'Fossil Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Shark Tooth Necklace'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Frog Gear'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_skeletron': GearLoadout(
    weapons: [
      GearItem(name: 'Minishark / Boomstick'),
      GearItem(name: 'Bee\'s Knees'),
      GearItem(name: 'Blood Rain Bow'),
      GearItem(name: 'Sandgun'),
    ],
    armor: [
      GearItem(name: 'Fossil / Necro Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Shark Tooth Necklace'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Worm Scarf / Brain of Confusion'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_wall_of_flesh': GearLoadout(
    weapons: [
      GearItem(name: 'Hellwing Bow / Molten Fury'),
      GearItem(name: 'Phoenix Blaster'),
      GearItem(name: 'Sharanga'),
      GearItem(name: 'Bee\'s Knees'),
    ],
    armor: [
      GearItem(name: 'Fossil / Necro Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Obsidian Shield'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_mech_bosses': GearLoadout(
    weapons: [
      GearItem(name: 'Daedalus Stormbow'),
      GearItem(name: 'Dart Rifle / Dart Pistol'),
      GearItem(name: 'Adamantite / Titanium Repeater'),
      GearItem(name: 'Clockwork Assault Rifle'),
    ],
    armor: [
      GearItem(name: 'Titanium / Adamantite Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T1 Wings', note: 'Fairy, Fin, Frozen, or Harpy Wings'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Frozen Turtle Shell / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'Demon Heart'),
    ],
  ),

  'pre_plantera': GearLoadout(
    weapons: [
      GearItem(name: 'Megashark / Onyx Blaster'),
      GearItem(name: 'Daedalus Stormbow'),
      GearItem(name: 'Dart Rifle / Dart Pistol'),
      GearItem(name: 'Chlorophyte Shotbow'),
    ],
    armor: [
      GearItem(name: 'Hallowed / Chlorophyte Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T2/T3 Wings', note: 'Bat, Bee, Butterfly, or Flame Wings'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
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
      GearItem(name: 'Tsunami / Megashark'),
      GearItem(name: 'Chlorophyte Shotbow'),
      GearItem(name: 'Dart Rifle / Dart Pistol'),
      GearItem(name: 'Nail Gun'),
    ],
    armor: [
      GearItem(name: 'Hallowed / Chlorophyte Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T4/T5 Wings', note: 'Hoverboard, Bone, Spectre, Beetle, Mothron, Festive, Spooky, or Tattered Fairy Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Frozen Shield / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_lunar_events': GearLoadout(
    weapons: [
      GearItem(name: 'Tsunami / Eventide'),
      GearItem(name: 'Aerial Bane'),
      GearItem(name: 'Phantasm'),
      GearItem(name: 'Charged Blaster Cannon'),
    ],
    armor: [
      GearItem(name: 'Shroomite Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Celestial Shell'),
      GearItem(name: 'Soaring Insignia'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_moon_lord': GearLoadout(
    weapons: [
      GearItem(name: 'Phantasm / Tsunami'),
      GearItem(name: 'Vortex Beater'),
      GearItem(name: 'Eventide'),
      GearItem(name: 'Aerial Bane'),
    ],
    armor: [
      GearItem(name: 'Shroomite Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
      GearItem(name: 'Master Ninja Gear'),
      GearItem(name: 'Ranger Emblem'),
      GearItem(name: 'Magic Quiver'),
      GearItem(name: 'Celestial Shell'),
      GearItem(name: 'Soaring Insignia'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),
};
