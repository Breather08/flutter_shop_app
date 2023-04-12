import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/products_grid.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop App"),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
                badgeContent: Text(cart.itemCount.toString()),
                position: BadgePosition.custom(end: 0, top: 0),
                child: ch),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.cart);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
              onSelected: (ProductFilter value) {
                setState(() {
                  _showOnlyFavorites = value == ProductFilter.favorite;
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: ProductFilter.favorite,
                      child: Text('Favorites'),
                    ),
                    const PopupMenuItem(
                      value: ProductFilter.all,
                      child: Text('All'),
                    )
                  ])
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
