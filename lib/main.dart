import 'package:flutter/material.dart';

void main() => runApp(const HVFNexus());

class HVFNexus extends StatelessWidget {
  const HVFNexus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  void _showCreed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text("THE HUMPHREY CREED", 
          style: TextStyle(color: Colors.blueAccent, letterSpacing: 2, fontWeight: FontWeight.bold)),
        content: const SingleChildScrollView(
          child: Text(
            "To lead with honor, to build with purpose, and to provide stewardship for the land and those who served. Through Humphrey Virtual Farms, we bridge the legacy of our ancestors with the technology of the future—securing sovereignty for our veterans and a foundation for the next generation.",
            style: TextStyle(color: Colors.white, fontSize: 15, height: 1.5, fontStyle: FontStyle.italic),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("UNDERSTOOD"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text("HVF NEXUS: COMMAND", style: TextStyle(fontSize: 18, letterSpacing: 2)), // Scaled down
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Increased padding to shrink elements 5%
        child: Column(
          children: [
            _buildStatusCard("HELIOGRID SYSTEM", "98% POWER", Colors.greenAccent),
            const SizedBox(height: 12),
            _buildStatusCard("BASIN HYDROLOGY", "24.2 FT", Colors.blueAccent),
            const SizedBox(height: 12),
            _buildStatusCard("SITE PERIMETER", "SECURE", Colors.orangeAccent),
            const Spacer(),
            // COMMAND BUTTON: THE HUMPHREY CREED
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, 
                minimumSize: const Size(double.infinity, 55), // Slimmer button
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
              onPressed: () => _showCreed(context), 
              child: const Text("OPEN SITE MAP & CREED", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(18), // Scaled down from 20
      decoration: BoxDecoration(
        color: Colors.white10, 
        borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: color.withOpacity(0.4))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70, fontSize: 13)), // Scaled down
          Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)), // Scaled down
        ],
      ),
    );
  }
}
