import 'package:flutter/material.dart';
import 'package:flutter_banca_movil/componentes/TransferPage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Colors.grey[800]!,
      backgroundColor: Colors.white,
      body: BodyHome(),
    );
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
          height: 40,
        ),
        BodyButtoms(),
        SizedBox(
          height: 20,
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
      height: 360,
      width: 300,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        //color: Color.fromRGBO(196, 196, 196, 1),
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 400,
            /*decoration: const BoxDecoration(
              color: Colors.white,
            ),*/
            alignment: Alignment.center,
            child: const Text(
              "BIENVENIDO A TU BANCA MOVIL",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
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
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Container(
            height: 110,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Mi Saldo",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "S/20.000",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
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
    return Row(
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
    );
  }
}

class BodyCards extends StatelessWidget {
  const BodyCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
    );
  }
}
