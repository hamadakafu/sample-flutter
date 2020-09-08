import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleFirebase/model/user.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/common/userService.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class MailInput extends StatefulWidget {
  final ScrollController scrollController;

  MailInput({this.scrollController});

  @override
  State<StatefulWidget> createState() => MailInputState(
        scrollController: scrollController,
      );
}

class MailInputState extends State {
  final ScrollController scrollController;

  String _tmpEmailText = "";
  Future<User> _futureUser;

  MailInputState({this.scrollController});

  @override
  Widget build(BuildContext rootContext) {
    return Material(
      child: Navigator(
        onGenerateRoute: (_) => CupertinoPageRoute(
          builder: (BuildContext context) => CupertinoPageScaffold(
            // navigationBar: CupertinoNavigationBar(
            //   leading: Container(),
            //   middle: Text('メールアドレス'),
            // ),
            child: SafeArea(
              top: true,
              // 周りを影で囲む
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Neumorphic(
                    margin:
                        EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 4),
                    style: NeumorphicStyle(
                      depth: NeumorphicTheme.embossDepth(context),
                      // boxShape: NeumorphicBoxShape.stadium(),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: 'email address',
                      ),
                      onChanged: (value) {
                        print('on changed $value');
                        _tmpEmailText = value;
                      },
                      validator: (String value) {
                        // TODO: validate
                        return null;
                      },
                      controller: null,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  NeumorphicButton(
                    style: NeumorphicTheme.of(context).current.buttonStyle,
                    child: Container(
                      height: 50,
                      // future button: futureが解決したら遷移する
                      child: FutureBuilder(
                        future: _futureUser?.then((u) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CupertinoPageScaffold(
                                navigationBar: CupertinoNavigationBar(
                                  middle: Text('ログイン'),
                                ),
                                child: SafeArea(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () async {
                                        Navigator.of(rootContext).pop();
                                        Navigator.of(rootContext)
                                            .pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => CounterHome(),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 50,
                                        child: Text('hoge'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                          // 注意 ここをnullで代入しないと戻るときにfutureBuilderの_futureUserが解決されて
                          // すぐにまた画面遷移してしまう
                          // _futureUser = null;
                          return u;
                        }),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (_futureUser == null) {
                            return Center(child: Text('hog'));
                          }
                          if (snapshot.error != null) {
                            // TODO: error handling
                          }
                          // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
                          if (snapshot.data == null ||
                              snapshot.connectionState !=
                                  ConnectionState.done) {
                            return new Center(
                                child: new CircularProgressIndicator());
                          }
                          return Text('Ok');
                        },
                      ),
                    ),
                    onPressed: () async {
                      final us = context.read<UserService>();
                      setState(() {
                        _futureUser = us.alreadyExists(_tmpEmailText);
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
