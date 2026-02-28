import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nearby You",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF120D26),
                ),
              ),
              GestureDetector(
                onTap: () {
                  
                },
                child: const Row(
                  children: [
                    Text("See All", style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_right, color: Colors.grey),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 150, 
          decoration: BoxDecoration(
            color: const Color(0xFFD7FFFF),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Invite your friends",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF120D26),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Get \$20 for ticket",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF484D70),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00F8FF), 
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: const Text(
                        "INVITE",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child: Image.asset(
                  AppAssets.inviteBannerGift, 
                  width: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}