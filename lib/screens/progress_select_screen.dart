import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/player_class.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.playerClass.name} Progress'),
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
        ? const Color.fromARGB(255, 90, 220, 140)
        : const Color.fromARGB(255, 211, 113, 151);

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