import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/Register.dart';
import 'package:get_started/presentation/pages/login.dart';
import 'package:get_started/presentation/recources/strings_manager.dart';
import '../pages/home_page.dart';
import '../pages/reset.dart';
import '../pages/splash_page..dart';


class Routes {
  static const String splashPage = '/splash';
  static const String homePage = '/home';
  static const String registerPage = '/register';
  static const String LogIn = '/login';
  static const String reset = '/reset';
}

class RouteManager {
  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.homePage:
        return  MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.registerPage:
        return  MaterialPageRoute(builder: (_) => const RegisterPage());
      case Routes.LogIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case Routes.reset:
        return MaterialPageRoute(builder: (_) => const Reset());
      default:
        return MaterialPageRoute(builder: (_) =>  _noPageFound());
    }
  }

  static Route buildPageRoute(Widget page, AxisDirection direction) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset.zero;
        var end = Offset.zero;
        switch (direction) {
          case AxisDirection.up:
            begin = const Offset(0.0, 1.0);
            break;
          case AxisDirection.down:
            begin = const Offset(0.0, -1.0);
            break;
          case AxisDirection.left:
            begin = const Offset(1.0, 0.0);
            break;
          case AxisDirection.right:
            begin = const Offset(-1.0, 0.0);
            break;
        }
        var tween = Tween(begin: begin, end: end);
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }



  static Widget _noPageFound() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noPageFound),
        centerTitle: true,
      ),
      body: const Center(child: Text(AppStrings.noPageFound)),
    );
  }
}
