// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutDto _$$_WorkoutDtoFromJson(Map<String, dynamic> json) =>
    _$_WorkoutDto(
      day: json['day'] as num? ?? 0,
      name: json['name'] as String? ?? '',
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExerciseDto>[],
    );

Map<String, dynamic> _$$_WorkoutDtoToJson(_$_WorkoutDto instance) =>
    <String, dynamic>{
      'day': instance.day,
      'name': instance.name,
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
    };
