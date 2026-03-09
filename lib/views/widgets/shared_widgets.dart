// ═══════════════════════════════════════════════════════════════════════════════
// SHARED WIDGETS — Cyberpunk UI components
// ═══════════════════════════════════════════════════════════════════════════════

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../theme/app_theme.dart';

// ─── Reveal on scroll ─────────────────────────────────────────────────────────
class Reveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset from;

  const Reveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.from = const Offset(0, 30),
  });

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double>   _op;
  late final Animation<Offset>   _sl;
  bool _fired = false;

  @override
  void initState() {
    super.initState();
    _c  = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _op = CurvedAnimation(parent: _c, curve: Curves.easeOut).drive(Tween(begin: 0.0, end: 1.0));
    _sl = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic)
        .drive(Tween(begin: widget.from / 80, end: Offset.zero));
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  void _go() {
    if (_fired) return; _fired = true;
    Future.delayed(widget.delay, () { if (mounted) _c.forward(); });
  }

  @override
  Widget build(BuildContext context) => VisibilityDetector(
    key: widget.key ?? UniqueKey(),
    onVisibilityChanged: (i) { if (i.visibleFraction > 0.08) _go(); },
    child: FadeTransition(opacity: _op,
      child: SlideTransition(position: _sl, child: widget.child)),
  );
}

// ─── Neon Panel (card) ────────────────────────────────────────────────────────
class NeonPanel extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? glowColor;
  final bool hoverable;
  final double radius;

  const NeonPanel({
    super.key,
    required this.child,
    this.padding,
    this.glowColor,
    this.hoverable = true,
    this.radius = 4,
  });

  @override
  State<NeonPanel> createState() => _NeonPanelState();
}

class _NeonPanelState extends State<NeonPanel> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final glow = widget.glowColor ?? CyberTheme.cyan;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: widget.padding ?? const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: CyberTheme.panelGrad,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: _hovered && widget.hoverable
                ? glow.withOpacity(0.8)
                : CyberTheme.border,
            width: _hovered && widget.hoverable ? 1.5 : 1,
          ),
          boxShadow: _hovered && widget.hoverable
              ? [BoxShadow(color: glow.withOpacity(0.15), blurRadius: 40, spreadRadius: 2),
                 BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)]
              : [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 12)],
        ),
        child: widget.child,
      ),
    );
  }
}

// ─── Neon Button ─────────────────────────────────────────────────────────────
class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool outlined;
  final IconData? icon;
  final Color? color;
  final double? fontSize;

  const NeonButton({
    super.key,
    required this.label,
    this.onTap,
    this.outlined = false,
    this.icon,
    this.color,
    this.fontSize,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final col = widget.color ?? CyberTheme.cyan;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: widget.outlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: _hovered ? col : col.withOpacity(0.5), width: 1.5),
                  color: _hovered ? col.withOpacity(0.12) : Colors.transparent,
                  boxShadow: _hovered ? [BoxShadow(color: col.withOpacity(0.3), blurRadius: 20)] : [],
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: _hovered ? col.withOpacity(0.9) : col.withOpacity(0.15),
                  border: Border.all(color: col, width: 1.5),
                  boxShadow: _hovered
                      ? [BoxShadow(color: col.withOpacity(0.5), blurRadius: 24, spreadRadius: 2)]
                      : [BoxShadow(color: col.withOpacity(0.2), blurRadius: 12)],
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 14,
                  color: widget.outlined || !_hovered ? col : CyberTheme.void_black),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: CyberTheme.labelCyan.copyWith(
                  color: widget.outlined || !_hovered ? col : CyberTheme.void_black,
                  fontSize: widget.fontSize ?? 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Cyber chip / tag ─────────────────────────────────────────────────────────
class CyberChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color? color;

  const CyberChip({super.key, required this.label, this.active = false, this.color});

  @override
  Widget build(BuildContext context) {
    final col = color ?? CyberTheme.cyan;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: active ? col.withOpacity(0.15) : CyberTheme.panel,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: active ? col.withOpacity(0.7) : CyberTheme.border),
      ),
      child: Text(label, style: CyberTheme.labelMuted.copyWith(
        color: active ? col : CyberTheme.text_muted,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}

// ─── Section Header ───────────────────────────────────────────────────────────
class CyberHeader extends StatelessWidget {
  final String sys, title;
  final String? sub;

  const CyberHeader({super.key, required this.sys, required this.title, this.sub});

  @override
  Widget build(BuildContext context) => Column(children: [
    Text(sys, style: CyberTheme.labelCyan),
    const SizedBox(height: 12),
    Text(title, style: CyberTheme.displayMedium, textAlign: TextAlign.center),
    if (sub != null) ...[
      const SizedBox(height: 14),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Text(sub!, style: CyberTheme.bodyLarge, textAlign: TextAlign.center),
      ),
    ],
  ]);
}

// ─── Animated counter ─────────────────────────────────────────────────────────
class CyberCounter extends StatefulWidget {
  final int value;
  final String suffix;
  final TextStyle style;

  const CyberCounter({super.key, required this.value, required this.suffix, required this.style});

  @override
  State<CyberCounter> createState() => _CyberCounterState();
}

