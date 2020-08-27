import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/sampleSQLite/model/user.dart';
import 'package:flutter_app/pages/sampleSQLite/repository/user.dart';

// FIXME: SimulatorだとonCreateが呼ばれるが、実機だと呼ばれずテーブルが作成されない
class SampleSQLite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SampleSQLiteState();
}

class SampleSQLiteState extends State {
  UserRepo _userRepo = UserRepositorySQLite();
  Future<List<User>> _users;

  SampleSQLiteState() {
    this._users = this._userRepo.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SampleSQLite'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: this._users,
              builder:
                  (BuildContext context, AsyncSnapshot<List<User>> feedState) {
                if (feedState.error != null) {
                  // TODO: error handling
                }
                // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
                if (feedState.data == null ||
                    feedState.connectionState != ConnectionState.done) {
                  return new Center(child: new CircularProgressIndicator());
                }
                return Column(
                  children: feedState.data
                      .map((e) =>
                          Text('${e.userId}: ${e.firstName} ${e.lastName}'))
                      .toList(),
                );
              },
            ),
            Center(
              child: Row(
                children: [
                  RaisedButton(
                    child: Text("new user"),
                    color: Colors.red,
                    shape: StadiumBorder(),
                    onPressed: () {
                      WordPair wp = WordPair.random();
                      User u = User.create(wp.first, wp.second);
                      _userRepo.save(u);
                      print('create ${u.userId}');
                    },
                  ),
                  RaisedButton(
                    child: Text('get users'),
                    color: Colors.red,
                    shape: StadiumBorder(),
                    onPressed: () {
                      print('get users');
                      setState(() {
                        this._users = _userRepo.getAll();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
