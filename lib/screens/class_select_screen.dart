import 'package:flutter/material.dart';
import '../models/player_class.dart';
import 'progress_select_screen.dart';

class ClassSelectScreen extends StatelessWidget {
  const ClassSelectScreen({super.key});

  static const List<PlayerClass> classes = [
    PlayerClass(
      id: 'melee',
      name: 'Melee',
      assetPath: 'assets/classes/melee.jpg',
    ),
    PlayerClass(
      id: 'ranger',
      name: 'Ranger',
      assetPath: 'assets/classes/ranger.jpg',
    ),
    PlayerClass(
      id: 'mage',
      name: 'Mage',
      assetPath: 'assets/classes/mage.jpg',
    ),
    PlayerClass(
      id: 'summoner',
      name: 'Summoner',
      assetPath: 'assets/classes/summoner.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Class'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            const spacing = 16.0;

            final gridHeight = constraints.maxHeight;
            final tileHeight = (gridHeight - spacing) / 2;

            final gridWidth = constraints.maxWidth;
            final tileWidth = (gridWidth - spacing) / 2;

            return GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: tileWidth / tileHeight,
              children: classes.map((pc) {
                return _ClassTile(
                  playerClass: pc,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProgressSelectScreen(playerClass: pc),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class _ClassTile extends StatelessWidget {
  final PlayerClass playerClass;
  final VoidCallback onTap;

  const _ClassTile({
    required this.playerClass,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Card(
        color: const Color.fromARGB(243, 255, 255, 255),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 110,
                      maxHeight: 110,
                    ),
                    child: Image.asset(
                      playerClass.assetPath,
                      fit: BoxFit.contain,
                      errorBuilder: (_, _, _) =>
                          const Icon(Icons.image, size: 72),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                playerClass.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
