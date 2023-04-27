

import 'package:flutter/material.dart';
import 'package:insta/Routes/route_name.dart';
import 'package:insta/Screens/main_screen.dart';
import 'package:insta/Screens/splash_screen.dart';

Map<String, Widget Function(BuildContext)> myRoutes= {
  RouteName.splashScreen:(_) =>const  SplashScreen(),
  RouteName.mainScreen:(_) =>const  MainScreen(),

};