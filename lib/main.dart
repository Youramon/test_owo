import 'package:flutter/material.dart';
import "package:test_owo/andere/randomgen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:
          const RandomGen(title: 'Zufallsgenerator dafür was heute zu tun ist'),
      debugShowCheckedModeBanner: false,
    );
  }
}
