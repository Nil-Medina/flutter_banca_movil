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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NOTIFICACIONES")),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
