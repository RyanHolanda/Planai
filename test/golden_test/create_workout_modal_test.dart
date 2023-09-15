import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/mockito.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/dto/workout_plan_dto.dart';
import 'package:planai/repository/workout_repository.dart';
import 'package:planai/screens/create_workout/create_workout_screen.dart';

import '../mocks_generator.mocks.dart';
import 'golden_config.dart';

void main() async {
  final workoutRepositoryMock = MockWorkoutRepository();
  setUp(() {
    GetIt.I.registerFactory<WorkoutRepository>(() => workoutRepositoryMock);
    when(workoutRepositoryMock.createWorkout(userInfo: anyNamed("userInfo"), prompt: anyNamed("prompt"))).thenAnswer((_) async => WorkoutPlanDto.fixture());
  });

  tearDown(() => GetIt.I.reset());

  final deviceBuilder = await GoldenConfig.build(child: const CreateWorkoutScreen());

  testGoldens("When the user choose one focus, should show a modal to ask if the user want to go to the gym", (tester) async {
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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(UserFocus.lowerBody.name)));

    await screenMatchesGolden(tester, "create_workout_modal");
  });

  testGoldens("When the user mark the Radio Button with Gym should mark the Radio Button", (tester) async {
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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(UserFocus.lowerBody.name)));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key("gym")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "workout_modal_gym");
  });

  testGoldens("When the user mark the Radio Button without Gym should mark the Radio Button", (tester) async {
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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(UserFocus.lowerBody.name)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("no-gym")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "workout_modal_no_gym");
  });

  testGoldens("When the user mark any Radio Button, click create workout and an error happen, should show error modal", (tester) async {
    when(workoutRepositoryMock.createWorkout(userInfo: anyNamed('userInfo'), prompt: anyNamed("prompt"))).thenThrow(Exception());

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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(UserFocus.lowerBody.name)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("no-gym")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("create-workout")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_modal_error");
  });

  testGoldens("When the user mark any Radio Button, click create workout and create workout sucessfully, should send the user to created workout overview", (tester) async {
    when(workoutRepositoryMock.createWorkout(userInfo: anyNamed('userInfo'), prompt: anyNamed("prompt"))).thenAnswer((_) async => WorkoutPlanDto.fixture());

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
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key(UserFocus.lowerBody.name)));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("no-gym")));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key("create-workout")));
    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, "create_workout_modal_success");
  });
}
