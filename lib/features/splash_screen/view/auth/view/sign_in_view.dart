import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:event_hub_app/core/utils/widgets/custom_main_button.dart';
import 'package:event_hub_app/core/utils/widgets/custom_text_field.dart';
import 'package:event_hub_app/features/splash_screen/view/auth/view/reset_password_view.dart';
import 'package:flutter/material.dart';

// 1. استيراد الصفحات اللي هتروح لها (تأكد من المسارات صحيحة عندك)
import 'sign_up_view.dart';
// import 'reset_password_view.dart'; 

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 80),
              
              Image.asset(AppAssets.logos, width: 80), 
              const SizedBox(height: 15),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in', 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 25),

              CustomTextField(
                hintText: 'abc@email.com',
                prefixImageIcon: AppAssets.emailIcon, 
              ),
              const SizedBox(height: 20),

              CustomTextField(
                hintText: 'Your password',
                prefixImageIcon: AppAssets.lockIcon,
                isPassword: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Switch(
                        value: true, 
                        onChanged: (v) {}, 
                        activeColor: AppColors.primary,
                      ),
                      const Text("Remember Me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // 2. تفعيل زرار نسيت كلمة المرور
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordView()));
                    },
                    child: const Text(
                      "Forgot Password?", 
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              CustomMainButton(
                text: 'SIGN IN',
                hasIcon: true,
                onPressed: () {
                  // هنا يتم وضع كود تسجيل الدخول أو الانتقال للـ Home
                  print("Sign In Pressed");
                },
              ),

              const SizedBox(height: 30),
              const Center(child: Text('OR', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
              const SizedBox(height: 25),

              _buildSocialButton('Login with Google', AppAssets.googleIcon),
              const SizedBox(height: 15),
              _buildSocialButton('Login with Facebook', AppAssets.facebookIcon),
              
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account? "),
                  GestureDetector(
                    // 3. تفعيل رابط الـ Sign Up
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpView()),
                      );
                    },
                    child: const Text(
                      'Sign up', 
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, String iconPath) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 25), 
          const SizedBox(width: 15),
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
        ],
      ),
    );
  }
}