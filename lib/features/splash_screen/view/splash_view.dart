import 'dart:async';
import 'package:event_hub_app/features/splash_screen/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
// ملاحظة: هنغير مسار الـ Onboarding لاحقاً لما نكوده
// import '../../onboarding/view/onboarding_view.dart'; 

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // ده بيخلي الشاشة تستنى 3 ثواني وبعدين تنقل للي بعدها
    Timer(const Duration(seconds: 3), () {
      // حالياً هنطبع كلمة في الـ console لحد ما نخلص شاشة الـ Onboarding
      print("Go to Onboarding");
      
       Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingView()),
      ); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // اللون الأبيض من الـ Utils بتاعك
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // اللوجو (تأكدي إنك عرفتيه في الـ AppAssets)
            Image.asset(
              AppAssets.logo, 
              width: 160, // تحكمي في المقاس حسب الفيجما
            ),
            const SizedBox(height: 16),
            // كلمة EventHub باللون الأزرق
            
          ],
        ),
      ),
    );
  }
}