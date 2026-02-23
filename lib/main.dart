import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/class_select_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

debugPrint("➡️ attempting anonymous sign-in...");

try {
  final cred = await FirebaseAuth.instance.signInAnonymously();
  debugPrint("✅ signed in: ${cred.user?.uid}");
} on FirebaseAuthException catch (e) {
  debugPrint("❌ FirebaseAuthException code=${e.code} message=${e.message}");
} catch (e, st) {
  debugPrint("❌ Non-Firebase error: $e");
  debugPrint("$st");
}

debugPrint("➡️ sign-in block finished");

  runApp(const TerrariaGuideApp());
}

class TerrariaGuideApp extends StatelessWidget {
  const TerrariaGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Terraria Progression Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ClassSelectScreen(),
    );
  }
}
