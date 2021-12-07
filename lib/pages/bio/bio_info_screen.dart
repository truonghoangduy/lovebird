import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/config/routes/routing.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/pages/bio/custom_circle_avatar.dart';
import 'package:lovebird/services/auth/models/authentication_detail.dart';
import 'package:lovebird/widgets/bio_screen/text_devider.dart';
import 'custom_circle_avatar.dart';

class BioInfoScreen extends StatefulWidget {
  final Bio bio;
  const BioInfoScreen({Key? key, required this.bio}) : super(key: key);

  @override
  _BioInfoScreenState createState() => _BioInfoScreenState();
}

class _BioInfoScreenState extends State<BioInfoScreen> {
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);
    var user = (authBloc.state as AuthenticationSuccess).authenticationDetail;
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
            body: SizedBox(
          width: mediaQuery.width * 0.85,
          height: mediaQuery.height * 0.9,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: mediaQuery.height * 0.2,
                    width: mediaQuery.width * 2,
                    decoration: const BoxDecoration(
                      color: AppColors.tiffany,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 40,
                      child: CustomCircleAvatar(
                        avatarURL: widget.bio.avatar!,
                      )),
                  SizedBox(
                    height: mediaQuery.height * 0.68,
                    child: Center(
                      child: Text(
                        widget.bio.name! + '24',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            fontSize: mediaQuery.width * 0.04),
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
                              widget.bio.address ?? 'Đang ở TP.Hồ Chí Minh',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: mediaQuery.width * 0.04),
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
                              '----',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: mediaQuery.width * 0.04),
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
                              'Giới tính: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: mediaQuery.width * 0.04),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: mediaQuery.width * 0.1,
                                    height: mediaQuery.width * 0.1,
                                    child:
                                        Image.asset("assets/img/facebook.png"),
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
                          height: mediaQuery.width * 0.05,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: mediaQuery.width * 0.1,
                                    height: mediaQuery.width * 0.1,
                                    child:
                                        Image.asset("assets/img/instagram.png"),
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
                          height: mediaQuery.width * 0.03,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: mediaQuery.width * 0.1,
                                    height: mediaQuery.width * 0.1,
                                    child:
                                        Image.asset("assets/img/twitter.png"),
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
                          height: mediaQuery.width * 0.03,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
        )));
  }
}
