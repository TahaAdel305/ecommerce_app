
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/core/providers/theme_provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();

    final isDark = provider.themeMode == ThemeMode.system
        ? Theme.of(context).brightness == Brightness.dark
        : provider.themeMode == ThemeMode.dark;

    return GestureDetector(
      onTap: () {
        context.read<ThemeProvider>().changeTheme(
          isDark ? ThemeMode.light : ThemeMode.dark,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        /*width: 23,
        height: 24,*/
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          /*color: isDark
              ? const Color(0xFF161F28)
              : const Color(0xFFB8C7D9),*/
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          alignment: isDark
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child:SvgPicture.asset(
            isDark
                ? 'assets/icons/Switch_on.svg'
                : 'assets/icons/Switch_off.svg',
            key: ValueKey(isDark),
            width: 25,
            height: 24,
          ),
        ),
      ),
    );
  }
}
