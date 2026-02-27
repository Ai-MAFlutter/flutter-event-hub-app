import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:event_hub_app/core/utils/widgets/custom_main_button.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/home_view.dart';
import 'package:flutter/material.dart';

// تأكدي من مسار صفحة الهوم عندك، غالباً هيكون كدة:

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView( // أضفت دي عشان لو الكيبورد فتحت ميعملش Overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verification',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF120D26)),
              ),
              const SizedBox(height: 10),
              const Text(
                'We’ve send you the verification code on +1 2620 0323 7631',
                style: TextStyle(color: Color(0xFF747688), fontSize: 15),
              ),
              const SizedBox(height: 30),

              // صف مربعات الـ OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildOTPBox(context, first: true),
                  _buildOTPBox(context),
                  _buildOTPBox(context),
                  _buildOTPBox(context, last: true),
                ],
              ),

              const SizedBox(height: 40),

              CustomMainButton(
                text: 'CONTINUE',
                hasIcon: true,
                onPressed: () {
                  // الانتقال لصفحة الهوم واستبدال الصفحة الحالية
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
              ),

              const SizedBox(height: 25),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Re-send code in ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    children: [
                      TextSpan(
                        text: '0:20',
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget المربع الواحد للـ OTP
  Widget _buildOTPBox(BuildContext context,
      {bool first = false, bool last = false}) {
    return Container(
      height: 60,
      width: 55,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE4DFDF)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        autofocus: first,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus(); // ينتقل للمربع اللي بعده
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus(); // يرجع للمربع اللي قبله
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}