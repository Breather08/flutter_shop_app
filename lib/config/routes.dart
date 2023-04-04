import 'package:shop_app/core/router.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';

class AppRouter extends RouteManager {
  static const String productDetails = '/productDetails';
  static const String products = '/products';

  AppRouter() {
    addRoute(AppRouter.productDetails, (context) {
      final args =
          RouteManager.extractArguments<ProductDetailsScreenArguments>(context);
      return ProductDetailsScreen(args);
    });
    addRoute(AppRouter.products, (context) => ProductOverviewScreen());
  }
}
