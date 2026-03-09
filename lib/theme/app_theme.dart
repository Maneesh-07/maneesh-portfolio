// ═══════════════════════════════════════════════════════════════════════════════
// CYBERPUNK THEME — Dark neon palette, glitch typography, scanline textures
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CyberTheme {
  CyberTheme._();

  // ─── Core Dark Palette ────────────────────────────────────────────
  static const Color void_black = Color(0xFF020408); // deepest bg
  static const Color deep_void = Color(0xFF060B14); // section bg
  static const Color panel = Color(0xFF0A1628); // card bg
  static const Color panel_light = Color(0xFF0F1E38); // hover card
  static const Color border = Color(0xFF1A2E4A); // subtle border
  static const Color border_glow = Color(0xFF00FFFF); // neon border

  // ─── Neon Accents ─────────────────────────────────────────────────
  static const Color cyan = Color(0xFF00FFFF); // primary neon
  static const Color cyan_dim = Color(0xFF00B8CC); // dimmed cyan
  static const Color cyan_glow = Color(0x2200FFFF); // glow layer
  static const Color cyan_subtle = Color(0x0F00FFFF); // faint glow
  static const Color magenta = Color(0xFFFF00FF); // secondary neon
  static const Color magenta_dim = Color(0xFFCC00CC);
  static const Color magenta_glow = Color(0x22FF00FF);
  static const Color yellow_neon = Color(0xFFFFFF00); // accent warn
  static const Color green_neon = Color(0xFF00FF88); // success
  static const Color orange_neon = Color(0xFFFF6600); // in-progress

  // ─── Text ─────────────────────────────────────────────────────────
  static const Color text_primary = Color(0xFFE0F7FA); // near-white cyan tint
  static const Color text_secondary = Color(0xFF7EAFC4); // muted cyan-grey
  static const Color text_muted = Color(0xFF3D6070); // very muted

  // ─── Gradients ────────────────────────────────────────────────────
  static const LinearGradient cyanGrad = LinearGradient(
    colors: [cyan, Color(0xFF0088FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient magentaCyanGrad = LinearGradient(
    colors: [magenta, cyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGrad = LinearGradient(
    colors: [void_black, deep_void, Color(0xFF030D1A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient panelGrad = LinearGradient(
    colors: [panel, panel_light],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ─── Neon Shadows / Glows ─────────────────────────────────────────
  static List<BoxShadow> cyanGlow = [
    BoxShadow(color: cyan.withOpacity(0.5), blurRadius: 20, spreadRadius: 0),
    BoxShadow(color: cyan.withOpacity(0.2), blurRadius: 60, spreadRadius: 5),
  ];

  static List<BoxShadow> magentaGlow = [
    BoxShadow(color: magenta.withOpacity(0.5), blurRadius: 20, spreadRadius: 0),
    BoxShadow(color: magenta.withOpacity(0.2), blurRadius: 60, spreadRadius: 5),
  ];

  static List<BoxShadow> panelShadow = [
    BoxShadow(
        color: cyan.withOpacity(0.08),
        blurRadius: 30,
        offset: const Offset(0, 8)),
    BoxShadow(
        color: Colors.black.withOpacity(0.6),
        blurRadius: 20,
        offset: const Offset(0, 4)),
  ];

  static List<BoxShadow> cardHoverShadow = [
    BoxShadow(
        color: cyan.withOpacity(0.18),
        blurRadius: 40,
        offset: const Offset(0, 8)),
    BoxShadow(color: cyan.withOpacity(0.06), blurRadius: 80, spreadRadius: 2),
  ];

  static List<Shadow> textGlowCyan = [
    Shadow(color: cyan.withOpacity(0.9), blurRadius: 12),
    Shadow(color: cyan.withOpacity(0.5), blurRadius: 30),
  ];

  static List<Shadow> textGlowMagenta = [
    Shadow(color: magenta.withOpacity(0.9), blurRadius: 12),
    Shadow(color: magenta.withOpacity(0.5), blurRadius: 30),
  ];

  // ─── Typography ───────────────────────────────────────────────────
  // Orbitron = futuristic display; Share Tech Mono = terminal labels
  static TextStyle get displayHero => GoogleFonts.orbitron(
        fontSize: 60,
        fontWeight: FontWeight.w900,
        color: text_primary,
        height: 0.95,
        letterSpacing: -1,
        shadows: textGlowCyan.cast<Shadow>(),
      );

  static TextStyle get displayLarge => GoogleFonts.orbitron(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: text_primary,
        letterSpacing: -0.5,
      );

  static TextStyle get displayMedium => GoogleFonts.orbitron(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: text_primary,
        letterSpacing: 0,
      );

  static TextStyle get headlineLarge => GoogleFonts.orbitron(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: text_primary,
      );

  static TextStyle get headlineMedium => GoogleFonts.orbitron(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: text_primary,
        letterSpacing: 0.5,
      );

  static TextStyle get bodyLarge => GoogleFonts.shareTechMono(
        fontSize: 15,
        color: text_secondary,
        height: 1.8,
        letterSpacing: 0.3,
      );

  static TextStyle get bodyMedium => GoogleFonts.shareTechMono(
        fontSize: 13,
        color: text_secondary,
        height: 1.7,
      );

  static TextStyle get labelCyan => GoogleFonts.shareTechMono(
        fontSize: 11,
        color: cyan,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.5,
      );

  static TextStyle get labelMagenta => GoogleFonts.shareTechMono(
        fontSize: 11,
        color: magenta,
        letterSpacing: 2.5,
      );

  static TextStyle get labelMuted => GoogleFonts.shareTechMono(
        fontSize: 10,
        color: text_muted,
        letterSpacing: 1.5,
      );
  static TextStyle get labelHead => GoogleFonts.shareTechMono(
        fontSize: 10,
        color: text_primary,
        letterSpacing: 1.5,
      );

  static TextStyle get terminalText => GoogleFonts.shareTechMono(
        fontSize: 12,
        color: green_neon,
        letterSpacing: 1,
      );

  // ─── Theme Data ───────────────────────────────────────────────────
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: void_black,
        colorScheme: const ColorScheme.dark(
          primary: cyan,
          secondary: magenta,
          surface: panel,
          background: void_black,
        ),
        textTheme:
            GoogleFonts.shareTechMonoTextTheme(ThemeData.dark().textTheme),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: panel,
          contentTextStyle: GoogleFonts.shareTechMono(color: cyan),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: cyan, width: 1),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
}

// ─── Helper ───────────────────────────────────────────────────────────────────
Color hexToColor(String hex) =>
    Color(int.parse(hex.replaceFirst('0x', ''), radix: 16));
