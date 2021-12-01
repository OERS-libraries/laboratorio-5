import 'package:example_app/models/product.dart';
import 'package:example_app/ui/views/Register/register_view.dart';
import 'package:example_app/ui/views/cart/cart_view.dart';
import 'package:example_app/ui/views/home/home_view.dart';
import 'package:example_app/ui/views/login/login_view.dart';
import 'package:example_app/ui/views/product/product_view.dart';
import 'package:example_app/ui/views/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/register':
        return MaterialPageRoute(builder: (_) => Registerview());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/product-view':
        Product _product = args as Product;
        return MaterialPageRoute(builder: (_) => ProductView(_product));
      case '/cart-view':
        return MaterialPageRoute(builder: (_) => CartView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text("ERROR"),
        ),
      );
    });
  }
}
