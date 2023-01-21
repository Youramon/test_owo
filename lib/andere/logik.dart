import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_options.dart';
import 'lists.dart';

final rand = Random();

dynamic zufall2(var liste) {
  return liste[rand.nextInt(liste.length)];
}

class Playlist {
  List? genresss;
  var name;
  // ignore: prefer_typing_uninitialized_variables
  var link;
  var moeglichkeit = [
    "normal abspielen",
    "shuffle",
    "Radio von der Playlist",
    "empfohlene Playlist zu meiner Playlist"
  ];

  wasDann() {
    final rand = Random();
    return moeglichkeit[rand.nextInt(moeglichkeit.length)];
  }

  Playlist(this.name, this.genresss, this.link);
}

filter(var gonre) {
  var selected =
      library.where((element) => element.genresss?.contains(gonre) ?? false);

  var selectad = selected.toList();
  var selectud = selectad[rand.nextInt(selected.length)];
  return selectud;
}

/////////////////////////
///NICHTS///////////////
///////////////////////
dynamic hyperlink;
List<String> rolf(String enteredText) {
  switch (enteredText) {
    case "was heute tun":
      return [zufall2(wasHeuteTun), "", "", ""];
    case "youtube":
      var auswaha = zufall2(youtube);
      if (genres.values.contains(auswaha)) {
        hyperlink = filter(auswaha);
        return [
          "${auswaha.toString().substring(7)}: ",
          hyperlink.name,
          hyperlink.link,
          " und ${library[1].wasDann()}"
        ];
      } else if (auswaha == "zufällige Playlist meinerseits") {
        hyperlink = rand.nextInt(library.length - 3);
        return [
          "Zufall, also ",
          "${library[hyperlink + 3].name} ",
          library[hyperlink + 3].link,
          "und ${library[1].wasDann()}"
        ];
      } else if (auswaha == "podcast")
        return ["Podcast: ${zufall2(podcasts)}", "", "", ""];
      else if (auswaha == "tutoriel")
        return ["Tutoriel: ${zufall2(tutoriel)}", "", "", ""];
      else if (auswaha == "box.com")
        return ["box.com also: ${zufall2(box_com)}", "", "", ""];
      else
        return [auswaha, "", "", ""];

    case "box.com":
      return [zufall2(box_com), "", "", ""];

    case "Lofi":
      hyperlink = filter(genres.Lofi);
      return [
        "",
        hyperlink.name,
        hyperlink.link,
        " und ${hyperlink.wasDann()}"
      ];

    case "pesplayer":
      return [zufall2(pesteam), "", "", ""];
    default:
      return ["", "", ""];
  }
}

// return mit Liste? und das dann als Input Parameter benutzen?

/////////////////////////
///NICHTS///////////////
///////////////////////
Map<String, dynamic> mapConverter(List inputListe) {
  Map<String, dynamic> returnMap = {};
  inputListe.forEach((element) {
    returnMap[inputListe.indexOf(element).toString()] = element;
  });
  return returnMap;
}

var hahaoksdee = mapConverter(youtube);
Future<void>? rolfKopter() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
