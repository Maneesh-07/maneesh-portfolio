// ═══════════════════════════════════════════════════════════════════════════════
// ENTRY POINT — main.dart
// ═══════════════════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'controllers/portfolio_controller.dart';
import 'views/screens/portfolio_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF020408),
  ));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PortfolioController()),
        ],
        child: MaterialApp(
          title: 'Maneesh M // Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: CyberTheme.dark,
          home: const PortfolioScreen(),
          scrollBehavior: _ScrollBehavior(),
        ),
      );
}

class _ScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();
}
