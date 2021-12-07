// ignore_for_file: sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/config/routes/routing.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/auth/models/enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is AuthenticationSuccess) {
            var user = state.authenticationDetail;
            var userRef = FirebaseFirestore.instance
                .collection(ApiPath.bioCollectionRef)
                .doc(user.uid);
            var queryResult = await userRef.get();
            if (!queryResult.exists) {
              userRef.set(Bio(
                  sex: 0,
                  avatar: user.photoUrl,
                  background: "background",
                  nickName: "nickName",
                  hobbies: [""],
                  name: user.name,
                  address: "address",
                  socialUrl: [""]).toJson());
            }
            Navigator.of(context).popAndPushNamed(AppRouting.mainRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: mediaQuery.width * 1.1,
                            child: Image.asset(
                              "assets/img/lovebird.png",
                            ),
                          ),
                          Container(
                            width: mediaQuery.width * 0.8,
                            height: mediaQuery.width * 0.18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                const BoxShadow(
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
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(AuthenticationLogin(
                                          LoginProvider.google));
                                  // Navigator.pushNamed(context, );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: mediaQuery.width * 0.1,
                                      height: mediaQuery.width * 0.1,
                                      child: Image.asset(
                                          "assets/img/google_logo.png"),
                                    ),
                                    Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: mediaQuery.width * 0.055,
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
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    "assets/img/svg/bg2_login_1.svg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
