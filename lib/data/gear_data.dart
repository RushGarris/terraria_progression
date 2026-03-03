import '../models/gear_loadout.dart';

import 'gear_data_melee.dart';
import 'gear_data_ranger.dart';
import 'gear_data_mage.dart';
import 'gear_data_summoner.dart';

class GearData {
  static const Map<String, Map<String, GearLoadout>> all = {
    'melee': meleeLoadouts,
    'ranger': rangerLoadouts,
    'mage': mageLoadouts,
    'summoner': summonerLoadouts,
  };

  static GearLoadout? getLoadout({
    required String classId,
    required String stageId,
  }) {
    return all[classId]?[stageId];
  }
}