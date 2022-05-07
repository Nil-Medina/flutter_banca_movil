//
import 'package:flutter/material.dart';

class PageTransfer extends StatelessWidget {
  const PageTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.4, 0),
          child: const Text(
            "Zona de Transferencia",
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
        //shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 190,
            width: 300,
            decoration: const BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset(
                  "assets/icons/icontransfer.png",
                  width: 140,
                  height: 140,
                  scale: 1.0,
                ),
              ),
            ),
          ),
          Container(
            height: 340,
            width: 300,
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      labelText: "Monto a Pagar",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    //textInputAction: TextInputAction.continueAction,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      labelText: "Correo Electronico",
                      labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BarNavegationHome()),
                    );*/
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        "Confirmar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
