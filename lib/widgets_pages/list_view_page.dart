import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<String> letrasList = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "a",
    "s",
    "d"
  ];

  Widget buildContainers(String text) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.red,
      margin: EdgeInsets.all(16),
      child: Center(
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        letrasList.add("x");
        setState(() {});
        Navigator.pop(context);
      }),
      appBar: AppBar(
        title: Text("List view Page"),
      ),
      body: ListView.builder(
        itemCount: letrasList.length,
        itemBuilder: (BuildContext context, int index) {
          print(index);
          return buildContainers(letrasList[index]);
        },
      ),
    );
  }
}
