// // ═══════════════════════════════════════════════════════════════════════════════
// // VIEW — Contact Section
// // ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/portfolio_controller.dart';
import '../../models/portfolio_data.dart';
import '../../theme/app_theme.dart';
import '../widgets/shared_widgets.dart';

// class ContactSection extends StatelessWidget {
//   const ContactSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ctrl   = context.read<PortfolioController>();
//     final isWide = MediaQuery.of(context).size.width > 900;
//     final info   = kInfo;

//     return Container(
//       key: ctrl.keys['contact'],
//       color: CyberTheme.void_black,
//       padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 96),
//       child: Stack(children: [
//         Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
//         Positioned.fill(child: CustomPaint(painter: ScanlinePainter(opacity: 0.04))),

//         // big glow behind
//         Center(child: Container(
//           width: 600, height: 300,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: RadialGradient(colors: [
//               CyberTheme.cyan.withOpacity(0.04),
//               Colors.transparent,
//             ]),
//           ),
//         )),

//         Column(children: [
//           Reveal(child: Column(children: [
//             Text('// CONTACT.INIT', style: CyberTheme.labelCyan),
//             const SizedBox(height: 16),
//             GlitchText(
//               text: 'INITIATE\nCONNECTION',
//               style: CyberTheme.displayLarge.copyWith(
//                 height: 1.1, textBaseline: TextBaseline.alphabetic,
//                 shadows: CyberTheme.textGlowCyan.cast<Shadow>()),
//             ),
//             const SizedBox(height: 16),
//             Text('> Transmission channel open. Let\'s build something.',
//               style: CyberTheme.bodyLarge.copyWith(color: CyberTheme.text_secondary),
//               textAlign: TextAlign.center),
//           ])),
//           const SizedBox(height: 52),

//           // contact cards
//           Reveal(delay: const Duration(milliseconds: 100),
//             child: Wrap(spacing: 14, runSpacing: 14, alignment: WrapAlignment.center, children: [
//               _ContactCard(
//                 icon: Icons.email_outlined,
//                 label: 'EMAIL',
//                 value: info.email,
//                 color: CyberTheme.cyan,
//                 onTap: () {
//                   Clipboard.setData(ClipboardData(text: info.email));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('> EMAIL COPIED TO CLIPBOARD')));
//                 },
//               ),
//               _ContactCard(
//                 icon: Icons.phone_outlined,
//                 label: 'PHONE',
//                 value: info.phone,
//                 color: CyberTheme.magenta,
//                 onTap: () => launchUrl(Uri.parse('tel:${info.phone}')),
//               ),
//               _ContactCard(
//                 icon: Icons.location_on_outlined,
//                 label: 'LOCATION',
//                 value: info.location,
//                 color: CyberTheme.green_neon,
//                 onTap: () {},
//               ),
//             ]),
//           ),
//           const SizedBox(height: 40),

//           // social links
//           Reveal(delay: const Duration(milliseconds: 180),
//             child: Wrap(spacing: 14, runSpacing: 10, alignment: WrapAlignment.center, children: [
//               _SocialBtn(label: 'GITHUB',   icon: Icons.code,                     url: info.github),
//               _SocialBtn(label: 'LINKEDIN', icon: Icons.business_center_outlined,  url: info.linkedin),
//             ]),
//           ),
//           const SizedBox(height: 72),

//           // footer
//           Reveal(delay: const Duration(milliseconds: 240),
//             child: Column(children: [
//               Divider(color: CyberTheme.cyan.withOpacity(0.15), height: 1),
//               const SizedBox(height: 24),
//               Wrap(
//                 alignment: WrapAlignment.spaceBetween,
//                 spacing: 20, runSpacing: 8,
//                 children: [
//                   Text('© 2025 MANEESH M', style: CyberTheme.labelMuted),
//                   Text('BUILT WITH FLUTTER ⚡', style: CyberTheme.labelMuted),
//                 ],
//               ),
//             ]),
//           ),
//         ]),
//       ]),
//     );
//   }
// }

class _ContactCard extends StatefulWidget {
  final IconData icon;
  final String label, value;
  final Color color;
  final VoidCallback onTap;
  final double width;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
    required this.width,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final col = widget.color;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          height: MediaQuery.sizeOf(context).height * .154,
          padding: EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: _hovered ? col.withOpacity(0.1) : CyberTheme.panel,
            border: Border.all(
              color: _hovered ? col : CyberTheme.border,
              width: _hovered ? 1.5 : 1,
            ),
            boxShadow: _hovered
                ? [BoxShadow(color: col.withOpacity(0.25), blurRadius: 24)]
                : [],
          ),
          child: Column(children: [
            Icon(widget.icon,
                color: _hovered ? col : CyberTheme.text_muted, size: 24),
            const SizedBox(height: 10),
            Text(widget.label,
                style: CyberTheme.labelCyan.copyWith(color: col, fontSize: 10)),
            const SizedBox(height: 6),
            Text(widget.value,
                style: CyberTheme.bodyMedium,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
          ]),
        ),
      ),
    );
  }
}

