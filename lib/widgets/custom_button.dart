import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.onPressed, this.color, this.radius = 14, this.trailing, this.disabledColor, this.height, this.childColor})
      : super(key: key);

  final Text? title;
  final Function()? onPressed;
  final Color? color;
  final Color? disabledColor;
  final Color? childColor;
  final double radius;
  final Widget? trailing;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height ?? 55,
      child: MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color ?? Colors.black,
        textColor: childColor ?? Colors.white,
        disabledColor: disabledColor,
        onPressed: onPressed,
        child: Stack(
          children: [
            Center(child: title ?? Text(title?.data ?? "", style: const TextStyle(color: Colors.white))),
            if (trailing != null) Align(alignment: Alignment.centerRight, child: trailing!),
          ],
        ),
      ),
    );
  }
}
