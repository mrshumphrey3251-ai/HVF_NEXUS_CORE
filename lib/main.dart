import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const HVFNexus());

class HVFNexus extends StatelessWidget {
  const HVFNexus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFB87333), // HVF Copper
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
            const Text("CAGE: 1AHA8 | UEI: S1M4ENLHTDH5", style: TextStyle(fontSize: 9, color: Colors.white24, letterSpacing: 2)),
            const SizedBox(height: 48),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFB87333)),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NexusBase())),
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
  final List<Widget> _views = [const CommandHUD(), const SiteMapGIS(), const SocialClubPortal(), const MissionIntel()];

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

class CommandHUD extends StatefulWidget {
  const CommandHUD({super.key});
  @override
  State<CommandHUD> createState() => _CommandHUDState();
}

class _CommandHUDState extends State<CommandHUD> {
  double power = 98.2;
  double water = 24.2;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        setState(() {
          power = 96.0 + Random().nextDouble() * 4.0;
          water = 24.1 + Random().nextDouble() * 0.2;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text("LIVE TELEMETRY", style: TextStyle(color: Color(0xFFB87333), letterSpacing: 4, fontWeight: FontWeight.bold))),
          const SizedBox(height: 40),
          _statusTile("HELIOGRID", "${power.toStringAsFixed(1)}% OUTPUT", Icons.bolt, Colors.greenAccent),
          _statusTile("BASIN DEPTH", "${water.toStringAsFixed(2)} FT", Icons.water_drop, Colors.blueAccent),
          _statusTile("ATMOS (JXN)", "72°F | CLEAR", Icons.cloud, const Color(0xFFB87333)),
        ],
      ),
    );
  }

  Widget _statusTile(String title, String val, IconData icon, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(title, style: const TextStyle(fontSize: 10, color: Colors.white38, letterSpacing: 1)),
      subtitle: Text(val, style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold)),
    );
  }
}

class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("34.3323° N | 96.5056° W\nJOHNSTON COUNTY, OK", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2)));
  }
}

class SocialClubPortal extends StatelessWidget {
  const SocialClubPortal({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SOCIAL CLUB REGISTRY\n[FOUNDER 001 ACTIVE]", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333))));
  }
}

class MissionIntel extends StatelessWidget {
  const MissionIntel({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("HUMPHREY VIRTUAL FARMS LLC", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 8),
          Text("CAGE: 1AHA8", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, letterSpacing: 2)),
          Text("UEI: S1M4ENLHTDH5", style: TextStyle(color: Colors.white24, fontSize: 10)),
          SizedBox(height: 30),
          Text("THE HUMPHREY CREED\n\nTo lead with honor, to build with purpose.", textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white70)),
        ],
      ),
    );
  }
}
