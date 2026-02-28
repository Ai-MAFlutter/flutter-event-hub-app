import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class InviteFriendSheet extends StatelessWidget {
  const InviteFriendSheet({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, String>> friends = [
      {"name": "Alex Lee", "followers": "2k Followers", "image": AppAssets.imagenot1},
      {"name": "Micheal Ulasi", "followers": "56 Followers", "image": AppAssets.imagenot2},
      {"name": "Cristofer", "followers": "300 Followers", "image": AppAssets.imagenot3},
      {"name": "David Silbia", "followers": "5k Followers", "image": AppAssets.imagenot4},
      {"name": "Ashfak Sayem", "followers": "402 Followers", "image": AppAssets.imagenot5},
      {"name": "Micheal Ulasi", "followers": "56 Followers", "image": AppAssets.imagenot6},
      {"name": "Cristofer", "followers": "300 Followers", "image": AppAssets.imagenot7},
     
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)))),
          const SizedBox(height: 25),
          const Text("Invite Friend", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF120D26))),
          const SizedBox(height: 15),
          
          TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search, color: Color(0xFF5669FF)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.grey[100],
            ),
          ),
          const SizedBox(height: 20),
          
          SizedBox(
            height: 350,
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(backgroundImage: AssetImage(friends[index]['image']!)),
                  title: Text(friends[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(friends[index]['followers']!, style: const TextStyle(color: Colors.grey)),
                  trailing: Icon(
                    index % 2 == 0 ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: index % 2 == 0 ? const Color(0xFF5669FF) : Colors.grey[300],
                  ),
                );
              },
            ),
          ),
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(color: const Color(0xFF5669FF), borderRadius: BorderRadius.circular(15)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("INVITE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}