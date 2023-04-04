import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductItemProvider with ChangeNotifier {
  final Product product;

  ProductItemProvider(this.product);

  void toggleFavoriteStatus() {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
