// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutDto {
  num get day => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ExerciseDto> get exercises => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutDtoCopyWith<WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutDtoCopyWith<$Res> {
  factory $WorkoutDtoCopyWith(
          WorkoutDto value, $Res Function(WorkoutDto) then) =
      _$WorkoutDtoCopyWithImpl<$Res, WorkoutDto>;
  @useResult
  $Res call({num day, String name, List<ExerciseDto> exercises});
}

/// @nodoc
class _$WorkoutDtoCopyWithImpl<$Res, $Val extends WorkoutDto>
    implements $WorkoutDtoCopyWith<$Res> {
  _$WorkoutDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? name = null,
    Object? exercises = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value.exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutDtoCopyWith<$Res>
    implements $WorkoutDtoCopyWith<$Res> {
  factory _$$_WorkoutDtoCopyWith(
          _$_WorkoutDto value, $Res Function(_$_WorkoutDto) then) =
      __$$_WorkoutDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num day, String name, List<ExerciseDto> exercises});
}

/// @nodoc
class __$$_WorkoutDtoCopyWithImpl<$Res>
    extends _$WorkoutDtoCopyWithImpl<$Res, _$_WorkoutDto>
    implements _$$_WorkoutDtoCopyWith<$Res> {
  __$$_WorkoutDtoCopyWithImpl(
      _$_WorkoutDto _value, $Res Function(_$_WorkoutDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? name = null,
    Object? exercises = null,
  }) {
    return _then(_$_WorkoutDto(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      exercises: null == exercises
          ? _value._exercises
          : exercises // ignore: cast_nullable_to_non_nullable
              as List<ExerciseDto>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorkoutDto extends _WorkoutDto {
  _$_WorkoutDto(
      {this.day = 0,
      this.name = '',
      final List<ExerciseDto> exercises = const <ExerciseDto>[]})
      : _exercises = exercises,
        super._();

  factory _$_WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutDtoFromJson(json);

  @override
  @JsonKey()
  final num day;
  @override
  @JsonKey()
  final String name;
  final List<ExerciseDto> _exercises;
  @override
  @JsonKey()
  List<ExerciseDto> get exercises {
    if (_exercises is EqualUnmodifiableListView) return _exercises;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exercises);
  }

  @override
  String toString() {
    return 'WorkoutDto(day: $day, name: $name, exercises: $exercises)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutDto &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._exercises, _exercises));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, name, const DeepCollectionEquality().hash(_exercises));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      __$$_WorkoutDtoCopyWithImpl<_$_WorkoutDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutDtoToJson(
      this,
    );
  }
}

abstract class _WorkoutDto extends WorkoutDto {
  factory _WorkoutDto(
      {final num day,
      final String name,
      final List<ExerciseDto> exercises}) = _$_WorkoutDto;
  _WorkoutDto._() : super._();

  factory _WorkoutDto.fromJson(Map<String, dynamic> json) =
      _$_WorkoutDto.fromJson;

  @override
  num get day;
  @override
  String get name;
  @override
  List<ExerciseDto> get exercises;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutDtoCopyWith<_$_WorkoutDto> get copyWith =>
      throw _privateConstructorUsedError;
}
