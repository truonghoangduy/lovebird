import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/socail_service.dart';
import 'package:lovebird/widgets/bio_screen/bio_dialog.dart';

class CardAccept extends StatelessWidget {
  final Bio bio;
  final bool isAccept;
  final String myUUID;
  CardAccept(
      {Key? key,
      required this.bio,
      required this.isAccept,
      required this.myUUID})
      : super(key: key);
  final socailSerive = SocailSerive();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(mediaQuery.width * 0.05),
      child: Container(
        height: mediaQuery.width * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              // spreadRadius: -21,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: mediaQuery.width * 0.04,
            ),
            Material(
              child: InkWell(
                onTap: () async => {await showBioInfoDialog(bio, context)},
                child: Container(
                  width: mediaQuery.width * 0.2,
                  height: mediaQuery.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: AppColors.primaryColor,
                    image: DecorationImage(
                      image: NetworkImage(
                        bio.avatar!,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: mediaQuery.width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bio.name!,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.055,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  bio.address ?? "",
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                !isAccept
                    ? Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                socailSerive.acceptRequest(myUUID, bio.uuid!);
                              },
                              child: Container(
                                height: mediaQuery.width * 0.11,
                                width: mediaQuery.width * 0.25,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      // spreadRadius: -21,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Chấp nhận',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: mediaQuery.width * 0.04),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: mediaQuery.width * 0.04),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                height: mediaQuery.width * 0.11,
                                width: mediaQuery.width * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      // spreadRadius: -21,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Bỏ qua',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: mediaQuery.width * 0.04),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        child: Text("Thích rồi thì vô xem bio kìa"),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
