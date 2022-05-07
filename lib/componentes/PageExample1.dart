//
import 'package:flutter/material.dart';

class page1 extends StatelessWidget {
  const page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Pagina de Prueba",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
