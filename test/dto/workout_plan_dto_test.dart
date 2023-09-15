import 'package:flutter_test/flutter_test.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/dto/workout_plan_dto.dart';

void main() {
  test("Ensure workout plan json sample is correct", () {
    expect(WorkoutPlanDto.workoutplanJsonSample, {
      "title": "String with the Workout Plan Title without any given word",
      "description": "String with the Workout Plan Description without any given word",
      "focus": "String with the passed user focus. Possible values are: ${UserFocus.values.map((focus) => focus.name).toList()}. Do not use other any value",
      "workouts": [
        {
          "day": "int with the workout day in the week",
          "name": "String with the muscles of the day",
          "exercises": [
            {
              "name": "String with the name of the exercise",
              "duration": "int with the duration(in seconds) of the exercise if needed. Can be null if not needed.",
              "reps": "int with the number of reps to do in each a set",
              "sets": "int with the number of sets",
              "rest_duration": "int with the duration(in seconds) between sets",
            }
          ]
        }
      ],
    });
  });

  test("Ensure title json name are correct and exist", () {
    expect(WorkoutPlanDto().toJson().keys.contains("title"), true);
  });

  test("Ensure description json name are correct and exist", () {
    expect(WorkoutPlanDto().toJson().keys.contains("description"), true);
  });

  test("Ensure workouts json name are correct and exist", () {
    expect(WorkoutPlanDto().toJson().keys.contains("workouts"), true);
  });

  test("Ensure focus json name are correct and exist", () {
    expect(WorkoutPlanDto().toJson().keys.contains("focus"), true);
  });
}
