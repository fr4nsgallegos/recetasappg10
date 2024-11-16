import 'package:flutter/material.dart';

class TextfieldPage extends StatelessWidget {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Pafe"),
      ),
      body: Center(
        //TEXTFIELD: Básico para capturar textos
        //Fácil de usar y configurar, se usa donde no se necesita validación ni manejo de estados
        // TextField(
        //   decoration: InputDecoration(labelText: "Nombre"),
        // ),
        //TEXTFORMFIELD
        //Versión mejorada del TextField, se integra con un widget llamado Form, permite la validación y manejor de estados, se puede usasr la propiedad validator para verificar entradas
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ingresa tu correo",
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
