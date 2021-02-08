import 'package:flutter/material.dart';
import 'package:myapp/core/utils/constants.dart';
import 'package:myapp/features/account_management/presentation/pages/home_page.dart';
import 'package:myapp/features/login/presentation/pages/login_page.dart';


class Routes {
  static var routes = {
    login: (context) => LoginPage(),
    home: (context) => HomePage(),

  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> nav = {
      login: () => _builder(LoginPage()),
      home: () => _builder(HomePage()),

    };

    return nav[settings.name]();
  }

  static MaterialPageRoute _builder(page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
