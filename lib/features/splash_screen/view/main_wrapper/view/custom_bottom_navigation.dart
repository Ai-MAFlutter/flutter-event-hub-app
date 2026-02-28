import 'package:event_hub_app/features/splash_screen/view/home/views/home_view.dart';
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

  
  late final List<Widget> _screens = [
    const HomeView(),           
    const Center(child: Text("Events Screen")), 
    const MapView(), 
    const Center(child: Text("Profile Screen")), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
            
          },
         
          child: const Icon(Icons.add_box, color: Colors.white, size: 28),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 20,
        notchMargin: 8, 
        shape: const CircularNotchedRectangle(),
        
        clipBehavior: Clip.antiAlias, 
        child: Container(
          height: 60,
          padding: EdgeInsets.zero, 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [
              _buildNavItem(0, AppAssets.exploreActive, "Explore"),
              _buildNavItem(1, AppAssets.calendarIcon, "Events"),
              const SizedBox(width: 40), 
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
      
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 22,
            height: 22,
            
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