class _SocialBtn extends StatefulWidget {
  final String label, url;
  final IconData icon;
  const _SocialBtn(
      {required this.label, required this.icon, required this.url});

  @override
  State<_SocialBtn> createState() => _SocialBtnState();
}

class _SocialBtnState extends State<_SocialBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(widget.url)),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                  color: _hovered ? CyberTheme.cyan : CyberTheme.border),
              color: _hovered
                  ? CyberTheme.cyan.withOpacity(0.12)
                  : Colors.transparent,
              boxShadow: _hovered
                  ? [
                      BoxShadow(
                          color: CyberTheme.cyan.withOpacity(0.3),
                          blurRadius: 16)
                    ]
                  : [],
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(widget.icon,
                  color: _hovered ? CyberTheme.cyan : CyberTheme.text_muted,
                  size: 14),
              const SizedBox(width: 8),
              Text(widget.label,
                  style: CyberTheme.labelCyan.copyWith(
                      color:
                          _hovered ? CyberTheme.cyan : CyberTheme.text_muted)),
            ]),
          ),
        ),
      );
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PortfolioController>();
    final width = MediaQuery.of(context).size.width;
    final info = kInfo;

    final bool isMobile = width < 600;
    final bool isTablet = width >= 600 && width < 1000;

    final horizontalPadding = isMobile
        ? 20.0
        : isTablet
            ? 40.0
            : 80.0;
    final glowSize = isMobile
        ? 260.0
        : isTablet
            ? 400.0
            : 600.0;

    return Container(
      key: ctrl.keys['contact'],
      color: CyberTheme.void_black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isMobile ? 70 : 96,
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: CyberGridPainter())),
          Positioned.fill(
              child: CustomPaint(painter: ScanlinePainter(opacity: 0.04))),

          /// background glow
          Center(
            child: Container(
              width: glowSize,
              height: glowSize / 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    CyberTheme.cyan.withOpacity(0.04),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              /// header
              Reveal(
                child: Column(
                  children: [
                    Text('// CONTACT.INIT', style: CyberTheme.labelCyan),
                    const SizedBox(height: 16),
                    Text(
                      'INITIATE\nCONNECTION',
                      textAlign: TextAlign.center,
                      style: CyberTheme.displayLarge.copyWith(
                        fontSize: isMobile ? 40 : 64,
                        height: 1.1,
                        shadows: CyberTheme.textGlowCyan.cast<Shadow>(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 0,
                      ),
                      child: Text(
                        '> Transmission channel open. Let\'s build something.',
                        style: CyberTheme.bodyLarge.copyWith(
                          color: CyberTheme.text_secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 52),

              /// contact cards
              Reveal(
                delay: const Duration(milliseconds: 100),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    _ContactCard(
                      width: isMobile ? width * .8 : 200,
                      icon: Icons.email_outlined,
                      label: 'EMAIL',
                      value: info.email,
                      color: CyberTheme.cyan,
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: info.email));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('> EMAIL COPIED TO CLIPBOARD')),
                        );
                      },
                    ),
                    _ContactCard(
                      width: isMobile ? width * .8 : 200,
                      icon: Icons.phone_outlined,
                      label: 'PHONE',
                      value: info.phone,
                      color: CyberTheme.magenta,
                      onTap: () => launchUrl(Uri.parse('tel:${info.phone}')),
                    ),
                    _ContactCard(
                      width: isMobile ? width * .8 : 200,
                      icon: Icons.location_on_outlined,
                      label: 'LOCATION',
                      value: info.location,
                      color: CyberTheme.green_neon,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              /// social buttons
              Reveal(
                delay: const Duration(milliseconds: 180),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 14,
                  runSpacing: 10,
                  children: [
                    _SocialBtn(
                      label: 'GITHUB',
                      icon: Icons.code,
                      url: info.github,
                    ),
                    _SocialBtn(
                      label: 'LINKEDIN',
                      icon: Icons.business_center_outlined,
                      url: info.linkedin,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 72),

              /// footer
              Reveal(
                delay: const Duration(milliseconds: 240),
                child: Column(
                  children: [
                    Divider(
                      color: CyberTheme.cyan.withOpacity(0.15),
                      height: 1,
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 500) {
                          return Column(
                            children: [
                              Text(
                                '© 2025 MANEESH M',
                                style: CyberTheme.labelMuted,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'BUILT WITH FLUTTER ⚡',
                                style: CyberTheme.labelMuted,
                              ),
                            ],
                          );
                        }

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '© 2025 MANEESH M',
                              style: CyberTheme.labelMuted,
                            ),
                            Text(
                              'BUILT WITH FLUTTER ⚡',
                              style: CyberTheme.labelMuted,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
