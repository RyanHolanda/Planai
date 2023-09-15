import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CustomSnackBarType { error, success }

extension on CustomSnackBarType {
  Color get backgroundColor => [
        const Color.fromARGB(255, 250, 153, 146),
        const Color.fromARGB(255, 195, 254, 163),
      ][index];

  Color get childColor => [
        const Color.fromARGB(255, 149, 41, 31),
        const Color.fromARGB(255, 61, 129, 25),
      ][index];

  Color get closeButtonBackgroundColor => [
        const Color.fromARGB(255, 242, 131, 131),
        const Color.fromARGB(255, 173, 232, 141),
      ][index];

  Icon get icon => [
        Icon(CupertinoIcons.exclamationmark_triangle, color: childColor),
        Icon(CupertinoIcons.check_mark, color: childColor),
      ][index];
}

abstract class CustomSnackBar {
  const CustomSnackBar();

  static show(
    BuildContext context, {
    required String title,
    CustomSnackBarType type = CustomSnackBarType.success,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: false,
          closeIconColor: type.childColor,
          backgroundColor: type.backgroundColor,
          padding: const EdgeInsets.only(top: 24, left: 24, right: 12, bottom: 24),
          content: Row(
            children: [
              type.icon,
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, color: type.childColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                icon: Icon(Icons.close, color: type.childColor, size: 20),
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                  backgroundColor: MaterialStatePropertyAll(type.closeButtonBackgroundColor),
                ),
                color: type.childColor,
              )
            ],
          ),
        ),
      );
}
