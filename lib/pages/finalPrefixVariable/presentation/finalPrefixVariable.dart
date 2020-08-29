import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/finalPrefixVariable/model/user.dart';

class FinalPrefixVariable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FinalPrefixVariableState();
}

/// finalは再代入ができなくなるが更新が不可能になるわけではない
/// final const staticの違い
/// https://news.dartlang.org/2012/06/const-static-final-oh-my.html
/// final: single assignment
/// static: instanceではなくclassからアクセスすることが可能
/// const: コンパイル時に評価され、それ移行はimmutable。他にも色々複雑...
class FinalPrefixVariableState extends State {
  final User finalUser = User("hhh", "fff");
  static User staticUser = User("hhh", "fff");

  void _updateFinalUser(String firstName, String secondName) {
    setState(() {
      finalUser.update(firstName, secondName);
    });
  }

  void _updateStaticUser(String firstName, String secondName) {
    setState(() {
      staticUser.update(firstName, secondName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinalPrefixVariable'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text('${finalUser.firstName}, ${finalUser.secondName}'),
              RaisedButton(
                child: Text("new user"),
                color: Colors.red,
                shape: StadiumBorder(),
                onPressed: () {
                  WordPair wp = WordPair.random();
                  _updateFinalUser(wp.first, wp.second);
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('${staticUser.firstName}, ${staticUser.secondName}'),
              RaisedButton(
                child: Text("new user"),
                color: Colors.red,
                shape: StadiumBorder(),
                onPressed: () {
                  WordPair wp = WordPair.random();
                  _updateStaticUser(wp.first, wp.second);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
