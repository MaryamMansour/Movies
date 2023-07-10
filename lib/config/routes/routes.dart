

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/components.dart';
import '../../features/home/presentation/pages/home.dart';

class Routes {
  // static const String login = "/";
  // static const String signUp = "SignUp";
  static const String home = "/";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {

      case Routes.home:

        return MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }
}
