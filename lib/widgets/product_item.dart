import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {Key? key}) : super(key: key);

  void addToFavorites() {}

  void addToCart() {}

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: addToFavorites,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: addToCart,
        ),
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
      ),
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
