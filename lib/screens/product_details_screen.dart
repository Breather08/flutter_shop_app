import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailsScreenArguments {
  final String id;

  ProductDetailsScreenArguments({required this.id});
}

class ProductDetailsScreen extends StatelessWidget {
  final ProductDetailsScreenArguments args;

  const ProductDetailsScreen(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ProductsProvider>().findById(args.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
