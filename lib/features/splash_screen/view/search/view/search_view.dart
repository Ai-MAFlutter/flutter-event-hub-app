import 'package:flutter/material.dart';
import 'package:event_hub_app/core/utils/app_assets.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(AppAssets.arrowback, width: 24, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Search",
          style: TextStyle(
            color: Color(0xFF120D26),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: _buildSearchHeader(),
          ),

          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildEventCard("1ST MAY- SAT -2:00 PM", "A virtual evening of smooth jazz", AppAssets.musicsearch),
                _buildEventCard("1ST MAY- SAT -2:00 PM", "Jo malone london’s mother’s day", AppAssets.eventImage1),
                _buildEventCard("1ST MAY- SAT -2:00 PM", "Women's leadership conference", AppAssets.imagesearch1),
                _buildEventCard("1ST MAY- SAT -2:00 PM", "International kids safe parents night out", AppAssets.imagesearch2),
                _buildEventCard("1ST MAY- SAT -2:00 PM", "International gala music festival", AppAssets.imagesearch3),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Row(
      children: [
        Image.asset(AppAssets.searchIcon, width: 24, color: const Color(0xFF5669FF)),
        const SizedBox(width: 12),
        const Expanded(
          child: TextField(
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Color(0xFF747688), fontSize: 20),
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF5D56FF),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Image.asset(AppAssets.filterIcon, width: 18, color: Colors.white),
              const SizedBox(width: 6),
              const Text("Filters", style: TextStyle(color: Colors.white, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(String date, String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80, height: 82, fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80, height: 82, color: Colors.grey[200],
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(color: Color(0xFF5669FF), fontSize: 12)),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: const TextStyle(color: Color(0xFF120D26), fontSize: 15, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}