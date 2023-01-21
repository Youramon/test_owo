import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_owo/andere/constants/routes.dart';
import 'package:test_owo/andere/lists.dart';
import 'package:test_owo/andere/logik.dart';
import 'package:test_owo/firebase_options.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:test_owo/screensmanager.dart';

import 'andere/screens/ListCheck.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // var db = FirebaseFirestore.instance;
  // @override
  // void initState() {
  // db
  //  .collection("listen")
  //  .doc("rolfkopter")
  //  .set(mapConverter(wasHeuteTun))
  //  .onError((e, _) => print("Error writing document: $e"));
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: defaultTargetPlatform != TargetPlatform.windows
            ? const ScreensManager()
            : FutureBuilder(
                future: rolfKopter(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return const ScreensManager();
                    default:
                      return const Center(
                          child: SizedBox(
                              height: 50,
                              width: 50,
                              child: CircularProgressIndicator.adaptive()));
                  }
                }),
        debugShowCheckedModeBanner: false,
        routes: {listCheckRoute: (context) => const ListCheck()});
  }
}
