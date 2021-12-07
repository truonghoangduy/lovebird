import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/widgets/match_screen/list_love_me.dart';
import 'package:lovebird/widgets/match_screen/list_you_love.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            title: Text(
              "Danh sách yêu thích",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                //fontSize: mediaQuery.width * 0.055,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Tôi thích ai',
                  icon: Icon(Icons.favorite),
                ),
                Tab(
                  text: 'Ai thích tôi',
                  icon: Icon(Icons.thumb_up),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListYouLove(),
              ListLoveMe(),
            ],
          ),
        ),
      ),
    );
  }
}
