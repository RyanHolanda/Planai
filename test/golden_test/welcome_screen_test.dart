import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/screens/welcome/welcome_screen.dart';

import 'golden_config.dart';

void main() async {
  final deviceBuilder = await GoldenConfig.build(child: const WelcomeScreen());

  testGoldens("When users open the app for the first time, should show the welcome screen", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await screenMatchesGolden(tester, "welcome_screen");
  });
}
