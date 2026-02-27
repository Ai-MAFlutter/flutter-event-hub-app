import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF120D26), size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Color(0xFF120D26),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Color(0xFF120D26)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          // 1. تنبيه بدعوة (مع أزرار)
          _buildNotificationItem(
            name: "David Silbia",
            actionText: "Invite Jo Malone London’s Mother’s",
            time: "Just now",
            image: AppAssets.imagenot1, // استبدليها بـ AppAssets.imageprofile لو ده اسم المتغير عندك
            hasButtons: true,
          ),
          SizedBox(height: 20,),
          // 2. تنبيه متابعة (عادي)
          _buildNotificationItem(
            name: "Adnan Safi",
            actionText: "Started following you",
            time: "5 min ago",
            image: AppAssets.imagenot2, // صورة افتراضية للمثال
            hasButtons: false,
          ),
          SizedBox(height: 20,),
          // 3. تنبيه دعوة إيفنت جاز
          _buildNotificationItem(
            name: "Joan Baker",
            actionText: "Invite A virtual Evening of Smooth Jazz",
            time: "20 min ago",
            image: AppAssets.imagenot3,
            hasButtons: true,
          ),
          SizedBox(height: 20,),
          // 4. تنبيه Like
          _buildNotificationItem(
            name: "Ronald C. Kinch",
            actionText: "Like you events",
            time: "1 hr ago",
            image: AppAssets.imagenot4,
            hasButtons: false,
          ),
          SizedBox(height: 20,),
          // 5. تنبيه Join
          _buildNotificationItem(
            name: "Clara Tolson",
            actionText: "Join your Event Gala Music Festival",
            time: "9 hr ago",
            image: AppAssets.imagenot5,
            hasButtons: false,
          ),
          SizedBox(height: 20,),
          _buildNotificationItem(
            name: "Clara Tolson",
            actionText: "Join your Event Gala Music Festival",
            time: "9 hr ago",
            image: AppAssets.imagenot6,
            hasButtons: false,
          ),
          SizedBox(height: 20,),
          _buildNotificationItem(
            name: "Clara Tolson",
            actionText: "Join your Event Gala Music Festival",
            time: "9 hr ago",
            image: AppAssets.imagenot7,
            hasButtons: false,
          )
          
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String name,
    required String actionText,
    required String time,
    required String image,
    required bool hasButtons,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black, fontSize: 14, height: 1.4),
                          children: [
                            TextSpan(text: "$name ", style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: actionText, style: const TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(time, style: const TextStyle(color: Color(0xFF747688), fontSize: 12)),
                  ],
                ),
                if (hasButtons) ...[
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildButton("Reject", Colors.white, const Color(0xFF747688), true),
                      const SizedBox(width: 12),
                      _buildButton("Accept", const Color(0xFF5669FF), Colors.white, false),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, bool hasBorder) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: hasBorder ? Border.all(color: const Color(0xFFEEEEEE)) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }
}