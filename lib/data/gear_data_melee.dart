import '../models/gear_item.dart';
import '../models/gear_loadout.dart';

const Map<String, GearLoadout> meleeLoadouts = {
  'pre_eye': GearLoadout(
    weapons: [
      GearItem(name: 'Blade of Grass / Starfury'),
      GearItem(name: 'Storm Spear / Swordfish'),
      GearItem(name: 'Thorn Chakram / Trimarang'),
      GearItem(name: 'Amazon'),
    ],
    armor: [
      GearItem(name: 'Platinum / Gold Armor'),
    ],
    accessories: [
      GearItem(
        name: 'Hermes Boots / Flurry Boots',
        imagePath: 'assets/gear/accessories/hermes_boots.png',
      ),
      GearItem(name: 'Sandstorm in a Bottle'),
      GearItem(name: 'Band of Regeneration'),
      GearItem(name: 'Feral Claws'),
      GearItem(name: 'Shark Tooth Necklace'),
      GearItem(name: 'Frog Leg / Shiny Red Balloon'),
    ],
    permUpgrades: [
      GearItem(name: 'Life Crystal (15)'),
      GearItem(name: 'Vital Crystal'),
    ],
  ),

  'pre_evil_boss': GearLoadout(
    weapons: [
      GearItem(name: 'Blade of Grass / Starfury'),
      GearItem(name: 'The Rotted Fork / Storm Spear'),
      GearItem(name: "Ball O' Hurt / Trimarang"),
      GearItem(name: 'Artery / Amazon'),
    ],
    armor: [
      GearItem(name: 'Platinum / Gold Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Feral Claws'),
      GearItem(name: 'Shark Tooth Necklace'),
      GearItem(name: 'Frog Gear'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_skeletron': GearLoadout(
    weapons: [
      GearItem(name: 'Volcano / Phaseblade'),
      GearItem(name: 'The Rotted Fork / Storm Spear'),
      GearItem(name: 'Flamarang'),
      GearItem(name: 'Hive-Five'),
    ],
    armor: [
      GearItem(name: 'Molten Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Feral Claws'),
      GearItem(name: 'Stinger / Sweetheart Necklace'),
      GearItem(name: 'Worm Scarf / Brain of Confusion'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_wall_of_flesh': GearLoadout(
    weapons: [
      GearItem(name: 'Nights Edge'),
      GearItem(name: 'Dark Lance'),
      GearItem(name: 'Sunfury / Flamarang'),
      GearItem(name: 'Hive-Five'),
    ],
    armor: [
      GearItem(name: 'Molten Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'Bundle of Horseshoe Balloons'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Feral Claws'),
      GearItem(name: 'Obsidian Shield'),
      GearItem(name: 'Worm Scarf / Brain of Confusion'),
    ],
    permUpgrades: [
      GearItem(name: 'n/a'),
    ],
  ),

  'pre_mech_bosses': GearLoadout(
    weapons: [
      GearItem(name: 'Flint / Ice Sickle'),
      GearItem(name: 'Obsidian Swordfish'),
      GearItem(name: 'Bananarang'),
      GearItem(name: 'Amarok / Hel-Fire'),
    ],
    armor: [
      GearItem(name: 'Titanium / Adamantite Armor'),
    ],
    accessories: [
      GearItem(name: 'Terraspark Boots'),
      GearItem(name: 'T1 Wings', note: 'Fairy, Fin, Frozen, or Harpy Wings'),
      GearItem(name: 'Shield of Cthulhu'),
      GearItem(name: 'Beserkers Glove'),
      GearItem(name: 'Warrior Emblem'),
      GearItem(name: 'Frozen Turtle Shell / Ankh Shield'),
      GearItem(name: 'Star Veil / Charm of Myths'),
    ],
    permUpgrades: [
      GearItem(name: 'Demon Heart'),
    ],
  ),

'pre_plantera': GearLoadout(
  weapons: [
    GearItem(name: "True Excalibur / True Night's Edge"),
    GearItem(name: 'Ghastly Glaive / Chlorophyte Partisan'),
    GearItem(name: 'Light Disc'),
    GearItem(name: "Valkyrie Yoyo / Red's Throw"),
  ],
  armor: [
    GearItem(name: 'Hallowed / Turtle Armor'),
  ],
  accessories: [
    GearItem(name: 'Terraspark Boots'),
    GearItem(name: 'T2/T3 Wings', note: 'Bat, Bee, Butterfly, or Flame Wings'),
    GearItem(name: 'Shield of Cthulhu'),
    GearItem(name: 'Fire Gauntlet / Yoyo Bag*'),
    GearItem(name: 'Moon Stone / Warrior Emblem'),
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
    GearItem(name: 'Terra Blade / The Horseman\'s Blade'),
    GearItem(name: 'Scourge of the Corruptor / North Pole'),
    GearItem(name: 'Flower Pow / Vampire Knives'),
    GearItem(name: 'The Eye of Cthulhu'),
  ],
  armor: [
    GearItem(name: 'Hallowed / Turtle Armor'),
  ],
  accessories: [
    GearItem(name: 'Terraspark Boots'),
    GearItem(name: 'T4/T5 Wings', note: 'Hoverboard, Bone, Spectre, Beetle, Mothron, Festive, Spooky, or Tattered Fairy Wings'),
    GearItem(name: 'Master Ninja Gear'),
    GearItem(name: 'Fire Gauntlet'),
    GearItem(name: 'Moon Stone / Warrior Emblem'),
    GearItem(name: 'Frozen Shield / Ankh Shield'),
    GearItem(name: 'Star Veil / Charm of Myths'),
  ],
  permUpgrades: [
    GearItem(name: 'n/a'),
   
  ],
),

  'pre_lunar_events': GearLoadout(
  weapons: [
    GearItem(name: 'Terra Blade / Flying Dragon'),
    GearItem(name: 'Scourge of the Corruptor / North Pole'),
    GearItem(name: 'Flairon / Possessed Hatchet'),
    GearItem(name: 'The Eye of Cthulhu'),
  ],
  armor: [
    GearItem(name: 'Beetle Armor'),
  ],
  accessories: [
    GearItem(name: 'Terraspark Boots'),
    GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
    GearItem(name: 'Master Ninja Gear'),
    GearItem(name: 'Fire Gauntlet'),
    GearItem(name: 'Celestial Shell'),
    GearItem(name: 'Frozen Shield / Ankh Shield'),
    GearItem(name: 'Soaring Insignia'),
  ],
  permUpgrades: [
    GearItem(name: 'n/a'),
    
  ],
),

  'pre_moon_lord': GearLoadout(
  weapons: [
    GearItem(name: 'Terra Blade / Flying Dragon'),
    GearItem(name: 'Daybreak'),
    GearItem(name: 'Solar Eruption'),
    GearItem(name: 'The Eye of Cthulhu'),
  ],
  armor: [
    GearItem(name: 'Beetle Armor'),
  ],
  accessories: [
    GearItem(name: 'Terraspark Boots'),
    GearItem(name: 'T6 Wings', note: 'Betsys, Empress, or Fishron Wings'),
    GearItem(name: 'Master Ninja Gear'),
    GearItem(name: 'Fire Gauntlet'),
    GearItem(name: 'Celestial Shell'),
    GearItem(name: 'Frozen Shield / Ankh Shield'),
    GearItem(name: 'Soaring Insignia'),
  ],
  permUpgrades: [
    GearItem(name: 'n/a'),
    
  ],
),
};