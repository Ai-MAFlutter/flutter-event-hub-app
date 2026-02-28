import 'dart:async';
import 'package:event_hub_app/features/splash_screen/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
 

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    
    Timer(const Duration(seconds: 3), () {
      
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
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset(
              AppAssets.logo, 
              width: 160, 
            ),
            const SizedBox(height: 16),
           
            
          ],
        ),
      ),
    );
  }
}