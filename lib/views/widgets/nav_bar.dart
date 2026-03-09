// // ═══════════════════════════════════════════════════════════════════════════════
// // VIEW — Cyberpunk NavBar
// // ═══════════════════════════════════════════════════════════════════════════════

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/portfolio_controller.dart';
// import '../../theme/app_theme.dart';

// class CyberNavBar extends StatelessWidget {
//   const CyberNavBar({super.key});

//   static const _links = [
//     ('ABOUT',      'about'),
//     ('SKILLS',     'skills'),
//     ('PROJECTS',   'projects'),
//     ('EXPERIENCE', 'experience'),
//     ('FREELANCE',  'freelance'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final ctrl  = context.watch<PortfolioController>();
//     final isWide = MediaQuery.of(context).size.width > 850;

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       height: 64,
//       decoration: BoxDecoration(
//         color: ctrl.isScrolled
//             ? CyberTheme.void_black.withOpacity(0.95)
//             : Colors.transparent,
//         border: ctrl.isScrolled
//             ? Border(bottom: BorderSide(color: CyberTheme.cyan.withOpacity(0.25), width: 1))
//             : null,
//         boxShadow: ctrl.isScrolled
//             ? [BoxShadow(color: CyberTheme.cyan.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 4))]
//             : [],
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 20),
//         child: Row(children: [
//           _Logo(),
//           const Spacer(),
//           if (isWide) ...[
//             ..._links.map((l) => _NavLink(l.$1, l.$2)),
//             const SizedBox(width: 16),
//             _HireBtn(),
//           ] else
//             _MobileBtn(),
//         ]),
//       ),
//     );
//   }
// }

// class _Logo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => Row(children: [
//     Container(
//       width: 36, height: 36,
//       decoration: BoxDecoration(
//         border: Border.all(color: CyberTheme.cyan, width: 1.5),
//         color: CyberTheme.cyan.withOpacity(0.1),
//       ),
//       child: Center(child: Text('MM',
//         style: CyberTheme.labelCyan.copyWith(fontSize: 12, fontWeight: FontWeight.w900))),
//     ),
//     const SizedBox(width: 10),
//     Text('MANEESH.DEV',
//       style: CyberTheme.headlineMedium.copyWith(
//         fontSize: 13,
//         color: CyberTheme.cyan,
//         shadows: CyberTheme.textGlowCyan.cast<Shadow>(),
//       )),
//   ]);
// }

// class _NavLink extends StatefulWidget {
//   final String label, section;
//   const _NavLink(this.label, this.section);

//   @override
//   State<_NavLink> createState() => _NavLinkState();
// }

// class _NavLinkState extends State<_NavLink> {
//   bool _hovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = context.read<PortfolioController>();
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (_) => setState(() => _hovered = true),
//       onExit:  (_) => setState(() => _hovered = false),
//       child: GestureDetector(
//         onTap: () => ctrl.scrollTo(widget.section),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//           child: Column(mainAxisSize: MainAxisSize.min, children: [
//             Text(widget.label, style: CyberTheme.labelCyan.copyWith(
//               color: _hovered ? CyberTheme.cyan : CyberTheme.text_muted,
//               fontSize: 10,
//             )),
//             if (_hovered)
//               Container(
//                 margin: const EdgeInsets.only(top: 2),
//                 height: 1,
//                 width: 30,
//                 color: CyberTheme.cyan,
//               ),
//           ]),
//         ),
//       ),
//     );
//   }
// }

// class _HireBtn extends StatefulWidget {
//   @override
//   State<_HireBtn> createState() => _HireBtnState();
// }

// class _HireBtnState extends State<_HireBtn> {
//   bool _hovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final ctrl = context.read<PortfolioController>();
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (_) => setState(() => _hovered = true),
//       onExit:  (_) => setState(() => _hovered = false),
//       child: GestureDetector(
//         onTap: () => ctrl.scrollTo('contact'),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
//           decoration: BoxDecoration(
//             border: Border.all(color: CyberTheme.cyan, width: 1.5),
//             color: _hovered ? CyberTheme.cyan.withOpacity(0.9) : CyberTheme.cyan.withOpacity(0.1),
//             boxShadow: _hovered
//                 ? [BoxShadow(color: CyberTheme.cyan.withOpacity(0.5), blurRadius: 20)]
//                 : [],
//           ),
//           child: Text('[ HIRE ME ]', style: CyberTheme.labelCyan.copyWith(
//             color: _hovered ? CyberTheme.void_black : CyberTheme.cyan,
//             fontWeight: FontWeight.w900, fontSize: 10,
//           )),
//         ),
//       ),
//     );
//   }
// }

