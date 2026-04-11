import 'package:flutter/material.dart';

// NOTE: In a professional production environment, we would add the 'flutter_map' 
// package to your pubspec.yaml. For now, we are building the Custom Tactical UI.

void main() => runApp(const HVFNexus());

class HVFNexus extends StatelessWidget {
  const HVFNexus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFB87333),
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const ExecutiveGate(),
    );
  }
}

// ... [ExecutiveGate and NexusBase logic remains the same as Build #21] ...

class NexusBase extends StatefulWidget {
  const NexusBase({super.key});
  @override
  State<NexusBase> createState() => _NexusBaseState();
}

class _NexusBaseState extends State<NexusBase> {
  int _selectedIndex = 0;
  static const List<Widget> _views = [CommandHUD(), SiteMapGIS(), SocialClubPortal(), MissionIntel()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _views[_selectedIndex]), 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFB87333),
        unselectedItemColor: Colors.white10,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'COMMAND'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'GIS'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'CLUB'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user), label: 'MISSION'),
        ],
      ),
    );
  }
}

// VIEW 2: TACTICAL GIS OVERLAY (THE TOP PRIORITY)
class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // This simulates the Satellite Grid View
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D0D0D),
            image: DecorationImage(
              image: const NetworkImage('https://www.google.com/maps/vt/pb=!1m4!1m3!1i13!2i3886!3i3124!2m3!1e0!2sm!3i420120488!3m8!2szh-CN!3sus!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
            ),
          ),
        ),
        // Tactical Overlay
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("GEOSPATIAL COMMAND", style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2, fontWeight: FontWeight.bold)),
              const Text("TARGET: JOHNSTON COUNTY, OK", style: TextStyle(fontSize: 10, color: Colors.white38)),
              const Spacer(),
              _mapMarker("RESERVOIR ALPHA (25-ACRE)", "34.3323° N", Colors.blueAccent),
              const SizedBox(height: 10),
              _mapMarker("HELIOGRID ARRAY 1", "96.5056° W", Colors.greenAccent),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mapMarker(String label, String coord, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.black87, border: Border.all(color: color.withOpacity(0.5))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: color, size: 16),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 10, color: Colors.white70)),
              Text(coord, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

// ... [CommandHUD, SocialClubPortal, and MissionIntel remain updated from Build #21] ...
