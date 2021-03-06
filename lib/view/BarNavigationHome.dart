// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_banca/view/inicio.dart';

class BarNavegation extends StatefulWidget {
  const BarNavegation({Key? key}) : super(key: key);

  @override
  State<BarNavegation> createState() => _BarNavegationState();
}

class _BarNavegationState extends State<BarNavegation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(
      index: 1,
    ),
    //PagePerfil(),
    /*Text(
      'Index 3: Example',
      style: optionStyle,
    ),*/
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: 'Inicio',
          ),
          /*BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 35,
            ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
              size: 35,
            ),
            label: 'Salir',
          ),*/
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        //unselectedItemColor: Colors.grey[800]!,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
