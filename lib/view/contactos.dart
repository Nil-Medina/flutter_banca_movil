//import 'dart:async';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_banca/view/contactos.dart';

import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  State<Contact> createState() => _ContactNew();
}

class _ContactNew extends State<Contact> {
  List<Contact> contacts = []; //opcional
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Mi contactos")),
            backgroundColor: Colors.black,

            //titleTextStyle: Colors.black,
            //backgroundColor: Colors.black,
          ),
          body: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.face_outlined),
                      title: Text('Alexander Gonza caceres'),
                      tileColor: Color.fromARGB(138, 29, 28, 28),
                      subtitle: Text('+51 901576482'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.face),
                      title: Text('Susana Aguila Mendoza'),
                      tileColor: Colors.green,
                      subtitle: Text('+51 909754482'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.face),
                      title: Text('Hector  Lopez Casas'),
                      tileColor: Colors.green,
                      subtitle: Text('+51 99547482'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.face),
                      title: Text('Carlos Lora Puma'),
                      tileColor: Colors.green,
                      subtitle: Text('+51 987646482'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: Icon(Icons.face),
                      title: Text('Gerson Lozano Flores'),
                      tileColor: Colors.green,
                      subtitle: Text('+51 905874682'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 12,
            mini: true,
            onPressed: () async {
              _backCall(context);
            },
            disabledElevation: 0,
            backgroundColor: Colors.black,
            tooltip: 'call',
            child: const Icon(Icons.phone),
          ),
        ));
  }
}

void _backCall(BuildContext context) async {
  final result = await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        "INFORMACION",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      content: const Text("¿Desea agregar un nuevo contacto?."),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            "Cancelar",
            style: TextStyle(
              //fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            "Ok",
            style: TextStyle(
              //fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    ),
  );
  if (result ?? false) {
    // ignore: deprecated_member_use
    await launch("tel:$num");
  }
}
