import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_owo/andere/logik.dart';
import 'lists.dart';

class RandomGen extends StatefulWidget {
  const RandomGen({Key? key, required this.title}) : super(key: key);

  final String title;

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
  dynamic hyperlink;
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
    print(MediaQuery.of(context).size.width);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(widget.title),
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
                    onSubmitted: (String value) {},
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
                      final enteredText = _enteredText.text.trim();
                      switch (enteredText) {
                        case "was heute tun":
                          textEndern(zufall2(wasHeuteTun), "", "", "");
                          break;
                        case "youtube":
                          var auswaha = zufall2(youtube);
                          if (auswaha == "EDM" ||
                              auswaha == "Dubstep" ||
                              auswaha == "Japanese" ||
                              auswaha == "Epic" ||
                              auswaha == "Lofi") {
                            hyperlink = filter(auswaha);
                            textEndern("$auswaha: ", hyperlink.name,
                                hyperlink.link, " und ${library[1].wasDann()}");
                          } else if (auswaha ==
                              "zufällige Playlist meinerseits") {
                            hyperlink = rand.nextInt(library.length - 3);
                            textEndern(
                                "Zufall, also ",
                                "${library[hyperlink + 3].name} ",
                                library[hyperlink + 3].link,
                                "und ${library[1].wasDann()}");
                          } else if (auswaha == "podcast")
                            textEndern(
                                "Podcast: ${zufall2(podcasts)}", "", "", "");
                          else if (auswaha == "tutoriel")
                            textEndern(
                                "Tutoriel: ${zufall2(tutoriel)}", "", "", "");
                          else
                            textEndern(auswaha, "", "", "");
                          break;

                        case "box.com":
                          textEndern(zufall2(box_com), "", "", "");
                          break;
                        case "Lofi":
                          hyperlink = filter("Lofi");
                          textEndern("", hyperlink.name, hyperlink.link,
                              " und ${hyperlink.wasDann()}");

                          break;
                        default:
                          break;
                      }
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
