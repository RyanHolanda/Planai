import 'package:flutter_test/flutter_test.dart';
import 'package:planai/core/enums/user_focus_enum.dart';

void main() {
  test("Ensure the AiValue is correct. Because we use this value to send to the IA what's the user focus", () {
    expect(UserFocus.all.aiValue, "All");
    expect(UserFocus.healthiness.aiValue, "Healthiness");
    expect(UserFocus.loseWeight.aiValue, "Weight Loss");
    expect(UserFocus.upperBody.aiValue, "Upper Body");
    expect(UserFocus.lowerBody.aiValue, "Lower body");
  });

  test("ensure all boolean getters are correct", () {
    expect(UserFocus.all.isAll, true);
    expect(UserFocus.healthiness.ishealthiness, true);
    expect(UserFocus.loseWeight.isloseWeight, true);
    expect(UserFocus.upperBody.isupperBody, true);
    expect(UserFocus.lowerBody.isLowerBody, true);
  });
}
