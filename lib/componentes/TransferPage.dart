// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PageTransfer extends StatefulWidget {
  const PageTransfer({Key? key}) : super(key: key);

  @override
  State<PageTransfer> createState() => _PageTransferState();
}

class _PageTransferState extends State<PageTransfer> {
  final _controller = TextEditingController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      //print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('');
  }

  void _validationPage(BuildContext context) async {
    // ignore: prefer_is_empty
    if (_controller.text.length > 0) {
      final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("ALERT!!!"),
          content: const Text("¿Seguro que deseas cancelar la operación?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                "No",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                "Si",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );
      if (result ?? true) {
        Navigator.of(context).pop();
      }
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _validationPage(context);
        return Future.value(false);
      },
      child: Scaffold(
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
            const Icontransfer(),
            Container(
              height: 340,
              width: 300,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        labelText: "Monto a Depositar",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
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
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        EasyLoading.show(status: 'loading...');
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
      ),
    );
  }
}

class Icontransfer extends StatelessWidget {
  const Icontransfer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
