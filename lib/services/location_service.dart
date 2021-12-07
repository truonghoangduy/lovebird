import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:lovebird/models/bio_model.dart';

// Init firestore and geoFlutterFire

class LocationSerivces {
  Location _location = Location();

  final geo = Geoflutterfire();
  final _firestore = FirebaseFirestore.instance;

  _isPermission() async {
    if (await _location.hasPermission() == PermissionStatus.granted) {
      return true;
    }
    while (await _location.hasPermission() != PermissionStatus.granted) {
      await _location.requestPermission();
    }
    return true;
  }

  Future<LocationData> getUserGeoPoint() async {
    await _isPermission();
    return await _location.getLocation();
  }

  Future<List<Bio>> queryNearGeoPoint(LocationData mylocation,
      {double radiusRange = 30}) async {
    var myGeo = geo.point(
        latitude: mylocation.latitude!, longitude: mylocation.latitude!);
    var bioRef = _firestore.collection(ApiPath.bioCollectionRef);
    var query = await geo
        .collection(collectionRef: bioRef)
        .within(center: myGeo, radius: radiusRange, field: "position")
        .first;
    var data = query.map((e) {
      if (e.exists) {
        return e.data();
      }
    }).toList();
    return data.map((e) => Bio.fromJson(e as Map<String, dynamic>)).toList();
  }
}
