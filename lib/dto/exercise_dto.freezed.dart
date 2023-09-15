// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseDto _$ExerciseDtoFromJson(Map<String, dynamic> json) {
  return _ExerciseDto.fromJson(json);
}

/// @nodoc
mixin _$ExerciseDto {
  String get name => throw _privateConstructorUsedError;
  num get duration => throw _privateConstructorUsedError;
  num get sets => throw _privateConstructorUsedError;
  num get reps => throw _privateConstructorUsedError;
  @JsonKey(name: 'rest_duration')
  num get restDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseDtoCopyWith<ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDtoCopyWith<$Res> {
  factory $ExerciseDtoCopyWith(
          ExerciseDto value, $Res Function(ExerciseDto) then) =
      _$ExerciseDtoCopyWithImpl<$Res, ExerciseDto>;
  @useResult
  $Res call(
      {String name,
      num duration,
      num sets,
      num reps,
      @JsonKey(name: 'rest_duration') num restDuration});
}

/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res, $Val extends ExerciseDto>
    implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? duration = null,
    Object? sets = null,
    Object? reps = null,
    Object? restDuration = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as num,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as num,
      restDuration: null == restDuration
          ? _value.restDuration
          : restDuration // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExerciseDtoCopyWith<$Res>
    implements $ExerciseDtoCopyWith<$Res> {
  factory _$$_ExerciseDtoCopyWith(
          _$_ExerciseDto value, $Res Function(_$_ExerciseDto) then) =
      __$$_ExerciseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      num duration,
      num sets,
      num reps,
      @JsonKey(name: 'rest_duration') num restDuration});
}

/// @nodoc
class __$$_ExerciseDtoCopyWithImpl<$Res>
    extends _$ExerciseDtoCopyWithImpl<$Res, _$_ExerciseDto>
    implements _$$_ExerciseDtoCopyWith<$Res> {
  __$$_ExerciseDtoCopyWithImpl(
      _$_ExerciseDto _value, $Res Function(_$_ExerciseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? duration = null,
    Object? sets = null,
    Object? reps = null,
    Object? restDuration = null,
  }) {
    return _then(_$_ExerciseDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as num,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as num,
      reps: null == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as num,
      restDuration: null == restDuration
          ? _value.restDuration
          : restDuration // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ExerciseDto extends _ExerciseDto {
  _$_ExerciseDto(
      {this.name = '',
      this.duration = 0,
      this.sets = 0,
      this.reps = 0,
      @JsonKey(name: 'rest_duration') this.restDuration = 0})
      : super._();

  factory _$_ExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseDtoFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final num duration;
  @override
  @JsonKey()
  final num sets;
  @override
  @JsonKey()
  final num reps;
  @override
  @JsonKey(name: 'rest_duration')
  final num restDuration;

  @override
  String toString() {
    return 'ExerciseDto(name: $name, duration: $duration, sets: $sets, reps: $reps, restDuration: $restDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.sets, sets) || other.sets == sets) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.restDuration, restDuration) ||
                other.restDuration == restDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, duration, sets, reps, restDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      __$$_ExerciseDtoCopyWithImpl<_$_ExerciseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseDtoToJson(
      this,
    );
  }
}

abstract class _ExerciseDto extends ExerciseDto {
  factory _ExerciseDto(
      {final String name,
      final num duration,
      final num sets,
      final num reps,
      @JsonKey(name: 'rest_duration') final num restDuration}) = _$_ExerciseDto;
  _ExerciseDto._() : super._();

  factory _ExerciseDto.fromJson(Map<String, dynamic> json) =
      _$_ExerciseDto.fromJson;

  @override
  String get name;
  @override
  num get duration;
  @override
  num get sets;
  @override
  num get reps;
  @override
  @JsonKey(name: 'rest_duration')
  num get restDuration;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseDtoCopyWith<_$_ExerciseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