class _CyberCounterState extends State<CyberCounter> with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _a;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
    _a = CurvedAnimation(parent: _c, curve: Curves.easeOutExpo)
        .drive(Tween(begin: 0.0, end: widget.value.toDouble()));
    Future.delayed(const Duration(milliseconds: 500), () { if (mounted) _c.forward(); });
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _a,
    builder: (_, __) => Text('${_a.value.toInt()}${widget.suffix}', style: widget.style),
  );
}

// ─── Scanline overlay painter ─────────────────────────────────────────────────
class ScanlinePainter extends CustomPainter {
  final double opacity;
  const ScanlinePainter({this.opacity = 0.025});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = Colors.black.withOpacity(opacity)..strokeWidth = 1;
    for (double y = 0; y < size.height; y += 3) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Cyber grid painter ───────────────────────────────────────────────────────
class CyberGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final major = Paint()..color = CyberTheme.cyan.withOpacity(0.04)..strokeWidth = 1;
    final minor = Paint()..color = CyberTheme.cyan.withOpacity(0.015)..strokeWidth = 0.5;

    // major grid 80px
    for (double x = 0; x < size.width; x += 80)
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), major);
    for (double y = 0; y < size.height; y += 80)
      canvas.drawLine(Offset(0, y), Offset(size.width, y), major);

    // minor grid 20px
    for (double x = 0; x < size.width; x += 20)
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), minor);
    for (double y = 0; y < size.height; y += 20)
      canvas.drawLine(Offset(0, y), Offset(size.width, y), minor);
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Corner bracket decoration ────────────────────────────────────────────────
class CornerBrackets extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double size;
  final double thickness;

  const CornerBrackets({
    super.key,
    required this.child,
    this.color,
    this.size = 16,
    this.thickness = 2,
  });

  @override
  Widget build(BuildContext context) {
    final col = color ?? CyberTheme.cyan;
    return Stack(children: [
      child,
      Positioned(top: 0, left: 0, child: _Corner(col, size, thickness, false, false)),
      Positioned(top: 0, right: 0, child: _Corner(col, size, thickness, true, false)),
      Positioned(bottom: 0, left: 0, child: _Corner(col, size, thickness, false, true)),
      Positioned(bottom: 0, right: 0, child: _Corner(col, size, thickness, true, true)),
    ]);
  }
}

class _Corner extends StatelessWidget {
  final Color col;
  final double size, thickness;
  final bool flipH, flipV;
  const _Corner(this.col, this.size, this.thickness, this.flipH, this.flipV);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size, height: size,
    child: CustomPaint(painter: _CornerPainter(col, thickness, flipH, flipV)),
  );
}

class _CornerPainter extends CustomPainter {
  final Color col;
  final double t;
  final bool fh, fv;
  _CornerPainter(this.col, this.t, this.fh, this.fv);

  @override
  void paint(Canvas canvas, Size s) {
    final p = Paint()..color = col..strokeWidth = t..style = PaintingStyle.stroke;
    final x1 = fh ? s.width : 0.0;
    final x2 = fh ? 0.0 : s.width;
    final y1 = fv ? s.height : 0.0;
    final y2 = fv ? 0.0 : s.height;
    canvas.drawLine(Offset(x1, y1), Offset(x2, y1), p);
    canvas.drawLine(Offset(x1, y1), Offset(x1, y2), p);
  }

  @override
  bool shouldRepaint(_) => false;
}

// ─── Glitch text effect ───────────────────────────────────────────────────────
class GlitchText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const GlitchText({super.key, required this.text, required this.style});

  @override
  State<GlitchText> createState() => _GlitchTextState();
}

class _GlitchTextState extends State<GlitchText> with SingleTickerProviderStateMixin {
  late AnimationController _c;
  final _rng = math.Random();
  double _offsetX = 0, _offsetX2 = 0;
  bool _glitching = false;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 100));
    _scheduleGlitch();
  }

  void _scheduleGlitch() {
    Future.delayed(Duration(milliseconds: 2000 + _rng.nextInt(3000)), () {
      if (!mounted) return;
      setState(() { _glitching = true; _offsetX = (_rng.nextDouble() - 0.5) * 6; _offsetX2 = (_rng.nextDouble() - 0.5) * 4; });
      Future.delayed(const Duration(milliseconds: 80), () {
        if (!mounted) return;
        setState(() { _glitching = false; _offsetX = 0; _offsetX2 = 0; });
      });
      _scheduleGlitch();
    });
  }

  @override
  void dispose() { _c.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    if (!_glitching) return Text(widget.text, style: widget.style);
    return Stack(children: [
      // magenta ghost
      Transform.translate(
        offset: Offset(_offsetX, 0),
        child: Text(widget.text, style: widget.style.copyWith(
          color: CyberTheme.magenta.withOpacity(0.7),
          shadows: [],
        )),
      ),
      // cyan ghost
      Transform.translate(
        offset: Offset(_offsetX2, 0),
        child: Text(widget.text, style: widget.style.copyWith(
          color: CyberTheme.cyan.withOpacity(0.7),
          shadows: [],
        )),
      ),
      // base
      Text(widget.text, style: widget.style),
    ]);
  }
}
