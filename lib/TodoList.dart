import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoModel.dart';
import 'TodoListItem.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    var todoCount = Provider.of<TodoModel>(context).getTotalItems();
      
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: todoCount,
        itemBuilder: (context, i) {
          return TodoListItem(i);
        });
  }
}