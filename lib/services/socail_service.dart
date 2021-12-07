import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:lovebird/models/bio_model.dart';

class SocailSerive {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(ApiPath.statusCollectionRef);
  CollectionReference bioCollectionReference =
      FirebaseFirestore.instance.collection(ApiPath.bioCollectionRef);
  getPendding(String uuid) async {
    var ref =
        collectionReference.doc(uuid).collection(ApiPath.pendingCollectionRef);
    var query = await ref.get();
    var queryData = query.docs.map((e) {
      // if (e.exists) {
      return Bio.fromJson(e.data());
      // }
    }).toList();
  }

  pendingRequest(String myUUID, String otherUUID, String penddingTo) async {
    // Add to my watch pending

    var myRef = collectionReference
        .doc(myUUID)
        .collection(ApiPath.watchPendingRequestCollectionRef)
        .doc(otherUUID);
    var otherRef = collectionReference
        .doc(otherUUID)
        .collection(ApiPath.pendingCollectionRef)
        .doc(myUUID);

    var otherBioRef = bioCollectionReference.doc(otherUUID);
    var myBioRef = bioCollectionReference.doc(myUUID);
    await myRef.set({
      "other_ref": otherRef,
      "isAccepted": false,
      "other_bio_ref": otherBioRef.path
    });
    await otherRef.set({
      "other_ref": myRef.path,
      "isAccepted": false,
      "other_bio_ref": myBioRef
    });
  }

  acceptRequest(String myUUID, String otherUUID) async {
    var myRef = collectionReference
        .doc(myUUID)
        .collection(ApiPath.pendingCollectionRef)
        .doc(otherUUID);
    var myPendingData = await myRef.get();
    var otherPath = myPendingData.get("other_ref") as String;

    var otherPathRef = collectionReference.doc(otherPath);
    await otherPathRef.update({"isAccepted": true});
    await myRef.update({"isAccepted": true});

    // myPendingData = myPendingData.
  }
}
