import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'TodoModel.dart';

class TodoListItem extends StatelessWidget {
  TodoListItem(this.index, {Key? key}) : super(key: key);

  final int index;
  late TodoModel _model;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TodoModel>(context, listen: false);
    var item = _model.getByPosition(index);

    // return ListTile(
    //   title: Text(item, style: _biggerFont),
    // );

    return InkWell(
      child: Slidable(
        actionPane: SlidableDrawerDismissal(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(item, style: _biggerFont),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: IconSlideAction(
              caption: 'Edit',
              color: Colors.green,
              icon: Icons.edit,
              onTap: _editItem,
            ),
          )
        ],
        secondaryActions: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: _deleteItem,
            ),
          ),
        ],
      ),
    );
  }

  void _editItem() {
    // TODO: add edit functionality.
  }

  void _deleteItem() {
    _model.remove(_model.getByPosition(index));
  }
}
