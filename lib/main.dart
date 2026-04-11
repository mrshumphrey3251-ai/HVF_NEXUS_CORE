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
        type: BottomNavigationBarType.fixed, // Required for 4+ items
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white24,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'COMMAND'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'GIS'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_outlined), label: 'CLUB'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined), label: 'MISSION'),
        ],
      ),
    );
  }
}

// VIEW 1: UPDATED COMMAND HUD WITH WEATHER
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
          _statusCard("WEATHER (OK)", "72°F | 12MPH NW", Colors.purpleAccent), // New Telemetry
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

// VIEW 2: GIS (RESERVED FOR JOHNSTON COUNTY)
class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("JOHNSTON COUNTY GIS\nSATELLITE INTERFACE\n[ACTIVE SCAN PENDING]", 
        textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent, letterSpacing: 2, fontSize: 12)),
    );
  }
}

// VIEW 3: HUMPHREY SOCIAL CLUB
class SocialClubPortal extends StatelessWidget {
  const SocialClubPortal({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.house_siding, size: 40, color: Colors.blueAccent),
          SizedBox(height: 20),
          Text("HUMPHREY SOCIAL CLUB", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
          Text("Resident Management Portal", style: TextStyle(color: Colors.white38, fontSize: 11)),
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
          "THE HUMPHREY CREED\n\nTo lead with honor, to build with purpose, and to provide stewardship for the land and those who served. Through Humphrey Virtual Farms, we bridge the legacy of our ancestors with the technology of the future.",
          textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, height: 1.6, color: Colors.white70, fontSize: 13),
        ),
      ),
    );
  }
}
