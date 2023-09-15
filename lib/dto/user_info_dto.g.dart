// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoDto _$$_UserInfoDtoFromJson(Map<String, dynamic> json) =>
    _$_UserInfoDto(
      height: json['height'] as num? ?? 0,
      weight: json['weight'] as num? ?? 0,
      age: json['age'] as num? ?? 0,
      workoutAtGym: json['workout_at_gym'] as bool? ?? true,
      weightType:
          $enumDecodeNullable(_$WeightTypeEnumMap, json['weight_type']) ??
              WeightType.unknown,
      heightType:
          $enumDecodeNullable(_$HeightTypeEnumMap, json['height_type']) ??
              HeightType.unknown,
      focus: $enumDecode(_$UserFocusEnumMap, json['focus']),
    );

Map<String, dynamic> _$$_UserInfoDtoToJson(_$_UserInfoDto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'workout_at_gym': instance.workoutAtGym,
      'weight_type': _$WeightTypeEnumMap[instance.weightType]!,
      'height_type': _$HeightTypeEnumMap[instance.heightType]!,
      'focus': _$UserFocusEnumMap[instance.focus]!,
    };

const _$WeightTypeEnumMap = {
  WeightType.lbs: 'lbs',
  WeightType.kg: 'kg',
  WeightType.unknown: 'unknown',
};

const _$HeightTypeEnumMap = {
  HeightType.cm: 'cm',
  HeightType.ft: 'ft',
  HeightType.m: 'm',
  HeightType.unknown: 'unknown',
};

const _$UserFocusEnumMap = {
  UserFocus.lowerBody: 'lowerBody',
  UserFocus.upperBody: 'upperBody',
  UserFocus.all: 'all',
  UserFocus.healthiness: 'healthiness',
  UserFocus.loseWeight: 'loseWeight',
};
