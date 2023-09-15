import 'package:flutter_test/flutter_test.dart';
import 'package:planai/dto/workout_dto.dart';

void main() {
  test("Ensure day json name are correct and exist", () {
    expect(WorkoutDto().toJson().keys.contains("day"), true);
  });

  test("Ensure name json name are correct and exist", () {
    expect(WorkoutDto().toJson().keys.contains("name"), true);
  });

  test("Ensure exercises json name are correct and exist", () {
    expect(WorkoutDto().toJson().keys.contains("exercises"), true);
  });
}
