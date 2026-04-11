import 'package:flutter/material.dart';

void main() {
  runApp(const HVFNexus());
}

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shield_outlined, color: Color(0xFFB87333), size: 80),
            const SizedBox(height: 24),
            const Text("HVF NEXUS CORE", style: TextStyle(letterSpacing: 6, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 48),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFB87333)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const NexusBase()),
                );
              },
              child: const Text("ENGAGE COMMAND", style: TextStyle(color: Colors.white, letterSpacing: 2)),
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

  final List<Widget> _views = [
    const CommandHUD(),
    const SiteMapGIS(),
    const SocialClubPortal(),
    const MissionIntel(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _views[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: const Color(0xFFB87333),
        unselectedItemColor: Colors.white12,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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

class CommandHUD extends StatelessWidget {
  const CommandHUD({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text("COMMAND HUD", style: TextStyle(color: Color(0xFFB87333), letterSpacing: 4, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 40),
          _statusTile("HELIOGRID", "98% POWER", Icons.bolt, Colors.greenAccent),
          _statusTile("BASIN", "24.2 FT", Icons.water_drop, Colors.blueAccent),
          _statusTile("ATMOS", "72°F | CLEAR", Icons.cloud, const Color(0xFFB87333)),
        ],
      ),
    );
  }

  Widget _statusTile(String title, String val, IconData icon, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.white38)),
      subtitle: Text(val, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold)),
    );
  }
}

class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("GIS SATELLITE INTERFACE\n34.3323° N | 96.5056° W", 
        textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2)),
    );
  }
}

class SocialClubPortal extends StatelessWidget {
  const SocialClubPortal({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("SOCIAL CLUB REGISTRY\n[0 RESIDENTS FOUND]", 
        textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2)),
    );
  }
}

class MissionIntel extends StatelessWidget {
  const MissionIntel({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Text("THE HUMPHREY CREED\n\nTo lead with honor, to build with purpose.", 
          textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white70)),
      ),
    );
  }
}
