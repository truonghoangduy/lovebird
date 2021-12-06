import 'package:flutter/material.dart';
import 'package:lovebird/pages/bio/custom_circle_avatar.dart';
import 'custom_circle_avatar.dart';

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SizedBox(
        width: mediaQuery.width,
        height: mediaQuery.height,
        child: Stack(
          children: [
            Container(
              height: mediaQuery.height * 0.25,
              width: mediaQuery.width * 2,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
            ),
            const Positioned(
                left: 0, right: 0, top: 80, child: CustomCircleAvatar()),
          ],
        ),
      ),
    );
  }
}
