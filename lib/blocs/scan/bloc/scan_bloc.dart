import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/location_service.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final locationSerivces = LocationSerivces();
  ScanBloc() : super(ScanInitial()) {
    on<ScanEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ScanStartEvent>(_handleScanStartEvent);
  }

  FutureOr<void> _handleScanStartEvent(
      ScanStartEvent event, Emitter<ScanState> emit) async {
    try {
      emit(ScanLoading());
      var myLocation = await locationSerivces.getUserGeoPoint();
      var queryData = await locationSerivces.queryNearGeoPoint(myLocation);
      await Future.delayed(Duration(seconds: 5));
      emit(ScanResult(queryData));
    } catch (e) {
      // user denial gps location
      emit(ScanFail(e.toString()));
    }
  }
}
