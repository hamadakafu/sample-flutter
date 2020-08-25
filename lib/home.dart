import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Pages/todoList/presentation/todoList.dart';
import 'package:flutter_app/Pages/userJson/presentation/userJson.dart';
import 'package:flutter_app/pages/aboutDialogSample/presentation/aboutDialogSample.dart';
import 'package:flutter_app/pages/saveDataLocal/presentation/saveDataLocal.dart';
import 'package:flutter_app/pages/simpleAsyncAwait/presentation/simpleAsyncAwait.dart';
import 'package:tuple/tuple.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SampleList(),
      routes: {
        '/todo-list': (BuildContext context) => new TodoList(),
        '/user-json': (BuildContext context) => new UserJson(),
        '/about-dialog-sample': (BuildContext context) =>
            new AboutDialogSample(),
        '/simple-async-await': (BuildContext context) => new SimpleAsyncAwait(),
        '/save-data-local': (BuildContext context) => new SaveDataLocal(),
      },
    );
  }
}

class SampleList extends StatelessWidget {
  final List<Tuple2<String, String>> routes = [
    Tuple2('TodoList', '/todo-list'),
    Tuple2('UserJson', '/user-json'),
    Tuple2('AboutDialogSample', '/about-dialog-sample'),
    Tuple2('SimpleAsyncAwait', '/simple-async-await'),
    Tuple2('SaveDataLocal', '/save-data-local'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: routes
            .map((e) => GestureDetector(
                  onTap: (() => Navigator.of(context).pushNamed(e.item2)),
                  child: Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: Center(
                      child: Text(e.item1),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
