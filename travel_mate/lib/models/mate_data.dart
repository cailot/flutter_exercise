import 'dart:collection';
import 'package:flutter/material.dart';
import 'mate_item.dart';

class MateData extends ChangeNotifier {
  List<MateItem> _items = [
    MateItem(name: 'Lunch', price: 10),
    MateItem(name: 'Coffee', price: 5),
    MateItem(name: 'Souvenir1', price: 17),
    MateItem(name: 'Souvenir2', price: 27),
  ];

  UnmodifiableListView<MateItem> get items {
    return UnmodifiableListView(_items);
  }

  void addItem(MateItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(MateItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double totalAmount() {
    double total = 0;
    for (MateItem item in _items) {
      total += item.price;
    }
    return total;
  }
}
