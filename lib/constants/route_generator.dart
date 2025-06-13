import 'package:coffeeshop_application/screens/delivery.dart';
import 'package:flutter/material.dart';
import '../screens/order.dart';
import '../screens/welcome.dart';
import '../screens/home.dart';
import '../screens/detail.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return buildRoute(const Welcome(), settings: settings);
      case Routes.home:
        return buildRoute(const Home(), settings: settings);
      case Routes.detail:
        return buildRoute(const Detail(), settings: settings);
      case Routes.order:
        return buildRoute(const Order(), settings: settings);
      case Routes.delivery:
        return buildRoute(const Delivery(), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child, {required RouteSettings settings}) {
    return MaterialPageRoute(builder: (_) => child, settings: settings);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}
