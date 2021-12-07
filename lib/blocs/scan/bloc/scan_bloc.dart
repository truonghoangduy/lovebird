import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:lovebird/blocs/authentication/authentication_bloc.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/auth/models/authentication_detail.dart';
import 'package:lovebird/services/bio_service.dart';
import 'package:lovebird/services/location_service.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final locationSerivces = LocationSerivces();
  final bioSerivce = BioServices();
  final AuthenticationBloc authenticationBloc;
  late AuthenticationDetail user;
  ScanBloc({required this.authenticationBloc}) : super(ScanInitial()) {
    // on<ScanEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    _generateFakeBio();

    authenticationBloc.stream
        .where((state) => state is AuthenticationSuccess)
        .listen((event) {
      user = (event as AuthenticationSuccess).authenticationDetail;
      on<ScanStartEvent>(_handleScanStartEvent);
    });
  }

  FutureOr<void> _handleScanStartEvent(
      ScanStartEvent event, Emitter<ScanState> emit) async {
    try {
      emit(ScanLoading());
      var myLocation = await locationSerivces.getUserGeoPoint();
      await bioSerivce.updateBioGeo(myLocation, user.uid!);
      var queryData =
          await locationSerivces.queryNearGeoPoint(myLocation, user.uid!);
      await Future.delayed(Duration(seconds: 5));
      // queryData =
      //     queryData.where((element) => element.uuid != user.uid).toList();
      emit(ScanResult(queryData + fakeData));
    } catch (e) {
      // user denial gps location
      emit(ScanFail(e.toString()));
    }
  }

  _generateFakeBio() {
    for (var i = 0; i < 5; i++) {
      fakeData.add(Bio(
          uuid: "xxx",
          sex: 0,
          avatar:
              "https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-1/p320x320/249233916_3070314433217063_7410007586773100947_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=7206a8&_nc_ohc=m0OrDFFbgtIAX-7C2jy&_nc_ht=scontent.fsgn2-4.fna&oh=cc2bb385bc4899d196e53a56814593e6&oe=61B37D7A",
          background: "background",
          nickName: "nickName" + i.toString(),
          hobbies: ["hobbies"],
          name: "Fake" + i.toString(),
          address: "address",
          geoFirePoint: GeoFirePoint(1222, 233),
          socialUrl: ["socialUrl"]));
    }
  }

  List<Bio> fakeData = [];
}
