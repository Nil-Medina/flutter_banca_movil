import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_banca/view/inicio.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  State<Notifications> createState() => _NotificacionesNew();
}

class _NotificacionesNew extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    Home:
    Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.move_down),
        title: const Center(child: Text("Registro de Retiro")),
        backgroundColor: Colors.black,

        //titleTextStyle: Colors.black,
        //backgroundColor: Colors.black,
      ),
    );
    final PageController controller = PageController();
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: const <Widget>[
        Card(
          color: Color.fromARGB(202, 155, 155, 155),
          /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),*/
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ListTile(
                tileColor: Color.fromARGB(96, 64, 7, 155),
                contentPadding: const EdgeInsets.all(12),
                /*shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),*/
                leading: const Icon(
                  Icons.notification_important_outlined,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                title: Text("PRONTO NUEVA SUCURSAL"),
                subtitle: Text("2 de julio del 2022 - 11:12 am"),
                iconColor: Colors.white,
                textColor: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        Card(
          color: Color.fromARGB(202, 155, 155, 155),
          /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),*/
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ListTile(
                tileColor: Color.fromARGB(96, 64, 7, 155),
                contentPadding: const EdgeInsets.all(12),
                /* shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),*/
                leading: const Icon(
                  Icons.important_devices,
                  size: 40,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                title: Text("SE VIENE NUEVAS ACTUALIZACIONES"),
                subtitle: Text("2 de julio del 2022 - 11:12 am"),
                iconColor: Colors.white,
                textColor: Color.fromARGB(255, 255, 255, 255)),
          ),
        )
      ],
    );
  }
}
