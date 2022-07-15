//
// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:flutter_application_banca/view/inicio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PagVerifications extends StatefulWidget {
  const PagVerifications({Key? key}) : super(key: key);

  @override
  State<PagVerifications> createState() => _PagVerificationsState();
}

class _PagVerificationsState extends State<PagVerifications> {
  @override
  void initState() {
    super.initState();
    //EasyLoading.showSuccess('');
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.0, 0),
          child: const Text(
            "Transferencia",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
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
            height: 220,
            width: 300,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 166.5,
                  height: 140,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/conitodecelebracion.png",
                      width: 140,
                      height: 140,
                      scale: 1.0,
                    ),
                  ),
                ),
                Container(
                  width: 177,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  child: const Center(
                    child: Text(
                      '¡FELICITACIONES!',
                      style: TextStyle(
                        fontSize: 21,
                        color: Color.fromARGB(207, 24, 22, 21),
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2.5, 6.0),
                            blurRadius: 8.0,
                            color: Color.fromARGB(102, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 258,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(
              child: Container(
                height: 216,
                width: 318,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color.fromARGB(179, 158, 158, 158),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 255,
                      height: 50,
                      child: const Text(
                        'Para: kevin@gmail.com',
                        style: TextStyle(fontSize: 21),
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 255, 255, 255),
                      ),
                    ),
                    Container(
                      width: 255,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 191, 192, 197),
                      ),
                      child: const Text("Monto:150",
                          style: TextStyle(fontSize: 21)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 135,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(0, 63, 81, 181),
                          ),
                          child: const Text("Fecha:13/07/2022",
                              style: TextStyle(fontSize: 21)),
                        ),
                        Container(
                          width: 88,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(0, 63, 81, 181),
                          ),
                          child: const Text("Hora:8:40 am",
                              style: TextStyle(fontSize: 21)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 130,
            width: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      //EasyLoading.show(status: 'loading...');
                      //Navigator.push(
                      //context,
                      //MaterialPageRoute(builder: (context) => const Home()),
                      //);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 33),
                      child: const Text(
                        "Volver",
                        style: TextStyle(
                            fontSize: 20.3,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
