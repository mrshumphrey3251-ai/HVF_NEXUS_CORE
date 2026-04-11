import 'package:flutter/material.dart';

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

class ExecutiveGate extends StatelessWidget {
  const ExecutiveGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFB87333).withOpacity(0.1), width: 20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shield_outlined, color: Color(0xFFB87333), size: 80),
              const SizedBox(height: 30),
              const Text("HVF NEXUS CORE", style: TextStyle(letterSpacing: 6, fontSize: 20, fontWeight: FontWeight.bold)),
              const Text("PROPERTY OF HUMPHREY VIRTUAL FARMS LLC", style: TextStyle(fontSize: 8, color: Colors.white24, letterSpacing: 2)),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NexusBase())),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFB87333)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text("ENGAGE COMMAND", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.w300)),
                ),
              ),
            ],
          ),
        ),
      ),
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

// HUD VIEW (COMMAND)
class CommandHUD extends StatelessWidget {
  const CommandHUD({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("HVF NEXUS: COMMAND", style: TextStyle(fontSize: 14, letterSpacing: 4, color: Color(0xFFB87333)))),
          const SizedBox(height: 40),
          _card("POWER MATRIX", "HELIOGRID: 98%", Colors.greenAccent),
          const SizedBox(height: 15),
          _card("HYDROLOGY", "25-ACRE BASIN: 24.2 FT", Colors.blueAccent),
          const SizedBox(height: 15),
          _card("ATMOSPHERICS", "TISHOMINGO: 72°F", const Color(0xFFB87333)),
        ],
      ),
    );
  }

  Widget _card(String label, String value, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF111111), border: Border.all(color: color.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 9, color: Colors.white38, letterSpacing: 1)),
          const SizedBox(height: 5),
          Text(value, style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// PLACEHOLDERS FOR REMAINING TABS
class SiteMapGIS extends StatelessWidget { const SiteMapGIS({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("GIS SATELLITE FEED", style: TextStyle(color: Color(0xFFB87333)))); } }
class SocialClubPortal extends StatelessWidget { const SocialClubPortal({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("SOCIAL CLUB PORTAL", style: TextStyle(color: Color(0xFFB87333)))); } }
class MissionIntel extends StatelessWidget { const MissionIntel({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("THE HUMPHREY CREED", style: TextStyle(color: Color(0xFFB87333)))); } }
