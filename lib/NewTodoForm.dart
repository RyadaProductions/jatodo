import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'TodoModel.dart';

class NewTodoForm extends StatefulWidget {
  const NewTodoForm({Key? key}) : super(key: key);

  @override
  _NewTodoFormState createState() => _NewTodoFormState();
}

class _NewTodoFormState extends State<NewTodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _todoTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new Todo'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    validator: _isTodoValid,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Todo name'),
                    controller: _todoTextFieldController,
                  ),
              ),
              ElevatedButton(
                onPressed: _onSavePressed,
                child: const Text('Save'),
              ),
            ],
          ),
        ));
    ;
  }

  void _onSavePressed() {
    if (_formKey.currentState!.validate()) {
      Provider.of<TodoModel>(context, listen: false).add(_todoTextFieldController.text);
      Navigator.pop(context);
    }
  }

  String? _isTodoValid(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a todo';
    }
    return null;
  }

  @override
  void dispose() {
    _todoTextFieldController.dispose();
    super.dispose();
  }
}
