import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class profileSetteing extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget trailingIcon;

  final bool trailingIsInteractive;
  final VoidCallback onPressed;

  const profileSetteing({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.onPressed,
    required this.trailingIcon,

    this.trailingIsInteractive = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? appColor.primerydark : appColor.primerylight,
          border: Border.all(
            color: isDark ? appColor.primerylight : appColor.primerydark,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(13),
        ),
        height: height * 0.070,
        width: width * 0.9,
        child: Row(
          children: [
            SizedBox(width: 6),
            Icon(leadingIcon),
            SizedBox(width: 6),
            Expanded(child: Text(title, style: TextStyle(fontSize: 15))),
            trailingIsInteractive
                ? trailingIcon
                : IconButton(onPressed: onPressed, icon: trailingIcon),
            SizedBox(width: 13),
          ],
        ),
      ),
    );
  }
}
