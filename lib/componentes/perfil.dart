import 'package:flutter/material.dart';

class PagePerfil extends StatelessWidget {
  const PagePerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.3, 0),
          child: const Text(
            "PERFIL",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 550,
            width: 300,
            decoration: const BoxDecoration(color: Colors.grey),
            child: const Center(
              child: Text(
                "Proximamente",
                style: TextStyle(fontSize: 40),
              ),
            ),
          )
        ],
      ),
    );
  }
}
