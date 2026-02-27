import 'package:flutter/material.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/home_view.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/map_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // القائمة التي تحتوي على الصفحات الفعلية في مشروعك
  final List<Widget> _pages = [
    const HomeView(),           // Index 0: Explore
    const Center(child: Text("Events Page")), // Index 1: Events
    const MapView(),            // Index 2: Map
    const Center(child: Text("Profile Page")), // Index 3: Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // لضمان ظهور المحتوى بشكل كامل خلف الـ Bar
      extendBody: true, 
      body: _pages[_currentIndex == 2 || _currentIndex == 3 ? _currentIndex : _currentIndex],
      
      // 1. زر الزائد (+) الكبير في المنتصف
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // كود إضافة فعالية جديدة
        },
        backgroundColor: const Color(0xFF5669FF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add_box, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 2. شريط التنقل السفلي
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // لعمل الفتحة تحت زر الزائد
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الجزء الأيسر (Explore & Events)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, Icons.explore_outlined, "Explore"),
                  _buildNavItem(1, Icons.calendar_month_outlined, "Events"),
                ],
              ),
              // الجزء الأيمن (Map & Profile)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(2, Icons.location_on_outlined, "Map"),
                  _buildNavItem(3, Icons.person_outline, "Profile"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة بناء عناصر التنقل لجعل الكود أنظف
  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _currentIndex == index;
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xFF5669FF) : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xFF5669FF) : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}