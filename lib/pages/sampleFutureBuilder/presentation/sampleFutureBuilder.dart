import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SampleFutureBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SampleFutureBuilderState();
}

Future<bool> _toggleBool(bool now) async {
  return new Future.delayed(const Duration(seconds: 1), () => !now);
}

class SampleFutureBuilderState extends State {
  Future<bool> ok = _toggleBool(false);

  void _toggle(bool now) {
    setState(() {
      this.ok = null;
      this.ok = _toggleBool(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.ok,
      builder: (BuildContext context, AsyncSnapshot<bool> feedState) {
        if (feedState.error != null) {
          // TODO: error handling
        }
        // ここをConnectionState.doneじゃないやつにすると期待通りにリロード画面が間に入る
        if (feedState.data == null || feedState.connectionState != ConnectionState.done) {
          return new Center(child: new CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('${feedState.data}'),
          ),
          body: GestureDetector(
            onTap: () {
              this._toggle(feedState.data);
            },
            child: Center(
              child: Container(
                height: 50,
                child: Text('${feedState.data}'),
              ),
            ),
          ),
        );
      },
    );
  }
}
