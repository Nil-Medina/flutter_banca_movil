// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_banca/entities/Data_Users.dart';
import 'package:flutter_application_banca/service/users_service.dart';

class UsersProvider extends ChangeNotifier {
  late List<Users> users;

  Future<List<Users>> obtenerUsers() async {
    if (users != null) {
      return users;
    }

    var service = UsersServices();
    users = await service.obtenerAll();
    notifyListeners();
    return users;
  }

  Future<List<Users>> refreshUsers() async {
    var service = UsersServices();
    users = await service.obtenerAll();
    notifyListeners();
    return users;
  }
}
