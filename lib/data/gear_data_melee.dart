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
};