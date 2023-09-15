import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:planai/core/app_theme.dart';
import 'package:planai/core/inject.dart';
import 'package:planai/l10n/l10n.dart';
import 'package:planai/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  await setupInjection();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        S.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme().buildLightTheme(),
      home: const WelcomeScreen(),
    );
  }
}
