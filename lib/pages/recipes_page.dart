import 'package:flutter/material.dart';
import 'package:recetasappg10/widgets/drop_down_widget.dart';
import 'package:recetasappg10/widgets/form_item_widget.dart';

class RecipesPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _preparationController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final List<String> _options = ["Entrada", "Plato de fondo", "Postre"];
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff606c38),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Formulario de Receta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xff606c38),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ////CREAR FORM DONDE PUEDA LLENAR TITULO, PREPARACIÓN, URL DE LA IMAGEN.
              ///CRITERIOS PARA EL VALIDATOR
              ///TÍTULO: NO SEA NULL NI EMPEY Y AL MENOS 5 CARACTERES
              ///PREPARACIÓN: NO SEA NILL NI EMPTY Y AL MENOS 20 CARACTERES
              ///URL: NO SEA NULL NI EMPETY Y AL MENOS 10 CARACTERES
              ///
              FormItemWidget(
                  controller: _titleController,
                  hint: "Ingresa el título",
                  icon: Icons.title),
              FormItemWidget(
                controller: _preparationController,
                hint: "Ingresa la preparación",
                icon: Icons.list,
                maxLines: 3,
              ),
              FormItemWidget(
                  controller: _urlController,
                  hint: "Ingresa la url de la imagen",
                  icon: Icons.image),

              DropDownWidget(
                options: _options,
                funcionOnChanged: (value) {
                  _selectedOption = value;
                },
              ),

              Center(
                child: Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      String title = _titleController.text.trim();
                      String preparation = _preparationController.text.trim();
                      String url = _urlController.text.trim();

                      if (title.isEmpty || title.length < 5) {
                        showError(context,
                            'El título debe tener al menos 5 caracteres.');
                        return;
                      }
                      if (preparation.isEmpty || preparation.length < 20) {
                        showError(context,
                            'La preparación debe tener al menos 20 caracteres.');
                        return;
                      }
                      if (url.isEmpty || url.length < 10) {
                        showError(context,
                            'La URL debe tener al menos 10 caracteres.');
                        return;
                      }

                      if (_selectedOption == null) {
                        showError(context, "Seleccione el tipo de plato");
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario válido')),
                      );
                    },
                    child: Text('Guardar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: TextStyle(color: Colors.red))),
    );
  }
}
