import '../models/gear_item.dart';

class GearLoadout {
  final List<GearItem> weapons;
  final List<GearItem> armor;
  final List<GearItem> accessories;
  final List<GearItem> permUpgrades;

  const GearLoadout({
    required this.weapons,
    required this.armor,
    required this.accessories,
    required this.permUpgrades,
  });
}

class GearData {
  /// Key format: "<classId>:<stageId>"
  /// Example: "melee:pre_eye"
  static const Map<String, GearLoadout> loadouts = {
    'melee:pre_eye': GearLoadout(
      weapons: [
        
        GearItem(name: 'Blade of Grass / Starfury',),
        GearItem(name: 'Storm Spear / Swordfish',),
        GearItem(name: 'Thron Chakram / Trimarang',),
        GearItem(name: 'Amazon',),
        
      ],
      armor: [
        GearItem(name: 'Platinum / Gold Armor',),
      ],
      accessories: [
        GearItem(name: 'Hermes Boots / Flurry Boots', imagePath: 'assets/gear/accessories/hermes_boots.png'),
        GearItem(name: 'Sandstorm in a Bottle', ),
        GearItem(name: 'Band of Regeneration', ),
        GearItem(name: 'Feral Claws', ),
        GearItem(name: 'Shark Tooth Necklace',),
        GearItem(name: 'Frog Leg / Shiny Red Balloon',),
      ],
      permUpgrades: [
        GearItem(name: "Life Crystal (15)" ),
        GearItem(name: "Vital Crystal" ),
      ]
    ),
      
    'melee:pre_evil_boss': GearLoadout(
            weapons: [
        
        GearItem(name: 'Blade of Grass / Starfury',),
        GearItem(name: 'The Rotted Fork / Storm Spear',),
        GearItem(name: "Ball O' Hurt / Trimarang",),
        GearItem(name: 'Artery / Amazon',),
        
      ],
      armor: [
        GearItem(name: 'Platinum / Gold Armor',),
      ],
      accessories: [
        GearItem(name: 'Terraspark Boots',),
        GearItem(name: 'Bundle of Horseshoe Balloons', ),
        GearItem(name: 'Shield of Cythulu', ),
        GearItem(name: 'Feral Claws', ),
        GearItem(name: 'Shark Tooth Necklace',),
        GearItem(name: 'Frog Gear',),
        
      ],

      permUpgrades: [
        GearItem(name: "n/a"),
      ]
    ),

        'melee:pre_skeletron': GearLoadout(
      weapons: [
        
        GearItem(name: 'Volcano / Phaseblade',),
        GearItem(name: 'The Rotted Fork / Storm Spear',),
        GearItem(name: 'Flamarang',),
        GearItem(name: 'Hive-Five',),
        
      ],
      armor: [
        GearItem(name: 'Molten Armor',),
      ],
      accessories: [
        GearItem(name: 'Terraspark Boots',),
        GearItem(name: 'Bundle of Horseshoe Balloons', ),
        GearItem(name: 'Shield of Cythulu', ),
        GearItem(name: 'Feral Claws', ),
        GearItem(name: 'Stinger / Sweethear Necklace',),
        GearItem(name: 'Worm Scarf / Brain of Confusion',),
        
      ],
      permUpgrades: [
        GearItem(name: "n/a")
      ]
    ),


  };

  static GearLoadout? getLoadout({
    required String classId,
    required String stageId,
  }) {
    return loadouts['$classId:$stageId'];
  }
}
