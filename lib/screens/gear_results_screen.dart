import 'package:flutter/material.dart';
import '../data/gear_data.dart';
import '../models/player_class.dart';
import 'progress_select_screen.dart';

class GearResultsScreen extends StatelessWidget {
  final PlayerClass playerClass;
  final ProgressStage stage;

  const GearResultsScreen({
    super.key,
    required this.playerClass,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    final loadout = GearData.getLoadout(
      classId: playerClass.id,
      stageId: stage.id,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${playerClass.name} — ${stage.title}'),
      ),
      body: loadout == null
          ? _EmptyState(playerClass: playerClass, stage: stage)
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _Section(title: 'Weapons', items: loadout.weapons),
                const SizedBox(height: 12),
                _Section(title: 'Armor', items: loadout.armor),
                const SizedBox(height: 12),
                _Section(title: 'Accessories', items: loadout.accessories),
              ],
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final PlayerClass playerClass;
  final ProgressStage stage;

  const _EmptyState({
    required this.playerClass,
    required this.stage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          'No gear added yet for ${playerClass.name} — ${stage.title}.\n\n'
          'Next step: add a loadout in lib/data/gear_data.dart',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List items;

  const _Section({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            ...items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.imagePath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            item.imagePath!,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) =>
                                const Icon(
                                  Icons.image_not_supported,
                                  size: 22,
                                ),
                          ),
                        ),
                      )
                    else
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 20,
                        ),
                      ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style:
                                Theme.of(context).textTheme.titleMedium,
                          ),
                          if (item.note != null &&
                              item.note!.trim().isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                item.note!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
