import 'dart:async';
import 'dart:io';
//import 'package:flutter_application_banca/entities/auth.dart';
//import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_application_banca/screen/inicio.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'componentes/BarNavigationHome.dart';
import 'screen/registro.dart';

void main() {
  runApp(const MyApp());
  configLoading();
  Firebase.initializeApp();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Banca Movil',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
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
          //physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            TitleLogin(),
            SizedBox(
              height: 0,
            ),
            TextFieldUserPass(),
          ],
        ),
        backgroundColor: Colors.blueAccent,
        //floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 12,
          mini: true,
          onPressed: () async {
            _backCall(context);
          },
          disabledElevation: 0,
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
          "INFORMACION",
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
      height: 250,
      width: 400,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white, Colors.blueAccent]),
      ),
      alignment: Alignment.center,
      child: const Text(
        "BANCA MOVIL",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TextFieldUserPass extends StatefulWidget {
  const TextFieldUserPass({Key? key}) : super(key: key);

  @override
  State<TextFieldUserPass> createState() => _TextFieldUserPassState();
}

class _TextFieldUserPassState extends State<TextFieldUserPass> {
  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;

  bool _isObscure = true;

  Timer? _timer;

  final focus = FocusNode();

  //final AuthServer _auth = AuthServer();

  /*void _login(BuildContext context) async {
    print("""__emailcontroller ${_emailcontroller.text}
__passwordcontroller ${_passwordcontroller.text}
                """);
    //EasyLoading.show(status: "Loading....");
    /*Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Home()));*/
  }*/

  _iniciarsesion(String emailInput, String passInput) async {
    try {
      if (emailInput.isEmpty) {
        EasyLoading.showInfo('Ingrese el correo y la contraseña');
      } else if (passInput.isEmpty) {
        EasyLoading.showInfo('Ingrese la contraseña');
      } else {
        if (emailInput.contains("@")) {
          EasyLoading.show(status: "Loading....");
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailInput,
            password: passInput,
          );
          EasyLoading.showSuccess('Bienvenido!');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
          //EasyLoading.dismiss();
          _emailcontroller.clear();
          _passwordcontroller.clear();
        } else {
          EasyLoading.showError('Correo Electronico no valido');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        EasyLoading.showInfo("El correo electronico no esta registrado");
        //print("Usuario no registrado con ese correo electronico");
      } else if (e.code == 'wrong-password') {
        EasyLoading.showError('Contraseña Incorrecta');
        //print("Contraseña Incorrecta");
      }
    }
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    super.initState();
    EasyLoading.addStatusCallback((status) {
      //print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    //EasyLoading.showSuccess('');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Transform.translate(
        offset: const Offset(0, -30),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 360,
                //width: 320,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          controller: _emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 28,
                            ),
                            fillColor: Colors.black,
                            labelText: "Correo Electronico",
                            hintText: "ejemplo@correo.com",
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          textInputAction: TextInputAction.next,
                          onSubmitted: (v) {
                            FocusScope.of(context).requestFocus(focus);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          focusNode: focus,
                          controller: _passwordcontroller,
                          autocorrect: true,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            icon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 28,
                            ),
                            fillColor: Colors.black,
                            labelText: "Contraseña",
                            hintText: "Contraseña",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            labelStyle: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          /*login(_emailcontroller.text.toString(),
                              _passwordcontroller.text.toString());*/
                          _iniciarsesion(_emailcontroller.text.toString(),
                              _passwordcontroller.text.toString());
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          //padding: const EdgeInsets.all(0),
                          child: const Center(
                            child: Text(
                              "INICIAR SESION",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
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
                            "¿Olvidaste tu Correo o Contraseña?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "¿No tienes cuenta?",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PagRegistro(),
                                ),
                              );
                            },
                            child: const Text(
                              "Registrate Aqui",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
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
          ),
        ),
      ),
    );
  }
}
