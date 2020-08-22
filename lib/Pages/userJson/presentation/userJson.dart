import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/userJson/model/user.dart';

class UserJson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new UserJsonState();
}

class UserJsonState extends State {
  List<User> _users = [];
  String _tmpName = "";
  String _tmpEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('UserJson ')),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'your name',
                labelText: 'Name *',
              ),
              onChanged: (String value) {
                _tmpName = value;
              },
              validator: (String value) {
                print('$value');
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'your email?',
                labelText: 'Email *',
              ),
              onChanged: (String value) {
                _tmpEmail = value;
              },
              validator: (String value) {
                return value.contains('@') ? null : 'invalid email format.';
              },
            ),
            GestureDetector(
              onTap: () {
                String u1Str = '{"name": "$_tmpName", "email": "$_tmpEmail"}';
                User u1 = User.fromJson(jsonDecode(u1Str));
                print(u1Str);
                setState(() {
                  _users.add(u1);
                });
              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text('go'),
                ),
              ),
            ),
            ..._users
                .map((e) => Container(
                    child: Center(child: Text("${e.email}, ${e.name}"))))
                .toList(),
            Container(
              child: Center(
                child: Text('$_users'),
              ),
            )
          ],
        ));
  }
}
