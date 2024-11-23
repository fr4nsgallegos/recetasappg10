import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1A1C1A),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                color: Color(0xff2B352E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Text(
                "100",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        BuildButton("7", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("8", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("9", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("/", Color(0XFF3C4A40), () {}),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("4", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("5", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("6", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("x", Color(0XFF3C4A40), () {}),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("1", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("2", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("3", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("-", Color(0XFF3C4A40), () {}),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("0", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton(".", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("<-", Color(0xff202521), () {}),
                        SizedBox(width: 4),
                        BuildButton("+", Color(0XFF3C4A40), () {}),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton("AC", Color(0XFF2F4B57), () {}),
                        SizedBox(width: 4),
                        BuildButton("=", Color(0XFF245136), () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  String texto;
  Color bgColor;
  VoidCallback funcion;

  BuildButton(
    this.texto,
    this.bgColor,
    this.funcion,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          // shape: CircleBorder(),
          backgroundColor: bgColor,
          side: BorderSide.none,
        ),
        onPressed: funcion,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 8,
          child: Text(
            texto,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
