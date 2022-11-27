import 'package:flutter/material.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokem gen")),
      body: Center(
          child: SizedBox(
        height: 150,
        width: 150,
        child: ElevatedButton(
          child: Text("roflkopter"),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(150.0),
          ))),
          onPressed: (() {}),
        ),
      )),
    );
  }
}
