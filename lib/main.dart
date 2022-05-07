import 'package:flutter/material.dart';
import 'package:flutter_banca_movil/componentes/PageExample1.dart';
import 'package:flutter_banca_movil/componentes/inicio.dart';

//import 'componentes/PagExample1.dart';
//import 'componentes/PagExample2.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const page1()));
        },
        backgroundColor: Colors.black,
        tooltip: 'call',
        child: const Icon(Icons.phone),
      ),
    );
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
                      MaterialPageRoute(builder: (context) => const Home()),
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
                    onPressed: () {},
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
