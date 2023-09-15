import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_dto.freezed.dart';
part 'exercise_dto.g.dart';

@freezed
class ExerciseDto with _$ExerciseDto {
  ExerciseDto._();
  @JsonSerializable(explicitToJson: true)
  factory ExerciseDto({
    @Default('') String name,
    @Default(0) num duration,
    @Default(0) num sets,
    @Default(0) num reps,
    @Default(0) @JsonKey(name: 'rest_duration') num restDuration,
  }) = _ExerciseDto;

  factory ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);

  factory ExerciseDto.fixture() => ExerciseDto(
        name: "Free Squat",
        reps: 12,
        sets: 4,
        restDuration: 120,
        duration: 100,
      );
}
