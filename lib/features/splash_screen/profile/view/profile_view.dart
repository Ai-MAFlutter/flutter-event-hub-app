import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF120D26)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Profile", style: TextStyle(color: Color(0xFF120D26), fontSize: 20)),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // 1. الجزء العلوي (صورة David Silbia والاسم)
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppAssets.imageprofile), 
          ),
          const SizedBox(height: 15),
          const Text(
            "David Silbia",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF120D26)),
          ),
          const SizedBox(height: 20),
          
          // 2. الإحصائيات (Following & Followers)
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProfileStat(count: "350", label: "Following"),
              SizedBox(width: 40),
              _ProfileStat(count: "346", label: "Followers"),
            ],
          ),
          const SizedBox(height: 25),

          // 3. أزرار الأكشن (Follow & Messages) زي الفيجما بالظبط
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add, size: 18),
                    label: const Text("Follow"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5669FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.messenger_outline, size: 18),
                    label: const Text("Messages"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF5669FF),
                      side: const BorderSide(color: Color(0xFF5669FF)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // 4. التبويبات (Tabs)
          TabBar(
            controller: _tabController,
            labelColor: const Color(0xFF5669FF),
            unselectedLabelColor: const Color(0xFF747688),
            indicatorColor: const Color(0xFF5669FF),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            tabs: const [
              Tab(text: "ABOUT"),
              Tab(text: "EVENT"),
              Tab(text: "REVIEWS"),
            ],
          ),

          // 5. محتوى التبويبات (TabBarView)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAboutTab(),
                _buildEventTab(),
                _buildReviewTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- محتوى تبويب ABOUT (مع الـ Interests) ---
  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enjoy your favorite dishes and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More...",
            style: TextStyle(color: Color(0xFF747688), fontSize: 15, height: 1.6),
          ),
          const SizedBox(height: 25),
          const Text("Interest", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _interestChip("Games Online", const Color(0xFF6B7AFE)),
              _interestChip("Concert", const Color(0xFFEE544A)),
              _interestChip("Music", const Color(0xFFFF8D5D)),
              _interestChip("Art", const Color(0xFF7D67EE)),
              _interestChip("Movie", const Color(0xFF29D697)),
            ],
          ),
        ],
      ),
    );
  }

  // --- محتوى تبويب EVENT (كروت الإيفنتات) ---
  Widget _buildEventTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        _EventCard(title: "A virtual evening of smooth jazz", date: "1ST MAY-SAT-2:00 PM", image: AppAssets.musicsearch),
        _EventCard(title: "Jo malone london's mother's day", date: "1ST MAY-SAT-2:00 PM", image: AppAssets.eventImage1),
        _EventCard(title: "Women's leadership conference", date: "1ST MAY-SAT-2:00 PM", image: AppAssets.imagesearch1),
        _EventCard(title: "A virtual evening of smooth jazz", date: "1ST MAY-SAT-2:00 PM", image: AppAssets.musicsearch),
      ],
    );
  }

 // --- محتوى تبويب REVIEWS (النجوم والمراجعات) ---
  Widget _buildReviewTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      // زودنا عدد المراجعات لـ 10 مثلاً بدل 2
      itemCount: 10, 
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(radius: 22, backgroundImage: AssetImage(AppAssets.profile)),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Rocks Velkeinjen", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Text("10 Feb", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    // تعديل النجوم لتصبح 5 كاملة باللون الأصفر
                    Row(
                      children: List.generate(5, (i) => const Icon(Icons.star, size: 14, color: Color(0xFFFFC107))),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Cinemas is the ultimate experience to see new movies in Gold Class or Vmax. Find a cinema near you.",
                      style: TextStyle(color: Color(0xFF747688), fontSize: 14, height: 1.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _interestChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String count;
  final String label;
  const _ProfileStat({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF120D26))),
        Text(label, style: const TextStyle(color: Color(0xFF747688), fontSize: 14)),
      ],
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  const _EventCard({required this.title, required this.date, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image, width: 75, height: 75, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(color: Color(0xFF5669FF), fontSize: 12, fontWeight: FontWeight.w400)),
                const SizedBox(height: 5),
                Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF120D26))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}