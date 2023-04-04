import 'package:flutter/material.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product, {Key? key}) : super(key: key);

  void addToFavorites() {}

  void addToCart() {}

  void onTileTap(BuildContext ctx) {
    Navigator.pushNamed(ctx, AppRouter.productDetails,
        arguments: ProductDetailsScreenArguments(product.title));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
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
        child: GestureDetector(
          onTap: () => onTileTap(context),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
