// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Hero Section (Cyberpunk)
// ═══════════════════════════════════════════════════════════════════════════════

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});
  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with TickerProviderStateMixin {
  late final AnimationController _pulseCtrl;
  late final AnimationController _rotCtrl;
  late final Animation<double>   _pulse;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
    _rotCtrl   = AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();
    _pulse     = Tween<double>(begin: 0.9, end: 1.1).animate(
        CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() { _pulseCtrl.dispose(); _rotCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final ctrl   = context.read<PortfolioController>();
    final sz     = MediaQuery.of(context).size;
    final isWide = sz.width > 900;

    return Container(
      key: ctrl.keys['hero'],
      constraints: BoxConstraints(minHeight: sz.height),
      color: CyberTheme.void_black,
      child: Stack(children: [
        // grid + scanlines
        Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
        Positioned.fill(child: CustomPaint(painter: ScanlinePainter(opacity: 0.03))),

        // corner glow blobs
        Positioned(top: -100, left: -100,
          child: _GlowBlob(color: CyberTheme.cyan, size: 400)),
        Positioned(bottom: -80, right: -80,
          child: _GlowBlob(color: CyberTheme.magenta, size: 300)),

        // content
        Padding(
          padding: EdgeInsets.fromLTRB(
            isWide ? 80 : 24, 100, isWide ? 80 : 24, 60),
          child: isWide
              ? Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Expanded(flex: 6, child: _HeroLeft(ctrl: ctrl)),
                  const SizedBox(width: 60),
                  Expanded(flex: 4, child: _HeroRight(pulse: _pulse, rot: _rotCtrl)),
                ])
              : Column(children: [
                  _HeroLeft(ctrl: ctrl),
                  const SizedBox(height: 56),
                  _HeroRight(pulse: _pulse, rot: _rotCtrl),
                ]),
        ),

        // scroll cue
        Positioned(bottom: 24, left: 0, right: 0,
          child: Center(child: _ScrollCue())),
      ]),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowBlob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) => Container(
    width: size, height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(colors: [
        color.withOpacity(0.06), Colors.transparent]),
    ),
  );
}

class _HeroLeft extends StatelessWidget {
  final PortfolioController ctrl;
  const _HeroLeft({required this.ctrl});

  @override
  Widget build(BuildContext context) {
    final info = kInfo;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

      // system status line
      Reveal(child: Row(children: [
        Container(width: 8, height: 8, color: CyberTheme.green_neon,
          margin: const EdgeInsets.only(right: 8)),
        Text('SYS_STATUS: ONLINE  //  AVAILABLE_FOR_HIRE',
          style: CyberTheme.terminalText.copyWith(fontSize: 11)),
      ])),
      const SizedBox(height: 24),

      // name with glitch
      Reveal(delay: const Duration(milliseconds: 80),
        child: GlitchText(text: info.name, style: CyberTheme.displayHero)),
      const SizedBox(height: 6),

      // title with neon line
      Reveal(delay: const Duration(milliseconds: 140),
        child: Row(children: [
          Container(width: 3, height: 36, color: CyberTheme.magenta,
            margin: const EdgeInsets.only(right: 12)),
          AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 600),
            animatedTexts: [
              TyperAnimatedText('FLUTTER DEVELOPER',
                textStyle: CyberTheme.displayLarge.copyWith(
                  color: CyberTheme.cyan,
                  shadows: CyberTheme.textGlowCyan.cast<Shadow>(), fontSize: 32,
                ),
                speed: const Duration(milliseconds: 70)),
              TyperAnimatedText('MOBILE ENGINEER',
                textStyle: CyberTheme.displayLarge.copyWith(
                  color: CyberTheme.magenta,
                  shadows: CyberTheme.textGlowMagenta.cast<Shadow>(), fontSize: 32,
                ),
                speed: const Duration(milliseconds: 70)),
              TyperAnimatedText('APP ARCHITECT',
                textStyle: CyberTheme.displayLarge.copyWith(
                  color: CyberTheme.cyan,
                  shadows: CyberTheme.textGlowCyan.cast<Shadow>(), fontSize: 32,
                ),
                speed: const Duration(milliseconds: 70)),
            ],
          ),
        ]),
      ),
      const SizedBox(height: 28),

      // bio
      Reveal(delay: const Duration(milliseconds: 200),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('> ${info.bio}', style: CyberTheme.bodyLarge),
          ]),
        ),
      ),
      const SizedBox(height: 36),

      // CTAs
      Reveal(delay: const Duration(milliseconds: 270),
        child: Wrap(spacing: 14, runSpacing: 12, children: [
          NeonButton(
            label: '> VIEW_PROJECTS',
            icon: Icons.terminal,
            onTap: () => ctrl.scrollTo('projects'),
          ),
          NeonButton(
            label: '> HIRE_ME.EXE',
            icon: Icons.send_outlined,
            outlined: true,
            color: CyberTheme.magenta,
            onTap: () => ctrl.scrollTo('contact'),
          ),
        ]),
      ),
      const SizedBox(height: 52),

      // stats
      Reveal(delay: const Duration(milliseconds: 340),
        child: Row(children: [
          _StatBlock(value: info.yearsExp,  label: 'YEARS\nEXP',   suffix: '+'),
          _Pipe(),
          _StatBlock(value: info.appsBuilt, label: 'APPS\nBUILT',  suffix: '+'),
          _Pipe(),
          _StatBlock(value: info.companies, label: 'COMPANIES\nWORKED', suffix: ''),
        ]),
      ),
    ]);
  }
}

