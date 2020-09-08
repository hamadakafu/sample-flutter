import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class User {
  final String userId;
  final String name;
  final String email;
  final List<String> todoIds;
  final DateTime createdAt;
  DateTime updatedAt;

  User({
    @required this.userId,
    @required this.name,
    @required this.email,
    @required this.todoIds,
    @required this.createdAt,
    @required this.updatedAt,
  })  : assert(createdAt.isUtc),
        assert(updatedAt.isUtc);

  factory User.initialize({
    @required name,
    email = "",
  }) {
    final now = DateTime.now().toUtc();
    final userId = Uuid().v4();

    return User(
      userId: userId,
      name: name,
      email: email,
      todoIds: [],
      createdAt: now,
      updatedAt: now,
    );
  }
}
