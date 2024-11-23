import 'package:flutter/material.dart';
import 'package:recetasappg10/pages/calculator_page.dart';
import 'package:recetasappg10/pages/curve_navigation_page.dart';
import 'package:recetasappg10/pages/home_page.dart';
import 'package:recetasappg10/pages/recipes_page.dart';
import 'package:recetasappg10/widgets_pages/list_view_page.dart';
import 'package:recetasappg10/widgets_pages/scroll_page.dart';
import 'package:recetasappg10/widgets_pages/textfield_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: CalculatorPage(
          // bgColor: Colors.blueAccent,
          ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // "/": (context) => TextfieldPage(),
        // "/second": (context) => HomePage(),
        // "/third": (context) => ScrollPage(correo: ,)
      },
    ),
  );
}
