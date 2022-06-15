// ignore_for_file: prefer_final_fields, unused_field, unnecessary_string_escapes

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_banca/view/inicio.dart';
import 'package:flutter_application_banca/view/login.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static final _client = http.Client();

  static var _loginUrl =
      Uri.parse('https://banca-movil.herokuapp.com/api/login');

  static var _registerUrl =
      Uri.parse('https://banca-movil.herokuapp.com/api/register');

  static login(email, password, context) async {
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
        print(jsonDecode(response.body));
        var json = jsonDecode(response.body);
        if (json[0] == 'success' /*|| json[0] != null*/) {
          /*if () {
            
          } else {
          }*/
          //storage.write(key: "jwt", value: json[0]);
          await EasyLoading.showSuccess("Bienvenido");
          await Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
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

  static register(
      email, password, password2, name, lastname, dni, number, context) async {
    if (name == null || name == '') {
      await EasyLoading.showError("Los campos estan vacios");
    } else if (lastname == null || lastname == '') {
      EasyLoading.showError("Complete todos los campos vacios");
    } else if (dni == null || dni == '') {
      EasyLoading.showError("Complete todos los campos vacios");
    } else if (number == null || number == '') {
      EasyLoading.showError("Complete todos los campos vacios");
    } else if (email == null || email == '') {
      EasyLoading.showError("Complete todos los campos vacios");
    } else if (password == null || password == '') {
      EasyLoading.showError("Complete todos los campos vacios");
    } else {
      http.Response response = await _client.post(
        _registerUrl,
        body: {
          "email": email,
          "password": password,
          "password2": password2,
          "name": name,
          "lastname": lastname,
          "dni": dni,
          "number": number
        },
      );
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (name == null ||
            lastname == null ||
            email == null ||
            password == null) {
          await EasyLoading.showError("Los campos estan vacios");
        } else if (json[0] == 'Email ya registrado') {
          EasyLoading.showError(json[0]);
        } else if (json[0] ==
            '\"name\" length must be at least 5 characters long') {
          EasyLoading.showError("Ingresa tu nombre completo");
        } else if (json[0] ==
            '\"name\" length must be less than or equal to 12 characters long') {
          EasyLoading.showError("Ingresa tu apellido en el campo 'Apellido'");
        } else if (json[0] ==
            '\"lastname\" length must be at least 7 characters long') {
          EasyLoading.showError("Ingresa tu apellido completo");
        } else if (json[0] ==
                '\"dni\" must be larger than or equal to 9999999' ||
            json[0] == '\"dni\" must be less than or equal to 99999999') {
          EasyLoading.showError("Ingresa tu DNI correctamente");
        } else if (json[0] ==
                '\"number\" must be larger than or equal to 99999999' ||
            json[0] == '\"number\" must be less than or equal to 999999999') {
          EasyLoading.showError("Ingresa tu numero de celular correctamente");
        } else if (json[0] ==
                '\"email\" length must be at least 6 characters long' ||
            json[0] == '\"email\" must be a valid email') {
          EasyLoading.showError("Debe ser un correo electrónico válido");
        } else if (json[0] ==
            '\"password\" length must be at least 6 characters long') {
          EasyLoading.showError(
              "La longitud de la contraseña debe tener al menos 6 caracteres");
        } else if (json[0] == 'password not match') {
          EasyLoading.showError("La contraseña no coincide");
        } else {
          await EasyLoading.showSuccess(json[0]);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyLoginPage()));
        }
      } else {
        await EasyLoading.showError(
            "Error Code : ${response.statusCode.toString()}");
      }
    }
  }
}
