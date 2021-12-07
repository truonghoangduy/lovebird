import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/ultis/helper.dart';
import 'package:lovebird/widgets/bio_screen/bio_dialog.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    Key? key,
    required this.name,
    required this.dob,
    required this.status,
    required this.cardIndex,
    required this.imageUrl,
    required this.bio,
  }) : super(key: key);
  final String name;
  final String dob;
  final String status;
  final int cardIndex;
  final String imageUrl;
  final Bio bio;
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Padding(
        padding: EdgeInsets.only(top: mediaQuery.width * 0.02),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 7.0,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mediaQuery.width * 0.04),
              Material(
                child: InkWell(
                  onTap: () async => {
                    if (this.status == "Away")
                      {await showBioInfoDenail(context)}
                    else
                      {await showBioInfoDialog(bio, context)},
                  },
                  child: Container(
                    width: mediaQuery.width * 0.2,
                    height: mediaQuery.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.primaryColor,
                      image: DecorationImage(
                        image: NetworkImage(this.imageUrl),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: mediaQuery.width * 0.04),
              Text(
                Helper.customName(this.name),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mediaQuery.width * 0.055,
                ),
              ),
              SizedBox(height: mediaQuery.width * 0.01),
              Text(
                this.dob,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mediaQuery.width * 0.05,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: mediaQuery.width * 0.025),
              Expanded(
                child: Container(
                  width: mediaQuery.width,
                  decoration: BoxDecoration(
                    color: this.status == "Away"
                        ? Colors.grey
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: this.status == "Away"
                        ? Text(
                            'Đang đợi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mediaQuery.width * 0.045,
                            ),
                          )
                        : Text(
                            'Đã đồng ý',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: mediaQuery.width * 0.045,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
          margin: EdgeInsets.fromLTRB(12, 10, 12, 5),
        ),
      ),
    );
  }
}
