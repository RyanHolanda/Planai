import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:planai/dto/workout_plan_dto.dart';
import 'package:planai/repository/workout_repository.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';

import '../mocks_generator.mocks.dart';
import 'golden_config.dart';

void main() async {
  final workoutRepositoryMock = MockWorkoutRepository();
  setUp(() {
    GetIt.I.registerFactory<WorkoutRepository>(() => workoutRepositoryMock);
    when(workoutRepositoryMock.createWorkout(userInfo: anyNamed('userInfo'), prompt: anyNamed("prompt"))).thenAnswer((_) async => WorkoutPlanDto.fixture());
  });

  tearDown(() => GetIt.I.reset());

  final deviceBuilder = await GoldenConfig.build(child: const CreateWorkoutScreen());

  testGoldens("Should load create workout screen in the fourth step", (tester) async {
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
    await tester.tap(find.byKey(const Key("age-continue")));

    await screenMatchesGolden(tester, "create_workout_screen_step_four");
  });
}
