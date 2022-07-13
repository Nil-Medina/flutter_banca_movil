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
          title: const Center(child: Text("REGISTROS")),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
