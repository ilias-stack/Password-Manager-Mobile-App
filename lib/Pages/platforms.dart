// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:passwordatk/Pages/accounts.dart';
import 'package:passwordatk/main.dart';

class platforms extends StatefulWidget {
  const platforms({Key? key}) : super(key: key);

  @override
  State<platforms> createState() => _platformsState();
}

TextEditingController platfName = TextEditingController();

class _platformsState extends State<platforms> {
  @override
  void initState() {
    super.initState();
    HomePage().AssignData().then((value) {
      setState(() {});
    });
  }

  void refresh() {
    setState(() {});
  }

  int Searcher(String a) {
    int index = 0;
    for (var i in HomePage.data) {
      if (i['platform'] == a) {
        return (index);
      }
      index++;
    }
    return -1;
  }

  Widget PlatsBuilder() {
    // ignore: unused_local_variable
    int index = 0;

    var wdgs = <Widget>[
      const SizedBox(
        height: 40,
      )
    ];
    for (var plat in HomePage.data) {
      wdgs.addAll([
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // radius of 10
              color: const Color.fromRGBO(
                  90, 45, 78, 0.4) // green as background color
              ),
          width: 350,
          padding: const EdgeInsets.all(10),
          child: ListTile(
              tileColor: Colors.white30,
              subtitle: Text(
                'Accounts : ${plat['accounts'].length}',
                style: const TextStyle(color: Colors.white60),
              ),
              trailing: IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Accounts(Searcher(plat['platform']), plat)),
                  );
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white54,
                ),
              ),
              leading: IconButton(
                iconSize: 50,
                onPressed: () {
                  setState(() {
                    HomePage.data.removeAt(Searcher(plat['platform']));
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              title: Text(
                plat["platform"],
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w900,
                    fontSize: 30),
              )),
        ),
        const SizedBox(
          height: 30,
        )
      ]);
      index++;
    }
    return Column(
      children: wdgs,
    );
  }

  @override
  Widget build(BuildContext context) {
    var a = PlatsBuilder();
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Color.fromRGBO(50, 15, 38, 1)],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
        ),
        SingleChildScrollView(
            child: Column(
          children: [
            a,
            Center(
                child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white12)),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.white30,
                  title: const Text(
                    'Add a Platform',
                    style: TextStyle(
                        fontWeight: FontWeight.w900, color: Colors.white),
                  ),
                  content: TextField(
                      controller: platfName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Platform',
                      )),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (platfName.text != '') {
                          setState(() {
                            HomePage.data.add(
                                {'platform': platfName.text, 'accounts': []});
                          });
                        }
                        platfName.text = "";
                      },
                      child: const Icon(
                        Icons.add_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )),
            const SizedBox(
              height: 50,
            ),
          ],
        ))
      ],
    );
  }
}
