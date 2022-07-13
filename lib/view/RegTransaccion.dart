import 'dart:async';

import 'package:flutter/material.dart';

class RegTransferencia extends StatefulWidget {
  const RegTransferencia({
    Key? key,
  }) : super(key: key);

  @override
  State<RegTransferencia> createState() => _RegTransferenciaNew();
}

class _RegTransferenciaNew extends State<RegTransferencia> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.handshake),
          title: const Center(
              child: Text(
            "GIROS",
          )),
          backgroundColor: Colors.black,

          //titleTextStyle: Colors.black,
          //backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.check),
              title: Text("RECIENTE"),
              iconColor: Colors.blue,
              textColor: Color.fromARGB(137, 47, 1, 90),
            ),
            const SizedBox(
              height: 25,
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                height: 270,
                width: 800,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Card(
                      color: Color.fromARGB(202, 155, 155, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ListTile(
                          tileColor: Colors.blue[300]!,
                          contentPadding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: const Icon(
                            Icons.fire_hydrant_alt_sharp,
                            size: 40,
                            color: Colors.black,
                          ),
                          title: const Text(
                            "Alexander Gonza caceres",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.5),
                          ),
                          subtitle: const Text(
                            'Envió 200 soles - 12 de julio / 09:20 am',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      color: Color.fromARGB(202, 155, 155, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: ListTile(
                          tileColor: Color.fromARGB(255, 164, 241, 241),
                          contentPadding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          //shape: Border.all(color: Colors.grey, width: 5),
                          leading: const Icon(
                            Icons.photo_camera_front_rounded,
                            size: 40,
                            color: Colors.black,
                          ),
                          title: const Text(
                            "Susana Aguila Mendoza",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: const Text(
                            'Envió 10 soles - 11 de julio / 11:20 am',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
