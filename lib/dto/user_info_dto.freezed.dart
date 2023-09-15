// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInfoDto _$UserInfoDtoFromJson(Map<String, dynamic> json) {
  return _UserInfoDto.fromJson(json);
}

/// @nodoc
mixin _$UserInfoDto {
  num get height => throw _privateConstructorUsedError;
  num get weight => throw _privateConstructorUsedError;
  num get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'workout_at_gym')
  bool get workoutAtGym => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_type')
  WeightType get weightType => throw _privateConstructorUsedError;
  @JsonKey(name: 'height_type')
  HeightType get heightType => throw _privateConstructorUsedError;
  UserFocus get focus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoDtoCopyWith<UserInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoDtoCopyWith<$Res> {
  factory $UserInfoDtoCopyWith(
          UserInfoDto value, $Res Function(UserInfoDto) then) =
      _$UserInfoDtoCopyWithImpl<$Res, UserInfoDto>;
  @useResult
  $Res call(
      {num height,
      num weight,
      num age,
      @JsonKey(name: 'workout_at_gym') bool workoutAtGym,
      @JsonKey(name: 'weight_type') WeightType weightType,
      @JsonKey(name: 'height_type') HeightType heightType,
      UserFocus focus});
}

/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res, $Val extends UserInfoDto>
    implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? age = null,
    Object? workoutAtGym = null,
    Object? weightType = null,
    Object? heightType = null,
    Object? focus = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
      workoutAtGym: null == workoutAtGym
          ? _value.workoutAtGym
          : workoutAtGym // ignore: cast_nullable_to_non_nullable
              as bool,
      weightType: null == weightType
          ? _value.weightType
          : weightType // ignore: cast_nullable_to_non_nullable
              as WeightType,
      heightType: null == heightType
          ? _value.heightType
          : heightType // ignore: cast_nullable_to_non_nullable
              as HeightType,
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as UserFocus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoDtoCopyWith<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  factory _$$_UserInfoDtoCopyWith(
          _$_UserInfoDto value, $Res Function(_$_UserInfoDto) then) =
      __$$_UserInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num height,
      num weight,
      num age,
      @JsonKey(name: 'workout_at_gym') bool workoutAtGym,
      @JsonKey(name: 'weight_type') WeightType weightType,
      @JsonKey(name: 'height_type') HeightType heightType,
      UserFocus focus});
}

/// @nodoc
class __$$_UserInfoDtoCopyWithImpl<$Res>
    extends _$UserInfoDtoCopyWithImpl<$Res, _$_UserInfoDto>
    implements _$$_UserInfoDtoCopyWith<$Res> {
  __$$_UserInfoDtoCopyWithImpl(
      _$_UserInfoDto _value, $Res Function(_$_UserInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? weight = null,
    Object? age = null,
    Object? workoutAtGym = null,
    Object? weightType = null,
    Object? heightType = null,
    Object? focus = null,
  }) {
    return _then(_$_UserInfoDto(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
      workoutAtGym: null == workoutAtGym
          ? _value.workoutAtGym
          : workoutAtGym // ignore: cast_nullable_to_non_nullable
              as bool,
      weightType: null == weightType
          ? _value.weightType
          : weightType // ignore: cast_nullable_to_non_nullable
              as WeightType,
      heightType: null == heightType
          ? _value.heightType
          : heightType // ignore: cast_nullable_to_non_nullable
              as HeightType,
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as UserFocus,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_UserInfoDto extends _UserInfoDto {
  const _$_UserInfoDto(
      {this.height = 0,
      this.weight = 0,
      this.age = 0,
      @JsonKey(name: 'workout_at_gym') this.workoutAtGym = true,
      @JsonKey(name: 'weight_type') this.weightType = WeightType.unknown,
      @JsonKey(name: 'height_type') this.heightType = HeightType.unknown,
      required this.focus})
      : super._();

  factory _$_UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserInfoDtoFromJson(json);

  @override
  @JsonKey()
  final num height;
  @override
  @JsonKey()
  final num weight;
  @override
  @JsonKey()
  final num age;
  @override
  @JsonKey(name: 'workout_at_gym')
  final bool workoutAtGym;
  @override
  @JsonKey(name: 'weight_type')
  final WeightType weightType;
  @override
  @JsonKey(name: 'height_type')
  final HeightType heightType;
  @override
  final UserFocus focus;

  @override
  String toString() {
    return 'UserInfoDto(height: $height, weight: $weight, age: $age, workoutAtGym: $workoutAtGym, weightType: $weightType, heightType: $heightType, focus: $focus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoDto &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.workoutAtGym, workoutAtGym) ||
                other.workoutAtGym == workoutAtGym) &&
            (identical(other.weightType, weightType) ||
                other.weightType == weightType) &&
            (identical(other.heightType, heightType) ||
                other.heightType == heightType) &&
            (identical(other.focus, focus) || other.focus == focus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, height, weight, age,
      workoutAtGym, weightType, heightType, focus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoDtoCopyWith<_$_UserInfoDto> get copyWith =>
      __$$_UserInfoDtoCopyWithImpl<_$_UserInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserInfoDtoToJson(
      this,
    );
  }
}

abstract class _UserInfoDto extends UserInfoDto {
  const factory _UserInfoDto(
      {final num height,
      final num weight,
      final num age,
      @JsonKey(name: 'workout_at_gym') final bool workoutAtGym,
      @JsonKey(name: 'weight_type') final WeightType weightType,
      @JsonKey(name: 'height_type') final HeightType heightType,
      required final UserFocus focus}) = _$_UserInfoDto;
  const _UserInfoDto._() : super._();

  factory _UserInfoDto.fromJson(Map<String, dynamic> json) =
      _$_UserInfoDto.fromJson;

  @override
  num get height;
  @override
  num get weight;
  @override
  num get age;
  @override
  @JsonKey(name: 'workout_at_gym')
  bool get workoutAtGym;
  @override
  @JsonKey(name: 'weight_type')
  WeightType get weightType;
  @override
  @JsonKey(name: 'height_type')
  HeightType get heightType;
  @override
  UserFocus get focus;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoDtoCopyWith<_$_UserInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
