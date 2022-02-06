// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:passwordatk/Pages/platforms.dart';
import 'package:passwordatk/Pages/rights.dart';
import 'Pages/data_provider.dart';

main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Raleway'),
        title: 'PassManager',
        home: HomePage()),
  );
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static List<dynamic> data = [];

  // ignore: non_constant_identifier_names
  Future<void> AssignData() async {
    data = await Data.ReadFile();
  }

  bool once = true;
  @override
  Widget build(BuildContext context) {
    if (once) {
      once = false;
      AssignData();
    }
    return Scaffold(
        body: const platforms(),
        drawer: const rights(),
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    Data.Write(data);
                  },
                  icon: const Icon(Icons.save))
            ],
            elevation: 0.0,
            backgroundColor: Colors.black,
            title: Row(
              children: const [
                Text("    "),
                Icon(Icons.lock),
                Text(
                  "I's Password Manager",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
