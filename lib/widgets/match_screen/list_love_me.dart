import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/widgets/match_screen/card_accept.dart';

class ListLoveMe extends StatelessWidget {
  ListLoveMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: ListView(
        children: [
          CardAccept(),
          CardAccept(),
          CardAccept(),
          CardAccept(),
          CardAccept(),
          CardAccept(),
          CardAccept(),
          CardAccept(),
        ],
      ),
    );
  }
}
