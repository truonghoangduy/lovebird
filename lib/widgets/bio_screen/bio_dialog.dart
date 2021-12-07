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
