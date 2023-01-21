import 'package:test_owo/andere/constants/routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_owo/andere/logik.dart';
import '../lists.dart';
// import "package:test_owo/andere/screens/ListCheck.dart";

class RandomGen extends StatefulWidget {
  const RandomGen({Key? key}) : super(key: key);

  @override
  State<RandomGen> createState() => _RandomGenState();
}

class _RandomGenState extends State<RandomGen> {
  late final TextEditingController _enteredText;

  @override
  void initState() {
    _enteredText = TextEditingController();
    super.initState();
  }

  var mainText = "gib \"was heute tun\" ein :)";
  dynamic hyperlink; //entfernen
  dynamic haiperlink;
  String? playlistName;
  String? restDerAussage;
  void textEndern(var losten, var playlistNam, var hyperlank, var rest) {
    setState(() {
      playlistName = playlistNam;
      mainText = losten;
      restDerAussage = rest;
      haiperlink = hyperlank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Zufallsgenerator dafür was heute zu tun ist"),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                switch (value) {
                  case true:
                    Navigator.of(context).pushNamed(listCheckRoute);
                    print(value);
                    break;
                }
              },
              itemBuilder: ((context) {
                return const [
                  PopupMenuItem(
                    value: true,
                    child: Text("check all the list items"),
                  )
                ];
              }),
            )
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: mainText,
                    style: const TextStyle(color: Colors.white)),
                TextSpan(
                    text: playlistName,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        {
                          if (await canLaunchUrl(Uri.parse(haiperlink))) {
                            await launchUrl(Uri.parse(haiperlink));
                          }
                        }
                      },
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
                TextSpan(
                    text: restDerAussage,
                    style: const TextStyle(color: Colors.white))
              ], style: Theme.of(context).textTheme.headline2),
            ),
            ////////////////////////////
            // NICHTS HIER ////////////////
            ///////////////////////////////

            OrientationBuilder(builder: (context, orientation) {
              return Padding(
                padding: EdgeInsets.only(
                    left: orientation == Orientation.landscape ? 350 : 90,
                    top: orientation == Orientation.landscape ? 250 : 60,
                    right: orientation == Orientation.landscape ? 350.0 : 90,
                    bottom: 30.0),
                child: TextField(
                    onSubmitted: (String value) {
                      final entscheidung = rolf(value.trim());
                      textEndern(entscheidung[0], entscheidung[1],
                          entscheidung[2], entscheidung[3]);
                    },
                    textAlign: TextAlign.center,
                    controller: _enteredText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
              );
            }),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      // backgroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 54),
                    ),
                    //HIER DIE LOGIK REIN
                    onPressed: () {
                      final List<String> entscheidung =
                          rolf(_enteredText.text.trim());
                      textEndern(entscheidung[0], entscheidung[1],
                          entscheidung[2], entscheidung[3]);
                    },
                    child: const Text(
                      "Ausführen",
                    ),
                  ),
                ],
              ),
            ),
          ],
          // This trailing comma makes auto-formatting nicer for build methods.
        )));
  }
}
