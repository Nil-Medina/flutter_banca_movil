import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'componentes/BarNavigationHome.dart';
import 'componentes/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo Banca Movil',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final number = "+01 311 6900";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _closeapplication(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            TitleLogin(),
            SizedBox(
              height: 5,
            ),
            TextFieldUserPass(),
          ],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _backCall(context);
            // ignore: deprecated_member_use
            //await launch("tel:$number");
          },
          backgroundColor: Colors.black,
          tooltip: 'call',
          child: const Icon(Icons.phone),
        ),
      ),
    );
  }

  void _backCall(BuildContext context) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "AVISO",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: const Text(
            "Estas siendo redireccionado a nuestro canal Banca por Telefono."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Cancelar",
              style: TextStyle(
                //fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Ok",
              style: TextStyle(
                //fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
    if (result ?? false) {
      // ignore: deprecated_member_use
      await launch("tel:$number");
    }
  }

  void _closeapplication(BuildContext context) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("SALIDA"),
        content: const Text("¿Deseas salir de la aplicación?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "No",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Si",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
    if (result ?? true) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    }
  }
}

class TitleLogin extends StatelessWidget {
  const TitleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      alignment: Alignment.bottomCenter,
      child: const Text(
        "BANCA MOVIL",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TextFieldUserPass extends StatelessWidget {
  const TextFieldUserPass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 520,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: true,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    labelText: "Correo Electronico",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  //textInputAction: TextInputAction.continueAction,
                ),
                const SizedBox(
                  height: 15,
                ),
                const TextField(
                  autocorrect: true,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BarNavegation()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      "INICIAR SESION",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "¿Olvidaste tu Correo o Clave?",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PagRegistro(),
                        ),
                      );
                    },
                    child: const Text(
                      "Registrate",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //const SizedBox(height: 0),
        /*Container(
          height: 100,
          width: 450,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),*/
      ],
    );
  }
}
