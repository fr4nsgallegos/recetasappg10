import 'package:flutter/material.dart';
import 'package:recetasappg10/widgets_pages/list_view_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewPage(),
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
