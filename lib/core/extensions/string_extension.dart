extension StringExt on String {
  String get removeNonNumeric {
    RegExp nonNumeric = RegExp(r'[^0-9]');

    return replaceAll(nonNumeric, '');
  }
}
