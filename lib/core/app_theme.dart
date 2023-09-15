import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark
          .copyWith(systemNavigationBarColor: Colors.transparent, systemNavigationBarContrastEnforced: false, systemNavigationBarIconBrightness: Brightness.dark),
    );
  }
  ThemeData buildLightTheme() => ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      listTileTheme: ListTileThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      )),
      hintColor: Colors.grey[400],
      colorScheme: const ColorScheme.light().copyWith(primary: Colors.black),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 32),
      ).apply(fontFamily: 'OpenSans', bodyColor: Colors.black, decorationColor: Colors.black, displayColor: Colors.black),
      shadowColor: Colors.grey[300],
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[300]!, width: 1)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.black),
      pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }));
}
