import 'package:event_hub_app/core/utils/app_colors.dart';
import 'package:event_hub_app/core/utils/widgets/custom_main_button.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/home_view.dart';
import 'package:flutter/material.dart';
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
        child: SingleChildScrollView( 
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
            FocusScope.of(context).nextFocus(); 
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus(); 
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