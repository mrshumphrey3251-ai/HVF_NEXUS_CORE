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
    MissionIntel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(child: _views[_selectedIndex]), 
      bottomNavigationBar: BottomNavigationBar(
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
          BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined), label: 'MISSION'),
        ],
      ),
    );
  }
}

class CommandHUD extends StatelessWidget {
  const CommandHUD({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text("HVF NEXUS: COMMAND", 
              style: TextStyle(fontSize: 14, letterSpacing: 3, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ),
          const SizedBox(height: 40),
          _statusCard("HELIOGRID SYSTEM", "98% POWER", Colors.greenAccent),
          const SizedBox(height: 12),
          _statusCard("BASIN HYDROLOGY", "24.2 FT", Colors.blueAccent),
          const SizedBox(height: 12),
          _statusCard("SITE PERIMETER", "SECURE", Colors.orangeAccent),
          const Spacer(),
          const Center(
            child: Text("ALL SYSTEMS OPERATIONAL", 
              style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 1)),
          ),
        ],
      ),
    );
  }

  Widget _statusCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF151515), 
        borderRadius: BorderRadius.circular(4), 
        border: Border.all(color: color.withOpacity(0.2))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 10, letterSpacing: 1)),
          Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text("JOHNSTON COUNTY\nGIS OVERLAY\n\n[SATELLITE FEED PENDING]", 
          textAlign: TextAlign.center, style: TextStyle(color: Colors.blueAccent, letterSpacing: 2, fontSize: 12)),
      ),
    );
  }
}

class MissionIntel extends StatelessWidget {
  // FIXED: Changed super.objective to super.key
  const MissionIntel({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("THE HUMPHREY CREED", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14)),
            SizedBox(height: 24),
            Text(
              "To lead with honor, to build with purpose, and to provide stewardship for the land and those who served. Through Humphrey Virtual Farms, we bridge the legacy of our ancestors with the technology of the future—securing sovereignty for our veterans and a foundation for the next generation.",
              textAlign: TextAlign.center, 
              style: TextStyle(fontStyle: FontStyle.italic, height: 1.6, color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
