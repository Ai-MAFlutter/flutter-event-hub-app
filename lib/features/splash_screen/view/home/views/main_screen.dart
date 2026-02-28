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

  
  final List<Widget> _pages = [
    const HomeView(),           
    const Center(child: Text("Events Page")), 
    const MapView(),            
    const Center(child: Text("Profile Page")), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      extendBody: true, 
      body: _pages[_currentIndex == 2 || _currentIndex == 3 ? _currentIndex : _currentIndex],
      
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: const Color(0xFF5669FF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add_box, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

     
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), 
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNavItem(0, Icons.explore_outlined, "Explore"),
                  _buildNavItem(1, Icons.calendar_month_outlined, "Events"),
                ],
              ),
              
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