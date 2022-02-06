// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwordatk/main.dart';

class Accounts extends StatelessWidget {
  late dynamic accs;
  late int index;
  Accounts(this.index, this.accs, {Key? key}) : super(key: key);
  TextEditingController usernm = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  int Searcher(var account) {
    for (var i = 0; i < HomePage.data[index]['accounts'].length; i++) {
      if (HomePage.data[index]['accounts'][i].toString() ==
          account.toString()) {
        return (i);
      }
    }
    return -1;
  }

  void AccsDeleter(var account) {
    //print(HomePage.data[index]['accounts'][Searcher(account)]);
    List a = [
      for (int i = 0; i < HomePage.data[index]['accounts'].length; i++)
        HomePage.data[index]['accounts'][i]
    ];
    a.removeAt(Searcher(account));
    HomePage.data[index]['accounts'] = a;
  }

  Widget AccsBuilder(BuildContext context) {
    var wdgs = <Widget>[
      const SizedBox(
        height: 40,
      )
    ];

    for (var wd in accs['accounts']) {
      wdgs.add(Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // radius of 10
            color: const Color.fromRGBO(
                90, 45, 78, 0.4) // green as background color
            ),
        child: Column(
          children: [
            ListTile(
              horizontalTitleGap: 16.0,
              leading: IconButton(
                iconSize: 30,
                onPressed: () {
                  AccsDeleter(wd);
                  Navigator.pop((context));
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
              ),
              title: Column(
                children: [
                  Text(
                    wd['username'],
                    style: const TextStyle(fontSize: 30, color: Colors.white54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () =>
                          Clipboard.setData(ClipboardData(text: wd['email'])),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          Text(wd['email'],
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white54))
                        ],
                      )),
                  TextButton(
                      onPressed: () => Clipboard.setData(
                          ClipboardData(text: wd['password'])),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.password,
                            color: Colors.grey,
                          ),
                          Text(wd['password'].length.toString(),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white54))
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ));
    }
    return Column(
      children: wdgs,
    );
  }

  @override
  Widget build(BuildContext context) {
    var plat = accs['platform'];
    var accounts = accs['accounts'];

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Color.fromRGBO(50, 15, 38, 1)],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
        ),
        SingleChildScrollView(
            child: Column(children: [
          AccsBuilder(context),
          Center(
              child: TextButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white12)),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.white30,
                title: const Text(
                  'Add an Account',
                  style: TextStyle(
                      fontWeight: FontWeight.w900, color: Colors.white),
                ),
                content: SizedBox(
                  height: 230,
                  child: Column(
                    children: [
                      TextField(
                          controller: usernm,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Username',
                          )),
                      Divider(),
                      TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Email',
                          )),
                      Divider(),
                      TextField(
                          controller: pass,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Password',
                          ))
                    ],
                  ),
                ),
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
                      if (usernm.text != '') {
                        accounts.add({
                          'username': usernm.text,
                          'email': email.text,
                          'password': pass.text
                        });
                      }
                      var newdata = {'platform': plat, 'accounts': accounts};
                      HomePage.data[index] = newdata;
                      Navigator.pop(context);
                      Navigator.pop(context);
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
        ]))
      ]),
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Row(
            children: [
              const Text("    "),
              Text(
                "     ${accs['platform']} Passwords",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis),
              )
            ],
          )),
    );
  }
}
