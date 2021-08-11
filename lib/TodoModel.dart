import 'dart:collection';

import 'package:flutter/foundation.dart';

class TodoModel extends ChangeNotifier {
  final List<String> _items = ['test', 'test2'];

  UnmodifiableListView<String> get items => UnmodifiableListView(_items);

  String getByPosition(int position) => _items[position];

  int getTotalItems() => _items.length;

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(String item) {
    _items.remove(item);
    notifyListeners();
  }
}