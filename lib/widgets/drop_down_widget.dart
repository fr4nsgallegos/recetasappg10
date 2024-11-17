import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  List<String> options;
  // String? opcionSeleccionada;
  final Function(String?) funcionOnChanged;

  DropDownWidget({required this.options, required this.funcionOnChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: DropdownButtonFormField(
        items: options.map((option) {
          return DropdownMenuItem(
            child: Text(option),
            value: option,
          );
        }).toList(),

        // [
        //   DropdownMenuItem(child: Text("JUAN"), value: "JUANITO"),
        //   DropdownMenuItem(child: Text("PEDRO"), value: "PEDRITO"),
        //   DropdownMenuItem(child: Text("LUIS"), value: "LUISITO"),
        // ],

        onChanged: funcionOnChanged,
        //DECORACIÓN
        decoration: InputDecoration(
          labelText: "Selecciona el tipo de plato",
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        dropdownColor: Color(0xfff3D4622),
        style: TextStyle(color: Colors.white),
        icon: Icon(Icons.arrow_drop_down_circle),
        menuMaxHeight: 200,
      ),
    );
  }
}
