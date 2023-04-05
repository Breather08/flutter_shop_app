import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';
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
