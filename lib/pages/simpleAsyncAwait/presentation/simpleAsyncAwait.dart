import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAsyncAwait extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SimpleAsyncAwaitState();
}

class SimpleAsyncAwaitState extends State {
  bool _loading = false;

  void _setLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  void _toggleLoading() {
    setState(() {
      _loading = !_loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleAsyncAwait'),
      ),
      body: GestureDetector(
        onTap: () => {_setLoading(true)},
        child: Center(
          child: Container(
            height: 200,
            color: Colors.grey,
            child: Column(
              children: [
                Visibility(
                  visible: _loading,
                  // 見えていないときにサイズがそのままのこるか
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: Container(
                    margin: EdgeInsets.only(top: 50, bottom: 30),
                    child: CircularProgressIndicator(),
                  ),
                ),
                GestureDetector(
                  onTap: () => {_toggleLoading()},
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text('toggle'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
