import 'dart:async';

import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  State<Notifications> createState() => _NotificacionesNew();
}

class _NotificacionesNew extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.notification_add),
        title: const Center(child: Text("NOTIFICACIONES")),
        backgroundColor: Colors.black,

        //titleTextStyle: Colors.black,
        //backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          /*ListTile(
            leading: Icon(Icons.notification_add),
            title: Text("NOVEDADES"),
            iconColor: Colors.blue,
            textColor: Color.fromARGB(137, 47, 1, 90),
          ),*/
          Card(
              color: Color.fromARGB(183, 43, 166, 214),
              child: SizedBox(
                width: 200,
                height: 100,
                child: Text(
                  "¡Pronto se aperturá un nuevo locar cerca a ti!",
                  style: TextStyle(color: Colors.black87),
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Card(
              color: Color.fromARGB(183, 43, 166, 214),
              child: SizedBox(
                width: 200,
                height: 100,
                child: Text(
                  "¡Pronto se aperturá un nuevo locar cerca a ti!",
                  style: TextStyle(color: Colors.black87),
                ),
              )),
        ],
      ),
    );
    /* MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NOTIFICACIONES")),
          backgroundColor: Colors.black,
        ),
      ),
    );*/
  }
}
