import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';

import 'golden_config.dart';

void main() async {
  final deviceBuilder = await GoldenConfig.build(child: const CreateWorkoutScreen());

  testGoldens("Should load create workout screen in the second step", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_two");
  });

  testGoldens("When the user add his weight in kg, should return the weight in kg", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('weight-field')), "6350");

    await screenMatchesGolden(tester, "create_workout_screen_step_two_kg_filled");
  });

  testGoldens("When the user add his weight in lbs, should return the weight in lbs", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("lbs-button")));
    await tester.enterText(find.byKey(const Key('weight-field')), "6350");

    await screenMatchesGolden(tester, "create_workout_screen_step_two_lbs_filled");
  });

  testGoldens("When the user add his weight in lbs with more than 5 characters, should display only the first 5", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("lbs-button")));
    await tester.enterText(find.byKey(const Key('weight-field')), "123456");

    await screenMatchesGolden(tester, "create_workout_screen_step_two_lbs_filled_incorrect");
  });

  testGoldens("When the user add his weight in kg with more than 5 characters, should display only the first 5", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('weight-field')), "123456");

    await screenMatchesGolden(tester, "create_workout_screen_step_two_kg_filled_incorrect");
  });

  testGoldens("When the user try to continue without adding a value, should show snackbar", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("weight-continue")));

    await screenMatchesGolden(tester, "create_workout_screen_step_two_error");
  });
}
