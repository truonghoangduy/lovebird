import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:lovebird/models/bio_model.dart';
import 'package:lovebird/services/bio_service.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:lovebird/services/location_service.dart';
// import 'package:flutter/services.dart';
// import 'package:beacons_plugin/beacons_plugin.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with WidgetsBindingObserver {
  var locationSerivces = LocationSerivces();
  var bioServices = BioServices();

  Future<void> _putlocation() async {
    var myLocation = await locationSerivces.getUserGeoPoint();
    await bioServices.updateBioGeo(myLocation, "12345");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(onPressed: () async => {_putlocation()}),
          FutureBuilder<LocationData>(
              future: locationSerivces.getUserGeoPoint(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FutureBuilder<List<Bio>>(
                      future:
                          locationSerivces.queryNearGeoPoint(snapshot.data!),
                      builder: (builder, data) {
                        if (data.hasData) {
                          print(data.data);
                          return Column(
                            children: [
                              ...data.data!
                                  .map((e) =>
                                      Text(e.geoFirePoint!.latitude.toString()))
                                  .toList()
                            ],
                          );
                        }
                        return Container();
                      });
                }
                return Container();
              })
        ],
      ),
    );
  }
}
