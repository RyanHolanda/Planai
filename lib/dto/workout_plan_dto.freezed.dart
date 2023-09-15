// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_plan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutPlanDto _$WorkoutPlanDtoFromJson(Map<String, dynamic> json) {
  return _WorkoutPlanDto.fromJson(json);
}

/// @nodoc
mixin _$WorkoutPlanDto {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<WorkoutDto> get workouts => throw _privateConstructorUsedError;
  UserFocus? get focus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutPlanDtoCopyWith<WorkoutPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutPlanDtoCopyWith<$Res> {
  factory $WorkoutPlanDtoCopyWith(
          WorkoutPlanDto value, $Res Function(WorkoutPlanDto) then) =
      _$WorkoutPlanDtoCopyWithImpl<$Res, WorkoutPlanDto>;
  @useResult
  $Res call(
      {String title,
      String description,
      List<WorkoutDto> workouts,
      UserFocus? focus});
}

/// @nodoc
class _$WorkoutPlanDtoCopyWithImpl<$Res, $Val extends WorkoutPlanDto>
    implements $WorkoutPlanDtoCopyWith<$Res> {
  _$WorkoutPlanDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? workouts = null,
    Object? focus = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value.workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<WorkoutDto>,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as UserFocus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutPlanDtoCopyWith<$Res>
    implements $WorkoutPlanDtoCopyWith<$Res> {
  factory _$$_WorkoutPlanDtoCopyWith(
          _$_WorkoutPlanDto value, $Res Function(_$_WorkoutPlanDto) then) =
      __$$_WorkoutPlanDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      List<WorkoutDto> workouts,
      UserFocus? focus});
}

/// @nodoc
class __$$_WorkoutPlanDtoCopyWithImpl<$Res>
    extends _$WorkoutPlanDtoCopyWithImpl<$Res, _$_WorkoutPlanDto>
    implements _$$_WorkoutPlanDtoCopyWith<$Res> {
  __$$_WorkoutPlanDtoCopyWithImpl(
      _$_WorkoutPlanDto _value, $Res Function(_$_WorkoutPlanDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? workouts = null,
    Object? focus = freezed,
  }) {
    return _then(_$_WorkoutPlanDto(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      workouts: null == workouts
          ? _value._workouts
          : workouts // ignore: cast_nullable_to_non_nullable
              as List<WorkoutDto>,
      focus: freezed == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as UserFocus?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_WorkoutPlanDto extends _WorkoutPlanDto {
  _$_WorkoutPlanDto(
      {this.title = '',
      this.description = '',
      final List<WorkoutDto> workouts = const <WorkoutDto>[],
      this.focus})
      : _workouts = workouts,
        super._();

  factory _$_WorkoutPlanDto.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutPlanDtoFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  final List<WorkoutDto> _workouts;
  @override
  @JsonKey()
  List<WorkoutDto> get workouts {
    if (_workouts is EqualUnmodifiableListView) return _workouts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_workouts);
  }

  @override
  final UserFocus? focus;

  @override
  String toString() {
    return 'WorkoutPlanDto(title: $title, description: $description, workouts: $workouts, focus: $focus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutPlanDto &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._workouts, _workouts) &&
            (identical(other.focus, focus) || other.focus == focus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description,
      const DeepCollectionEquality().hash(_workouts), focus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutPlanDtoCopyWith<_$_WorkoutPlanDto> get copyWith =>
      __$$_WorkoutPlanDtoCopyWithImpl<_$_WorkoutPlanDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutPlanDtoToJson(
      this,
    );
  }
}

abstract class _WorkoutPlanDto extends WorkoutPlanDto {
  factory _WorkoutPlanDto(
      {final String title,
      final String description,
      final List<WorkoutDto> workouts,
      final UserFocus? focus}) = _$_WorkoutPlanDto;
  _WorkoutPlanDto._() : super._();

  factory _WorkoutPlanDto.fromJson(Map<String, dynamic> json) =
      _$_WorkoutPlanDto.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  List<WorkoutDto> get workouts;
  @override
  UserFocus? get focus;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutPlanDtoCopyWith<_$_WorkoutPlanDto> get copyWith =>
      throw _privateConstructorUsedError;
}
