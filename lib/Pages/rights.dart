import 'package:flutter/material.dart';

class rights extends StatelessWidget {
  const rights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            const Text(
              "Made By :",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            RotationTransition(
                turns: const AlwaysStoppedAnimation(90 / 360),
                child: Container(
                  padding: const EdgeInsets.only(left: 50),
                  margin: const EdgeInsets.only(top: 40),
                  height: 200,
                  child: const ListTile(
                    title: Text(
                      'Ilias',
                      style: TextStyle(
                          fontSize: 70, letterSpacing: 5, color: Colors.white),
                    ),
                  ),
                )),
            RotationTransition(
                turns: const AlwaysStoppedAnimation(90 / 360),
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  height: 200,
                  child: const ListTile(
                    title: Text(
                      'Zaazaa',
                      style: TextStyle(
                          fontSize: 70, letterSpacing: 5, color: Colors.white),
                    ),
                  ),
                )),
            const SizedBox(
              height: 140,
            ),
            Row(
              children: const [
                Icon(
                  Icons.copyright,
                  color: Colors.grey,
                ),
                Text(
                  "  All Rights Reserved",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ));
  }
}
