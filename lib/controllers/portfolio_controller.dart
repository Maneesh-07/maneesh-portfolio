// ═══════════════════════════════════════════════════════════════════════════════
// CONTROLLER — PortfolioController
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

class PortfolioController extends ChangeNotifier {
  // ─── Scroll ───────────────────────────────────────────────────────
  final ScrollController scrollController = ScrollController();
  double _offset = 0;
  bool   _scrolled = false;

  double get offset    => _offset;
  bool   get isScrolled => _scrolled;

  // ─── Section keys ─────────────────────────────────────────────────
  final Map<String, GlobalKey> keys = {
    'hero':       GlobalKey(),
    'about':      GlobalKey(),
    'skills':     GlobalKey(),
    'projects':   GlobalKey(),
    'experience': GlobalKey(),
    'freelance':  GlobalKey(),
    'contact':    GlobalKey(),
  };

  // ─── Skills tab ───────────────────────────────────────────────────
  String _skillTab = 'Mobile';
  String get skillTab => _skillTab;
  void setTab(String t) { _skillTab = t; notifyListeners(); }

  // ─── Init ─────────────────────────────────────────────────────────
  PortfolioController() {
    scrollController.addListener(() {
      _offset   = scrollController.offset;
      _scrolled = _offset > 60;
      notifyListeners();
    });
  }

  // ─── Navigate ─────────────────────────────────────────────────────
  void scrollTo(String section) {
    final ctx = keys[section]?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void toTop() {
    scrollController.animateTo(0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
