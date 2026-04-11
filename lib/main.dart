import 'package:flutter/material.dart';

void main() {
  runApp(const HVFNexusApp());
}

class HVFNexusApp extends StatelessWidget {
  const HVFNexusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HVF NEXUS',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueAccent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
      ),
      home: const NexusHome(),
    );
  }
}

class NexusHome extends StatelessWidget {
  const NexusHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "HVF NEXUS",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 12, height: 12,
              decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
            const SizedBox(height: 10),
            const Text("SYSTEM LIVE", style: TextStyle(color: Colors.white54, letterSpacing: 2)),
          ],
        ),
      ),
    );
  }
}
