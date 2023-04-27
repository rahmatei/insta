import 'package:flutter/material.dart';
import 'package:insta/Routes/route_name.dart';
import 'package:insta/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:RouteName.splashScreen,
      routes: myRoutes,
    );
  }
}

