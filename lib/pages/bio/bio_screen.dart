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

class BioScreen extends StatefulWidget {
  const BioScreen({Key? key}) : super(key: key);

  @override
  _BioScreenState createState() => _BioScreenState();
}

class _BioScreenState extends State<BioScreen> {
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);
    var user = (authBloc.state as AuthenticationSuccess).authenticationDetail;
    Size mediaQuery = MediaQuery.of(context).size;
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection(ApiPath.bioCollectionRef)
                  .doc(user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(
                      color: Colors.blueAccent);
                }
                var data = snapshot.data!.data();
                var bio = Bio.fromJson(data!);

                return SizedBox(
                  width: mediaQuery.width,
                  height: mediaQuery.height,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Stack(
                      children: [
                        Container(
                          height: mediaQuery.height * 0.2,
                          width: mediaQuery.width * 2,
                          decoration: const BoxDecoration(
                            color: AppColors.tiffany,
                            // borderRadius: BorderRadius.only(
                            //   bottomLeft: Radius.circular(80),
                            //   bottomRight: Radius.circular(80),
                            // ),
                          ),
                        ),
                        Positioned(
                            left: 0,
                            right: 0,
                            top: 40,
                            child: CustomCircleAvatar(
                              avatarURL: bio.avatar!,
                            )),
                        SizedBox(
                          height: mediaQuery.height * 0.68,
                          child: Center(
                            child: Text(
                              bio.name! + '24',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                  fontSize: mediaQuery.width * 0.08),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(AuthenticationLogout());

                                  // missing logout navitong
                                },
                                icon: Icon(Icons.logout, size: 30)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(320, 180, 4, 80),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.tiffany, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () async {
                              var aaaa = await Navigator.of(context).pushNamed(
                                  AppRouting.bioeditRoute,
                                  arguments: bio);
                              print(aaaa);
                            },
                            child: const Icon(Icons.edit, size: 30),
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
                                    'Đang ở TP.Hồ Chí Minh',
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
                                    '24/12/1999',
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
                                    'Giới tính: Nam',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: mediaQuery.width * 0.1,
                                          height: mediaQuery.width * 0.1,
                                          child: Image.asset(
                                              "assets/img/facebook.png"),
                                        ),
                                        Text(
                                          'Link FaceBook',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize:
                                                  mediaQuery.width * 0.05),
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
                                          child: Image.asset(
                                              "assets/img/instagram.png"),
                                        ),
                                        Text(
                                          'Link instagram',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize:
                                                  mediaQuery.width * 0.05),
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
                                          child: Image.asset(
                                              "assets/img/twitter.png"),
                                        ),
                                        Text(
                                          'Link instagram',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize:
                                                  mediaQuery.width * 0.05),
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
                                          child: Image.asset(
                                              "assets/img/world.png"),
                                        ),
                                        Text(
                                          'Link instagram',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize:
                                                  mediaQuery.width * 0.05),
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
                );
              }),
        ));
  }
}
