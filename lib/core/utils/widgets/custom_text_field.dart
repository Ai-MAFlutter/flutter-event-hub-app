import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixImageIcon;
  final IconData? prefixIcon; 
  final bool isPassword;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixImageIcon,
    this.prefixIcon,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      autofocus: false, 
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 18), 
        prefixIcon: prefixImageIcon != null 
            ? Padding(
                padding: const EdgeInsets.all(14.0), 
                child: Image.asset(prefixImageIcon!, width: 20, height: 20),
              ) 
            : (prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE4DFDF)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFE4DFDF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF3D56F0), width: 1.5),
        ),
      ),
    );
  }
}