class _StatBlock extends StatelessWidget {
  final int value;
  final String label, suffix;
  const _StatBlock({required this.value, required this.label, required this.suffix});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CyberCounter(
        value: value, suffix: suffix,
        style: CyberTheme.displayMedium.copyWith(
          color: CyberTheme.cyan,
          shadows: CyberTheme.textGlowCyan.cast<Shadow>(), fontSize: 30),
      ),
      const SizedBox(height: 4),
      Text(label, style: CyberTheme.labelMuted),
    ],
  );
}

class _Pipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    width: 1, height: 40,
    color: CyberTheme.cyan.withOpacity(0.25),
  );
}

class _HeroRight extends StatelessWidget {
  final Animation<double> pulse;
  final AnimationController rot;
  const _HeroRight({required this.pulse, required this.rot});

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340, maxHeight: 340),
      child: Stack(alignment: Alignment.center, children: [
        // rotating outer ring
        AnimatedBuilder(
          animation: rot,
          builder: (_, __) => Transform.rotate(
            angle: rot.value * 2 * math.pi,
            child: Container(
              width: 320, height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CyberTheme.cyan.withOpacity(0.15), width: 1),
              ),
              child: CustomPaint(painter: _DashedCirclePainter(
                color: CyberTheme.cyan, radius: 159, dashes: 32)),
            ),
          ),
        ),

        // pulsing middle ring
        AnimatedBuilder(
          animation: pulse,
          builder: (_, child) => Transform.scale(scale: pulse.value, child: child),
          child: Container(width: 240, height: 240,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CyberTheme.magenta.withOpacity(0.3), width: 1),
              boxShadow: [BoxShadow(color: CyberTheme.magenta.withOpacity(0.08),
                blurRadius: 30, spreadRadius: 5)],
            ),
          ),
        ),

        // avatar hexagon-ish
        Container(
          width: 170, height: 170,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CyberTheme.cyan, width: 2),
            color: CyberTheme.panel,
            boxShadow: CyberTheme.cyanGlow,
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('MM', style: CyberTheme.displayLarge.copyWith(
              color: CyberTheme.cyan, fontSize: 48,
              shadows: CyberTheme.textGlowCyan.cast<Shadow>())),
            Text('DEV', style: CyberTheme.labelCyan.copyWith(fontSize: 10)),
          ]),
        ),

        // floating badges
        ..._buildBadges(),
      ]),
    ),
  );

  List<Widget> _buildBadges() {
    final data = [
      ('FLUTTER', const Offset(130, -50)),
      ('FIREBASE', const Offset(130, 60)),
      ('BLoC', const Offset(-140, 50)),
      ('HIVE DB', const Offset(-130, -50)),
    ];
    return data.map((b) => Transform.translate(
      offset: b.$2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: CyberTheme.panel,
          border: Border.all(color: CyberTheme.cyan.withOpacity(0.6), width: 1),
          boxShadow: [BoxShadow(color: CyberTheme.cyan.withOpacity(0.2), blurRadius: 10)],
        ),
        child: Text(b.$1, style: CyberTheme.labelCyan.copyWith(fontSize: 9)),
      ),
    )).toList();
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  final double radius;
  final int dashes;
  const _DashedCirclePainter({required this.color, required this.radius, required this.dashes});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = color..strokeWidth = 1..style = PaintingStyle.stroke;
    final step = 2 * math.pi / dashes;
    for (int i = 0; i < dashes; i += 2) {
      final start = i * step;
      final end   = start + step * 0.6;
      canvas.drawArc(Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        start, end - start, false, p);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

class _ScrollCue extends StatefulWidget {
  @override
  State<_ScrollCue> createState() => _ScrollCueState();
}

class _ScrollCueState extends State<_ScrollCue> with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _a;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
    _a = Tween<double>(begin: 0, end: 8).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _a,
    builder: (_, child) => Transform.translate(offset: Offset(0, _a.value), child: child),
    child: Column(children: [
      Text('[ SCROLL ]', style: CyberTheme.labelMuted),
      const SizedBox(height: 6),
      Container(width: 1, height: 28,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [CyberTheme.cyan, Colors.transparent],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
      ),
    ]),
  );
}
