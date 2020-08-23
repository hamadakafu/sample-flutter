import 'dart:convert';

import 'package:test/test.dart';
import 'package:flutter_app/Pages/userJson/model/user.dart';

void main() {
  var userJsonString;
  setUp(() {
    userJsonString = [
      '{"hoge": "hogename", "email": "hgoe.email.com"}',
    ];
  });
  group("descriptionhgoe", () {
    test("descriptionhoge", () {
      var umap = jsonDecode(userJsonString[0]);
      User.fromJson(umap);
    });
  });
}
