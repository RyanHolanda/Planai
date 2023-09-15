import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';

import 'golden_config.dart';

void main() async {
  final deviceBuilder = await GoldenConfig.build(child: const CreateWorkoutScreen());

  testGoldens("Should load create workout screen in the first step", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await screenMatchesGolden(tester, "create_workout_screen_step_one");
  });

  testGoldens("When the user try to continue without adding a value, should display a Snack Bar", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.tap(find.byKey(const Key("height-continue")));

    await screenMatchesGolden(tester, "create_workout_screen_step_one_error");
  });

  testGoldens("When the user add his height in cm, should return the height in cm", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.enterText(find.byKey(const Key('height-field')), "167");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_cm_filled");
  });

  testGoldens("When the user add his height in ft, should return the height in ft with symbols", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.tap(find.byKey(const Key("ft-button")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('height-field')), "167");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_ft_filled");
  });

  testGoldens("When the user add his height in m, should return the height in m with symbols", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.tap(find.byKey(const Key("m-button")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('height-field')), "167");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_m_filled");
  });

  testGoldens("When the user add his height in cm with more than 3 numbers, should return the height with the first 3 numbers", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.enterText(find.byKey(const Key('height-field')), "1674");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_cm_filled_incorrect");
  });

  testGoldens("When the user add his height in ft with more than 3 numbers, should return the height with the first 3 numbers", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.tap(find.byKey(const Key("ft-button")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('height-field')), "1674");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_ft_filled_incorrect");
  });

  testGoldens("When the user add his height in m with more than 3 numbers, should return the height with the first 3 numbers", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.tap(find.byKey(const Key("m-button")));
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(const Key('height-field')), "1674");

    await screenMatchesGolden(tester, "create_workout_screen_step_one_m_filled_incorrect");
  });

  testGoldens("When the user click to convert to ft and the height is filled, should format the value using ft symbols", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.enterText(find.byKey(const Key('height-field')), "1674");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("ft-button")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_one_from_cm_to_ft");
  });

  testGoldens("When the user click to convert to m and the height is filled, should format the value using m symbols", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.enterText(find.byKey(const Key('height-field')), "1674");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("ft-button")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("m-button")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_one_from_ft_to_m");
  });

  testGoldens("When the user click to convert to cm and the height is filled, should format the value without any symbol", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await tester.enterText(find.byKey(const Key('height-field')), "1674");
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("ft-button")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("m-button")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("cm-button")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_screen_step_one_from_m_to_cm");
  });
}
