import 'package:flutter/material.dart';

class ProductDetailsScreenArguments {
  final String title;

  ProductDetailsScreenArguments(this.title);
}

class ProductDetailsScreen extends StatelessWidget {
  final ProductDetailsScreenArguments args;

  const ProductDetailsScreen(this.args, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
    );
  }
}
