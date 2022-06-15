//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_banca/service/http_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PagRegistro extends StatefulWidget {
  const PagRegistro({Key? key}) : super(key: key);

  @override
  State<PagRegistro> createState() => _PagRegistroState();
}

class _PagRegistroState extends State<PagRegistro> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _apecontroller = TextEditingController();
  final TextEditingController _dnicontroller = TextEditingController();
  final TextEditingController _numtelefcontroller = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    _apecontroller.dispose();
    _numtelefcontroller.dispose();
    _dnicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: const Alignment(-0.4, 0),
          child: const Text(
            "CREAR CUENTA",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            scrollDirection: Axis.vertical,
            //physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(
                height: 290,
                width: 20,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blueAccent,
                  Colors.white,
                  Colors.blueAccent
                ])),
                alignment: Alignment.center,
                child: Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/icons/logoregistro.png",
                      width: 170,
                      height: 170,
                      scale: 1.0,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -40),
                child: Center(
                  child: SingleChildScrollView(
                    //physics: const ScrollPhysics(),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _namecontroller,
                                    keyboardType: TextInputType.name,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.account_box_rounded,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                      fillColor: Colors.black,
                                      labelText: "Nombre Completo",
                                      hintText: "",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _apecontroller,
                                    keyboardType: TextInputType.name,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.account_box_rounded,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                      fillColor: Colors.black,
                                      labelText: "Apellido Completo",
                                      hintText: "",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _dnicontroller,
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.chrome_reader_mode_rounded,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                      fillColor: Colors.black,
                                      labelText: "DNI",
                                      hintText: "",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _numtelefcontroller,
                                    keyboardType: TextInputType.number,
                                    autocorrect: true,
                                    decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                        size: 28,
                                      ),
                                      fillColor: Colors.black,
                                      labelText: "Número Telefonico",
                                      hintText: "",
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextField(
                                    controller: _passwordcontroller,
                                    obscureText: _isObscure,
                                    autocorrect: false,
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
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    var email =
                                        _emailcontroller.text.toString();
                                    var password =
                                        _passwordcontroller.text.toString();
                                    var name = _namecontroller.text.toString();
                                    var lastname =
                                        _apecontroller.text.toString();
                                    var dni = _dnicontroller.text.toString();
                                    var number =
                                        _numtelefcontroller.text.toString();
                                    EasyLoading.show(status: '...Loading');
                                    HttpService.register(email, password, name,
                                        lastname, dni, number, context);
                                  },
                                  child: Container(
                                    width: 140,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Registrar",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
