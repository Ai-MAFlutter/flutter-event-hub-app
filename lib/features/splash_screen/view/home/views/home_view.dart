import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:event_hub_app/core/utils/widgets/filter_bottom_sheet.dart';
import 'package:event_hub_app/features/splash_screen/profile/view/notifications_view.dart';
import 'package:event_hub_app/features/splash_screen/profile/view/profile_view.dart';
import 'package:event_hub_app/features/splash_screen/view/events/view/see_all_events_screen.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/event_details_view.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/widgets/home_drawer.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/widgets/upcoming_event_card.dart';
import 'package:event_hub_app/features/splash_screen/view/search/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/map_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const HomeDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF5669FF),
        shape: const CircleBorder(),
        child: Image.asset(AppAssets.addCircleIcon, width: 24, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(AppAssets.exploreActive, "Explore", () {}),
            _buildBottomNavItem(AppAssets.eventsActive, "Events", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const EventDetailsView()));
            }),
            const SizedBox(width: 40), 
            _buildBottomNavItem(AppAssets.mapactive, "Map", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MapView()));
            }),
            _buildBottomNavItem(AppAssets.profile, "Profile", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileView()));
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildSectionHeader("Upcoming Events", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeAllEventsScreen()));
            }),
            const SizedBox(height: 10),
            _buildUpcomingEventsList(),
            const SizedBox(height: 25),
            _buildInviteBanner(),
            const SizedBox(height: 25),
            _buildSectionHeader("Nearby You", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeAllEventsScreen()));
            }),
            const SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF4A43EC),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(33), bottomRight: Radius.circular(33)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (context) => IconButton(
                icon: Image.asset(AppAssets.menuIcon, width: 24),
                onPressed: () => Scaffold.of(context).openDrawer(),
              )),
              const Column(
                children: [
                  Row(children: [Text("Current Location", style: TextStyle(color: Colors.white70, fontSize: 12)), Icon(Icons.arrow_drop_down, color: Colors.white, size: 15)]),
                  Text("New York, USA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsView()));
                },
                child: CircleAvatar(
                  radius: 18, 
                  backgroundColor: const Color(0xFF5D56F3), 
                  child: Image.asset(AppAssets.notificationIcon, width: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchView())),
                child: Row(children: [Image.asset(AppAssets.searchIcon, width: 24, color: Colors.white), const SizedBox(width: 10), const Expanded(child: Text("Search...", style: TextStyle(color: Colors.white54, fontSize: 18)))]),
              )),
              GestureDetector(
                onTap: () => showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (context) => const FilterBottomSheet()),
                child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF5D56F3), borderRadius: BorderRadius.circular(20)), child: Row(children: [Image.asset(AppAssets.filterIcon, width: 16), const SizedBox(width: 5), const Text("Filters", style: TextStyle(color: Colors.white, fontSize: 12))])),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [_buildCategoryItem(AppAssets.sports, "Sports", const Color(0xFFF0635A)), _buildCategoryItem(AppAssets.music, "Music", const Color(0xFFF59762)), _buildCategoryItem(AppAssets.food, "Food", const Color(0xFF29D697))])),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventsList() {
    return SizedBox(
      height: 270,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EventDetailsView())),
            child: const UpcomingEventCard(
              imagePath: AppAssets.eventImage1,
              title: "International Band Mu...",
              location: "36 Guild Street London, UK",
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EventDetailsView())),
            child: const UpcomingEventCard(
              imagePath: AppAssets.eventImage2,
              title: "Jo Malone London’s..",
              location: "Radius Gallery • Santa Cruz, CA",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: onTap,
            child: const Row(
              children: [
                Text("See All", style: TextStyle(color: Colors.grey)),
                Icon(Icons.arrow_right, color: Colors.grey),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(String iconPath, String label, VoidCallback onTap) {
    return Expanded(child: InkWell(onTap: onTap, child: Column(mainAxisSize: MainAxisSize.min, children: [Image.asset(iconPath, width: 22, color: Colors.grey), const SizedBox(height: 4), Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey))])));
  }

  Widget _buildCategoryItem(String iconPath, String label, Color color) {
    return Container(margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)), child: Row(children: [Image.asset(iconPath, width: 18), const SizedBox(width: 8), Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500))]));
  }

  Widget _buildInviteBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20), width: double.infinity, height: 150,
      decoration: BoxDecoration(color: const Color(0xFFD7FFFF), borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Padding(padding: const EdgeInsets.only(left: 20, top: 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Invite your friends", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF120D26))), const SizedBox(height: 8), const Text("Get \$20 for ticket", style: TextStyle(color: Color(0xFF484D70), fontSize: 16)), const SizedBox(height: 15), Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), decoration: BoxDecoration(color: const Color(0xFF00F8FF), borderRadius: BorderRadius.circular(8)), child: const Text("INVITE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))]),
        ),
        Positioned(right: 0, bottom: 0, top: 0, child: Image.asset(AppAssets.inviteBannerGift, width: 170, fit: BoxFit.contain)),
      ]),
    );
  }
}