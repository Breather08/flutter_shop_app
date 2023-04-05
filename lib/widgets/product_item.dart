import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/product_item_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  void toggleFavorite(BuildContext ctx) {
    ctx.read<ProductItemProvider>().toggleFavoriteStatus();
  }

  void addToCart() {}

  void onTileTap(BuildContext ctx, String id) {
    Navigator.pushNamed(ctx, AppRouter.productDetails,
        arguments: ProductDetailsScreenArguments(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductItemProvider>().product;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_outline),
            onPressed: () => toggleFavorite(context),
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
          onTap: () => onTileTap(context, product.id),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
