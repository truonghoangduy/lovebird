import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/socail_service.dart';
import 'package:lovebird/widgets/match_screen/build_card.dart';

class ListYouLoveViewModel {
  final bool isAccept;
  final Bio otherBio;

  ListYouLoveViewModel(this.isAccept, this.otherBio);
}

class ListYouLove extends StatefulWidget {
  ListYouLove({Key? key}) : super(key: key);

  @override
  _ListYouLoveState createState() => _ListYouLoveState();
}

class _ListYouLoveState extends State<ListYouLove> {
  Future<List<ListYouLoveViewModel>> _praseViewModel(
      QuerySnapshot<Map<String, dynamic>> snapshot) async {
    List<ListYouLoveViewModel> viewModel = [];
    for (var item in snapshot.docs) {
      var itemData = item.data();
      var query =
          await FirebaseFirestore.instance.doc(itemData["other_bio_ref"]).get();
      var data = query.data();
      viewModel.add(ListYouLoveViewModel(
          item["isAccepted"] as bool, Bio.fromJson(data!)));
    }
    return viewModel;
  }

  final socailSerive = SocailSerive();
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final user = (BlocProvider.of<AuthenticationBloc>(context).state
            as AuthenticationSuccess)
        .authenticationDetail;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: socailSerive.watchPendingRequest(user.uid!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("Bạn lovebird ai điii"));
            }
            return FutureBuilder<List<ListYouLoveViewModel>>(
                future: _praseViewModel(snapshot.data!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return GridView.count(
                    crossAxisCount: 2,
                    //crossAxisSpacing: 0.5,
                    //mainAxisSpacing: 6.0,
                    childAspectRatio: 0.8,
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      ...snapshot.data!.map((e) {
                        var status = e.isAccept ? "Active" : "Away";
                        return BuildCard(
                          bio: e.otherBio,
                          status: status,
                          cardIndex: 0,
                          dob: '----',
                          imageUrl: e.otherBio.avatar!,
                          name: e.otherBio.name!,
                        );
                      }).toList()
                      // ...watchPendingBio.map((e) {
                      //   var status =
                      //   return BuildCard(status: , cardIndex: 0, dob: '', imageUrl: '', name: '',)})
                      // BuildCard(
                      //   name: 'Hùng Nguyễn',
                      //   dob: '5-7-1999',
                      //   status: 'Away',
                      //   cardIndex: 1,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                      // BuildCard(
                      //   name: 'Hùng',
                      //   dob: '5-7-1999',
                      //   status: 'Active',
                      //   cardIndex: 2,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                      // BuildCard(
                      //   name: 'Hùng Nguyễn',
                      //   dob: '5-7-1999',
                      //   status: 'Away',
                      //   cardIndex: 3,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                      // BuildCard(
                      //   name: 'Hùng',
                      //   dob: '5-7-1999',
                      //   status: 'Active',
                      //   cardIndex: 4,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                      // BuildCard(
                      //   name: 'Hùng Nguyễn',
                      //   dob: '5-7-1999',
                      //   status: 'Away',
                      //   cardIndex: 5,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                      // BuildCard(
                      //   name: 'Hùng',
                      //   dob: '5-7-1999',
                      //   status: 'Active',
                      //   cardIndex: 6,
                      //   imageUrl:
                      //       'https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A',
                      // ),
                    ],
                  );
                });
          }),
    );
  }
}
