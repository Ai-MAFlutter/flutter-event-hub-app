import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;

  const UpcomingEventCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(imagePath, height: 130, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8, left: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    children: [
                      Text("10", style: TextStyle(color: Color(0xFFF0635A), fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("JUNE", style: TextStyle(color: Color(0xFFF0635A), fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8, right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), borderRadius: BorderRadius.circular(10)),
                 
                  child: Image.asset(AppAssets.bookmarkIcons, width: 20, color: const Color(0xFFF0635A)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(
            children: [
              Image.asset(AppAssets.peoplegoing, width: 60), 
              const SizedBox(width: 5),
              const Text("+20 Going", style: TextStyle(color: Color(0xFF3F38DD), fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              
              Image.asset(
                AppAssets.locationmarker, 
                width: 16, 
                height: 16,
                color: Colors.grey, 
              ),
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  "36 Guild Street London, UK", 
                  style: TextStyle(color: Colors.grey, fontSize: 13), 
                  overflow: TextOverflow.ellipsis
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}