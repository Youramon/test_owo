import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_owo/andere/lists.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:test_owo/firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(brightness: Brightness.dark),
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        /* home: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done: */
        home: Scaffold(
            body: screens[_currentIndex],
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
                    _currentIndex = index;
                  });
                })));

    //   default:
    //   return const Center(
    //     child: SizedBox(
    // height: 50,
    // width: 50,
    // child: CircularProgressIndicator.adaptive(),
    // ));
  }
}
