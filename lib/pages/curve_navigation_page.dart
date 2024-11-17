import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurveNavigationPage extends StatefulWidget {
  @override
  State<CurveNavigationPage> createState() => _CurveNavigationPageState();
}

class _CurveNavigationPageState extends State<CurveNavigationPage> {
  int _pageIndex = 0;

  List<Widget> _screens = [
    Center(child: Text("Home Page")),
    Center(child: Text("Perfil Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home),
          Icon(Icons.person),
        ],
        index: _pageIndex, //setea donde va a inciar el page
        // height: 10,//altura del menu
        color: Colors.blue, //color de fondo de la barra
        buttonBackgroundColor: Colors.yellow, //Color del botón
        backgroundColor: Colors
            .red, //Color de fondo (debe ser similar a la pantalla que va a mostrar)
        onTap: (index) {
          _pageIndex = index;
          setState(() {});
        },
      ),
      body: _screens[_pageIndex],
    );
  }
}
