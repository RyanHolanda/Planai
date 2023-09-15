import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:planai/dto/workout_plan_dto.dart';
import 'package:planai/screens/created_workout_overview/created_workout_overview_screen.dart';

import 'golden_config.dart';

void main() async {
  final deviceBuilder = await GoldenConfig.build(child: CreatedWorkoutOverview(workoutPlan: WorkoutPlanDto.fixture()));

  testGoldens("Should load the Created workout overview", (tester) async {
    await tester.pumpDeviceBuilder(deviceBuilder);

    await screenMatchesGolden(tester, "created_workout_overview");
  });
}
