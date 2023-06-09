import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/products_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider<ProductsProvider>(create: (ctx) => ProductsProvider()),
  ChangeNotifierProvider<CartProvider>(create: (ctx) => CartProvider()),
];
