import 'package:event_hub_app/features/splash_screen/view/home/views/widgets/InviteFriendSheet.dart';
import 'package:event_hub_app/features/splash_screen/view/home/views/widgets/shareeventsheet.dart';
import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';
// تأكدي من عمل import لملفات الـ Sheets التي أنشأناها سابقاً

class EventDetailsView extends StatelessWidget {
  const EventDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // المحتوى القابل للتمرير
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderImage(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50), // مساحة للكارت الأبيض المرتفع
                      const Text(
                        "International Band Music Concert",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF120D26),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // صف التاريخ والوقت
                      _buildDetailRow(
                        AppAssets.calendarIcon,
                        "14 December, 2021",
                        "Tuesday, 4:00PM - 9:00PM",
                      ),
                      const SizedBox(height: 20),
                      // صف الموقع
                      _buildDetailRow(
                        AppAssets.locationmarker,
                        "Gala Convention Center",
                        "36 Guild Street London, UK",
                      ),
                      const SizedBox(height: 20),
                      // صف المنظم
                      _buildOrganizerRow(),
                      const SizedBox(height: 30),
                      const Text(
                        "About Event",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF120D26),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF120D26),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 120), // مساحة للزر السفلي
                    ],
                  ),
                ),
              ],
            ),
          ),
          // الطبقات الثابتة فوق المحتوى
          _buildTopBar(context),
          _buildBuyTicketButton(),
        ],
      ),
    );
  }

  // ميثود بناء صفوف التفاصيل (تاريخ وموقع)
  Widget _buildDetailRow(String iconPath, String title, String subtitle) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: const Color(0xFF5669FF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image.asset(
              iconPath,
              width: 24,
              color: const Color(0xFF5669FF), 
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF120D26),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Color(0xFF747688), fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  // الجزء الخاص بالمنظم (Organizer)
  Widget _buildOrganizerRow() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppAssets.imageevent2,
            width: 44, 
            height: 44, 
            fit: BoxFit.cover
          ),
        ),
        const SizedBox(width: 15),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ashfak Sayem",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF120D26)),
            ),
            Text("Organizer", style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF5669FF).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Follow",
            style: TextStyle(color: Color(0xFF5669FF), fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          AppAssets.imageevent,
          width: double.infinity,
          height: 240,
          fit: BoxFit.cover,
        ),
        // كارت الأشخاص (20+ Going)
        Positioned(
          bottom: -25,
          left: 45,
          right: 45,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ],
            ),
            child: Row(
              children: [
                Image.asset(AppAssets.peoplegoing, height: 28),
                const SizedBox(width: 10),
                const Text(
                  "+20 Going",
                  style: TextStyle(
                    color: Color(0xFF3F38DD),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // تم إضافة كود الـ Invite هنا
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const InviteFriendSheet(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5669FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text("Invite", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBuyTicketButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 58,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF5669FF),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5669FF).withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Text(
              "BUY TICKET \$120",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 15,
                backgroundColor: const Color(0xFF3D56F0),
                child: Image.asset(AppAssets.arrownext, width: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              "Event Details",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            // تم إضافة كود الـ Share عند الضغط على أيقونة الـ Bookmark
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ShareEventSheet(),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.bookmark, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}