import 'package:flutter_test/flutter_test.dart';
import 'package:planai/dto/user_info_dto.dart';

void main() {
  test("Ensure height json name are correct and exist", () {
    expect(UserInfoDto.fixture().toJson().keys.contains("height"), true);
  });

  test("Ensure weight json name are correct and exist", () {
    expect(UserInfoDto.fixture().toJson().keys.contains("weight"), true);
  });

  test("Ensure age json name are correct and exist", () {
    expect(UserInfoDto.fixture().toJson().keys.contains("age"), true);
  });

  test("Ensure workout_at_gym json name are correct and exist", () {
    expect(UserInfoDto.fixture().toJson().keys.contains("workout_at_gym"), true);
  });

  test("Ensure weight_type json name are correct and exist", () {
    expect(UserInfoDto.fixture().toJson().keys.contains("weight_type"), true);
  });
}
