import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/extensions/string_extension.dart';

enum HeightType { cm, ft, m, unknown }

extension HeightTypeExt on HeightType {
  bool get isCentimeter => this == HeightType.cm;
  bool get isFeet => this == HeightType.ft;
  bool get isMeters => this == HeightType.m;

  String label(BuildContext context) => ["cm", "ft", "m", S.of(context)!.unknown][index];
  int get maxCharacters => [3, 5, 4, 0][index];

  TextEditingValue formatter(TextEditingValue value) => [
        HeightInputFormatter.formatCentimeter(value),
        HeightInputFormatter.formatFeet(value),
        HeightInputFormatter.formatMeter(value),
        value,
      ][index];
}

class HeightInputFormatter extends TextInputFormatter {
  HeightInputFormatter({required this.heightType});
  final HeightType heightType;

  static TextEditingValue formatFeet(TextEditingValue value) {
    TextEditingValue valueWithOnlyNumbers = value.copyWith(text: value.text.removeNonNumeric);

    if (valueWithOnlyNumbers.text.length > 3) {
      valueWithOnlyNumbers = valueWithOnlyNumbers.copyWith(text: valueWithOnlyNumbers.text.replaceRange(3, valueWithOnlyNumbers.text.length, ""));
    }

    if (valueWithOnlyNumbers.text.isNotEmpty) {
      if (!valueWithOnlyNumbers.text.contains("'")) {
        final numbers = valueWithOnlyNumbers.text.split('');
        return valueWithOnlyNumbers.copyWith(
          text: '''${numbers.first}'${numbers.getRange(1, numbers.length).join()}"''',
          selection: TextSelection.collapsed(offset: valueWithOnlyNumbers.text.length + 1),
        );
      }
    }

    return value;
  }

  static TextEditingValue formatMeter(TextEditingValue value) {
    TextEditingValue valueWithOnlyNumbers = value.copyWith(text: value.text.removeNonNumeric);

    if (valueWithOnlyNumbers.text.isNotEmpty && !value.text.contains(".")) {
      final numbers = valueWithOnlyNumbers.text.split('');
      return valueWithOnlyNumbers.copyWith(
        text: "${numbers.first}.${numbers.getRange(1, numbers.length).join()}",
        selection: TextSelection.collapsed(offset: value.text.length + 1),
      );
    }
    return value;
  }

  static TextEditingValue formatCentimeter(TextEditingValue value) {
    TextEditingValue valueWithOnlyNumbers = value.copyWith(text: value.text.removeNonNumeric);

    return valueWithOnlyNumbers;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final bool isDeleting = oldValue.text.length > newValue.text.length;
    if (isDeleting) return newValue;

    if (heightType.isFeet) {
      return formatFeet(newValue);
    } else if (heightType.isCentimeter) {
      return formatCentimeter(newValue);
    } else if (heightType.isMeters) {
      return formatMeter(newValue);
    }

    return newValue;
  }
}
