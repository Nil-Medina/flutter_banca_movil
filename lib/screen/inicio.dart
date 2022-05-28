import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_banca/screen/TransferPage.dart';
import 'package:flutter_application_banca/screen/perfil.dart';
import 'package:flutter_application_banca/main.dart';

//import 'package:flutter_banca_movil/main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _validationback(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Center(child: Text("INICIO")),
          leading: TextButton(
            onPressed: () {
              _validationback(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset(
                "assets/icons/turnoff.png",
                scale: 1.0,
                height: 30,
                width: 30,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PagePerfil(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ))
          ],
        ),
        //backgroundColor: Colors.grey[800]!,
        backgroundColor: Colors.white,
        body: const BodyHome(),
      ),
    );
  }

  void _validationback(BuildContext context) async {
    final result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          "ALERTA!",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: const Text("¿Seguro que deseas salir?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "No",
              style: TextStyle(
                //fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Si",
              style: TextStyle(
                //fontSize: 20,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
    if (result ?? true) {
      await FirebaseAuth.instance.signOut().then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      });
    }
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: const <Widget>[
        TitleBody(),
        SizedBox(
          height: 0,
        ),
        BodyButtoms(),
        SizedBox(
          height: 0,
        ),
        BodyCards(),
      ],
    );
  }
}

class TitleBody extends StatelessWidget {
  const TitleBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
      width: 300,
      //alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        //color: Color.fromRGBO(196, 196, 196, 1),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.white, Colors.blueAccent],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          /*Container(
            height: 50,
            width: 450,
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(color: Colors.black),
            child: TextButton(
              onPressed: () {
                _validationback(context);
              },
              child: Container(
                //height: 50,
                //width: 34,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Image.asset(
                  "assets/icons/turnoff.png",
                  //width: 5,
                  //height: 5,
                  scale: 1.0,
                ),
              ),
            ),
          ),*/
          /*const SizedBox(
            height: 5,
          ),*/
          Container(
            width: 400,
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              "BIENVENIDO A TU BANCA MOVIL",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/perfilpreview.png",
                width: 120,
                height: 120,
                scale: 1.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Jean Pierre Vasquez",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Container(
            height: 100,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Mi Saldo",
                  style: TextStyle(
                    fontSize: 27.5,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "S/200.00",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BodyButtoms extends StatelessWidget {
  const BodyButtoms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageTransfer()),
              );
            },
            child: Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.repeat,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "TRANSFERIR",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.supervisor_account_rounded,
                      color: Colors.black,
                      size: 55,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    "CONTACTOS",
                    style: TextStyle(color: Colors.white),
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

class BodyCards extends StatelessWidget {
  const BodyCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: Container(
        height: 270,
        width: 300,
        /*decoration: const BoxDecoration(
          color: Colors.grey,
        ),*/
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  tileColor: Colors.blue[300]!,
                  contentPadding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  leading: const Icon(
                    Icons.credit_card,
                    size: 40,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "CUENTA FREE",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
                  ),
                  subtitle: const Text(
                    'Saldo Disponible: S/.0.00',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ListTile(
                  tileColor: Colors.tealAccent[400]!,
                  contentPadding: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //shape: Border.all(color: Colors.grey, width: 5),
                  leading: const Icon(
                    Icons.add_card,
                    size: 40,
                    color: Colors.black,
                  ),
                  title: const Text(
                    "CUENTA PREMIUM",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: const Text(
                    'Apertura tu Cuenta Aqui',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
