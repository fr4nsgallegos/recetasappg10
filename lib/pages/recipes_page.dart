import 'package:flutter/material.dart';
import 'package:recetasappg10/models/receta_model.dart';
import 'package:recetasappg10/widgets/drop_down_widget.dart';
import 'package:recetasappg10/widgets/form_item_widget.dart';
import 'package:recetasappg10/widgets/porciones_check_widget.dart';
import 'package:recetasappg10/widgets/receta_card_widget.dart';

class RecipesPage extends StatefulWidget {
  Color bgColor;
  RecipesPage({required this.bgColor});
  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _preparationController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final List<String> _options = ["Entrada", "Plato de fondo", "Postre"];

  String? _selectedOption;

  bool _conPapa = false;
  bool _conCamote = false;
  RecetaModel recetaModel = RecetaModel(
      title: "Lomo Saltado",
      recipe:
          "El Lomo Saltado peruano, también conocido como bistec salteado, es un plato de fusión muy popular que mezcla las tradiciones chinas del salteado con ingredientes peruanos que incluyen ají amarillo, cilantro y tomate. Este abundante plato principal suele ir acompañado de un esponjoso arroz blanco y papas fritas. Puedes sentirte libre de combinar esta receta de Lomo Saltado Peruano con tus guarniciones favoritas para crear tus propias fusiones culturales en la mesa. Aprende a hacer Lomo Saltado ahora con esta receta y a disfrutar.",
      urlImage:
          "https://images.pexels.com/photos/28503582/pexels-photo-28503582.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      type: "Plato de fondo",
      withPapa: true,
      withCamote: false);
  List<RecetaModel> recetasList = [];

  @override
  void initState() {
    recetasList.add(recetaModel);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.bgColor,
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'Formulario de Receta',
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   ),
        //   backgroundColor: Color(0xff606c38),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  'Formulario de Receta',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: 16,
              ), ////CREAR FORM DONDE PUEDA LLENAR TITULO, PREPARACIÓN, URL DE LA IMAGEN.
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PorcionesCheckWidget(
                      title: "Papa",
                      value: _conPapa,
                      onChanged: (value) {
                        _conPapa = value ?? false;
                        setState(() {});
                      }),
                  PorcionesCheckWidget(
                      title: "Camo",
                      value: _conCamote,
                      onChanged: (value) {
                        _conCamote = value ?? false;
                        setState(() {});
                      }),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 4,
                  //   child: CheckboxListTile(
                  //     title: Text(
                  //       "2",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     value: _isSelected,

                  //     onChanged: (value) {
                  //       _isSelected = value ?? false;
                  //       setState(() {});
                  //     },
                  //     //personalizando checkboxlistile
                  //     activeColor: Colors.green,
                  //     checkColor: Colors.white,
                  //     // secondary: Icon(
                  //     //   Icons.food_bank,
                  //     //   color: Colors.white,
                  //     // ),
                  //     tileColor: Colors.black.withOpacity(0.35),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //     hoverColor: Colors.white,
                  //     selectedTileColor: Colors.blue,
                  //   ),
                  // ),
                ],
              ),

              Center(
                child: Container(
                  margin: EdgeInsets.all(8),
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
                        return;
                      }

                      RecetaModel recetaAux = RecetaModel(
                          title: _titleController.text,
                          recipe: _preparationController.text,
                          urlImage: _urlController.text,
                          type: _selectedOption!,
                          withPapa: _conPapa,
                          withCamote: _conCamote);
                      recetasList.add(recetaAux);

                      _titleController.clear();
                      _preparationController.clear();
                      _urlController.clear();
                      _selectedOption = null;
                      _conPapa = false;
                      _conCamote = false;
                      setState(() {});

                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Formulario válido')),
                      // );
                    },
                    child: Text('Guardar'),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: recetasList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecetaCardWidget(
                      receta: recetasList[index],
                    );
                  },
                ),

                // child: ListView(
                //   children: [
                //     RecetaCardWidget(),
                //     RecetaCardWidget(),
                //   ],
                // ),
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
