import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  final String avatarURL;
  const CustomCircleAvatar({Key? key, required this.avatarURL})
      : super(key: key);

  @override
  _CustomCircleAvatarState createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return CustomPositionAvatar(
      avatarURL: widget.avatarURL,
      mediaQuery: mediaQuery * 2,
      // avt:
    );
  }
}

class CustomPositionAvatar extends StatelessWidget {
  final String avatarURL;

  const CustomPositionAvatar({
    Key? key,
    required this.mediaQuery,
    required this.avatarURL,
    // required this.avt,
  }) : super(key: key);
  // final String avt;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.width * 0.24,
      height: mediaQuery.width * 0.24,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: CircleAvatar(
          backgroundImage: NetworkImage(avatarURL),
          backgroundColor: Colors.cyanAccent,
          foregroundColor: Colors.white
          // backgroundImage: NetworkImage(
          //   avt,
          // ),
          ),
    );
  }
}
