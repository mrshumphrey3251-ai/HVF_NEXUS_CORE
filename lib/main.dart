import 'package:flutter/material.dart';

void main() => runApp(const HVFNexus());

class HVFNexus extends StatelessWidget {
  const HVFNexus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFB87333), // Copper Accent
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const ExecutiveGate(),
    );
  }
}

// THE EXECUTIVE GATEWAY
class ExecutiveGate extends StatefulWidget {
  const ExecutiveGate({super.key});
  @override
  State<ExecutiveGate> createState() => _ExecutiveGateState();
}

class _ExecutiveGateState extends State<ExecutiveGate> {
  void _unlockSystem() {
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const NexusBase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, color: Color(0xFFB87333), size: 60),
            const SizedBox(height: 20),
            const Text("HVF NEXUS CORE", style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.bold)),
            const Text("AUTHORIZED ACCESS ONLY", style: TextStyle(fontSize: 10, color: Colors.white24)),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFFB87333))),
              onPressed: _unlockSystem,
              child: const Text("INITIALIZE COMMAND", style: TextStyle(color: Colors.white)),
            ),
          ],
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
        selectedItemColor: const Color(0xFFB87333), // Copper
        unselectedItemColor: Colors.white12,
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

// REST OF THE VIEWS UPDATED WITH COPPER THEME
class CommandHUD extends StatelessWidget {
  const CommandHUD({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
      child: Column(
        children: [
          const Text("HVF NEXUS: COMMAND", style: TextStyle(fontSize: 14, letterSpacing: 3, color: Color(0xFFB87333))),
          const SizedBox(height: 30),
          _statusCard("HELIOGRID", "98% POWER", Colors.greenAccent),
          const SizedBox(height: 10),
          _statusCard("BASIN", "24.2 FT", Colors.blueAccent),
          const SizedBox(height: 10),
          _statusCard("SITE PERIMETER", "SECURE", Colors.orangeAccent),
          const SizedBox(height: 10),
          _statusCard("JXN WEATHER", "LIVE FEED", const Color(0xFFB87333)), 
        ],
      ),
    );
  }

  Widget _statusCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xFF151515), border: Border.all(color: color.withOpacity(0.15))),
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

// VIEWS 2, 3, 4 MAINTAINED AS PER BUILD 19...
class SiteMapGIS extends StatelessWidget { const SiteMapGIS({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("SATELLITE ACTIVE", style: TextStyle(color: Color(0xFFB87333)))); } }
class SocialClubPortal extends StatelessWidget { const SocialClubPortal({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("CLUB PORTAL", style: TextStyle(color: Color(0xFFB87333)))); } }
class MissionIntel extends StatelessWidget { const MissionIntel({super.key}); @override Widget build(BuildContext context) { return const Center(child: Text("MISSION INTEL", style: TextStyle(color: Color(0xFFB87333)))); } }
