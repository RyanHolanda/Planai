import 'package:flutter_test/flutter_test.dart';
import 'package:planai/dto/exercise_dto.dart';

void main() {
  test("Ensure name json name are correct and exist", () {
    expect(ExerciseDto().toJson().keys.contains("name"), true);
  });

  test("Ensure duration json name are correct and exist", () {
    expect(ExerciseDto().toJson().keys.contains("duration"), true);
  });

  test("Ensure sets json name are correct and exist", () {
    expect(ExerciseDto().toJson().keys.contains("sets"), true);
  });

  test("Ensure reps json name are correct and exist", () {
    expect(ExerciseDto().toJson().keys.contains("reps"), true);
  });

  test("Ensure rest_duration json name are correct and exist", () {
    expect(ExerciseDto().toJson().keys.contains("rest_duration"), true);
  });
}
