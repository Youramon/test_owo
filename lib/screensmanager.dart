import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:test_owo/andere/logik.dart';
import 'andere/lists.dart';

int currentIndex = 0;

class ScreensManager extends StatefulWidget {
  const ScreensManager({super.key});

  @override
  State<ScreensManager> createState() => _ScreensManagerState();
}

class _ScreensManagerState extends State<ScreensManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 300),
            //  animationCurve: Curves.bounceInOut,
            color: const Color.fromARGB(255, 68, 66, 66),
            items: const [
              Icon(Icons.question_mark, size: 30, color: Colors.blueAccent),
              Icon(MdiIcons.pokeball, size: 30, color: Colors.blueAccent),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }));
  }
}
