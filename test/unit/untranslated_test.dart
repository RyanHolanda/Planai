import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Ensure there's no missing translations", () async {
    final untranslatedFile = await File("untranslated.json").readAsString();

    expect(untranslatedFile, "{}");
  });
}
