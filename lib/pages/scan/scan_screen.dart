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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tiffany,
        centerTitle: true,
        title: Text(
          "Tìm kiếm tình yêu",
        ),
      ),
      body: Center(
        child: Image.network(
            "https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif"),
      ),
    );
  }
}
