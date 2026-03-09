// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Projects Section
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    final isWide = MediaQuery.of(context).size.width > 900;

    return Container(
      key: ctrl.keys['projects'],
      color: CyberTheme.deep_void,
      padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 96),
      child: Column(children: [
        Reveal(
            child: CyberHeader(
          sys: '// PROJECT.DB',
          title: 'DEPLOYED SYSTEMS',
          sub: 'Real apps. Real clients. Production-grade Flutter '
              'from retail POS to children\'s entertainment.',
        )),
        const SizedBox(height: 60),
        LayoutBuilder(builder: (_, c) {
          // two column on very wide screens, single on narrow
          if (c.maxWidth > 1100) {
            final leftP =
                kProjects.where((p) => kProjects.indexOf(p).isEven).toList();
            final rightP =
                kProjects.where((p) => kProjects.indexOf(p).isOdd).toList();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                        children: leftP
                            .asMap()
                            .entries
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Reveal(
                                      delay: Duration(milliseconds: e.key * 80),
                                      child: _ProjectCard(p: e.value)),
                                ))
                            .toList())),
                const SizedBox(width: 20),
                Expanded(
                    child: Column(
                        children: rightP
                            .asMap()
                            .entries
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Reveal(
                                      delay: Duration(
                                          milliseconds: e.key * 80 + 40),
                                      child: _ProjectCard(p: e.value)),
                                ))
                            .toList())),
              ],
            );
          }
          return Column(
              children: kProjects
                  .asMap()
                  .entries
                  .map((e) => Reveal(
                        delay: Duration(milliseconds: e.key * 80),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _ProjectCard(p: e.value),
                        ),
                      ))
                  .toList());
        }),
      ]),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project p;
  const _ProjectCard({required this.p});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    final c1 = hexToColor(p.neonStart);
    final c2 = hexToColor(p.neonEnd);
    final isW = MediaQuery.of(context).size.width > 640;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 230),
        decoration: BoxDecoration(
          color: CyberTheme.panel,
          border: Border.all(
            color: _hovered ? c1.withOpacity(0.8) : CyberTheme.border,
            width: _hovered ? 1.5 : 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                      color: c1.withOpacity(0.2),
                      blurRadius: 40,
                      spreadRadius: 2)
                ]
              : [],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // neon accent bar
          Container(
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [c1, c2]),
              boxShadow: [BoxShadow(color: c1.withOpacity(0.6), blurRadius: 8)],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // header row
              isW
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Expanded(child: _ProjHead(p: p, c1: c1)),
                          const SizedBox(width: 12),
                          _ProjBadges(p: p, c1: c1),
                        ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          _ProjHead(p: p, c1: c1),
                          const SizedBox(height: 8),
                          _ProjBadges(p: p, c1: c1),
                        ]),
              const SizedBox(height: 14),

              Text('> ${p.description}', style: CyberTheme.bodyMedium),
              const SizedBox(height: 16),

              // tech chips
              Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: p.techStack
                      .map((t) => CyberChip(label: t, active: true, color: c1))
                      .toList()),
              const SizedBox(height: 14),

              // expand toggle
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Row(children: [
                  Text(_expanded ? '[ COLLAPSE ]' : '[ VIEW DETAILS ]',
                      style: CyberTheme.labelCyan
                          .copyWith(color: c1, fontSize: 10)),
                  const SizedBox(width: 4),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.keyboard_arrow_down, color: c1, size: 16),
                  ),
                ]),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 280),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Column(
                      children: p.highlights
                          .map((h) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('▸ ',
                                          style: TextStyle(
                                              color: c1, fontSize: 12)),
                                      Expanded(
                                          child: Text(h,
                                              style: CyberTheme.bodyMedium)),
                                    ]),
                              ))
                          .toList()),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}

class _ProjHead extends StatelessWidget {
  final Project p;
  final Color c1;
  const _ProjHead({required this.p, required this.c1});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(p.title, style: CyberTheme.headlineLarge),
          const SizedBox(height: 3),
          Text(p.subtitle, style: CyberTheme.labelMuted),
        ],
      );
}

class _ProjBadges extends StatelessWidget {
  final Project p;
  final Color c1;
  const _ProjBadges({required this.p, required this.c1});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _StatusBadge(status: p.status, color: c1),
          if (p.isFreelance) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: CyberTheme.magenta.withOpacity(0.6)),
                color: CyberTheme.magenta.withOpacity(0.1),
              ),
              child: Text('◈ FREELANCE',
                  style: CyberTheme.labelMagenta.copyWith(fontSize: 9)),
            ),
          ],
        ],
      );
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final Color color;
  const _StatusBadge({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    final isLive = status == 'DEPLOYED';
    final col = isLive ? CyberTheme.green_neon : CyberTheme.orange_neon;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: col.withOpacity(0.6)),
        color: col.withOpacity(0.08),
        boxShadow: [BoxShadow(color: col.withOpacity(0.2), blurRadius: 8)],
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                color: col,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: col.withOpacity(0.8), blurRadius: 4)
                ])),
        const SizedBox(width: 5),
        Text(status,
            style: CyberTheme.labelCyan.copyWith(color: col, fontSize: 9)),
      ]),
    );
  }
}
