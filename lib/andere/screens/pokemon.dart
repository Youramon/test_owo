import 'package:flutter/material.dart';

int counter = 0;

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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: 170,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.red[300]),
              child: FittedBox(
                child: Text("$counter"),
              )),
          Row(
            children: [
              const Spacer(
                flex: 11,
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: ElevatedButton(
                  child: Text("roflkopter"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ))),
                  onPressed: (() {
                    setState(() {
                      counter++;
                    });
                  }),
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: ElevatedButton(
                  child: Icon(Icons.undo_outlined, size: 150),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ))),
                  onPressed: (() {
                    setState(() {
                      counter = 0;
                    });
                  }),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
