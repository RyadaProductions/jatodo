import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoList.dart';
import 'NewTodoForm.dart';
import 'TodoModel.dart';

class JATodo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MaterialApp(
        title: 'JATodo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: {
          '/': (context) => JATodoAppBar(),
          '/add': (context) => NewTodoForm(),
        },
      ),
    );
  }
}

class JATodoAppBar extends StatelessWidget {
  const JATodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JA Todo'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(context, '/add')),
        ],
      ),
      body: TodoList(),
    );
  }
}
