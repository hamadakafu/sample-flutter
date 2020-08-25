import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAsyncAwait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SimpleAsyncAwaitState();
}

Future<bool> _returnFalse() async {
  return new Future.delayed(const Duration(seconds: 1), () => false);
}

class SimpleAsyncAwaitState extends State {
  void _setLoading(bool loading) {
    setState(() {});
  }

  void _toggleLoading() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleAsyncAwait'),
      ),
      body: FutureBuilder(
        future: new Future(() async {
          var token = await _returnFalse();
          var user = await _returnFalse();
          return await _returnFalse();
        }),
        builder: (BuildContext context, AsyncSnapshot<bool> feedState) {
          if (feedState.error != null) {
            // TODO: error handling
          }
          if (feedState.data == null) {
            return new Center(child: new CircularProgressIndicator());
          }
          return Center(
            child: Container(
              height: 50,
              color: Colors.grey,
              child: GestureDetector(
                onTap: () => {_toggleLoading()},
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text('toggle'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
