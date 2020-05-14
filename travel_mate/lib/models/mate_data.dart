import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'mate_item.dart';

class MateData extends ChangeNotifier {
  List<MateItem> _items = [
    MateItem(name: 'Lunch', price: 10),
    MateItem(name: 'Coffee', price: 5),
    MateItem(name: '기념품', price: 17),
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
    total = double.parse(total.toStringAsFixed(2));
    return total;
  }

  int get itemCount {
    return _items.length;
  }
}
