import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:lovebird/constant/api_constant.dart';
import 'package:path/path.dart';

class BucketService {
  firebase_storage.FirebaseStorage firebaseStorage =
      firebase_storage.FirebaseStorage.instance;

  /// TODO test
  Future<String> uploadAvatar(File img, String uuid) async {
    String returnURL = "";
    firebase_storage.Reference ref =
        firebaseStorage.ref(ApiPath.avatarStorageReference);
    ref.child(uuid + basename(img.path));
    firebase_storage.UploadTask uploadTask = ref.putFile(img);
    // uploadTask.snaps
    print('File Uploaded');
    await ref.getDownloadURL().then((fileURL) {
      returnURL = fileURL;
    });
    return returnURL;
  }
}
