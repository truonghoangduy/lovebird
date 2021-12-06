import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lovebird/constant/api_constant.dart';

import 'package:lovebird/models/bio_model.dart';

abstract class IBioSerives {
  Future<void> update(Bio bio, String uuid);
}

class BioServices implements IBioSerives {
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
}
