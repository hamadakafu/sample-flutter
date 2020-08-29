import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sampleSQLite/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

abstract class UserRepo {
  Future<void> save(User user);

  Future<User> get(String userId);

  Future<List<User>> getAll();
}

/// onCreate時にバージョンが変わった際にはhot reloadではonCreateが走らないのでちゃんとrebuildする必要がある
/// 実機で動かないので解決待ち、flutterの問題かもioができない
class UserRepositorySQLite implements UserRepo {
  // ignore: top_level_function_literal_block
  var _sqlite;

  Future<Database> get sqlite async {
    if (_sqlite != null) return _sqlite;
    // lazily instantiate the db the first time it is accessed
    print('at first');
    var databasePath = await getDatabasesPath();
    _sqlite = await openDatabase(
      join(databasePath, 'sampleSQLite.db'),
      onCreate: _createDB,
      // versionが変わるときにonCreateが走ってくれる?要確認
      version: 4,
    );
    print('ok done');
    return _sqlite;
  }

  Future<void> _createDB(Database db, int version) async {
    print('only first create?');
    await db.execute(
      '''
          CREATE TABLE users (
            userId TEXT PRIMARY KEY, 
            firstName TEXT NOT NULL, 
            lastName TEXT NOT NULL
          )
      ''',
    );
    await db.insert('users', User('feaf', 'hoge', 'lastName').toMap());
  }

  @override
  Future<void> save(User user) async {
    Database db = await sqlite;
    print('exist? ${await databaseExists(db.path)}');
    print('insert?');
    print(db.path);
    print('${db.isOpen}');
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('done');
  }

  @override
  Future<User> get(String userId) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAll() async {
    Database db = await sqlite;
    print('${await db.query('users')}');
    return (await db.query('users'))
        .map((e) => User(e['userId'], e['firstName'], e['lastName']))
        .toList();
  }
}
