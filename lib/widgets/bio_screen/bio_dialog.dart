import 'package:lovebird/models/bio_model.dart';
import 'package:flutter/material.dart';
import 'package:lovebird/pages/bio/bio_info_screen.dart';

Future<bool> showBioInfoDialog(Bio bio, BuildContext context) async {
  await showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: BioInfoScreen(bio: bio));
      });
  return true;
}

Future<bool> showBioInfoDenail(BuildContext context) async {
  var mediaQuery = MediaQuery.of(context).size;

  await showDialog(
      barrierColor: Colors.black54,
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                width: mediaQuery.width * 0.56,
                height: mediaQuery.height * 0.15,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Chưa đồng ý ai cho coi info :>".toUpperCase(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Đợi chờ là hạnh phúc...."),
                  ],
                ))));
      });
  return true;
}
