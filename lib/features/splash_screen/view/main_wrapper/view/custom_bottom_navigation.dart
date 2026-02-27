import 'package:event_hub_app/features/splash_screen/view/home/views/home_view.dart';
// 1. التعديل هنا: لو طلع لك خطأ في MapView، غيري الـ import ليكون دقيقاً 
// وتأكدي أن اسم الكلاس داخل ملف map_view.dart هو MapView
import 'package:event_hub_app/features/splash_screen/view/home/views/map_view.dart'; 

import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;

  // 2. التعديل الأهم: مسح كلمة const من هنا نهائياً
  // لأن MapView غالباً جواها متغيرات فمينفعش القائمة كلها تبقى const
  late final List<Widget> _screens = [
    const HomeView(),           
    const Center(child: Text("Events Screen")), 
    const MapView(), // التأكد من أن هذا هو الـ Widget الخاص بكِ وليس Map مكتبة أخرى
    const Center(child: Text("Profile Screen")), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 3. دي اللي بتخلي الهوم تبدأ من تحت الناف بار وتديكِ شكل الفيجما الصح
      extendBody: true, 
      body: _screens[_currentIndex],

      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5669FF).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF5669FF),
          elevation: 0, 
          shape: const CircleBorder(),
          onPressed: () {
            // هنا ممكن تفتحي صفحة إضافة فعالية
          },
          // تأكدي من استخدام أيقونة الزائد من Assets أو Icons.add
          child: const Icon(Icons.add_box, color: Colors.white, size: 28),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 20,
        notchMargin: 8, // الفراغ حوالين الزرار الأزرق
        shape: const CircularNotchedRectangle(),
        // Clip.antiAlias بيخلي الحواف ناعمة جداً زي الفيجما
        clipBehavior: Clip.antiAlias, 
        child: Container(
          height: 60,
          padding: EdgeInsets.zero, // عشان الأيقونات تاخد راحتها
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [
              _buildNavItem(0, AppAssets.exploreActive, "Explore"),
              _buildNavItem(1, AppAssets.calendarIcon, "Events"),
              const SizedBox(width: 40), // مكان الزرار العائم
              _buildNavItem(2, AppAssets.locationmarker, "Map"),
              _buildNavItem(3, AppAssets.profileMenu, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    bool isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      // إزالة تأثير اللون الرمادي عند الضغط للحفاظ على نظافة التصميم
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
            // تغيير اللون بناءً على الحالة (نشط أم لا)
            color: isSelected ? const Color(0xFF5669FF) : const Color(0xFF747688),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? const Color(0xFF5669FF) : const Color(0xFF747688),
            ),
          ),
        ],
      ),
    );
  }
}