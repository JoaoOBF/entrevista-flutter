import 'package:flutter/material.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:myapp/features/login/presentation/pages/login_page.dart';
import 'package:myapp/core/injection/injection.dart' as I;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await I.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
