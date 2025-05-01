import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartViewModel extends ChangeNotifier {
  final Map<Product, int> _items = {};

  Map<Product, int> get items => Map.unmodifiable(_items);

  void addItem(Product p) {
    _items.update(p, (qty) => qty + 1, ifAbsent: () => 1);
    notifyListeners();
  }

  void removeItem(Product p) {
    if (!_items.containsKey(p)) return;
    if (_items[p]! > 1) {
      _items[p] = _items[p]! - 1;
    } else {
      _items.remove(p);
    }
    notifyListeners();
  }

  bool get hasItems => _items.isNotEmpty;
  int get totalItems => _items.values.fold(0, (a, b) => a + b);
  double get totalPrice =>
      _items.entries.map((e) => e.key.price * e.value).fold(0.0, (a, b) => a + b);
}
