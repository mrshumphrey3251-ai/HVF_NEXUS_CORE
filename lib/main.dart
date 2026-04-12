// HVF NEXUS CORE - VERSION 1.0.6 - EXECUTIVE IDENTITY LOCK
// CEO: JEFFERY DONNELL HUMPHREY
// CAGE: 1AHA8 | UEI: S1M4ENLHTDH5
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
      title: 'HVF NEXUS',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFB87333), // HVF COPPER
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
          border: Border.all(color: const Color(0xFFB87333), width: 0.5),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shield_outlined, color: Color(0xFFB87333), size: 100),
              const SizedBox(height: 32),
              const Text("HVF NEXUS CORE", style: TextStyle(letterSpacing: 8, fontWeight: FontWeight.bold, fontSize: 22)),
              const SizedBox(height: 8),
              const Text("SYSTEM VERSION 1.0.6", style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 2)),
              const SizedBox(height: 48),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB87333), width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                ),
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NexusBase())),
                child: const Text("ENGAGE COMMAND", style: TextStyle(color: Colors.white, letterSpacing: 3, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 60),
              const Text("CAGE: 1AHA8", style: TextStyle(color: Color(0xFFB87333), fontWeight: FontWeight.bold, fontSize: 12)),
              const Text("UEI: S1M4ENLHTDH5", style: TextStyle(color: Colors.white10, fontSize: 10)),
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
  final List<Widget> _views = [const CommandHUD(), const SiteMapGIS(), const SocialClubPortal(), const MissionIntel()];

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
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), label: 'COMMAND'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'GIS'),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: 'CLUB'),
          BottomNavigationBarItem(icon: Icon(Icons.verified_user_outlined), label: 'MISSION'),
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
          power = 97.5 + Random().nextDouble() * 2.5;
          water = 24.18 + Random().nextDouble() * 0.05;
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
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("OPERATIONAL TELEMETRY", style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2, fontWeight: FontWeight.bold)),
          const Text("SLAB ROAD SITE - JOHNSTON CO.", style: TextStyle(color: Colors.white24, fontSize: 10)),
          const SizedBox(height: 40),
          _dataCard("HELIOGRID OUTPUT", "${power.toStringAsFixed(1)}%", Icons.solar_power, Colors.greenAccent),
          const SizedBox(height: 16),
          _dataCard("BASIN DEPTH", "${water.toStringAsFixed(2)} FT", Icons.water, Colors.blueAccent),
          const SizedBox(height: 16),
          _dataCard("NETWORK STATUS", "ENCRYPTED", Icons.security, const Color(0xFFB87333)),
        ],
      ),
    );
  }

  Widget _dataCard(String title, String val, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1)),
              Text(val, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

class SiteMapGIS extends StatelessWidget {
  const SiteMapGIS({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("GIS STRATEGIC OVERLAY\n34.3323° N | 96.5056° W", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333), letterSpacing: 2)));
  }
}

class SocialClubPortal extends StatelessWidget {
  const SocialClubPortal({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("HVF SOCIAL CLUB\nREGISTRY ACTIVE", textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFB87333))));
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
        children: [
          const Text("FOUNDER & CEO", style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 4)),
          const Text("JEFFERY D. HUMPHREY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFB87333))),
          const SizedBox(height: 30),
          const Divider(color: Colors.white10),
          const SizedBox(height: 30),
          const Text("FEDERAL CREDENTIALS", style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 2)),
          const SizedBox(height: 10),
          const Text("CAGE: 1AHA8", style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const Text("UEI: S1M4ENLHTDH5", style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 40),
          const Text("HUMPHREY VIRTUAL FARMS LLC", style: TextStyle(fontSize: 10, color: Colors.white24)),
        ],
      ),
    );
  }
}
