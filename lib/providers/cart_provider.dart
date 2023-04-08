import 'package:flutter/foundation.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get totalPrice {
    double total = 0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  void addItem(CartItem cartItem) {
    if (items.containsKey(cartItem.id)) {
      _items.update(
          cartItem.id,
          (value) => CartItem(
                id: cartItem.id,
                title: cartItem.title,
                price: cartItem.price,
                quantity: items[cartItem.id]!.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(cartItem.id, () => cartItem);
    }
    notifyListeners();
  }
}
