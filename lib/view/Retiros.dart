//import 'dart:async';

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Retiro extends StatefulWidget {
  const Retiro({
    Key? key,
  }) : super(key: key);

  @override
  State<Retiro> createState() => _RetirosNew();
}

class _RetirosNew extends State<Retiro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.move_down),
          title: const Center(child: Text("Registro de Retiro")),
          backgroundColor: Colors.black,

          //titleTextStyle: Colors.black,
          //backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.check),
              title: Text("RECIENTE"),
              iconColor: Colors.blue,
              textColor: Color.fromARGB(137, 47, 1, 90),
            ),
            Card(
              color: const Color.fromARGB(202, 155, 155, 155),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                    tileColor: const Color.fromARGB(96, 64, 7, 155),
                    contentPadding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: const Icon(
                      Icons.near_me,
                      size: 40,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    title: const Text("RETIRO EN TOTAL 10"),
                    subtitle: const Text("2 de julio del 2022 - 11:12 am"),
                    iconColor: Colors.white,
                    textColor: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Card(
              color: const Color.fromARGB(202, 155, 155, 155),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                    tileColor: const Color.fromARGB(96, 64, 7, 155),
                    contentPadding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: const Icon(
                      Icons.near_me,
                      size: 40,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    title: const Text("RETIRO EN TOTAL 10"),
                    subtitle: const Text("2 de julio del 2022 - 11:12 am"),
                    iconColor: Colors.white,
                    textColor: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Card(
              color: const Color.fromARGB(202, 155, 155, 155),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                    tileColor: const Color.fromARGB(96, 64, 7, 155),
                    contentPadding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: const Icon(
                      Icons.near_me,
                      size: 40,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    title: const Text("RETIRO EN TOTAL 10"),
                    subtitle: const Text("2 de julio del 2022 - 11:12 am"),
                    iconColor: Colors.white,
                    textColor: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
