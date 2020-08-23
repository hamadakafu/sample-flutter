import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/todoList/model/todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todo> _todoList = [];

  void _addItem() {
    setState(() {
      var title = WordPair.random();
      var description = WordPair.random();
      _todoList.add(Todo(title.asPascalCase, description.asPascalCase));
    });
  }

  Widget _buildBody() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _todoList.length) {
        return ListTile(
          subtitle: Text(_todoList[index].description),
          title: Text(_todoList[index].title),
        );
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo list"),
      ),
      body: _buildBody(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addItem, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }
}
