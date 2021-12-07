import 'package:flutter/material.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/pages/bio/custom_circle_avatar.dart';
import 'package:lovebird/widgets/bio_screen/text_devider.dart';
import 'custom_circle_avatar.dart';

class BioEditScreen extends StatefulWidget {
  const BioEditScreen({Key? key}) : super(key: key);

  @override
  _BioEditScreenState createState() => _BioEditScreenState();
}

class _BioEditScreenState extends State<BioEditScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back),
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        backgroundColor: Colors.blueGrey[50],
        body: SizedBox(
          width: mediaQuery.width,
          height: mediaQuery.height,
          child: Stack(
            children: [
              Container(
                height: mediaQuery.height * 0.2,
                width: mediaQuery.width * 2,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Positioned(
                  left: 0, right: 0, top: 40, child: CustomCircleAvatar()),
              SizedBox(
                height: mediaQuery.height * 0.68,
                child: Center(
                  child: Text(
                    'Love Bird, 24',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: mediaQuery.width * 0.08),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 300, 20, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuery.width * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_pin, size: 30),
                        SizedBox(
                          width: mediaQuery.width * 0.02,
                        ),
                        Text(
                          'Đang ở',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: mediaQuery.width * 0.06),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.date_range, size: 30),
                        SizedBox(
                          width: mediaQuery.width * 0.02,
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: mediaQuery.width * 0.06),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.02,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.wc, size: 30),
                        SizedBox(
                          width: mediaQuery.width * 0.02,
                        ),
                        Text(
                          'Giới tính:',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: mediaQuery.width * 0.06),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.02,
                    ),
                    Center(
                      child: TextDivider(
                        textDivider: "Your Bio",
                        color: AppColors.tiffany,
                        sizeTextDivider: mediaQuery.width * 0.04,
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.02,
                    ),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: mediaQuery.width * 0.14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            // spreadRadius: -21,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * 0.1,
                                height: mediaQuery.width * 0.1,
                                child: Image.asset("assets/img/facebook.png"),
                              ),
                              Text(
                                'Link FaceBook',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: mediaQuery.width * 0.05),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.01,
                    ),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: mediaQuery.width * 0.14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            // spreadRadius: -21,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * 0.1,
                                height: mediaQuery.width * 0.1,
                                child: Image.asset("assets/img/instagram.png"),
                              ),
                              Text(
                                'Link instagram',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: mediaQuery.width * 0.05),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.01,
                    ),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: mediaQuery.width * 0.14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            // spreadRadius: -21,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * 0.1,
                                height: mediaQuery.width * 0.1,
                                child: Image.asset("assets/img/twitter.png"),
                              ),
                              Text(
                                'Link instagram',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: mediaQuery.width * 0.05),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.width * 0.01,
                    ),
                    Container(
                      width: mediaQuery.width * 0.8,
                      height: mediaQuery.width * 0.14,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            // spreadRadius: -21,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * 0.1,
                                height: mediaQuery.width * 0.1,
                                child: Image.asset("assets/img/world.png"),
                              ),
                              Text(
                                'Link instagram',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: mediaQuery.width * 0.05),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
