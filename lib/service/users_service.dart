// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_application_banca/entities/Data_Users.dart';
import 'package:http/http.dart' as http;

final _client = http.Client();
var _usersUrl = Uri.parse('https://banca-movil.herokuapp.com/api/users');

class UsersServices {
  Future<List<Users>> obtenerAll() async {
    http.Response response = await _client.get(_usersUrl);
    if (response.statusCode == 200) {
      final decode = await json.decode(response.body);
      var lst = <Users>[];
      for (var user in decode[0]['users']) {
        var pl = Users.fromJson(user);
        lst.add(pl);
        print(user);
      }
      return lst;
    }
    return [];
  }
}
