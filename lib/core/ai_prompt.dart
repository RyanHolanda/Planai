import 'package:flutter/material.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/height_input_formatter.dart';
import 'package:planai/core/weight_input_formatter.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/dto/workout_plan_dto.dart';

class AIPrompt {
  AIPrompt({required this.userInfo});

  final UserInfoDto userInfo;

  String getWorkoutPlanPrompt(String language) {
    if (userInfo.focus.isLowerBody || userInfo.focus.isAll || userInfo.focus.isupperBody) {
      return _workoutPlanForMuscleGrowth(language, userInfo);
    } else if (userInfo.focus.ishealthiness) {
      return _workoutPlanForHealthiness(language, userInfo);
    } else {
      return _workoutPlanForLoseWeight(language, userInfo);
    }
  }

  String _workoutPlanForMuscleGrowth(String language, UserInfoDto userInfo) =>
      "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue} muscles growth. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}";

  String _workoutPlanForHealthiness(String language, UserInfoDto userInfo) =>
      "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue}. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}";

  String _workoutPlanForLoseWeight(String language, UserInfoDto userInfo) =>
      "You are a backend data processor that is part of an App that generates workouts with AI for users. Please return the following json filled with a Workout Plan ${userInfo.workoutAtGym ? "at gym" : "without any needs of gym"} in the language $language including the rest days, for a person ${userInfo.heightType.formatter(TextEditingValue(text: userInfo.height.toString())).text} ${userInfo.heightType.name} tall with ${userInfo.weightType.formatter(TextEditingValue(text: userInfo.weight.toString())).text} ${userInfo.weightType.name} of weight and ${userInfo.age} years. The user focus is ${userInfo.focus.aiValue}. The output will be only API schema compliant JSON compatible, and in each json value, there's instructions for what I'm expecting in this key. ${WorkoutPlanDto.workoutplanJsonSample}";
}
