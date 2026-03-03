import 'gear_item.dart';

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