import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class Bio {
  int? sex;
  String? avatar;
  String? background;
  String? nickName;
  List<String>? hobbies;
  String? name;
  String? address;
  List<String>? socialUrl;
  GeoFirePoint? geoFirePoint;

  Bio(
      {required this.sex,
      required this.avatar,
      required this.background,
      required this.nickName,
      required this.hobbies,
      required this.name,
      required this.address,
      required this.socialUrl,
      this.geoFirePoint});

  Bio.fromJson(Map<String, dynamic> json) {
    // sex = json['sex'];
    // avatar = json['avatar'];
    // background = json['background'];
    // nickName = json['nickName'];
    // hobbies = json['hobbies'] ?? json['hobbies'].cast<String>();
    // name = json['name'];
    // address = json['address'];
    // socialUrl = json['social_url'].cast<String>();
    geoFirePoint = GeoFirePoint(json['position']['geopoint'].latitude,
        json['position']['geopoint'].longitude);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sex'] = sex;
    data['avatar'] = avatar;
    data['background'] = background;
    data['nickName'] = nickName;
    data['hobbies'] = hobbies;
    data['name'] = name;
    data['address'] = address;
    data['social_url'] = socialUrl;
    data['position'] = geoFirePoint!.data;
    return data;
  }
}
