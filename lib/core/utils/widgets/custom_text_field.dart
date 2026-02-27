import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? prefixImageIcon;
  final IconData? prefixIcon; // ضفنا دي عشان لو حبيتي تستخدمي أيقونة عادية
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
      // التعديل المهم: ده بيخلي الـ TextField مياخدش الـ Focus أول ما الصفحة تفتح
      autofocus: false, 
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 18), // عشان الكلام ميبقاش لازق فوق وتحت
        prefixIcon: prefixImageIcon != null 
            ? Padding(
                padding: const EdgeInsets.all(14.0), // زودنا الـ Padding شوية عشان أيقونة الفيجما تطلع بمقاس مظبوط
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
        focusedBorder: OutlineInputBorder( // ضفنا دي عشان لما تدوسي على الحقل لونه يتغير بشكل شيك
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF3D56F0), width: 1.5),
        ),
      ),
    );
  }
}