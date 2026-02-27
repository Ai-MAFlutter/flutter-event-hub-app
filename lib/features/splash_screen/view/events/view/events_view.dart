import 'package:event_hub_app/features/splash_screen/view/events/view/EmptyEventsScreen.dart';
import 'package:flutter/material.dart';
import 'see_all_events_screen.dart';

class EventsView extends StatelessWidget {
  final List<Map<String, dynamic>> events;

  const EventsView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Events",
          style: TextStyle(color: Color(0xFF120D26), fontSize: 24, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black, size: 28), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: events.isEmpty 
          ? const EmptyEventsScreen() 
          : SeeAllEventsScreen(),
    );
  }
}