import 'dart:developer';

import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int indexBox = 0;

  List<Widget> _listBox = [Box1(), Box2(), Box3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 66, 175, 230),
            child: const Center(child: Text('Explore Screen')),
          ),
          _listBox[indexBox],
          Positioned(
              left: 0,
              right: 0,
              top: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: indexBox > 0
                          ? () {
                              setState(() {
                                //indexBox > 0 ? --indexBox : indexBox;
                                --indexBox;
                              });
                            }
                          : null,
                      child: const Text('Back')),
                  ElevatedButton(
                      onPressed: indexBox < _listBox.length - 1
                          ? () {
                              setState(() {
                                // indexBox < _listBox.length - 1 ? ++indexBox : indexBox;
                                ++indexBox;
                              });
                            }
                          : null,
                      child: const Text('Next')),
                ],
              )),
        ],
      )),
    );
  }
}

class Box1 extends StatelessWidget {
  const Box1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: 100,
      color: Colors.red,
      child: const Center(child: Text('Box 1')),
    ));
  }
}

class Box2 extends StatelessWidget {
  const Box2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: 100,
      color: Colors.yellow,
      child: const Center(child: Text('Box 2')),
    ));
  }
}

class Box3 extends StatelessWidget {
  const Box3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.3,
      height: 100,
      color: Colors.green,
      child: const Center(child: Text('Box 3')),
    ));
  }
}
