import 'package:flutter/material.dart';

class PagRegistro extends StatelessWidget {
  const PagRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.3, 0),
          child: const Text(
            "CREAR CUENTA",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 250,
            width: 300,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Container(
            height: 370,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[600]!,
            ),
          )
        ],
      ),
    );
  }
}
