import 'package:flutter/material.dart';
import 'screens/class_select_screen.dart';

void main() {
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
