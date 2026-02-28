import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/widgets/custom_main_button.dart';
import 'package:event_hub_app/core/utils/widgets/custom_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF120D26),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Please enter your email address to request a password reset',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF747688),
              ),
            ),
            const SizedBox(height: 26),
            
            CustomTextField(
              hintText: 'abc@email.com',
              prefixImageIcon: AppAssets.emailIcon,
            ),
            
            const SizedBox(height: 40),
            
            CustomMainButton(
              text: 'SEND',
              hasIcon: true,
              onPressed: () {
                print("Reset link sent!");
              },
            ),
          ],
        ),
      ),
    );
  }
}