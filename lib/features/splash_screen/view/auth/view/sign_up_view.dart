import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:event_hub_app/core/utils/widgets/custom_main_button.dart';
import 'package:event_hub_app/core/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'verification_view.dart'; 

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF120D26),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Full name',
                prefixImageIcon: AppAssets.userIcon, 
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Confirm password',
                prefixImageIcon: AppAssets.lockIcon,
                isPassword: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              CustomMainButton(
                text: 'SIGN UP',
                hasIcon: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerificationView()),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'OR',
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

             
              _buildSocialButton('Login with Google', AppAssets.googleIcon),
              const SizedBox(height: 15),
              _buildSocialButton('Login with Facebook', AppAssets.facebookIcon),
              
              const SizedBox(height: 25),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
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
          Image.asset(
            iconPath, 
            width: 25, 
            height: 25,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 15),
          Text(
            text, 
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF120D26),
            )
          ),
        ],
      ),
    );
  }
}