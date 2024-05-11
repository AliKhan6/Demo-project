import 'package:flutter/material.dart';

class Onboarding {
  String? imgUrl;
  String? title;
  String? body;

  Onboarding({this.imgUrl, this.title, this.body});

  Onboarding.fromJson(json) {
    debugPrint('$json');
    this.title = json["title"];
    this.imgUrl = json['image_url'];
    this.body = json["body"];
  }
}
