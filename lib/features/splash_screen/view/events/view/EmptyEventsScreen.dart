import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class EmptyEventsScreen extends StatelessWidget {
  const EmptyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.noeventimage, width: 200), 
              const SizedBox(height: 40),
              const Text(
                "No Upcoming Event",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF120D26)),
              ),
              const SizedBox(height: 12),
              const Text(
                "Lorem ipsum dolor sit amet,\nconsectetur",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF747688), fontSize: 16),
              ),
            ],
          ),
        ),
        
        Positioned(
          bottom: 40,
          left: 50,
          right: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF),
              minimumSize: const Size(double.infinity, 58),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("EXPLORE EVENTS", style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1)),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: const Color(0xFF3D56F0),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}