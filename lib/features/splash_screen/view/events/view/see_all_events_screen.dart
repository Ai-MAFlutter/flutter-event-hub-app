import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class SeeAllEventsScreen extends StatelessWidget {
  const SeeAllEventsScreen({super.key});

  // البيانات الـ 6 كاملة ثابتة جوه الصفحة
  final List<Map<String, dynamic>> staticEvents = const [
    {
      "title": "Jo Malone London’s Mother’s Day Presents",
      "location": "Radius Gallery • Santa Cruz, CA",
      "date": "WED, APR 28 • 5:30 PM",
      "image": AppAssets.eventImage1,
    },
    {
      "title": "A Virtual Evening of Smooth Jazz",
      "location": "Lot 13 • Oakland, CA",
      "date": "SAT, MAY 1 • 2:00 PM",
      "image": AppAssets.musicsearch,
    },
    {
      "title": "Women's Leadership Conference 2021",
      "location": "53 Bush St • San Francisco, CA",
      "date": "SAT, APR 24 • 1:30 PM",
      "image": AppAssets.imagesearch1,
    },
    {
      "title": "International Kids Safe Parents Night Out",
      "location": "Lot 13 • Oakland, CA",
      "date": "FRI, APR 23 • 6:00 PM",
      "image": AppAssets.imagesearch2,
    },
    {
      "title": "Collectivity Plays the Music of Jimi",
      "location": "Longboard Margarita Bar",
      "date": "MON, JUN 21 • 10:00 PM",
      "image": AppAssets.eventImage2,
    },
    {
      "title": "International Gala Music Festival",
      "location": "36 Guild Street London, UK",
      "date": "SUN, APR 25 • 10:15 AM",
      "image": AppAssets.imagesearch3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF120D26)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Events",
          style: TextStyle(
            color: Color(0xFF120D26),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(AppAssets.searchIcon, width: 24),
            onPressed: () {},
          ),
          const Icon(Icons.more_vert, color: Color(0xFF120D26)),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: staticEvents.length, 
        itemBuilder: (context, index) {
          final event = staticEvents[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                // الصورة
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    event['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 14),
                // المعلومات
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event['date'],
                        style: const TextStyle(
                          color: Color(0xFF5669FF),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        event['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF120D26),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Color(0xFF747688)),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              event['location'],
                              style: const TextStyle(
                                color: Color(0xFF747688),
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}