// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutPlanDto _$$_WorkoutPlanDtoFromJson(Map<String, dynamic> json) =>
    _$_WorkoutPlanDto(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      workouts: (json['workouts'] as List<dynamic>?)
              ?.map((e) => WorkoutDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <WorkoutDto>[],
      focus: $enumDecodeNullable(_$UserFocusEnumMap, json['focus']),
    );

Map<String, dynamic> _$$_WorkoutPlanDtoToJson(_$_WorkoutPlanDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'workouts': instance.workouts.map((e) => e.toJson()).toList(),
      'focus': _$UserFocusEnumMap[instance.focus],
    };

const _$UserFocusEnumMap = {
  UserFocus.lowerBody: 'lowerBody',
  UserFocus.upperBody: 'upperBody',
  UserFocus.all: 'all',
  UserFocus.healthiness: 'healthiness',
  UserFocus.loseWeight: 'loseWeight',
};
