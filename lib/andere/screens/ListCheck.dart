import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_owo/andere/lists.dart';

class ListCheck extends StatefulWidget {
  const ListCheck({super.key});

  @override
  State<ListCheck> createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {
  _ListCheckState() {
    _selectedVal = wasHeuteTun;
  }
  var _selectedVal = allLists["was heute tun"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("guk ma nach"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "hier kannst du überprüfen:",
                style: TextStyle(fontSize: 48.0),
              ),
              DropdownButton(
                value: _selectedVal,
                items: allLists.keys.map((e) {
                  return DropdownMenuItem(child: Text(e), value: allLists[e]);
                }).toList(),
                onChanged: ((List<Object>? value) {
                  setState(() {
                    _selectedVal = value;
                  });
                }),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _selectedVal?.length ?? 0,
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Dismissible(
                              background: Container(
                                  color: Colors.red,
                                  child: const Icon(Icons.delete)),
                              secondaryBackground: Container(
                                  color: Colors.green,
                                  child: const Icon(Icons.check_box)),
                              key: ValueKey(_selectedVal?[index]),
                              child: SizedBox(
                                height: 50,
                                width: 350,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple,
                                    ),
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                            "${index + 1}. ${_selectedVal?[index]}"))),
                              )),
                          const Spacer()
                        ],
                      ),
                      const Divider(
                        height: 20,
                        indent: 600,
                        endIndent: 600,
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
