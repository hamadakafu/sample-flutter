import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Pages/todoList/presentation/todoList.dart';
import 'package:flutter_app/Pages/userJson/presentation/userJson.dart';
import 'package:flutter_app/pages/aboutDialogSample/presentation/aboutDialogSample.dart';
import 'package:flutter_app/pages/finalPrefixVariable/presentation/finalPrefixVariable.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/presentation/pages/home.dart';
import 'package:flutter_app/pages/sampleFirebase/repository/counter.dart';
import 'package:flutter_app/pages/sampleFirebase/service/interface/iCounterRepository.dart';
import 'package:flutter_app/pages/sampleFlutterTTS/presentation/sampleFlutterTTS.dart';
import 'package:flutter_app/pages/sampleFutureBuilder/presentation/sampleFutureBuilder.dart';
import 'package:flutter_app/pages/sampleInheritedWidget/presentation/sampleInheritedWidget.dart';
import 'package:flutter_app/pages/sampleProvider/presentation/sampleProvider.dart';
import 'package:flutter_app/pages/sampleSQLite/presentation/sampleSQLite.dart';
import 'package:flutter_app/pages/saveDataLocal/presentation/saveDataLocal.dart';
import 'package:flutter_app/pages/simpleAsyncAwait/presentation/sampleAsyncAwait.dart';
import 'package:tuple/tuple.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Ricty',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      routes: {
        '/todo-list': (BuildContext context) => new TodoList(),
        '/user-json': (BuildContext context) => new UserJson(),
        '/about-dialog-sample': (BuildContext context) =>
            new AboutDialogSample(),
        '/sample-async-await': (BuildContext context) => new SampleAsyncAwait(),
        '/save-data-local': (BuildContext context) => new SaveDataLocal(),
        '/sample-future-builder': (BuildContext context) =>
            new SampleFutureBuilder(),
        '/sample-sqlite': (BuildContext context) => new SampleSQLite(),
        '/final-prefix-variable': (BuildContext context) =>
            new FinalPrefixVariable(),
        '/sample-inherited-widget': (BuildContext context) =>
            new SampleInheritedWidget(),
        '/sample-provider': (BuildContext context) => new SampleProvider(),
        '/sample-flutter-tts': (BuildContext context) => new SampleFlutterTTS(),
        '/sample-firebase': (BuildContext context) => new SampleFirebaseHome(),
      },
    );
  }
}

class Main extends StatelessWidget {
  final List<Tuple2<String, String>> routes = [
    Tuple2('TodoList', '/todo-list'),
    Tuple2('UserJson', '/user-json'),
    Tuple2('AboutDialogSample', '/about-dialog-sample'),
    Tuple2('SampleAsyncAwait', '/sample-async-await'),
    Tuple2('SaveDataLocal', '/save-data-local'),
    Tuple2('SampleFutureBuilder', '/sample-future-builder'),
    Tuple2('SampleSQLite', '/sample-sqlite'),
    Tuple2('FinalPrefixVariable', '/final-prefix-variable'),
    Tuple2('SampleInheritedWidget', '/sample-inherited-widget'),
    Tuple2('SampleProvider', '/sample-provider'),
    Tuple2('SampleFlutterTTS', '/sample-flutter-tts'),
    Tuple2('SampleFirebase', '/sample-firebase'),
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
