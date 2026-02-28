import 'package:event_hub_app/core/utils/app_assets.dart';
import 'package:event_hub_app/features/splash_screen/view/auth/view/sign_in_view.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(AppAssets.profileImage),
              ),
              const SizedBox(height: 18),
              const Text(
                'Ashfak Sayem',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF120D26),
                ),
              ),
              const SizedBox(height: 40), 

              
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _drawerItem(
                      context,
                      iconPath: AppAssets.profileMenu,
                      text: 'My Profile',
                      onTap: () => _navigateTo(context, 'My Profile'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.messageIcon,
                      text: 'Message',
                      badgeCount: 3, 
                      onTap: () => _navigateTo(context, 'Message'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.calendarIcon,
                      text: 'Calendar',
                      onTap: () => _navigateTo(context, 'Calendar'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.bookmarkIcon,
                      text: 'Bookmark',
                      onTap: () => _navigateTo(context, 'Bookmark'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.contactIcon,
                      text: 'Contact Us',
                      onTap: () => _navigateTo(context, 'Contact Us'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.settingsIcon,
                      text: 'Settings',
                      onTap: () => _navigateTo(context, 'Settings'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.helpIcon,
                      text: 'Helps & FAQs',
                      onTap: () => _navigateTo(context, 'Helps & FAQs'),
                    ),
                    _drawerItem(
                      context,
                      iconPath: AppAssets.signOutIcon,
                      text: 'Sign Out',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInView()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF00F8FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AppAssets.upgradeIcon, width: 24),
                    const SizedBox(width: 12),
                    const Text(
                      'Upgrade Pro',
                      style: TextStyle(
                        color: Color(0xFF00B5B5),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _drawerItem(
    BuildContext context, {
    required String iconPath,
    required String text,
    int? badgeCount,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  iconPath,
                  width: 25,
                  height: 25,
                  color: const Color(0xFF747688), 
                ),
                if (badgeCount != null)
                  Positioned(
                    top: -4,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF8D5D), 
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        '$badgeCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16, 
                color: Color(0xFF120D26),
                fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, String title) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaceholderScreen(title: title)),
    );
  }
}


class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Coming Soon')),
    );
  }
}