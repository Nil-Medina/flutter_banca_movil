// ignore_for_file: avoid_print, unnecessary_string_escapes

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_banca/view/inicio.dart';
import 'package:flutter_application_banca/view/registro.dart';
//import 'package:flutter_application_banca/service/http_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final number = "+01 311 6900";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _closeapplication(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              opacity: 230.0,
              fit: BoxFit.fill,
              image: AssetImage("assets/images/fondo.jpg"),
            ),
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white, Colors.blueAccent],
            ),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const <Widget>[
              TitleLogin(),
              SizedBox(
                height: 0,
              ),
              TextFieldUserPass(),
            ],
          ),
        ),
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
      alignment: Alignment.center,
      child: Center(
        child: Image.asset(
          "assets/icons/logoinit.png",
          width: 240,
          height: 240,
        ),
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
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isObscure = true;

  final focus = FocusNode();

  late Map? data;
  late List? usersData;
  final _clientGet = http.Client();
  final _usersUrl =
      Uri.parse('https://banca-movil.herokuapp.com/api/authUsers');

  getuser() async {
    http.Response response = await _clientGet.get(_usersUrl);
    data = json.decode(response.body);
    setState(() {
      usersData = data?['users'];
      for (int index = 0; index < usersData!.length; index++) {
        if (usersData == usersData) {
          print({'Conexion exitosa con la base de usuarios'});
        } else {
          print('Error de conexion');
        }
      }
    });
  }

  static final _client = http.Client();
  static final _loginUrl =
      Uri.parse('https://banca-movil.herokuapp.com/api/login');

  login(email, password, context) async {
    if (email == null || email == '') {
      await EasyLoading.showInfo("Ingrese Correo Electronico y Contraseña");
    } else if (password == null || password == '') {
      EasyLoading.showInfo("Ingrese Contraseña");
    } else {
      http.Response response = await _client.post(
        _loginUrl,
        body: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json[0] == 'success') {
          for (int i = 0; i < usersData!.length; i++) {
            if (email == usersData?[i]['email']) {
              print('Usuario Logueado');
              await EasyLoading.showSuccess("Bienvenido");
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                    datapage: usersData,
                    index: i,
                  ),
                ),
              );
            } else {
              await EasyLoading.showError("Ocurrio un error!");
            }
          }
        } else if (json[0] == '\"email\" must be a valid email') {
          EasyLoading.showInfo("Debe ser un correo electrónico válido");
        } else if (json[0] ==
            '\"password\" length must be at least 6 characters long') {
          EasyLoading.showInfo(
              "La longitud de la contraseña debe tener al menos 6 caracteres");
        } else {
          EasyLoading.showError(json[0]);
        }
      } else {
        await EasyLoading.showError(
            "Error Code : ${response.statusCode.toString()}");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Transform.translate(
        offset: const Offset(0, 20),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(left: 20, right: 20),
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
                          var email = _emailcontroller.text.toString();
                          var password = _passwordcontroller.text.toString();
                          EasyLoading.show(status: '...Loading');
                          login(email, password, context);
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
