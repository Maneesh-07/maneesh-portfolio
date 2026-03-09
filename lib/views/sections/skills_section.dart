// // ═══════════════════════════════════════════════════════════════════════════════
// // VIEW — Skills Section
// // ═══════════════════════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/portfolio_controller.dart';
// import '../../models/portfolio_data.dart';
// import '../../theme/app_theme.dart';
// import '../widgets/shared_widgets.dart';

// class SkillsSection extends StatelessWidget {
//   const SkillsSection({super.key});

//   static const _tabs = ['Mobile', 'Backend', 'Tools'];
//   static const _other = [
//     'SAP INTEGRATION', 'TMDB API', 'WEATHER API', 'SOAP API',
//     'YOUTUBE API', 'WOOCOMMERCE', 'PHOTOSHOP', 'C / C++ / JAVA',
//     'HTML & CSS', 'BARCODE SCANNING', 'AGILE / SCRUM',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final ctrl   = context.watch<PortfolioController>();
//     final isWide = MediaQuery.of(context).size.width > 900;
//     final skills = kSkills.where((s) => s.category == ctrl.skillTab).toList();

//     return Container(
//       key: ctrl.keys['skills'],
//       color: CyberTheme.void_black,
//       padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 96),
//       child: Stack(children: [
//         Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
//         Column(children: [
//           Reveal(child: CyberHeader(
//             sys: '// SKILLS.LOG',
//             title: 'TECH STACK',
//             sub: 'Tools forged through real-world delivery — POS systems, '
//                 'enterprise apps, booking platforms.',
//           )),
//           const SizedBox(height: 44),

//           // tabs
//           Reveal(delay: const Duration(milliseconds: 80),
//             child: Row(mainAxisAlignment: MainAxisAlignment.center,
//               children: _tabs.map((t) {
//                 final active = ctrl.skillTab == t;
//                 return GestureDetector(
//                   onTap: () => ctrl.setTab(t),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 200),
//                     margin: const EdgeInsets.symmetric(horizontal: 4),
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: active ? CyberTheme.cyan.withOpacity(0.15) : Colors.transparent,
//                       border: Border.all(
//                         color: active ? CyberTheme.cyan : CyberTheme.border),
//                       boxShadow: active
//                           ? [BoxShadow(color: CyberTheme.cyan.withOpacity(0.3), blurRadius: 16)]
//                           : [],
//                     ),
//                     child: Text(t.toUpperCase(),
//                       style: CyberTheme.labelCyan.copyWith(
//                         color: active ? CyberTheme.cyan : CyberTheme.text_muted)),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//           const SizedBox(height: 40),

//           // skill grid
//           Reveal(delay: const Duration(milliseconds: 160),
//             child: LayoutBuilder(builder: (_, c) {
//               final cols = c.maxWidth > 700 ? 3 : 2;
//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: cols,
//                   childAspectRatio: cols == 3 ? 2.8 : 2.4,
//                   crossAxisSpacing: 12, mainAxisSpacing: 12,
//                 ),
//                 itemCount: skills.length,
//                 itemBuilder: (_, i) => _SkillCard(skill: skills[i], index: i),
//               );
//             }),
//           ),
//           const SizedBox(height: 60),

//           // also experienced with
//           Reveal(delay: const Duration(milliseconds: 200),
//             child: Column(children: [
//               Text('// ALSO_EXPERIENCED', style: CyberTheme.labelMuted),
//               const SizedBox(height: 20),
//               Wrap(
//                 spacing: 8, runSpacing: 8,
//                 alignment: WrapAlignment.center,
//                 children: _other.map((t) => CyberChip(label: t)).toList(),
//               ),
//             ]),
//           ),
//         ]),
//       ]),
//     );
//   }
// }

// class _SkillCard extends StatefulWidget {
//   final Skill skill;
//   final int index;
//   const _SkillCard({required this.skill, required this.index});

//   @override
//   State<_SkillCard> createState() => _SkillCardState();
// }

// class _SkillCardState extends State<_SkillCard> with SingleTickerProviderStateMixin {
//   late final AnimationController _c;
//   late final Animation<double>   _bar;
//   bool _hovered = false;

//   @override
//   void initState() {
//     super.initState();
//     _c   = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
//     _bar = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic)
//         .drive(Tween(begin: 0.0, end: widget.skill.level));
//     Future.delayed(Duration(milliseconds: 200 + widget.index * 80), () {
//       if (mounted) _c.forward();
//     });
//   }

//   @override
//   void dispose() { _c.dispose(); super.dispose(); }

//   @override
//   Widget build(BuildContext context) => MouseRegion(
//     onEnter: (_) => setState(() => _hovered = true),
//     onExit:  (_) => setState(() => _hovered = false),
//     child: AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: _hovered ? CyberTheme.panel_light : CyberTheme.panel,
//         border: Border.all(
//           color: _hovered ? CyberTheme.cyan.withOpacity(0.7) : CyberTheme.border),
//         boxShadow: _hovered
//             ? [BoxShadow(color: CyberTheme.cyan.withOpacity(0.15), blurRadius: 20)]
//             : [],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(children: [
//             Text(widget.skill.icon,
//               style: TextStyle(color: CyberTheme.cyan, fontSize: 14)),
//             const SizedBox(width: 8),
//             Expanded(child: Text(widget.skill.name,
//               style: CyberTheme.headlineMedium.copyWith(fontSize: 12),
//               overflow: TextOverflow.ellipsis)),
//             Text('${(widget.skill.level * 100).toInt()}%',
//               style: CyberTheme.labelCyan.copyWith(fontSize: 10)),
//           ]),
//           const SizedBox(height: 10),
//           Stack(children: [
//             Container(height: 3, color: CyberTheme.border),
//             AnimatedBuilder(
//               animation: _bar,
//               builder: (_, __) => FractionallySizedBox(
//                 widthFactor: _bar.value,
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   height: 3,
//                   decoration: BoxDecoration(
//                     gradient: CyberTheme.cyanGrad,
//                     boxShadow: [BoxShadow(color: CyberTheme.cyan.withOpacity(0.6), blurRadius: 6)],
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ],
//       ),
//     ),
//   );
// }

// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Skills Section
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const _tabs = ['Mobile', 'Backend', 'Tools'];
  static const _other = [
    'SAP INTEGRATION',
    'TMDB API',
    'WEATHER API',
    'SOAP API',
    'YOUTUBE API',
    'WOOCOMMERCE',
    'PHOTOSHOP',
    'C / C++ / JAVA',
    'HTML & CSS',
    'BARCODE SCANNING',
    'AGILE / SCRUM',
  ];

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PortfolioController>();
    final width = MediaQuery.of(context).size.width;
    final skills = kSkills.where((s) => s.category == ctrl.skillTab).toList();

    // Fluid padding matching other sections
    final double horizontalPadding = width > 1200
        ? 120
        : width > 900
            ? 80
            : width > 600
                ? 48
                : 24;

    return Container(
      key: ctrl.keys['skills'],
      color: CyberTheme.void_black,
      padding:
          EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 96),
      child: Stack(children: [
        Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
        Column(children: [
          Reveal(
              child: CyberHeader(
            sys: '// SKILLS.LOG',
            title: 'TECH STACK',
            sub: 'Tools forged through real-world delivery — POS systems, '
                'enterprise apps, booking platforms.',
          )),
          const SizedBox(height: 44),

          // Tabs (Switched to Wrap to prevent overflow on very narrow phones)
          Reveal(
            delay: const Duration(milliseconds: 80),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 12,
              children: _tabs.map((t) {
                final active = ctrl.skillTab == t;
                return GestureDetector(
                  onTap: () => ctrl.setTab(t),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: active
                          ? CyberTheme.cyan.withOpacity(0.15)
                          : Colors.transparent,
                      border: Border.all(
                          color: active ? CyberTheme.cyan : CyberTheme.border),
                      boxShadow: active
                          ? [
                              BoxShadow(
                                  color: CyberTheme.cyan.withOpacity(0.3),
                                  blurRadius: 16)
                            ]
                          : [],
                    ),
                    child: Text(t.toUpperCase(),
                        style: CyberTheme.labelCyan.copyWith(
                            color: active
                                ? CyberTheme.cyan
                                : CyberTheme.text_muted)),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 40),

          // Skill Grid
          Reveal(
            delay: const Duration(milliseconds: 160),
            child: LayoutBuilder(builder: (_, constraints) {
              // Responsive column counts
              int crossAxisCount;
              if (constraints.maxWidth < 550) {
                crossAxisCount = 1; // Mobile
              } else if (constraints.maxWidth < 900) {
                crossAxisCount = 2; // Tablet
              } else if (constraints.maxWidth < 1300) {
                crossAxisCount = 3; // Small Desktop
              } else {
                crossAxisCount = 4; // Large Desktop
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisExtent:
                      76, // Fixed height prevents squishing/stretching
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: skills.length,
                itemBuilder: (_, i) => _SkillCard(skill: skills[i], index: i),
              );
            }),
          ),
          const SizedBox(height: 60),

          // Also Experienced With
          Reveal(
            delay: const Duration(milliseconds: 200),
            child: Column(children: [
              Text('// ALSO_EXPERIENCED', style: CyberTheme.labelMuted),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: _other.map((t) => CyberChip(label: t)).toList(),
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;
  final int index;
  const _SkillCard({required this.skill, required this.index});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _bar;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _bar = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic)
        .drive(Tween(begin: 0.0, end: widget.skill.level));

    // Trigger animation slightly delayed based on grid index
    Future.delayed(Duration(milliseconds: 200 + widget.index * 80), () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _hovered ? CyberTheme.panel_light : CyberTheme.panel,
            border: Border.all(
                color: _hovered
                    ? CyberTheme.cyan.withOpacity(0.7)
                    : CyberTheme.border),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                        color: CyberTheme.cyan.withOpacity(0.15),
                        blurRadius: 20)
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment
                .center, // Centers contents vertically within the fixed mainAxisExtent
            children: [
              Row(children: [
                Text(widget.skill.icon,
                    style: TextStyle(color: CyberTheme.cyan, fontSize: 14)),
                const SizedBox(width: 8),
                Expanded(
                    child: Text(widget.skill.name,
                        style: CyberTheme.headlineMedium.copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis)),
                Text('${(widget.skill.level * 100).toInt()}%',
                    style: CyberTheme.labelCyan.copyWith(fontSize: 10)),
              ]),
              const SizedBox(height: 12),
              Stack(children: [
                Container(height: 3, color: CyberTheme.border),
                AnimatedBuilder(
                  animation: _bar,
                  builder: (_, __) => FractionallySizedBox(
                    widthFactor: _bar.value,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: CyberTheme.cyanGrad,
                        boxShadow: [
                          BoxShadow(
                              color: CyberTheme.cyan.withOpacity(0.6),
                              blurRadius: 6)
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      );
}
