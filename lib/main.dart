import 'package:flutter/material.dart';
import 'package:shop_app/config/routes.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shop App',
    routes: AppRouter().routes,
    initialRoute: AppRouter.products,
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      }),
    ),
  ));
}
