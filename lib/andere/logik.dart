import 'dart:math';
import 'lists.dart';
import 'package:test_owo/andere/screens/randomgen.dart';

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
      else
        return [auswaha, "", "", ""];

    case "box.com":
      return [zufall2(box_com), "", "", ""];

    case "Lofi":
      hyperlink = filter("Lofi");
      return [
        "",
        hyperlink.name,
        hyperlink.link,
        " und ${hyperlink.wasDann()}"
      ];

    default:
      return ["", "", ""];
  }
}



// return mit Liste? und das dann als Input Parameter benutzen?