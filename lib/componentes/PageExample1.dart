//
import 'package:flutter/material.dart';
import 'package:flutter_banca_movil/componentes/inicio.dart';

class BarNavegationHome extends StatefulWidget {
  const BarNavegationHome({Key? key}) : super(key: key);

  @override
  State<BarNavegationHome> createState() => _BarNavegationHomeState();
}

class _BarNavegationHomeState extends State<BarNavegationHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 2: Perfil',
      style: optionStyle,
    ),
    Text(
      'Index 3: Example',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Salir',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[800]!,
        backgroundColor: const Color.fromRGBO(196, 196, 196, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
