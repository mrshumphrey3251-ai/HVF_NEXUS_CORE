// HVF_NEXUS_CORE - Sovereign Build v1.1
// CEO & SME: Jeffery Donnell Humphrey
// Logic: Unobstructed Theater Matrix / Dynamic Radar Refresh

import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(HVFNexusSovereign());

class HVFNexusSovereign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HVF Nexus',
      theme: ThemeData.dark(),
      home: TheaterMatrix(),
    );
  }
}

class TheaterMatrix extends StatefulWidget {
  @override
  _TheaterMatrixState createState() => _TheaterMatrixState();
}

class _TheaterMatrixState extends State<TheaterMatrix> {
  bool _hudVisible = false; // Ghost HUD state
  bool _isLooping = false;  // 30m History state
  String _radarLayer = "Reflectivity";
  int _refreshRate = 5; // Default 5 minutes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        // SME Directive: Single tap for HUD, Long-press for History Loop
        onTap: () => setState(() => _hudVisible = !_hudVisible),
        onLongPress: () => setState(() => _isLooping = !_isLooping),
        child: Stack(
          children: [
            // THEATER MATRIX: RADAR CONTENT (Backend integration point)
            Center(
              child: Text(
                _isLooping ? "HISTORY: 30M LOOP ACTIVE" : "LIVE RADAR: $_radarLayer",
                style: TextStyle(
                  color: Colors.blueAccent.withOpacity(0.4),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),

            // CEO ANCHOR: PERSISTENT BLUE DOT (Fixed at center for follow-me logic)
            Center(
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.blueAccent, blurRadius: 12, spreadRadius: 2)
                  ],
                ),
              ),
            ),

            // GHOST HUD: INFRASTRUCTURE TELEMETRY (Sector HVF-003)
            if (_hudVisible) Positioned(
              top: 60,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    _buildStatusRow("HELIOGRID", "2.48 MW", Colors.amber),
                    Divider(color: Colors.white10, height: 20),
                    _buildStatusRow("BASIN LEVEL", "14.5 FT", Colors.cyan),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusRow(String label, String value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}
