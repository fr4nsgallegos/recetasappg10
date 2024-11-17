import 'package:flutter/material.dart';

class PorcionesCheckWidget extends StatelessWidget {
  String title;
  bool value;
  Function(bool?) onChanged;

  PorcionesCheckWidget({
    required this.title,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 + 20,
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        value: value,

        onChanged: onChanged,
        //personalizando checkboxlistile
        activeColor: Colors.green,
        checkColor: Colors.white,
        // secondary: Icon(
        //   Icons.food_bank,
        //   color: Colors.white,
        // ),
        tileColor: Colors.black.withOpacity(0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        hoverColor: Colors.white,
        selectedTileColor: Colors.blue,
        checkboxShape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(25),
            ), //vuelve circular el checkbox
      ),
    );
  }
}
