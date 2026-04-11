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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text("THE HUMPHREY CREED", 
          style: TextStyle(color: Colors.blueAccent, fontSize: 16, letterSpacing: 2, fontWeight: FontWeight.bold)),
        content: const SingleChildScrollView(
          child: Text(
            "To lead with honor, to build with purpose, and to provide stewardship for the land and those who served. Through Humphrey Virtual Farms, we bridge the legacy of our ancestors with the technology of the future—securing sovereignty for our veterans and a foundation for the next generation.",
            style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5, fontStyle: FontStyle.italic),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("CLOSE", style: TextStyle(color: Colors.blueAccent)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text("HVF NEXUS: COMMAND", style: TextStyle(fontSize: 16, letterSpacing: 2.5)), // Scaled down further
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0), // Deep margins (10% pull-in)
        child: Column(
          children: [
            _buildStatusCard("HELIOGRID SYSTEM", "98% POWER", Colors.greenAccent),
            const SizedBox(height: 10), // Tightened gap
            _buildStatusCard("BASIN HYDROLOGY", "24.2 FT", Colors.blueAccent),
            const SizedBox(height: 10), // Tightened gap
            _buildStatusCard("SITE PERIMETER", "SECURE", Colors.orangeAccent),
            const Spacer(),
            // COMMAND BUTTON
            SizedBox(
              width: double.infinity,
              height: 50, // More tactical, slimmer height
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)) // Harder, industrial edges
                ),
                onPressed: () => _showCreed(context), 
                child: const Text("OPEN SITE MAP & CREED", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14), // Tighter internal padding
      decoration: BoxDecoration(
        color: const Color(0xFF151515), // Slightly lighter for depth
        borderRadius: BorderRadius.circular(4), // Industrial sharp-round
        border: Border.all(color: color.withOpacity(0.3), width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 11, letterSpacing: 1)),
          Text(value, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
