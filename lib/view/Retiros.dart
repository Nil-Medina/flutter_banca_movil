import 'dart:async';

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
          title: const Center(child: Text("RETIROS")),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
