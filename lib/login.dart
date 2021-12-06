import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lovebird/config/styles/color.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: AppColors.primaryColor,
        // ),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                "assets/img/svg/bg1_login.svg",
                fit: BoxFit.cover,
                width: mediaQuery.width,
                height: mediaQuery.height * 0.75,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: mediaQuery.width * 0.45),
              child: Center(
                child: Container(
                  width: mediaQuery.width * 0.9,
                  height: mediaQuery.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        // spreadRadius: -21,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/img/lovebird.png",
                      ),
                      Container(
                        width: mediaQuery.width * 0.8,
                        height: mediaQuery.width * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
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
                                Container(
                                  width: mediaQuery.width * 0.1,
                                  height: mediaQuery.width * 0.1,
                                  child:
                                      Image.asset("assets/img/google_logo.png"),
                                ),
                                Text(
                                  'Login With Google',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
