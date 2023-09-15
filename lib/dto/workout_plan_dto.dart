import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/dto/workout_dto.dart';

part 'workout_plan_dto.freezed.dart';
part 'workout_plan_dto.g.dart';

@freezed
class WorkoutPlanDto with _$WorkoutPlanDto {
  static final workoutplanJsonSample = {
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
  };

  @JsonSerializable(explicitToJson: true)
  factory WorkoutPlanDto({
    @Default('') String title,
    @Default('') String description,
    @Default(<WorkoutDto>[]) List<WorkoutDto> workouts,
    UserFocus? focus,
  }) = _WorkoutPlanDto;

  factory WorkoutPlanDto.fromJson(Map<String, dynamic> json) => _$WorkoutPlanDtoFromJson(json);

  factory WorkoutPlanDto.fixture() => WorkoutPlanDto(
        title: "Lower Body Muscle Growth Workout Plan",
        description: "This workout plan is focused on the growth of lower body muscles.",
        focus: UserFocus.lowerBody,
        workouts: [
          WorkoutDto.fixture(),
        ],
      );

  WorkoutPlanDto._();
}
