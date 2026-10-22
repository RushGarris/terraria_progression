import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/player_class.dart';
import '../theme/app_theme.dart';
import 'progress_select_screen.dart';

class ClassSelectScreen extends StatelessWidget {
  const ClassSelectScreen({super.key});

  static const List<PlayerClass> classes = [
    PlayerClass(
      id: 'melee',
      name: 'Melee',
      assetPath: 'assets/classes/melee.png',
    ),
    PlayerClass(
      id: 'ranger',
      name: 'Ranger',
      assetPath: 'assets/classes/ranger.png',
    ),
    PlayerClass(
      id: 'mage',
      name: 'Mage',
      assetPath: 'assets/classes/mage.png',
    ),
    PlayerClass(
      id: 'summoner',
      name: 'Summoner',
      assetPath: 'assets/classes/summoner.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SkyScaffold(
      appBar: AppBar(
        title: const Text('CHOOSE YOUR CLASS'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          ),
        ],
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

  static const _accents = {
    'melee': Color(0xFFFF6B6B),
    'ranger': Color(0xFF5CDB8F),
    'mage': Color(0xFF6CB7FF),
    'summoner': Color(0xFFC792FF),
  };

  const _ClassTile({
    required this.playerClass,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = _accents[playerClass.id] ?? AppColors.gold;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.25),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: accent.withValues(alpha: 0.7), width: 2),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                accent.withValues(alpha: 0.28),
                AppColors.panel.withValues(alpha: 0.95),
              ],
            ),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            splashColor: accent.withValues(alpha: 0.3),
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            playerClass.assetPath,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.none,
                            errorBuilder: (_, _, _) =>
                                const Icon(Icons.image, size: 72),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      playerClass.name.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: accent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
