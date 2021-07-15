import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/constants.dart';
import 'package:haefele_health_app/src/ui/views/auth/signup_view.dart';
import 'package:haefele_health_app/src/ui/views/dashboard/dashboard_view.dart';
import 'package:haefele_health_app/src/ui/views/views.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.login:
        return MaterialPageRoute<LoginView>(builder: (_) => LoginView());
      case RoutePaths.signUp:
        return MaterialPageRoute<SignUpView>(builder: (_) => SignUpView());
      case RoutePaths.dashboard:
        return MaterialPageRoute<DashBoardView>(builder: (_) => DashBoardView());
      default:
        return null;
    }
  }
}
