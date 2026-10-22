import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Terraria-inspired palette: night sky, grass, gold.
class AppColors {
  static const skyTop = Color(0xFF0B1026);
  static const skyMid = Color(0xFF1B1F4B);
  static const skyBottom = Color(0xFF2E2A5E);

  static const panel = Color(0xFF1A1D3A);
  static const panelHigh = Color(0xFF242852);
  static const panelBorder = Color(0xFF3A3F7A);

  static const grass = Color(0xFF5CDB8F);
  static const gold = Color(0xFFFFD166);
  static const crimson = Color(0xFFE5577C);

  static const textPrimary = Color(0xFFF3F1FF);
  static const textMuted = Color(0xFFA9A8D0);
}

/// Press Start 2P, used for titles and headings only; body text stays readable.
TextStyle pixelFont({
  required double fontSize,
  double? height,
  Color color = AppColors.textPrimary,
}) => GoogleFonts.pressStart2p(
  fontSize: fontSize,
  height: height,
  color: color,
);

class AppTheme {
  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.grass,
      brightness: Brightness.dark,
    ).copyWith(
      primary: AppColors.grass,
      secondary: AppColors.gold,
      surface: AppColors.panel,
      onSurface: AppColors.textPrimary,
    );

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: Brightness.dark,
    );

    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: base.textTheme
          .apply(
            bodyColor: AppColors.textPrimary,
            displayColor: AppColors.textPrimary,
          )
          .copyWith(
            headlineMedium: pixelFont(fontSize: 22, height: 1.4),
            titleLarge: pixelFont(
              fontSize: 15,
              height: 1.4,
              color: AppColors.textPrimary,
            ),
            titleMedium: pixelFont(
              fontSize: 11,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
            bodyMedium: const TextStyle(
              fontSize: 14,
              height: 1.35,
              color: AppColors.textMuted,
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: pixelFont(fontSize: 13, color: AppColors.gold),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      cardTheme: CardThemeData(
        color: AppColors.panel.withValues(alpha: 0.92),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.panelBorder, width: 1.5),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: const BorderSide(color: AppColors.textMuted, width: 1.5),
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? AppColors.grass : null,
        ),
        checkColor: const WidgetStatePropertyAll(AppColors.skyTop),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.panelHigh,
        labelStyle: const TextStyle(color: AppColors.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.panelBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.panelBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.grass, width: 2),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.grass,
          foregroundColor: AppColors.skyTop,
          minimumSize: const Size.fromHeight(50),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.gold,
          minimumSize: const Size.fromHeight(50),
          side: const BorderSide(color: AppColors.gold, width: 1.5),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.textMuted),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.panelHigh,
        contentTextStyle: const TextStyle(color: AppColors.textPrimary),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.grass,
      ),
    );
  }
}

/// A [Scaffold] that paints its own night sky, so page transitions stay opaque.
class SkyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  const SkyScaffold({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return SkyBackground(child: Scaffold(appBar: appBar, body: body));
  }
}

/// Night-sky gradient with a sprinkle of stars.
class SkyBackground extends StatelessWidget {
  final Widget child;
  const SkyBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.skyTop, AppColors.skyMid, AppColors.skyBottom],
        ),
      ),
      child: CustomPaint(painter: _StarPainter(), child: child),
    );
  }
}

class _StarPainter extends CustomPainter {
  // Fixed fractional positions so stars never shift between rebuilds.
  static const _stars = [
    (0.08, 0.06, 1.6), (0.22, 0.14, 1.0), (0.37, 0.04, 1.3),
    (0.52, 0.11, 1.8), (0.68, 0.05, 1.1), (0.81, 0.16, 1.5),
    (0.93, 0.08, 1.2), (0.14, 0.27, 1.2), (0.46, 0.24, 1.0),
    (0.74, 0.31, 1.4), (0.90, 0.38, 1.0), (0.05, 0.46, 1.3),
    (0.31, 0.52, 1.0), (0.62, 0.58, 1.5), (0.86, 0.66, 1.1),
    (0.18, 0.74, 1.4), (0.49, 0.82, 1.0), (0.77, 0.90, 1.3),
    (0.34, 0.94, 1.1), (0.96, 0.54, 1.0),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.55);
    for (final (x, y, r) in _stars) {
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset(x * size.width, y * size.height),
          width: r * 2,
          height: r * 2,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
