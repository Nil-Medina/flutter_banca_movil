//
import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    required this.email,
    required this.password,
    required this.data,
  });

  String email;
  String password;
  Data data;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        password: json["password"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.lastname,
    required this.number,
    required this.dni,
    required this.saldo,
  });

  String name;
  String lastname;
  String number;
  String dni;
  String saldo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        lastname: json["lastname"],
        number: json["number"],
        dni: json["dni"],
        saldo: json["saldo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "number": number,
        "dni": dni,
        "saldo": saldo,
      };
}
