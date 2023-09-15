// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExerciseDto _$$_ExerciseDtoFromJson(Map<String, dynamic> json) =>
    _$_ExerciseDto(
      name: json['name'] as String? ?? '',
      duration: json['duration'] as num? ?? 0,
      sets: json['sets'] as num? ?? 0,
      reps: json['reps'] as num? ?? 0,
      restDuration: json['rest_duration'] as num? ?? 0,
    );

Map<String, dynamic> _$$_ExerciseDtoToJson(_$_ExerciseDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration,
      'sets': instance.sets,
      'reps': instance.reps,
      'rest_duration': instance.restDuration,
    };