// class _MobileBtn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final ctrl = context.read<PortfolioController>();
//     return IconButton(
//       icon: Icon(Icons.menu_rounded, color: CyberTheme.cyan),
//       onPressed: () => showModalBottomSheet(
//         context: context,
//         backgroundColor: CyberTheme.panel,
//         shape: const RoundedRectangleBorder(),
//         builder: (_) {
//           final items = [
//             ('ABOUT','about'), ('SKILLS','skills'), ('PROJECTS','projects'),
//             ('EXPERIENCE','experience'), ('FREELANCE','freelance'), ('CONTACT','contact'),
//           ];
//           return Container(
//             decoration: BoxDecoration(border: Border(top: BorderSide(color: CyberTheme.cyan, width: 1))),
//             child: Column(mainAxisSize: MainAxisSize.min, children: [
//               const SizedBox(height: 12),
//               ...items.map((i) => InkWell(
//                 onTap: () { Navigator.pop(context); ctrl.scrollTo(i.$2); },
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(i.$1, style: CyberTheme.headlineMedium),
//                       Text('▶', style: CyberTheme.labelCyan),
//                     ],
//                   ),
//                 ),
//               )),
//               const SizedBox(height: 16),
//             ]),
//           );
//         },
//       ),
//     );
//   }
// }
// ═══════════════════════════════════════════════════════════════════════════════
// VIEW — Cyberpunk NavBar
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/portfolio_controller.dart';
import '../../theme/app_theme.dart';

class CyberNavBar extends StatelessWidget {
  const CyberNavBar({super.key});

  static const _links = [
    ('ABOUT', 'about'),
    ('SKILLS', 'skills'),
    ('PROJECTS', 'projects'),
    ('EXPERIENCE', 'experience'),
    ('FREELANCE', 'freelance'),
  ];

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PortfolioController>();
    final width = MediaQuery.of(context).size.width;

    // Unified breakpoint matching the rest of the app sections
    final isDesktop = width > 900;

    // Fluid padding matching other sections
    final double horizontalPadding = width > 1200
        ? 20
        : width > 900
            ? 10
            : width > 600
                ? 48
                : 24;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 64,
      decoration: BoxDecoration(
        color: ctrl.isScrolled
            ? CyberTheme.void_black.withOpacity(0.95)
            : Colors.transparent,
        border: ctrl.isScrolled
            ? Border(
                bottom: BorderSide(
                    color: CyberTheme.cyan.withOpacity(0.25), width: 1))
            : null,
        boxShadow: ctrl.isScrolled
            ? [
                BoxShadow(
                    color: CyberTheme.cyan.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 4))
              ]
            : [],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Center(
          child: Row(children: [
            _Logo(),
            const Spacer(),
            if (isDesktop) ...[
              ..._links.map((l) => _NavLink(l.$1, l.$2)),
              const SizedBox(width: 16),
              _HireBtn(),
            ] else
              _MobileBtn(),
          ]),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
          mainAxisSize:
              MainAxisSize.min, // Fixes the layout constraint calculation
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                border: Border.all(color: CyberTheme.cyan, width: 1.5),
                color: CyberTheme.cyan.withOpacity(0.1),
              ),
              child: Center(
                  child: Text('MM',
                      style: CyberTheme.labelCyan.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w900))),
            ),
            const SizedBox(width: 10),
            Text('MANEESH.DEV',
                style: CyberTheme.headlineMedium.copyWith(
                  fontSize: 13,
                  color: CyberTheme.cyan,
                  shadows: CyberTheme.textGlowCyan.cast<Shadow>(),
                )),
          ]);
}

class _NavLink extends StatefulWidget {
  final String label, section;
  const _NavLink(this.label, this.section);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => ctrl.scrollTo(widget.section),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(widget.label,
                style: CyberTheme.labelCyan.copyWith(
                  color: _hovered ? CyberTheme.cyan : CyberTheme.text_muted,
                  fontSize: 10,
                )),
            if (_hovered)
              Container(
                margin: const EdgeInsets.only(top: 2),
                height: 1,
                width: 30,
                color: CyberTheme.cyan,
              ),
          ]),
        ),
      ),
    );
  }
}

class _HireBtn extends StatefulWidget {
  @override
  State<_HireBtn> createState() => _HireBtnState();
}

class _HireBtnState extends State<_HireBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => ctrl.scrollTo('contact'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            border: Border.all(color: CyberTheme.cyan, width: 1.5),
            color: _hovered
                ? CyberTheme.cyan.withOpacity(0.9)
                : CyberTheme.cyan.withOpacity(0.1),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                        color: CyberTheme.cyan.withOpacity(0.5), blurRadius: 20)
                  ]
                : [],
          ),
          child: Text('[ HIRE ME ]',
              style: CyberTheme.labelCyan.copyWith(
                color: _hovered ? CyberTheme.void_black : CyberTheme.cyan,
                fontWeight: FontWeight.w900,
                fontSize: 10,
              )),
        ),
      ),
    );
  }
}

class _MobileBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    return IconButton(
      icon: Icon(Icons.menu_rounded, color: CyberTheme.cyan),
      onPressed: () => showModalBottomSheet(
        context: context,
        backgroundColor: CyberTheme.panel,
        shape: const RoundedRectangleBorder(),
        constraints: const BoxConstraints(maxWidth: 600),
        builder: (_) {
          final items = [
            ('ABOUT', 'about'),
            ('SKILLS', 'skills'),
            ('PROJECTS', 'projects'),
            ('EXPERIENCE', 'experience'),
            ('FREELANCE', 'freelance'),
            ('CONTACT', 'contact'),
          ];
          return SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: CyberTheme.cyan, width: 1))),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const SizedBox(height: 12),
                ...items.map((i) => InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        ctrl.scrollTo(i.$2);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(i.$1, style: CyberTheme.headlineMedium),
                            Text('▶', style: CyberTheme.labelCyan),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(height: 16),
              ]),
            ),
          );
        },
      ),
    );
  }
}
