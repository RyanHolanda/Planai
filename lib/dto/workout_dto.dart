import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planai/dto/exercise_dto.dart';

part 'workout_dto.freezed.dart';
part 'workout_dto.g.dart';

@freezed
class WorkoutDto with _$WorkoutDto {
  @JsonSerializable(explicitToJson: true)
  factory WorkoutDto({
    @Default(0) num day,
    @Default('') String name,
    @Default(<ExerciseDto>[]) List<ExerciseDto> exercises,
  }) = _WorkoutDto;

  WorkoutDto._();

  factory WorkoutDto.fromJson(Map<String, dynamic> json) => _$WorkoutDtoFromJson(json);

  factory WorkoutDto.fixture() => WorkoutDto(
        name: "Legs and Glutes",
        day: 1,
        exercises: [
          ExerciseDto.fixture(),
        ],
      );
}
