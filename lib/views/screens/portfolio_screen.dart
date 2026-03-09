// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Portfolio Screen
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../sections/hero_section.dart';
import '../sections/about_section.dart';
import '../sections/skills_section.dart';
import '../sections/projects_section.dart';
import '../sections/experience_section.dart';
import '../sections/freelance_section.dart';
import '../sections/contact_section.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();

    return Scaffold(
      backgroundColor: CyberTheme.void_black,
      body: Stack(children: [

        // ── scrollable content
        SingleChildScrollView(
          controller: ctrl.scrollController,
          child: const Column(children: [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ProjectsSection(),
            ExperienceSection(),
            FreelanceSection(),
            ContactSection(),
          ]),
        ),

        // ── sticky navbar
        const Positioned(top: 0, left: 0, right: 0, child: CyberNavBar()),

        // ── scroll-to-top FAB
        Positioned(
          bottom: 24, right: 24,
          child: _TopFab(ctrl: ctrl),
        ),
      ]),
    );
  }
}

class _TopFab extends StatelessWidget {
  final PortfolioController ctrl;
  const _TopFab({required this.ctrl});

  @override
  Widget build(BuildContext context) => Consumer<PortfolioController>(
    builder: (_, c, __) => AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: c.isScrolled ? 1.0 : 0.0,
      child: GestureDetector(
        onTap: c.isScrolled ? ctrl.toTop : null,
        child: Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            color: CyberTheme.panel,
            border: Border.all(color: CyberTheme.cyan, width: 1.5),
            boxShadow: CyberTheme.cyanGlow,
          ),
          child: const Icon(Icons.keyboard_arrow_up_rounded,
            color: CyberTheme.cyan, size: 20),
        ),
      ),
    ),
  );
}
