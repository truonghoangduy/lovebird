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
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: GridView.count(
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
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
          BuildCard(
            name: 'Hùng',
            dob: '5-7-1999',
            status: 'Active',
            cardIndex: 2,
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
          BuildCard(
            name: 'Hùng Nguyễn',
            dob: '5-7-1999',
            status: 'Away',
            cardIndex: 3,
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
          BuildCard(
            name: 'Hùng',
            dob: '5-7-1999',
            status: 'Active',
            cardIndex: 4,
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
          BuildCard(
            name: 'Hùng Nguyễn',
            dob: '5-7-1999',
            status: 'Away',
            cardIndex: 5,
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
          BuildCard(
            name: 'Hùng',
            dob: '5-7-1999',
            status: 'Active',
            cardIndex: 6,
            imageUrl:
                'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
          ),
        ],
      ),
    );
  }
}
