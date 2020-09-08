import 'package:flutter/cupertino.dart';

class Todo {
  String userId;
  String title;
  String description;
  bool done;
  DateTime createdAt;
  DateTime updatedAt;

  Todo({
    @required this.userId,
    @required this.title,
    @required this.description,
    @required this.done,
    @required this.createdAt,
    @required this.updatedAt,
  })  : assert(title.length > 0),
        assert(createdAt.isUtc),
        assert(updatedAt.isUtc);

  factory Todo.create({
    @required userId,
    @required title,
  }) {
    final now = DateTime.now().toUtc();
    return Todo(
      userId: userId,
      title: title,
      description: "",
      done: false,
      createdAt: now,
      updatedAt: now,
    );
  }
}
