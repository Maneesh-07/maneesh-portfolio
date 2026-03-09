// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Experience Section
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    final width = MediaQuery.of(context).size.width;

    // Fluid padding matching the Freelance section
    final double horizontalPadding = width > 1200
        ? 120
        : width > 900
            ? 80
            : width > 600
                ? 48
                : 24;

    return Container(
      key: ctrl.keys['experience'],
      color: CyberTheme.void_black,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 96),
      child: Stack(children: [
        Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
        Column(children: [
          Reveal(
            child: CyberHeader(
              sys: '// WORK_HISTORY.LOG',
              title: 'EXPERIENCE',
              sub:
                  'Deployed at 3 companies — startup to Middle East enterprise.',
            ),
          ),
          const SizedBox(height: 60),

          // Container width restriction ensures the timeline doesn't stretch
          // too far on ultra-wide 4k/8k monitors
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: Column(
              children: kExperiences
                  .asMap()
                  .entries
                  .map((e) => Reveal(
                        delay: Duration(milliseconds: e.key * 120),
                        child: _TimelineEntry(
                          exp: e.value,
                          isLast: e.key == kExperiences.length - 1,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ]),
      ]),
    );
  }
}

class _TimelineEntry extends StatefulWidget {
  final Experience exp;
  final bool isLast;
  const _TimelineEntry({required this.exp, required this.isLast});

  @override
  State<_TimelineEntry> createState() => _TimelineEntryState();
}

class _TimelineEntryState extends State<_TimelineEntry> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final exp = widget.exp;
    final isW = MediaQuery.of(context).size.width > 640;
    final dotColor = exp.isCurrent ? CyberTheme.cyan : CyberTheme.border;

    // Replaced IntrinsicHeight with a Stack. This allows the layout to naturally
    // expand vertically during cross-fades and text wrapping without throwing
    // fractional pixel boundary exceptions.
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 1. Timeline spine (Vertical Line)
        if (!widget.isLast)
          Positioned(
            left: 13.5, // Centers the 1px line within the 28px width constraint
            top:
                24, // Starts right below the circle (margin 5 + circle 14 + gap 5)
            bottom: 0,
            child: Container(
              width: 1,
              color: CyberTheme.cyan.withOpacity(0.2),
            ),
          ),

        // 2. Timeline Content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dot
            SizedBox(
              width: 28,
              child: Column(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: exp.isCurrent
                          ? CyberTheme.cyan.withOpacity(0.2)
                          : Colors.transparent,
                      border: Border.all(color: dotColor, width: 2),
                      boxShadow: exp.isCurrent ? CyberTheme.cyanGlow : [],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 18),

            // Card Panel
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: NeonPanel(
                  glowColor:
                      exp.isCurrent ? CyberTheme.cyan : CyberTheme.magenta,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Hugs content perfectly
                    children: [
                      // Responsive Header Row vs Column
                      isW
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _Head(exp: exp)),
                                const SizedBox(width: 16),
                                _Meta(
                                  exp: exp,
                                  alignment: CrossAxisAlignment.end,
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _Head(exp: exp),
                                const SizedBox(height: 12),
                                _Meta(
                                  exp: exp,
                                  alignment: CrossAxisAlignment.start,
                                ),
                              ],
                            ),

                      const SizedBox(height: 16),
                      Text('> ${exp.description}',
                          style: CyberTheme.bodyMedium),
                      const SizedBox(height: 16),

                      // Expandable Key Missions
                      GestureDetector(
                        onTap: () => setState(() => _expanded = !_expanded),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _expanded ? '[ COLLAPSE ]' : '[ KEY MISSIONS ]',
                              style:
                                  CyberTheme.labelCyan.copyWith(fontSize: 10),
                            ),
                            const SizedBox(width: 4),
                            AnimatedRotation(
                              turns: _expanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: const Icon(Icons.keyboard_arrow_down,
                                  color: CyberTheme.cyan, size: 14),
                            ),
                          ],
                        ),
                      ),

                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 280),
                        crossFadeState: _expanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const SizedBox.shrink(),
                        secondChild: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 12),
                            ...exp.achievements.map((a) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('▸ ',
                                          style: const TextStyle(
                                              color: CyberTheme.green_neon,
                                              fontSize: 12)),
                                      Expanded(
                                          child: Text(a,
                                              style: CyberTheme.bodyMedium)),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Head extends StatelessWidget {
  final Experience exp;
  const _Head({required this.exp});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(exp.role, style: CyberTheme.headlineLarge),
          const SizedBox(height: 3),
          Text(exp.company,
              style: CyberTheme.labelCyan.copyWith(
                  color: CyberTheme.cyan,
                  shadows: CyberTheme.textGlowCyan.cast<Shadow>(),
                  fontSize: 11)),
        ],
      );
}

class _Meta extends StatelessWidget {
  final Experience exp;
  final CrossAxisAlignment alignment;

  const _Meta({
    required this.exp,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: alignment,
        children: [
          if (exp.isCurrent)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                border:
                    Border.all(color: CyberTheme.green_neon.withOpacity(0.6)),
                color: CyberTheme.green_neon.withOpacity(0.08),
                boxShadow: [
                  BoxShadow(
                      color: CyberTheme.green_neon.withOpacity(0.2),
                      blurRadius: 8)
                ],
              ),
              child: Text('● ACTIVE',
                  style: CyberTheme.labelCyan
                      .copyWith(color: CyberTheme.green_neon, fontSize: 9)),
            ),
          const SizedBox(height: 5),
          Text(
            exp.period,
            style: CyberTheme.labelMagenta,
          ),
          Text(exp.location, style: CyberTheme.labelCyan),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            decoration:
                BoxDecoration(border: Border.all(color: CyberTheme.border)),
            child: Text(exp.type,
                style: CyberTheme.labelHead.copyWith(fontSize: 9)),
          ),
        ],
      );
}
