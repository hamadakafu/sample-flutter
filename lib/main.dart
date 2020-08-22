import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/home.dart';

void main() {
  // runApp(MyApp());
  runApp(Home());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     String u1s = '{"hoge": "fjoiaf", "email": "hoge.email.com"}';
//     var u1map = jsonDecode(u1s);
//     User u1 = User.fromJson(u1map);
//     User u2 = User('name2', 'email.com');
//     var navbar = BottomNavigationBar(
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.favorite,
//             color: Colors.pink,
//             size: 24.0,
//             semanticLabel: 'Text to announce in accessibility modes',
//           ),
//           title: Text("hgeo"),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(
//             Icons.favorite,
//             color: Colors.pink,
//             size: 24.0,
//             semanticLabel: 'Text to announce in accessibility modes',
//           ),
//           title: Text("hgeo"),
//         ),
//       ],
//     );
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("datahge"),
//         ),
//         body: TodoList(),
//         bottomNavigationBar: navbar,
//       ),
//     );
//   }
// }
