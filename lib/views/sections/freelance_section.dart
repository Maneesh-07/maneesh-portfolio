// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Freelance Section
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class FreelanceSection extends StatelessWidget {
  const FreelanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    final width = MediaQuery.of(context).size.width;

    // Fluid padding based on screen width
    final double horizontalPadding = width > 1200
        ? 120
        : width > 900
            ? 80
            : width > 600
                ? 48
                : 24;

    return Container(
      key: ctrl.keys['freelance'],
      color: CyberTheme.deep_void,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 96),
      child: Stack(children: [
        Positioned.fill(child: CustomPaint(painter: ScanlinePainter())),
        Column(children: [
          Reveal(
            child: CyberHeader(
              sys: '// FREELANCE.MODE',
              title: 'HIRE ME',
              sub: 'Select freelance engagements for businesses that need '
                  'quality mobile solutions. Slot currently available.',
            ),
          ),
          const SizedBox(height: 20),

          // Availability Status
          Reveal(
            delay: const Duration(milliseconds: 80),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CyberTheme.green_neon.withOpacity(0.5)),
                color: CyberTheme.green_neon.withOpacity(0.05),
                boxShadow: [
                  BoxShadow(
                      color: CyberTheme.green_neon.withOpacity(0.1),
                      blurRadius: 20)
                ],
              ),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: CyberTheme.green_neon,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: CyberTheme.green_neon.withOpacity(0.8),
                            blurRadius: 8)
                      ],
                    )),
                const SizedBox(width: 10),
                Flexible(
                  child: Text('STATUS: ACCEPTING NEW CONTRACTS',
                      textAlign: TextAlign.center,
                      style: CyberTheme.labelCyan.copyWith(
                          color: CyberTheme.green_neon, fontSize: 11)),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 52),

          // Service Cards Grid
          Reveal(
            delay: const Duration(milliseconds: 160),
            child: LayoutBuilder(
              builder: (_, constraints) {
                int crossAxisCount;

                // Breakpoints for grid
                if (constraints.maxWidth < 650) {
                  crossAxisCount = 1; // Mobile
                } else if (constraints.maxWidth < 1024) {
                  crossAxisCount = 2; // Tablet
                } else if (constraints.maxWidth < 1400) {
                  crossAxisCount = 3; // Small desktop
                } else {
                  crossAxisCount = 4; // Large desktop
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    // Use mainAxisExtent instead of childAspectRatio to prevent
                    // vertical squishing/stretching on resize
                    mainAxisExtent: 320,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: kServices.length,
                  itemBuilder: (_, i) => _ServiceCard(svc: kServices[i]),
                );
              },
            ),
          ),
          const SizedBox(height: 72),

          // Engagement Process
          Reveal(
            delay: const Duration(milliseconds: 200),
            child: Column(children: [
              Text('// ENGAGEMENT_PROTOCOL', style: CyberTheme.labelCyan),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (_, c) {
                  if (c.maxWidth > 900) return _ProcessRow();
                  if (c.maxWidth > 600) return _ProcessGrid(); // Tablet layout
                  return _ProcessCol();
                },
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final FreelanceService svc;
  const _ServiceCard({required this.svc});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final s = widget.svc;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _hovered ? CyberTheme.panel_light : CyberTheme.panel,
          border: Border.all(
            color:
                _hovered ? CyberTheme.cyan.withOpacity(0.7) : CyberTheme.border,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                      color: CyberTheme.cyan.withOpacity(0.15), blurRadius: 30)
                ]
              : [],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: CyberTheme.cyan.withOpacity(0.5)),
                  color: CyberTheme.cyan.withOpacity(0.08),
                ),
                child: Center(
                    child: Text(s.icon,
                        style: CyberTheme.headlineLarge
                            .copyWith(color: CyberTheme.cyan, fontSize: 18))),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(s.title, style: CyberTheme.headlineMedium)),
            ]),
            const SizedBox(height: 12),
            Text('> ${s.description}', style: CyberTheme.bodyMedium),
            const Spacer(),
            const SizedBox(height: 14),
            ...s.features.map((f) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('▸ ',
                          style:
                              TextStyle(color: CyberTheme.cyan, fontSize: 11)),
                      // Wrap feature text in Expanded to prevent overflow on thin screens
                      Expanded(child: Text(f, style: CyberTheme.labelMuted)),
                    ],
                  ),
                )),
          ]),
          if (s.isPopular)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: CyberTheme.cyanGrad,
                  boxShadow: CyberTheme.cyanGlow,
                ),
                child: Text('★ POPULAR',
                    style: CyberTheme.labelCyan.copyWith(
                        color: CyberTheme.void_black,
                        fontSize: 9,
                        fontWeight: FontWeight.w900)),
              ),
            ),
        ]),
      ),
    );
  }
}

const _steps = [
  ('01', 'DISCOVERY', 'Vision, goals & requirements scoped.'),
  ('02', 'SPEC', 'Timeline, cost, deliverables locked in.'),
  ('03', 'BUILD', 'Weekly demos. Fast iterations. Live feedback.'),
  ('04', 'DEPLOY', 'Testing, launch & post-ship support.'),
];

// Desktop: 4 items in a row
class _ProcessRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _steps
            .asMap()
            .entries
            .map((e) => Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: _StepBox(step: e.value)),
                      if (e.key < _steps.length - 1)
                        Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(' ▶ ',
                                style: CyberTheme.labelCyan
                                    .copyWith(fontSize: 10))),
                    ],
                  ),
                ))
            .toList(),
      );
}

// Tablet: 2x2 Grid Layout
class _ProcessGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _StepBox(step: _steps[0])),
            Expanded(child: _StepBox(step: _steps[1])),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _StepBox(step: _steps[2])),
            Expanded(child: _StepBox(step: _steps[3])),
          ],
        ),
      ],
    );
  }
}

// Mobile: 1 Column Stack
class _ProcessCol extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: _steps
            .map((s) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: _StepBox(step: s),
                  ),
                ))
            .toList(),
      );
}

class _StepBox extends StatelessWidget {
  final (String, String, String) step;
  const _StepBox({required this.step});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: CyberTheme.panel,
          border: Border.all(color: CyberTheme.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Hug content height
          children: [
            Text(step.$1,
                style: CyberTheme.labelCyan.copyWith(
                    color: CyberTheme.cyan,
                    shadows: CyberTheme.textGlowCyan.cast<Shadow>())),
            const SizedBox(height: 6),
            Text(step.$2, style: CyberTheme.headlineMedium),
            const SizedBox(height: 4),
            Text(step.$3, style: CyberTheme.bodyMedium),
          ],
        ),
      );
}
