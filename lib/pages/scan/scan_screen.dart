import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:lovebird/blocs/scan/bloc/scan_bloc.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/ultis/helper.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ScanBloc>().add(ScanStartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tiffany,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              "Tìm kiếm tình yêu",
              textAlign: TextAlign.center,
            ),
            IconButton(
              onPressed: () => {context.read<ScanBloc>().add(ScanStartEvent())},
              icon: const Icon(Icons.replay_rounded),
              color: Colors.white,
              iconSize: mediaQuery.width * 0.1,
            ),
          ],
        ),
      ),
      body: BlocConsumer<ScanBloc, ScanState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ScanResult) {
            Size mediaQuery = MediaQuery.of(context).size;
            return ListView(
              children: state.scanResult
                  .map((e) => Padding(
                            padding: EdgeInsets.all(mediaQuery.width * 0.05),
                            child: Container(
                              height: mediaQuery.width * 0.3,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: mediaQuery.width * 0.04,
                                      ),
                                      Container(
                                        width: mediaQuery.width * 0.15,
                                        height: mediaQuery.width * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: AppColors.primaryColor,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                e.avatar!.toString()
                                                // 'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                                                ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: mediaQuery.width * 0.05,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            Helper.customName(
                                                e.name!.toString()),
                                            style: TextStyle(
                                              fontSize: mediaQuery.width * 0.05,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            e.address!.toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.width * 0.045,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            e.geoFirePoint!.latitude.toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    mediaQuery.width * 0.045,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: mediaQuery.width * 0.04,
                                    ),
                                    child: LikeButton(
                                      size: mediaQuery.width * 0.1,
                                      isLiked: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                      // Text(e.geoFirePoint!.latitude.toString())
                      )
                  .toList(),
            );
          }

          //   child: Image.network(
          // "https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif%22)",
          return Stack(children: [
            Center(
                child: Image.network(
                    "https://media.giphy.com/media/3oriNO0p3Sn0itamg8/giphy.gif"))
          ]);
        },
      ),
    );
  }
}
