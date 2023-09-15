import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';

import 'golden_config.dart';

void main() async {
  final deviceBuilder = await GoldenConfig.build(child: const CreateWorkoutScreen());

  testGoldens("Should load create workout screen in the third step", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('weight-field')), "6350");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("weight-continue")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_three");
  });

  testGoldens("When the user add his age, should return the age", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('weight-field')), "6350");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("weight-continue")));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('age-field')), "19");
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_three_age_filled");
  });

  testGoldens("When the user add his age with more than 3 characters, should return the first 1 characters", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("lbs-button")));
    await tester.enterText(find.byKey(const Key('weight-field')), "6350");
    await tester.tap(find.byKey(const Key("weight-continue")));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('age-field')), "1234");
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_three_filled_incorrect");
  });

  testGoldens("When the user try to continue without adding a value, should show snackbar", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);
    await tester.enterText(find.byKey(const Key('height-field')), "167");
    await tester.tap(find.byKey(const Key("height-continue")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('weight-field')), "6350");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("weight-continue")));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("age-continue")));

    await screenMatchesGolden(tester, "create_workout_screen_step_three_error");
  });
}
