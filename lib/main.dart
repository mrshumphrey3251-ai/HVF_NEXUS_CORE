import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
      children: [
        Center(
          child: Text(
            "HVF NEXUS: LIVE",
            style: TextStyle(color: Colors.blueAccent.withOpacity(0.5), fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Container(
            width: 15, height: 15,
            decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          ),
        ),
      ],
    ),
  ),
));
