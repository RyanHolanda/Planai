import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/core/app_theme.dart';
import 'package:planai/l10n/l10n.dart';

class GoldenConfig {
  static final devices = [Device.phone];

  static late Locale? currentLocale;
  static late BuildContext testContext;

  static Future<DeviceBuilder> build({required Widget child}) async {
    await loadAppFonts();
    return DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: devices)
      ..addScenario(
        widget: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: L10n.supportedLocales,
            theme: AppTheme().buildLightTheme(),
            home: child,
          );
        }),
      );
  }
}
