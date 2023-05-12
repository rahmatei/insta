import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta/Routes/route_name.dart';
import 'package:insta/Screens/add_screen.dart';
import 'package:insta/Screens/explore_screen.dart';
import 'package:insta/Screens/home_screen.dart';
import 'package:insta/Screens/notify_screen.dart';
import 'package:insta/Screens/post_screen.dart';
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

  final GlobalKey<NavigatorState> _navHome = GlobalKey();
  final GlobalKey<NavigatorState> _navExplore = GlobalKey();
  final GlobalKey<NavigatorState> _navNotify = GlobalKey();
  final GlobalKey<NavigatorState> _navProfile = GlobalKey();

  late final List<GlobalKey<NavigatorState>> _navState = [
    _navHome,
    _navExplore,
    _navNotify,
    _navProfile
  ];

  final List<int> _historyBtnNav = [];

  Future<bool> _willPopScope() async {
    if (_navState[indexNavigationBottom].currentState!.canPop()) {
      _navState[indexNavigationBottom].currentState!.pop();
    } else if (_historyBtnNav.length > 1) {
      _historyBtnNav.removeLast();
      setState(() {
        indexNavigationBottom = _historyBtnNav.last;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Back')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Exit')),
            ],
            content: const Text('Are You Sure  Exit?'),
            title: const Text('Info'),
          );
        },
      );
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _historyBtnNav.add(MyBottomNavigationItem.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        bottomNavigationBar: btnNavigationBar(),
        body: SafeArea(
          child: IndexedStack(
            index: indexNavigationBottom,
            children: [
              Navigator(
                key: _navHome,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
              Navigator(
                key: _navExplore,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (_) => const ExploreScreen()),
              ),
              Navigator(
                key: _navNotify,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (_) => const NotifyScreen()),
              ),
              Navigator(
                key: _navProfile,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container btnNavigationBar() {
    return Container(
      width: double.infinity,
      height: 60,
      color: MyColor.bottomNavigationColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
          onPressed: () {
            _historyBtnNav.add(MyBottomNavigationItem.homeScreen);

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
            _historyBtnNav.add(MyBottomNavigationItem.exploreScreen);

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddScreen()));
            },
            icon: Assets.icons.add.svg()),
        IconButton(
          onPressed: () {
            _historyBtnNav.add(MyBottomNavigationItem.notifyScreen);

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
            _historyBtnNav.add(MyBottomNavigationItem.profileScreen);

            setState(() {
              indexNavigationBottom = MyBottomNavigationItem.profileScreen;
            });
          },
          icon: indexNavigationBottom == MyBottomNavigationItem.homeScreen
              ? Assets.icons.profileSelected.svg()
              : Assets.icons.profile.svg(),
        ),
      ]),
    );
  }
}

abstract class MyBottomNavigationItem {
  static const homeScreen = 0;
  static const exploreScreen = 1;
  static const notifyScreen = 2;
  static const profileScreen = 3;
}
