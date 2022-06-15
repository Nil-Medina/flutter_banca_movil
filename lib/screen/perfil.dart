import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:flutter_banca_movil/componentes/BarNavigationHome.dart';

class PagePerfil extends StatelessWidget {
  const PagePerfil({Key? key}) : super(key: key);

  void _backpage(BuildContext context) async {
    Navigator.pop(context);
  }

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
                decoration: BoxDecoration(
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
                        image: DecorationImage(
                          image: AssetImage("assets/images/perfilpreview.png"),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                      "Jean Pierre Vasquez",
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
                color: Color.fromARGB(255, 56, 55, 55),
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("NOTIFICACIONES",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              //Alignment.topLeft,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromARGB(255, 56, 55, 55),
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Registro de transacciones",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              //Alignment.topLeft,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Color.fromARGB(255, 56, 55, 55),
                padding: EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Registro de Retiro",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              //Alignment.topLeft,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}