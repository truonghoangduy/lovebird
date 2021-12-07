import 'package:flutter/material.dart';
import 'package:lovebird/widgets/match_screen/build_card.dart';

class ListYouLove extends StatefulWidget {
  ListYouLove({Key? key}) : super(key: key);

  @override
  _ListYouLoveState createState() => _ListYouLoveState();
}

class _ListYouLoveState extends State<ListYouLove> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return GridView.count(
      crossAxisCount: 2,
      //crossAxisSpacing: 0.5,
      //mainAxisSpacing: 6.0,
      childAspectRatio: 0.8,
      shrinkWrap: true,
      primary: false,
      children: [
        BuildCard(
          name: 'Hùng Nguyễn',
          dob: '5-7-1999',
          status: 'Away',
          cardIndex: 1,
        ),
        BuildCard(
          name: 'Hùng',
          dob: '5-7-1999',
          status: 'Active',
          cardIndex: 2,
        ),
        BuildCard(
          name: 'Hùng',
          dob: '5-7-1999',
          status: 'Active',
          cardIndex: 3,
        ),
        BuildCard(
          name: 'Hùng',
          dob: '5-7-1999',
          status: 'Away',
          cardIndex: 4,
        ),
        BuildCard(
          name: 'Hùng',
          dob: '5-7-1999',
          status: 'Active',
          cardIndex: 5,
        ),
        BuildCard(
          name: 'Hùng',
          dob: '5-7-1999',
          status: 'Away',
          cardIndex: 6,
        ),
      ],
    );
  }
}
