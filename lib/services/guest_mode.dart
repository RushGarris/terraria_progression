import 'package:flutter/foundation.dart';

/// Guest mode lets visitors try the app without an account. Nothing is sent
/// to Firebase: progress lives in memory and is lost when the page reloads.
class GuestMode {
  static final ValueNotifier<bool> active = ValueNotifier<bool>(false);

  static final Map<String, Set<String>> _progressByClass = {};

  static void enter() => active.value = true;

  static void exit() {
    _progressByClass.clear();
    active.value = false;
  }

  static Set<String> completedFor(String classId) =>
      Set<String>.from(_progressByClass[classId] ?? const <String>{});

  static void saveCompleted(String classId, Set<String> stageIds) {
    _progressByClass[classId] = Set<String>.from(stageIds);
  }
}
