// // ═══════════════════════════════════════════════════════════════════════════════
// // VIEW — About Section
// // ═══════════════════════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/portfolio_controller.dart';
// import '../../models/portfolio_data.dart';
// import '../../theme/app_theme.dart';
// import '../widgets/shared_widgets.dart';

// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = context.read<PortfolioController>();
//     final isWide = MediaQuery.of(context).size.width > 900;

//     return Container(
//       key: ctrl.keys['about'],
//       color: CyberTheme.deep_void,
//       padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 96),
//       child: Stack(children: [
//         Positioned.fill(child: CustomPaint(painter: ScanlinePainter())),
//         isWide
//             ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Expanded(flex: 5, child: _AboutLeft()),
//                 const SizedBox(width: 64),
//                 Expanded(flex: 5, child: _AboutRight()),
//               ])
//             : Column(children: [
//                 _AboutLeft(),
//                 const SizedBox(height: 48),
//                 _AboutRight(),
//               ]),
//       ]),
//     );
//   }
// }

// class _AboutLeft extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final info = kInfo;
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Reveal(child: Text('// ABOUT.EXE', style: CyberTheme.labelCyan)),
//       const SizedBox(height: 14),
//       Reveal(
//           delay: const Duration(milliseconds: 80),
//           child: GlitchText(text: 'WHO AM I', style: CyberTheme.displayMedium)),
//       const SizedBox(height: 24),
//       Reveal(
//           delay: const Duration(milliseconds: 140),
//           child: Text('> ${info.bio}', style: CyberTheme.bodyLarge)),
//       const SizedBox(height: 16),
//       Reveal(
//         delay: const Duration(milliseconds: 180),
//         child: Text(
//           '> I believe great software is as much about the experience '
//           'as the code. Every widget I build is optimised for the user, '
//           'not the developer.',
//           style: CyberTheme.bodyLarge,
//         ),
//       ),
//       const SizedBox(height: 28),
//       Reveal(
//         delay: const Duration(milliseconds: 220),
//         child: Wrap(spacing: 8, runSpacing: 8, children: const [
//           CyberChip(label: 'FLUTTER EXPERT', active: true),
//           CyberChip(label: 'BLoC / GETX / PROVIDER', active: true),
//           CyberChip(label: 'FIREBASE', active: true),
//           CyberChip(label: 'HIVE DB', active: true),
//           CyberChip(label: 'REST API', active: true),
//           CyberChip(label: 'PLAY CONSOLE', active: true),
//         ]),
//       ),
//     ]);
//   }
// }

// class _AboutRight extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final info = kInfo;
//     return Column(children: [
//       Reveal(
//         delay: const Duration(milliseconds: 80),
//         child: CornerBrackets(
//           child: NeonPanel(
//             hoverable: false,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text('SYSTEM_INFO', style: CyberTheme.labelCyan),
//               const SizedBox(height: 4),
//               Divider(color: CyberTheme.cyan.withOpacity(0.2), height: 20),
//               ...[
//                 ('LOCATION', 'Cochin, Kerala, India'),
//                 ('EMAIL', info.email),
//                 ('STATUS', 'OPEN TO OPPORTUNITIES'),
//                 ('EDUCATION', 'BCA — BHARATHIYAR UNIV.'),
//                 ('LANGUAGES', 'ENG / MAL / TAM'),
//               ].map((row) => Padding(
//                     padding: const EdgeInsets.only(bottom: 14),
//                     child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('${row.$1}:',
//                               style:
//                                   CyberTheme.labelCyan.copyWith(fontSize: 10)),
//                           const SizedBox(width: 10),
//                           Expanded(
//                               child: Text(row.$2,
//                                   style: CyberTheme.bodyMedium.copyWith(
//                                       color: CyberTheme.text_primary))),
//                         ]),
//                   )),
//             ]),
//           ),
//         ),
//       ),
//       const SizedBox(height: 16),
//       Reveal(
//         delay: const Duration(milliseconds: 200),
//         child: NeonPanel(
//           hoverable: false,
//           glowColor: CyberTheme.magenta,
//           child:
//               Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//             _StatTile('${info.yearsExp}+', 'YEARS'),
//             _VDivider(),
//             _StatTile('${info.appsBuilt}+', 'APPS'),
//             _VDivider(),
//             _StatTile('${info.companies}', 'COMPANIES'),
//           ]),
//         ),
//       ),
//     ]);
//   }
// }

// class _StatTile extends StatelessWidget {
//   final String v, l;
//   const _StatTile(this.v, this.l);

//   @override
//   Widget build(BuildContext context) => Column(children: [
//         Text(v,
//             style: CyberTheme.displayMedium.copyWith(
//                 color: CyberTheme.cyan,
//                 fontSize: 26,
//                 shadows: CyberTheme.textGlowCyan.cast<Shadow>())),
//         Text(l, style: CyberTheme.labelMuted),
//       ]);
// }

// class _VDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) =>
//       Container(height: 36, width: 1, color: CyberTheme.cyan.withOpacity(0.2));
// }

// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — About Section
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    final width = MediaQuery.of(context).size.width;

    // Desktop vs Mobile layout toggle
    final isDesktop = width > 900;

    // Fluid padding matching other sections
    final double horizontalPadding = width > 1200
        ? 120
        : width > 900
            ? 80
            : width > 600
                ? 48
                : 24;

    return Container(
      key: ctrl.keys['about'],
      color: CyberTheme.deep_void,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 96),
      child: Stack(children: [
        Positioned.fill(child: CustomPaint(painter: ScanlinePainter())),

        // Ensure max width so it doesn't stretch infinitely on ultra-wide screens
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1400),
            child: isDesktop
                ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(flex: 7, child: _AboutLeft()),
                    SizedBox(width: 64),
                    Expanded(
                        flex: 4,
                        child:
                            _AboutRight()), // Slightly narrower right side looks better on desktop
                  ])
                : Column(children: [
                    _AboutLeft(),
                    const SizedBox(height: 64),
                    _AboutRight(),
                  ]),
          ),
        ),
      ]),
    );
  }
}

class _AboutLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = kInfo;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Reveal(child: Text('// ABOUT.EXE', style: CyberTheme.labelCyan)),
      const SizedBox(height: 14),
      Reveal(
          delay: const Duration(milliseconds: 80),
          child: GlitchText(text: 'WHO AM I', style: CyberTheme.displayMedium)),
      const SizedBox(height: 24),
      Reveal(
          delay: const Duration(milliseconds: 140),
          child: Text('> ${info.bio}', style: CyberTheme.bodyLarge)),
      const SizedBox(height: 16),
      Reveal(
        delay: const Duration(milliseconds: 180),
        child: Text(
          '> I believe great software is as much about the experience '
          'as the code. Every widget I build is optimised for the user, '
          'not the developer.',
          style: CyberTheme.bodyLarge,
        ),
      ),
      const SizedBox(height: 28),
      Reveal(
        delay: const Duration(milliseconds: 220),
        child: Wrap(spacing: 8, runSpacing: 8, children: const [
          CyberChip(label: 'FLUTTER EXPERT', active: true),
          CyberChip(label: 'BLoC / GETX / PROVIDER', active: true),
          CyberChip(label: 'FIREBASE', active: true),
          CyberChip(label: 'HIVE DB', active: true),
          CyberChip(label: 'REST API', active: true),
          CyberChip(label: 'PLAY CONSOLE', active: true),
        ]),
      ),
    ]);
  }
}

class _AboutRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = kInfo;
    final width = MediaQuery.of(context).size.width;

    // Scale down stats on very thin phones (like iPhone SE)
    final bool isTinyPhone = width < 380;

    return Column(children: [
      Reveal(
        delay: const Duration(milliseconds: 80),
        child: CornerBrackets(
          child: NeonPanel(
            hoverable: false,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('SYSTEM_INFO', style: CyberTheme.labelCyan),
              const SizedBox(height: 4),
              Divider(color: CyberTheme.cyan.withOpacity(0.2), height: 20),
              ...[
                ('LOCATION', 'Cochin, Kerala, India'),
                ('EMAIL', info.email),
                ('STATUS', 'OPEN TO OPPORTUNITIES'),
                ('EDUCATION', 'BCA — BHARATHIYAR UNIV.'),
                ('LANGUAGES', 'ENG / MAL / TAM'),
              ].map((row) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Fixed width label aligns all the values into a perfect visual column
                          SizedBox(
                            width: 85,
                            child: Text('${row.$1}:',
                                style: CyberTheme.labelCyan
                                    .copyWith(fontSize: 10)),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Text(row.$2,
                                  style: CyberTheme.bodyMedium.copyWith(
                                      color: CyberTheme.text_primary))),
                        ]),
                  )),
            ]),
          ),
        ),
      ),
      const SizedBox(height: 16),
      Reveal(
        delay: const Duration(milliseconds: 200),
        child: NeonPanel(
          hoverable: false,
          glowColor: CyberTheme.magenta,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _StatTile('${info.yearsExp}+', 'YEARS', isTiny: isTinyPhone),
            _VDivider(),
            _StatTile('${info.appsBuilt}+', 'APPS', isTiny: isTinyPhone),
            _VDivider(),
            _StatTile('${info.companies}', 'COMPANIES', isTiny: isTinyPhone),
          ]),
        ),
      ),
    ]);
  }
}

class _StatTile extends StatelessWidget {
  final String v, l;
  final bool isTiny;
  const _StatTile(this.v, this.l, {required this.isTiny});

  @override
  Widget build(BuildContext context) => Column(children: [
        Text(v,
            style: CyberTheme.displayMedium.copyWith(
                color: CyberTheme.cyan,
                // Shrink font size on tiny screens to prevent flex row overflow
                fontSize: isTiny ? 20 : 26,
                shadows: CyberTheme.textGlowCyan.cast<Shadow>())),
        Text(l,
            style: CyberTheme.labelMuted.copyWith(
                fontSize: isTiny ? 9 : null)), // Shrink label if needed
      ]);
}

class _VDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Container(height: 36, width: 1, color: CyberTheme.cyan.withOpacity(0.2));
}
