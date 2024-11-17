import 'package:flutter/material.dart';
import 'package:recetasappg10/widgets_pages/list_view_page.dart';

class HomePage extends StatelessWidget {
  Color bgColor;
  HomePage({required this.bgColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   title: Text("Home Page"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewPage(
                      bgColor: Colors.white,
                    ),
                  ),
                );
              },
              child: Text("Ir a otra pantalla"),
            ),
          ],
        ),
      ),
    );
  }
}
