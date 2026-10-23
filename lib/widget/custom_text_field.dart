
import 'package:flutter/material.dart';

import '../core/theme/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,

    }
  );
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.isPassword && isObscure,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:  TextStyle(
            fontSize: 14,
            color: isDark
                ?appColor.textdark
                :appColor.textlight,
            fontWeight: FontWeight.w400,
          ),

          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon)
              : null,


          suffixIcon: widget.isPassword
              ? IconButton(iconSize: 24,padding: EdgeInsets.symmetric(horizontal: 25),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
          )
              : null,

          filled: true,
          fillColor: isDark
              ?appColor.primerydark
              :appColor.primerylight,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: isDark
                ?appColor.primerylight
                :appColor.primerydark, width: 1),

              ),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}