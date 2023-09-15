import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/height_input_formatter.dart';
import 'package:planai/core/weight_input_formatter.dart';

part 'user_info_dto.freezed.dart';
part 'user_info_dto.g.dart';

@freezed
class UserInfoDto with _$UserInfoDto {
  const UserInfoDto._();
  @JsonSerializable(explicitToJson: true)
  const factory UserInfoDto({
    @Default(0) num height,
    @Default(0) num weight,
    @Default(0) num age,
    @Default(true) @JsonKey(name: 'workout_at_gym') bool workoutAtGym,
    @Default(WeightType.unknown) @JsonKey(name: 'weight_type') WeightType weightType,
    @Default(HeightType.unknown) @JsonKey(name: 'height_type') HeightType heightType,
    required UserFocus focus,
  }) = _UserInfoDto;

  factory UserInfoDto.fixture() => const UserInfoDto(
        focus: UserFocus.lowerBody,
        age: 18,
        height: 159,
        heightType: HeightType.cm,
        weight: 63.5,
        weightType: WeightType.kg,
        workoutAtGym: true,
      );

  factory UserInfoDto.fromJson(Map<String, dynamic> json) => _$UserInfoDtoFromJson(json);
}
