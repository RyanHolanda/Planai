import 'package:flutter/material.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    this.onTap,
  });

  final String title;
  final Widget leading;
  final Function()? onTap;

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 8, spreadRadius: 0.5, color: Theme.of(context).shadowColor, offset: const Offset(0, 0)),
            BoxShadow(blurRadius: 10, spreadRadius: 1, color: Theme.of(context).scaffoldBackgroundColor, offset: const Offset(6, -6)),
          ],
        ),
        child: Row(
          children: [
            SizedBox(height: 30, width: 30, child: widget.leading),
            const SizedBox(width: 20),
            Text(widget.title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
