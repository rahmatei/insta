import 'package:flutter/material.dart';
import 'package:insta/Screens/explore_screen.dart';
import 'package:insta/Screens/home_screen.dart';
import 'package:insta/Screens/notify_screen.dart';
import 'package:insta/Screens/profile_screen.dart';
import 'package:insta/gen/assets.gen.dart';
import 'package:insta/res/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexNavigationBottom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 60,
        color: MyColor.bottomNavigationColor,
        child: Row(children: [
          IconButton(
            onPressed: () {
              setState(() {
                indexNavigationBottom = MyBottomNavigationItem.homeScreen;
              });
            },
            icon: indexNavigationBottom == MyBottomNavigationItem.homeScreen
                ? Assets.icons.homeSelected.svg()
                : Assets.icons.home.svg(),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                indexNavigationBottom = MyBottomNavigationItem.exploreScreen;
              });
            },
            icon: indexNavigationBottom == MyBottomNavigationItem.exploreScreen
                ? Assets.icons.exploreSelected.svg()
                : Assets.icons.explore.svg(),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                indexNavigationBottom = MyBottomNavigationItem.notifyScreen;
              });
            },
            icon: indexNavigationBottom == MyBottomNavigationItem.notifyScreen
                ? Assets.icons.notifySeleced.svg()
                : Assets.icons.notify.svg(),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                indexNavigationBottom = MyBottomNavigationItem.profileScreen;
              });
            },
            icon: indexNavigationBottom == MyBottomNavigationItem.homeScreen
                ? Assets.icons.profileSelected.svg()
                : Assets.icons.profile.svg(),
          ),
        ]),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: indexNavigationBottom,
          children: const [
            HomeScreen(),
            ExploreScreen(),
            NotifyScreen(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}

abstract class MyBottomNavigationItem {
  static const homeScreen = 0;
  static const exploreScreen = 1;
  static const notifyScreen = 2;
  static const profileScreen = 3;
}
