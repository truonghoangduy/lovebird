import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({Key? key}) : super(key: key);

  @override
  _CustomCircleAvatarState createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return CustomPositionAvatar(
      mediaQuery: mediaQuery * 2,
      // avt:
    );
  }
}

class CustomPositionAvatar extends StatelessWidget {
  const CustomPositionAvatar({
    Key? key,
    required this.mediaQuery,
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
      child: const CircleAvatar(
          backgroundColor: Colors.red, foregroundColor: Colors.red
          // backgroundImage: NetworkImage(
          //   avt,
          // ),
          ),
    );
  }
}
