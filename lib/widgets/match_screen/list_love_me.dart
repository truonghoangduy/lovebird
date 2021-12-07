import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/config/styles/color.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/socail_service.dart';
import 'package:lovebird/widgets/match_screen/card_accept.dart';

class ListLoveMeViewModel {
  final bool isAccept;
  final Bio otherBio;

  ListLoveMeViewModel(this.isAccept, this.otherBio);
}

class ListLoveMe extends StatelessWidget {
  final socailSerive = SocailSerive();
  ListLoveMe({Key? key}) : super(key: key);

  Future<List<ListLoveMeViewModel>> _praseViewModel(
      QuerySnapshot<Map<String, dynamic>> snapshot) async {
    List<ListLoveMeViewModel> viewModel = [];
    for (var item in snapshot.docs) {
      var itemData = item.data();
      var query =
          await FirebaseFirestore.instance.doc(itemData["other_bio_ref"]).get();
      var data = query.data();
      viewModel.add(
          ListLoveMeViewModel(item["isAccepted"] as bool, Bio.fromJson(data!)));
    }
    return viewModel;
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    final user = (BlocProvider.of<AuthenticationBloc>(context).state
            as AuthenticationSuccess)
        .authenticationDetail;
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: socailSerive.watchMyPendingListRequest(user.uid!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Chưa có ai thích bạn luôn \?/"),
              );
            }

            return FutureBuilder<List<ListLoveMeViewModel>>(
                future: _praseViewModel(snapshot.data!),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView(
                    children: [
                      ...snapshot.data!.map((e) => CardAccept(
                          bio: e.otherBio,
                          isAccept: e.isAccept,
                          myUUID: user.uid!))
                    ],
                  );
                });
          }),
    );
  }
}
