import 'package:flutter/material.dart';
import 'package:insta/Routes/route_name.dart';
import 'package:insta/Screens/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Home Screen _ Stack 0')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PostScreen())),
              child: const Text('Next Page To Post'))
        ],
      )),
    );
  }
}
