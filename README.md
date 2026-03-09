# MANEESH M // FLUTTER DEVELOPER PORTFOLIO
### Cyberpunk Dark Theme | MVC + Provider | Fully Responsive

---

## QUICK START

```bash
# 1. Unzip and enter
unzip maneesh_portfolio_cyber.zip
cd maneesh_portfolio

# 2. Install
flutter pub get

# 3. Run
flutter run -d chrome    # web (best experience)
flutter run              # Android
```

---

## PROJECT STRUCTURE (MVC)

```
lib/
├── main.dart
├── models/
│   └── portfolio_data.dart       ← ALL DATA HERE (edit this file only)
├── controllers/
│   └── portfolio_controller.dart ← Provider ChangeNotifier
├── views/
│   ├── screens/portfolio_screen.dart
│   ├── sections/
│   │   ├── hero_section.dart     ← Glitch text, rotating ring, neon avatar
│   │   ├── about_section.dart
│   │   ├── skills_section.dart   ← Tabbed + animated neon progress bars
│   │   ├── projects_section.dart ← 6 projects, 2-col on wide screens
│   │   ├── experience_section.dart ← Neon timeline
│   │   ├── freelance_section.dart
│   │   └── contact_section.dart
│   └── widgets/
│       ├── shared_widgets.dart   ← NeonPanel, NeonButton, GlitchText...
│       └── nav_bar.dart
└── theme/
    └── app_theme.dart            ← Full cyberpunk color system
```

---

## DESIGN TOKENS

| Token | Value | Use |
|-------|-------|-----|
| void_black | #020408 | Deep background |
| deep_void | #060B14 | Section alt bg |
| panel | #0A1628 | Card background |
| cyan | #00FFFF | Primary neon |
| magenta | #FF00FF | Secondary neon |
| green_neon | #00FF88 | Success / active |
| orange_neon | #FF6600 | In-progress |
| text_primary | #E0F7FA | Body text |

## FONTS
- **Orbitron** — Display headings (futuristic)
- **Share Tech Mono** — Body & terminal labels

---

## RESPONSIVENESS

| Breakpoint | Layout |
|-----------|--------|
| < 640px   | Single column, stacked |
| 640–900px | 2-col badges, single column cards |
| 900–1100px | Wide 2-col hero/about |
| > 1100px  | 2-col project grid |

---
*Built with Flutter ⚡ by Maneesh M*
