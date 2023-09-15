import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planai/gen/assets.gen.dart';

enum UserFocus { lowerBody, upperBody, all, healthiness, loseWeight }

extension UserFocusExt on UserFocus {
  bool get isLowerBody => this == UserFocus.lowerBody;
  bool get isupperBody => this == UserFocus.upperBody;
  bool get isAll => this == UserFocus.all;
  bool get ishealthiness => this == UserFocus.healthiness;
  bool get isloseWeight => this == UserFocus.loseWeight;

  String get aiValue => ['Lower body', 'Upper Body', 'All', 'Healthiness', 'Weight Loss'][index];

  String label(BuildContext context) => [
        S.of(context)!.userFocusEnumLowerBody,
        S.of(context)!.userFocusEnumUpperBody,
        S.of(context)!.userFocusEnumBoth,
        S.of(context)!.userFocusEnumHealthiness,
        S.of(context)!.userFocusEnumLoseWeight,
      ][index];

  String description(BuildContext context) => [
        S.of(context)!.userFocusEnumLowerBodyDescription,
        S.of(context)!.userFocusEnumUpperBodyDescription,
        S.of(context)!.userFocusEnumBothDescription,
        S.of(context)!.userFocusEnumHealthinessDescription,
        S.of(context)!.userFocusEnumLoseWeightdescription,
      ][index];

  SvgPicture get icon => [
        Assets.icons.lowerBody.svg(width: 25),
        Assets.icons.torso.svg(width: 30),
        Assets.icons.lowerAndUpperBody.svg(width: 30),
        Assets.icons.healthcare.svg(width: 30),
        Assets.icons.weightLoss.svg(width: 30),
      ][index];

  Color get color => [
        Colors.pink,
        Colors.blue,
        Colors.blueGrey,
        Colors.red,
        Colors.deepPurpleAccent,
      ][index];
}
