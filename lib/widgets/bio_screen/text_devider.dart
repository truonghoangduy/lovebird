import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    Key? key,
    required this.textDivider,
    required this.color,
    required this.sizeTextDivider,
  }) : super(key: key);
  final String textDivider;
  final Color color;
  final double sizeTextDivider;
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: SizedBox(
        width: mediaQuery.width * 0.8,
        child: Row(
          children: <Widget>[
            buildDivider(),
            SizedBox(width: mediaQuery.width * 0.05),
            Text(
              textDivider,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: sizeTextDivider,
              ),
            ),
            SizedBox(width: mediaQuery.width * 0.05),
            buildDivider(),
          ],
        ),
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: color,
        thickness: 1.2,
      ),
    );
  }
}
