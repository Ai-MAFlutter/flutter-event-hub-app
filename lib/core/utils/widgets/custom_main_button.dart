import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool hasIcon;

  const CustomMainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white, // لون تأثير الضغطة (Splash)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
        ),
        onPressed: onPressed, // تأكدي أن القيمة الممرة هنا ليست null في الصفحة الأساسية
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600, // خليناه أسمك شوية عشان يظهر زي الفيجما
                letterSpacing: 1,
              ),
            ),
            if (hasIcon)
              Align(
                alignment: Alignment.centerRight,
                // IgnorePointer هو الحل: بيخلي الأيقونة متسحبش الضغطة لنفسها
                child: IgnorePointer(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Color(0xFF3D56F0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}