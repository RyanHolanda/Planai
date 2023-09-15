import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planai/core/ai_prompt.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/height_input_formatter.dart';
import 'package:planai/core/weight_input_formatter.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/dto/workout_plan_dto.dart';

void main() {
  final language = const Locale("en").languageCode;

  test("When the workout plan is related to lower body, should return workout plan prompt for muscles growth", () async {
    UserInfoDto userInfo = UserInfoDto.fixture().copyWith(focus: UserFocus.lowerBody);
    final sut = AIPrompt(userInfo: userInfo);
    final String workoutPlanPrompt = sut.getWorkoutPlanPrompt(language);

    expect(workoutPlanPrompt,
        "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue} muscles growth. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}");
  });

  test("When the workout plan is related to upper body, should return workout plan prompt for muscles growth", () async {
    UserInfoDto userInfo = UserInfoDto.fixture().copyWith(focus: UserFocus.upperBody);
    final sut = AIPrompt(userInfo: userInfo);
    final String workoutPlanPrompt = sut.getWorkoutPlanPrompt(language);

    expect(workoutPlanPrompt,
        "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue} muscles growth. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}");
  });

  test("When the workout plan is related to both, should return workout plan prompt for muscles growth", () async {
    UserInfoDto userInfo = UserInfoDto.fixture().copyWith(focus: UserFocus.all);
    final sut = AIPrompt(userInfo: userInfo);
    final String workoutPlanPrompt = sut.getWorkoutPlanPrompt(language);

    expect(workoutPlanPrompt,
        "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue} muscles growth. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}");
  });

  test("When the workout plan is related to healthiness, should return workout plan prompt for healthiness", () async {
    UserInfoDto userInfo = UserInfoDto.fixture().copyWith(focus: UserFocus.healthiness);
    final sut = AIPrompt(userInfo: userInfo);
    final String workoutPlanPrompt = sut.getWorkoutPlanPrompt(language);

    expect(workoutPlanPrompt,
        "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue}. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}");
  });

  test("When the workout plan is related to weight loss, should return workout plan prompt for lose weight", () async {
    UserInfoDto userInfo = UserInfoDto.fixture().copyWith(focus: UserFocus.loseWeight, workoutAtGym: false);
    final sut = AIPrompt(userInfo: userInfo);
    final String workoutPlanPrompt = sut.getWorkoutPlanPrompt(language);

    expect(workoutPlanPrompt,
        "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue}. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}");
  });
}
