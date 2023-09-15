import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension DurationExt on Duration {
  String formatDuration(BuildContext context) {
    if (inSeconds <= 59) {
      return S.of(context)!.second(inSeconds);
    } else if (inSeconds > 59 && inMinutes <= 59) {
      return S.of(context)!.minute(inMinutes);
    } else if (inMinutes > 59 && inHours <= 24) {
      return S.of(context)!.hour(inHours);
    } else {
      return S.of(context)!.day(inDays);
    }
  }
}
