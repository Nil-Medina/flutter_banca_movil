import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800]!,
      body: const BodyHome(),
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
          height: 10,
        ),
        BodyButtoms(),
        SizedBox(
          height: 5,
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
      height: 290,
      width: 300,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(196, 196, 196, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
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
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hola, Jean Pierre",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 10,
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
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "S/20 000",
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
        children: const <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                //tileColor: Color(0xFAA35678),
                leading: Icon(
                  Icons.credit_card,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  "CUENTA FREE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  'Saldo Disponible: S/.0.00',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                tileColor: Colors.white,
                //shape: Border.all(color: Colors.grey, width: 5),
                leading: Icon(
                  Icons.add_card,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  "CUENTA PREMIUM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
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
