import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/player_class.dart';
import '../theme/app_theme.dart';
import 'gear_results_screen.dart';

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
      gifPath: 'assets/bosses/Skeletron.png',
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
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Set<String> _completedStageIds = {};
  bool _loading = true;

  String get _classId => widget.playerClass.id;

  String get _uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw StateError('Not logged in');
    return user.uid;
  }

  DocumentReference<Map<String, dynamic>> get _userDoc =>
      _db.collection('users').doc(_uid);

  @override
  void initState() {
    super.initState();
    _loadCompletedFromFirestore();
  }

  Future<void> _loadCompletedFromFirestore() async {
    try {
      final snap = await _userDoc.get();
      final data = snap.data();

      final progressByClass =
          (data?['progressByClass'] as Map?)?.cast<String, dynamic>() ?? {};

      final list = (progressByClass[_classId] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          <String>[];

      if (!mounted) return;
      setState(() {
        _completedStageIds = list.toSet();
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
      // ignore: avoid_print
      print('Firestore load error: $e');
    }
  }

  Future<void> _setCompleted(String stageId, bool completed) async {
    // optimistic UI
    setState(() {
      if (completed) {
        _completedStageIds.add(stageId);
      } else {
        _completedStageIds.remove(stageId);
      }
    });

    
    await _userDoc.set({
      'email': FirebaseAuth.instance.currentUser?.email,
      'updatedAt': FieldValue.serverTimestamp(),
      'progressByClass': {
        _classId: _completedStageIds.toList(),
      },
    }, SetOptions(merge: true));
  }

  Future<void> _resetProgress() async {
    setState(() => _completedStageIds.clear());

    await _userDoc.set({
      'updatedAt': FieldValue.serverTimestamp(),
      'progressByClass': {
        _classId: <String>[],
      },
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    final done = _completedStageIds.length;
    final total = ProgressSelectScreen.stages.length;

    return SkyScaffold(
      appBar: AppBar(
        title: Text('${widget.playerClass.name.toUpperCase()} PROGRESS'),
        actions: [
          IconButton(
            tooltip: 'Reset',
            onPressed: _resetProgress,
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: total + 1,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _ProgressHeader(done: done, total: total);
                }
                final stage = ProgressSelectScreen.stages[index - 1];
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

class _ProgressHeader extends StatelessWidget {
  final int done;
  final int total;

  const _ProgressHeader({required this.done, required this.total});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Boss Progress',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  '$done / $total',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.gold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TweenAnimationBuilder<double>(
                tween: Tween(end: total == 0 ? 0 : done / total),
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOut,
                builder: (_, value, _) => LinearProgressIndicator(
                  value: value,
                  minHeight: 12,
                  backgroundColor: AppColors.panelHigh,
                  color: AppColors.grass,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
    final glowColor = isDone ? AppColors.grass : AppColors.crimson;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDone ? AppColors.grass : Colors.transparent,
          width: 2,
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: glowColor.withValues(alpha: 0.45),
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 72,
                    height: 72,
                    padding: const EdgeInsets.all(6),
                    color: AppColors.skyTop.withValues(alpha: 0.7),
                    child: Image.asset(
                      stage.gifPath,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.none,
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: isDone,
                    onChanged: (v) => onChanged(v ?? false),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.gold),
                ],
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}