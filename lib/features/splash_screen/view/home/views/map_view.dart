import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart'; 
import 'package:latlong2/latlong.dart'; 
import 'package:event_hub_app/core/utils/app_assets.dart'; 

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. الخريطة التفاعلية (OpenStreetMap)
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(37.7749, -122.4194), // سان فرانسيسكو كمثال
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              // توزيع الأيقونات (Markers) في أماكن مختلفة
              MarkerLayer(
                markers: [
                  _buildRealMarker(const LatLng(37.7880, -122.4050), AppAssets.food, const Color(0xFF29D697)),
                  _buildRealMarker(const LatLng(37.7810, -122.4350), AppAssets.music, const Color(0xFF5669FF)),
                  //_buildRealMarker(const LatLng(37.7700, -122.3950), AppAssets.art, const Color(0xFF39C3F2)),
                  _buildRealMarker(const LatLng(37.7580, -122.4200), AppAssets.sports, const Color(0xFFFF5656)),
                ],
              ),
            ],
          ),

          // 2. الجزء العلوي: بار البحث وأيقونة البوصلة
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                _buildTopSearchRow(context),
                const SizedBox(height: 15),
                _buildCategoriesList(),
              ],
            ),
          ),

          // 3. الجزء السفلي: زر الفلتر وكارت الإيفنت
          _buildBottomSection(),
        ],
      ),
    );
  }

  // ميثود بناء دبابيس الخريطة (Markers)
  Marker _buildRealMarker(LatLng point, String asset, Color color) {
    return Marker(
      point: point,
      width: 45,
      height: 45,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 8)],
        ),
        child: Image.asset(asset, color: color), 
      ),
    );
  }

  // بار البحث العلوي (محدث بأيقونات الفيجما)
  Widget _buildTopSearchRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // زر الرجوع
          _buildCircularIconFromAsset(AppAssets.arrowback, () => Navigator.pop(context), iconColor: Colors.black),
          const SizedBox(width: 10),
          // حقل البحث
          Expanded(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: Row(
                children: [
                  Image.asset(AppAssets.searchIcon, width: 20, color: const Color(0xFF5669FF)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Find for food or restaurant...",
                        hintStyle: TextStyle(color: Color(0xFF747688), fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // أيقونة البوصلة (علوية يمين)
          _buildCircularIconFromAsset(AppAssets.locationmarker, () {}, iconColor: const Color(0xFF5669FF)),
        ],
      ),
    );
  }

  // قائمة التصنيفات العلوية
  Widget _buildCategoriesList() {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        children: [
          _buildCategoryItem("Sports", AppAssets.sports, const Color(0xFFFF5656)),
          _buildCategoryItem("Music", AppAssets.music, const Color(0xFF5669FF)),
          _buildCategoryItem("Food", AppAssets.food, const Color(0xFF29D697)),
        ],
      ),
    );
  }

  // الكارت السفلي وزر الفلتر
  Widget _buildBottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // زر الفلتر الدائري الأزرق
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 15),
            child: FloatingActionButton(
              heroTag: "map_filter_btn",
              backgroundColor: const Color(0xFF5669FF),
              onPressed: () {},
              child: Image.asset(AppAssets.filterIcon, width: 24, color: Colors.white),
            ),
          ),
          // كارت الإيفنت
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(AppAssets.eventImage1, width: 75, height: 75, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Wed, Apr 28 • 5:30 PM", style: TextStyle(color: Color(0xFF5669FF), fontSize: 12)),
                      const SizedBox(height: 4),
                      const Text("Jo Malone London’s Presents", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          // أيقونة الموقع الصغيرة من الفيجما
                          Image.asset(AppAssets.locationmarker, width: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          const Text(" Radius Gallery • Santa Cruz, CA", style: TextStyle(color: Colors.grey, fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(AppAssets.bookmarkIcon, width: 18, color: const Color(0xFFFF5656)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // دالة مساعدة للأزرار الدائرية
  Widget _buildCircularIconFromAsset(String asset, VoidCallback onTap, {required Color iconColor}) {
    return Container(
      height: 50, width: 50,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: onTap,
        child: Center(child: Image.asset(asset, width: 22, color: iconColor)),
      ),
    );
  }

  // دالة مساعدة لعناصر التصنيفات
  Widget _buildCategoryItem(String label, String iconAsset, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Row(
        children: [
          Image.asset(iconAsset, width: 20, height: 20, color: color),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Color(0xFF747688))),
        ],
      ),
    );
  }
}