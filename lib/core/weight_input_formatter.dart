import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/extensions/string_extension.dart';

enum WeightType { lbs, kg, unknown }

extension WeightTypeExt on WeightType {
  bool get isLbs => this == WeightType.lbs;
  bool get isKg => this == WeightType.kg;

  String label(BuildContext context) => ["lbs", "kg", S.of(context)!.unknown][index];

  int get maxCharactes => [6, 6, 0][index];

  TextEditingValue formatter(TextEditingValue value) => WeightInputFormatter().formatEditUpdate(const TextEditingValue(), value);
}

class WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueWithOnlyNumbers = newValue.copyWith(text: newValue.text.removeNonNumeric);
    final bool isDeleting = oldValue.text.length > newValue.text.length;

    if (isDeleting) return newValue;

    if (newValueWithOnlyNumbers.text.length == 1) {
      return newValue.copyWith(
        text: ".${newValueWithOnlyNumbers.text}",
        selection: TextSelection.collapsed(offset: newValueWithOnlyNumbers.text.length + 1),
      );
    }

    if (newValueWithOnlyNumbers.text.length == 2) {
      return newValue.copyWith(
        text: "${newValueWithOnlyNumbers.text[0]}.${newValueWithOnlyNumbers.text.replaceRange(0, 1, '')}",
        selection: TextSelection.collapsed(offset: newValueWithOnlyNumbers.text.length + 1),
      );
    }

    if (newValueWithOnlyNumbers.text.length == 3) {
      return newValue.copyWith(
        text: "${newValueWithOnlyNumbers.text[0]}${newValueWithOnlyNumbers.text[1]}.${newValueWithOnlyNumbers.text.replaceRange(0, 2, '')}",
        selection: TextSelection.collapsed(offset: newValueWithOnlyNumbers.text.length + 1),
      );
    }

    if (newValueWithOnlyNumbers.text.length == 5 || !newValue.text.contains(".")) {
      return newValue.copyWith(
        text: "${newValueWithOnlyNumbers.text[0]}${newValueWithOnlyNumbers.text[1]}${newValueWithOnlyNumbers.text[2]}.${newValueWithOnlyNumbers.text.replaceRange(0, 3, '')}",
        selection: TextSelection.collapsed(offset: newValueWithOnlyNumbers.text.length + 1),
      );
    }

    return newValue;
  }
}
