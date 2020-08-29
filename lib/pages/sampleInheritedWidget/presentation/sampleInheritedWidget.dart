import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/sampleInheritedWidget/model/user.dart';
import 'package:path/path.dart';

class FrogColor extends InheritedWidget {
  const FrogColor({
    Key key,
    @required this.color,
    @required Widget child,
  })  : assert(color != null),
        assert(child != null),
        super(key: key, child: child);

  final Color color;

  static FrogColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  @override
  bool updateShouldNotify(FrogColor old) => color != old.color;
}

class SampleInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SampleInheritedWidgetState();
}

class SampleInheritedWidgetState extends State {
  final User user = User.create('hhh', 'fff');

  void updateUser(firstName, String secondName) {
    setState(() {
      user.firstName = firstName;
      user.secondName = secondName;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context.widget.toStringShort());
    return Scaffold(
      appBar: AppBar(
        title: Text('hhh'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SampleInheritedWidgetStateInheritedState(child: MyText(), data: user),
          Center(
            child: RaisedButton(
              onPressed: () {
                var a = WordPair.random();
                updateUser(a.first, a.second);
              },
              child: Text('load'),
            ),
          ),
        ],
      ),
    );
  }
}

class SampleInheritedWidgetStateInheritedState extends InheritedWidget {
  final User data;

  SampleInheritedWidgetStateInheritedState({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  static SampleInheritedWidgetStateInheritedState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        SampleInheritedWidgetStateInheritedState>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = SampleInheritedWidgetStateInheritedState.of(context).data;
    return Text('${data.userId}: ${data.firstName} ${data.secondName}');
  }
}
