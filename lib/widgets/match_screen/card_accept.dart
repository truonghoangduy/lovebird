import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';

class CardAccept extends StatelessWidget {
  const CardAccept({Key? key}) : super(key: key);

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
            Container(
              width: mediaQuery.width * 0.2,
              height: mediaQuery.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: AppColors.primaryColor,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
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
                  'Hùng Nguyễn, 22',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.055,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'HoChiMinh, 1km',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
