import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recetasappg10/models/screen_model.dart';
import 'package:recetasappg10/pages/home_page.dart';
import 'package:recetasappg10/pages/recipes_page.dart';

class CurveNavigationPage extends StatefulWidget {
  @override
  State<CurveNavigationPage> createState() => _CurveNavigationPageState();
}

class _CurveNavigationPageState extends State<CurveNavigationPage> {
  int _activePageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageDetails[_activePageIndex].title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: pageDetails[_activePageIndex].bgColor,
        elevation: 10,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          ...pageDetails.map((e) => e.icono).toList(),
        ],
        index: _activePageIndex, //setea donde va a inciar el page
        // height: 10,//altura del menu
        color: Color(0xffccd5ae), //color de fondo de la barra
        buttonBackgroundColor:
            pageDetails[_activePageIndex].colorButtonOption, //Color del botón
        backgroundColor: pageDetails[_activePageIndex]
            .bgColor, //Color de fondo (debe ser similar a la pantalla que va a mostrar)
        onTap: (index) {
          _activePageIndex = index;
          setState(() {});
        },
      ),
      body: pageDetails[_activePageIndex].page,
    );
  }
}
