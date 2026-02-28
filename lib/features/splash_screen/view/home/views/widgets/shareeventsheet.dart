import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class ShareEventSheet extends StatelessWidget {
  const ShareEventSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(38)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Center(
            child: Container(
              width: 38,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFB2B2B2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            "Share with friends",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF120D26),
            ),
          ),
          const SizedBox(height: 30),
          
          
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4, 
            mainAxisSpacing: 25,
            crossAxisSpacing: 10,
            children: [
              _buildShareItem("Copy Link", AppAssets.copylink), 
              _buildShareItem("WhatsApp", AppAssets.whatsapp),
              _buildShareItem("Facebook", AppAssets.facebook),
              _buildShareItem("Messenger", AppAssets.messenger),
              _buildShareItem("Twitter", AppAssets.twitter),
              _buildShareItem("Instagram", AppAssets.instagram),
              _buildShareItem("Skype", AppAssets.skype),
              _buildShareItem("Message", AppAssets.message),
            ],
          ),
          
          const SizedBox(height: 35),
          
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF0F0F0), 
                foregroundColor: const Color(0xFF120D26),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Text(
                "CANCEL",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 1.1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildShareItem(String label, String imagePath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        SizedBox(
          width: 58,
          height: 58,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
            
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF747688), 
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}