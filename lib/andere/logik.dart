import 'dart:math';
import 'lists.dart';

final rand = Random();

String zufall2(var liste) {
  return liste[rand.nextInt(liste.length)];
}

class Playlist {
  var genres;
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

  Playlist(this.name, this.genres, this.link);
}

filter(var gonre) {
  var selected =
      library.where((element) => element.genres.contains(gonre)).toList();
  var selectud = selected[rand.nextInt(selected.length)];
  return selectud;
}
