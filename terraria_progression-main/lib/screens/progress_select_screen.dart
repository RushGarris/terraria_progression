import 'package:flutter/material.dart';
import '../models/player_class.dart';

class ProgressSelectScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${playerClass.name} Progress')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: stages.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final stage = stages[index];
          return _StageTile(
            stage: stage,
            onTap: () {
              // TODO: Navigate to results screen and pass playerClass + stage
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Selected: ${playerClass.name} — ${stage.title}',
                  ),
                  duration: const Duration(milliseconds: 900),
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

  const _StageTile({required this.stage, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
             Container(
              decoration:
              BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 211, 113, 151),
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
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
