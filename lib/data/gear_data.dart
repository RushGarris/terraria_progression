import '../models/gear_item.dart';

class GearLoadout {
  final List<GearItem> weapons;
  final List<GearItem> armor;
  final List<GearItem> accessories;

  const GearLoadout({
    required this.weapons,
    required this.armor,
    required this.accessories,
  });
}

class GearData {
  /// Key format: "<classId>:<stageId>"
  /// Example: "melee:pre_eye"
  static const Map<String, GearLoadout> loadouts = {
    'melee:pre_eye': GearLoadout(
      weapons: [
        
        GearItem(name: 'Blade of Grass', note: 'Made from jungle materials'),
        GearItem(name: 'Starfury', note: 'Found in sky island chests'),
        GearItem(name: 'Mandible Blade', note: 'Dropped by Antlion Chargers/Swarmers'),
        GearItem(name: 'Amazon', note: 'Made from jungle materials'),
        GearItem(name: 'Stylish Scissors', note: 'Dropped by killing the Stylist NPC'),
      ],
      armor: [
        GearItem(name: 'Platinum / Gold Armor', note: 'Best basic ore armor'),
        GearItem(name: 'Fossil Armor', note: 'Not melee-focused, but decent early defense'),
      ],
      accessories: [
        GearItem(name: 'Hermes Boots / Flurry Boots', note: 'Found in gold chests', imagePath: 'assets/gear/accessories/hermes_boots.png'),
        GearItem(name: 'Cloud in a Bottle', note: 'Found in gold chests', imagePath: 'assets/classes/melee.jpg'),
        GearItem(name: 'Band of Regeneration', note: 'Found in gold chests'),
        GearItem(name: 'Feral Claws', note: 'Found in jungle chests'),
        GearItem(name: 'Shark Tooth Necklace', note: 'Dropped by zombies'),
        GearItem(name: 'String*', note: 'Only use if using yoyo'),
      ],
    ),
  };

  static GearLoadout? getLoadout({
    required String classId,
    required String stageId,
  }) {
    return loadouts['$classId:$stageId'];
  }
}
