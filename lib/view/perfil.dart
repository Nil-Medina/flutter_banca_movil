import 'package:flutter/material.dart';
import 'package:flutter_application_banca/view/Notification.dart';
import 'package:flutter_application_banca/view/RegTransaccion.dart';
import 'package:flutter_application_banca/view/Retiros.dart';

//import 'package:flutter_banca_movil/componentes/BarNavigationHome.dart';

class PagePerfil extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final dataperfil;
  final int index;
  const PagePerfil({
    Key? key,
    this.dataperfil,
    required this.index,
  }) : super(key: key);

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  /*void _backpage(BuildContext context) async {
    Navigator.pop(context);
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("PERFIL ")),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/lugar.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/perfilpreview.png"),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                  ),
                  Text(
                    widget.dataperfil[widget.index]['name'] +
                        ' ' +
                        widget.dataperfil[widget.index]['lastname'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              child: Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifications()),
                    );
                  },
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: const Icon(
                            Icons.notification_add,
                            color: Colors.green,
                            size: 35,
                          ),
                        ),
                        const Text(
                          "Notificaciones",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Container(
              // color: Color.fromARGB(179, 138, 116, 180),
              //padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegTransferencia()),
                    );
                  },
                  child: Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: const Icon(
                            Icons.handshake,
                            color: Colors.green,
                            size: 35,
                          ),
                        ),
                        const Text(
                          "Registro de transferencia ",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Retiro()),
                    );
                  },
                  child: Container(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: const Icon(
                            Icons.move_down,
                            color: Colors.green,
                            size: 35,
                          ),
                        ),
                        const Text(
                          "Registro de Retiro",
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 120,
            ),

            /////////////////// REDES
            ///
            ///
            Transform.translate(
              offset: const Offset(0, -60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Notifications()),
                      );
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          /*const SizedBox(
                            height: 3,
                          ),*/
                          const Text(
                            "facebook",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegTransferencia()),
                      );
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 3,
                          ),
                          const Text(
                            "Youtube",
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
