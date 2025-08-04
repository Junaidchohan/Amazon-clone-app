import 'package:amazon_clone_app/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_app/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_app/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_app/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone_app/features/home/screens/home_screen.dart';
import 'package:amazon_clone_app/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone_app/features/search/screens/search_screen.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AuthScreen(),
      );
    case HomeScreen.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case BottomBar.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BottomBar(),
      );
    case AddProductScreen.routName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProductScreen(),
      );
    case CategoryDealsScreen.routName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(category: category),
      );
    case SearchScreen.routName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(searchQuery: searchQuery),
      );
    case ProductDetailsScreen.routName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(product: product),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder:
            (_) =>
                Scaffold(body: Center(child: Text("Screen does not exist!"))),
      );
  }
}
