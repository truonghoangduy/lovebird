import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/pages/bio/bio_screen.dart';
import 'package:lovebird/pages/match/match_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 40, color: Colors.white),
      const Icon(Icons.favorite, size: 40, color: Colors.white),
      const Icon(Icons.person, size: 40, color: Colors.white),
    ];
    return Container(
      child: Scaffold(
        backgroundColor: Colors.red,
      ),
    );
  }
}
