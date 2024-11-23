import 'package:flutter/material.dart';
import 'package:recetasappg10/models/screen_model.dart';

class MenuLateralWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //menu lateral a la izquierda
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(32),
              child: FlutterLogo(
                  // size: 20,
                  ),
            ),
            decoration: BoxDecoration(color: Colors.black),
          ),
          //opciones del menu lateral
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text("Home"),
          //   onTap: () {},
          // )

          ...pageDetails
              .map(
                (e) => ListTile(
                  leading: e.icono,
                  title: Text(e.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => e.page),
                    );
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
