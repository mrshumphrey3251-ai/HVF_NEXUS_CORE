import 'package:flutter/material.dart';

void main() => runApp(const HVFNexus());

class HVFNexus extends StatelessWidget {
  const HVFNexus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const NexusBase(),
    );
  }
}

class NexusBase extends StatefulWidget {
  const NexusBase({super.key});
  @override
  State<NexusBase> createState() => _NexusBaseState();
}

class _NexusBaseState extends State<NexusBase> {
  int _selectedIndex = 0;

  static const List<Widget> _views = [
    CommandHUD(),
    SiteMapGIS(),
    SocialClubPortal(),
    MissionIntel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(child: _views[_selectedIndex]), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white24,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'COMMAND'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'SITE MAP'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined), label: 'CLUB'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined), label: 'MISSION'),
        ],
      ),
    );
  }
}

// VIEW 1: DYNAMIC COMMAND HUD
class CommandHUD extends StatelessWidget {
  const CommandHUD({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: Column(
        children: [
          const Text("HVF NEXUS: COMMAND", style: TextStyle(fontSize: 14, letterSpacing: 3, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          const SizedBox(height: 30),
          _statusCard("HELIOGRID SYSTEM", "98% POWER", Colors.greenAccent),
          const SizedBox(height: 10),
          _statusCard("BASIN HYDROLOGY", "24.2 FT", Colors.blueAccent),
          const SizedBox(height: 10),
          _statusCard("SITE PERIMETER", "SECURE", Colors.orangeAccent),
          const SizedBox(height: 10),
          // Prepared for OpenWeatherMap API Integration
          _statusCard("JOHNSTON CO. WX", "LIVE FEED ACTIVE", Colors.purpleAccent), 
        ],
      ),
    );
  }

  Widget _statusCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFF151515), borderRadius: BorderRadius.circular(4), border: Border.all(color: color.withOpacity(0.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 10)),
          Text(value, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// VIEW 2: TACTICAL GIS OVERLAY
class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          const Center(child: Icon(Icons.gps_fixed, color: Colors.blueAccent, size: 100)),
          Positioned(
            bottom: 40, left: 40, right: 40,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.black87,
              child: const Text("TARGET: JOHNSTON COUNTY SITE\nLAT: 34.3323° | LON: -96.5056°\nSTATUS: INITIALIZING SAT-LAYER", 
                style: TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1)),
            ),
          )
        ],
      ),
    );
  }
}

// VIEW 3: SOCIAL CLUB & MILESTONE TRACKER
class SocialClubPortal extends StatelessWidget {
  const SocialClubPortal({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("HUMPHREY SOCIAL CLUB", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, color: Colors.blueAccent)),
          const SizedBox(height: 30),
          const Text("CURRENT PROJECT MILESTONES:", style: TextStyle(fontSize: 10, color: Colors.white38)),
          const SizedBox(height: 20),
          _milestone("Nexus Infrastructure", "100%", Colors.greenAccent),
          _milestone("Johnston County Pivot", "90%", Colors.blueAccent),
          _milestone("25-Acre Basin Engineering", "IN PROGRESS", Colors.orangeAccent),
        ],
      ),
    );
  }

  Widget _milestone(String label, String progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.white)),
          Text(progress, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// VIEW 4: MISSION INTEL
class MissionIntel extends StatelessWidget {
  const MissionIntel({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text(
          "THE HUMPHREY CREED\n\nTo lead with honor, to build with purpose, and to provide stewardship for the land and those who served.",
          textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, height: 1.6, color: Colors.white70, fontSize: 13),
        ),
      ),
    );
  }
}
