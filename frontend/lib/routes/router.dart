import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/screens/auth_screens/login_screen.dart';
import 'package:frontend/screens/splash_screen.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen()); 
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
