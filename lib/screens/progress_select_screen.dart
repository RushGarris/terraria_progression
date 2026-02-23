import 'package:flutter/material.dart';
import '../models/player_class.dart';
import 'gear_results_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressSelectScreen extends StatefulWidget {
  final PlayerClass playerClass;

  const ProgressSelectScreen({super.key, required this.playerClass});

  static const List<ProgressStage> stages = [
    ProgressStage(
      id: 'pre_eye',
      title: 'Pre-Eye',
      subtitle: 'Early exploration, basic gear, first upgrades',
      gifPath: 'assets/bosses/Eye_of_Cthulhu.gif',
    ),
    ProgressStage(
      id: 'pre_evil_boss',
      title: 'Pre-Evil Boss',
      subtitle: 'Before Eater of Worlds / Brain of Cthulhu',
      gifPath: 'assets/bosses/Brain_of_Cthulhu.gif',
    ),
    ProgressStage(
      id: 'pre_skeletron',
      title: 'Pre-Skeletron',
      subtitle: 'Dungeon prep and mid-prehardmode upgrades',
      gifPath: 'assets/bosses/skeletron.png',
    ),
    ProgressStage(
      id: 'pre_wall_of_flesh',
      title: 'Pre-Wall of Flesh',
      subtitle: 'Finish prehardmode, prep for Hardmode',
      gifPath: 'assets/bosses/Wall_of_Flesh.gif',
    ),
    ProgressStage(
      id: 'pre_mech_bosses',
      title: 'Pre-Mech Bosses',
      subtitle: 'Early Hardmode gearing before any mechs',
      gifPath: 'assets/bosses/The_Twins.gif',
    ),
    ProgressStage(
      id: 'pre_plantera',
      title: 'Pre-Plantera',
      subtitle: 'After mechs, gearing for the jungle',
      gifPath: 'assets/bosses/Plantera.gif',
    ),
    ProgressStage(
      id: 'pre_golem',
      title: 'Pre-Golem',
      subtitle: 'Temple prep and post-Plantera upgrades',
      gifPath: 'assets/bosses/Golem.gif',
    ),
    ProgressStage(
      id: 'pre_lunar_events',
      title: 'Pre-Lunar Events',
      subtitle: 'Endgame prep before pillars/events',
      gifPath: 'assets/bosses/Lunatic_Cultist.gif',
    ),
    ProgressStage(
      id: 'pre_moon_lord',
      title: 'Pre-Moon Lord',
      subtitle: 'Final upgrades before Moon Lord',
      gifPath: 'assets/bosses/moonlord-cthulhu.gif',
    ),
  ];

  @override
  State<ProgressSelectScreen> createState() => _ProgressSelectScreenState();
}

class _ProgressSelectScreenState extends State<ProgressSelectScreen> {
  // Save per-class so Melee/Ranger/etc can have different progress
  String get _prefsKey => 'completedStages_${widget.playerClass.id}';

  Set<String> _completedStageIds = {};

  @override
  void initState() {
    super.initState();
    _loadCompleted();
  }

  Future<void> _loadCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_prefsKey) ?? <String>[];
    if (!mounted) return;
    setState(() => _completedStageIds = list.toSet());
  }

  Future<void> _setCompleted(String stageId, bool completed) async {
    setState(() {
      if (completed) {
        _completedStageIds.add(stageId);
      } else {
        _completedStageIds.remove(stageId);
      }
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, _completedStageIds.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.playerClass.name} Progress'),
        actions: [
          IconButton(
            tooltip: 'Reset',
            onPressed: () async {
              setState(() => _completedStageIds.clear());
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove(_prefsKey);
            },
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: ProgressSelectScreen.stages.length,
        separatorBuilder: (_, _) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final stage = ProgressSelectScreen.stages[index];
          final isDone = _completedStageIds.contains(stage.id);

          return _StageTile(
            stage: stage,
            isDone: isDone,
            onChanged: (v) => _setCompleted(stage.id, v),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GearResultsScreen(
                    playerClass: widget.playerClass,
                    stage: stage,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProgressStage {
  final String id;
  final String title;
  final String subtitle;
  final String gifPath;

  const ProgressStage({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.gifPath,
  });
}

class _StageTile extends StatelessWidget {
  final ProgressStage stage;
  final VoidCallback onTap;

  final bool isDone;
  final ValueChanged<bool> onChanged;

  const _StageTile({
    required this.stage,
    required this.onTap,
    required this.isDone,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final glowColor = isDone
        ? const Color.fromARGB(255, 90, 220, 140) // green glow
        : const Color.fromARGB(255, 211, 113, 151); // your original pink/red glow

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: glowColor,
                      blurRadius: 40,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 72,
                    height: 72,
                    child: Image.asset(
                      stage.gifPath,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.videogame_asset, size: 40),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stage.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stage.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // Checkbox + chevron, like your screenshot
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isDone,
                    onChanged: (v) => onChanged(v ?? false),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}