import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(HVFNexusSovereign());

class HVFNexusSovereign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool _hudVisible = false;
  bool _isLooping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => setState(() => _hudVisible = !_hudVisible), 
        onLongPress: () => setState(() => _isLooping = !_isLooping), 
        child: Stack(
          children: [
            Center(
              child: Text(
                _isLooping ? "HISTORY: 30M LOOP" : "LIVE RADAR: REFLECTIVITY",
                style: TextStyle(color: Colors.blueAccent.withOpacity(0.4), fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                width: 14, height: 14,
                decoration: BoxDecoration(
                  color: Colors.blue, 
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.blueAccent, blurRadius: 12)],
                ),
              ),
            ),
            if (_hudVisible) Positioned(
              top: 60, left: 20, right: 20,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white10)),
                child: Column(
                  children: [
                    Text("HELIOGRID: 2.48 MW", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    Divider(color: Colors.white24),
                    Text("BASIN: 14.5 FT", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
