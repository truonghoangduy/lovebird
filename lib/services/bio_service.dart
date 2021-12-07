import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:lovebird/constant/api_constant.dart';

import 'package:lovebird/models/bio_model.dart';

abstract class IBioSerives {
  Future<void> update(Bio bio, String uuid);
  Future<void> get(String uuid);
}

class BioServices implements IBioSerives {
  final geo = Geoflutterfire();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(ApiPath.bioCollectionRef);

  //
  // bio - collection
  //    uuid (doc) -> uploaded data
  @override
  Future<void> update(Bio bio, String uuid) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> get(String uuid) {
    // TODO: implement get
    throw UnimplementedError();
  }

  Future<void> updateBioGeo(LocationData location, String uuid) async {
    var myGeo =
        geo.point(latitude: location.latitude!, longitude: location.latitude!);
    await collectionReference.doc(uuid).update({"position": myGeo.data});
  }
}
