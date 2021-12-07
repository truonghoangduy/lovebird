import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/pages/bio/bio_screen.dart';
import 'package:lovebird/pages/match/match_screen.dart';
import 'package:lovebird/pages/scan/scan_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 2;
  final screens = [
    const ScanScreen(),
    const MatchScreen(),
    const BioScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(Icons.home, size: 40, color: Colors.white),
      const Icon(Icons.favorite, size: 40, color: Colors.white),
      const Icon(Icons.person, size: 40, color: Colors.white),
    ];
    return Scaffold(
      backgroundColor: Colors.red,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: index,
        items: items,
        backgroundColor: Colors.transparent,
        color: AppColors.tiffany,
        buttonBackgroundColor: AppColors.tiffany,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
