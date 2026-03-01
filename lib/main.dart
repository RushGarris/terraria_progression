import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import 'screens/class_select_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  try {
    print('➡️ attempting email/password sign-in...');
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: 'test@test.com',
      password: 'Test1234!',
    );
    print('✅ signed in!');
  } on FirebaseAuthException catch (e) {
    print('❌ FirebaseAuthException code=${e.code} message=${e.message}');
  } catch (e) {
    print('❌ Unknown error: $e');
  }

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