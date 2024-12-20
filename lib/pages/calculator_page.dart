import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = ""; //lo que voy ingresando
  String output = ""; //resultado
  String operator = "";
  double num1 = 0.0;
  double num2 = 0.0;

  void buttonPressed(String textButton) {
    if (textButton == ".") {
      buttonDecimal();
    } else if (textButton == "AC") {
      buttonAC();
    } else if (textButton == "+" ||
        textButton == "-" ||
        textButton == "/" ||
        textButton == "x") {
      if (operator == "" && !input.isEmpty) {
        //ayuda a saber si el primer botón presionado es un operador
        num1 = double.parse(input);
        operator = textButton;
        input = "0";
      }
    } else if (textButton == "=") {
      num2 = double.parse(input);
      igualFunction();
      num1 = 0.0;
      num2 = 0.0;
      operator = "";
      input = output; //realizo esto para poder ver el resultado en la pantalla
    } else if (textButton == "<-") {
      deleteDigito();
    } else {
      buttonNumberPressed(textButton);
    }

    output = input;
    setState(() {});
  }

  void igualFunction() {
    switch (operator) {
      case "+":
        output = (num1 + num2).toString();
      case "-":
        output = (num1 - num2).toString();
      case "/":
        output = (num1 / num2).toString();
      case ("x"):
        output = (num1 * num2).toString();
      default:
        break;
    }
  }

  void deleteDigito() {
    output.length != 0 ? input = input.substring(0, input.length - 1) : "0";
  }

  void buttonNumberPressed(String number) {
    // input != "0" ? input = input + number : input = number;
    input != "0"
        ? input += number
        : number == "."
            ? input += number
            : input = number;
  }

  void buttonDecimal() {
    if (!input.contains(".")) {
      // input = input + '.';
      input += '.';
    }
  }

  void buttonAC() {
    input = output = "0";
    operator = "";
    num1 = num2 = 0.0;
  }

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
                output,
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
                        BuildButton(
                            "7", Color(0xff202521), () => buttonPressed("7")),
                        SizedBox(width: 4),
                        BuildButton(
                            "8", Color(0xff202521), () => buttonPressed("8")),
                        SizedBox(width: 4),
                        BuildButton(
                            "9", Color(0xff202521), () => buttonPressed("9")),
                        SizedBox(width: 4),
                        BuildButton(
                            "/", Color(0XFF3C4A40), () => buttonPressed("/")),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton(
                            "4", Color(0xff202521), () => buttonPressed("4")),
                        SizedBox(width: 4),
                        BuildButton(
                            "5", Color(0xff202521), () => buttonPressed("5")),
                        SizedBox(width: 4),
                        BuildButton(
                            "6", Color(0xff202521), () => buttonPressed("6")),
                        SizedBox(width: 4),
                        BuildButton(
                            "x", Color(0XFF3C4A40), () => buttonPressed("x")),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton(
                            "1", Color(0xff202521), () => buttonPressed("1")),
                        SizedBox(width: 4),
                        BuildButton(
                            "2", Color(0xff202521), () => buttonPressed("2")),
                        SizedBox(width: 4),
                        BuildButton(
                            "3", Color(0xff202521), () => buttonPressed("3")),
                        SizedBox(width: 4),
                        BuildButton(
                            "-", Color(0XFF3C4A40), () => buttonPressed("-")),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton(
                            "0", Color(0xff202521), () => buttonPressed("0")),
                        SizedBox(width: 4),
                        BuildButton(
                            ".", Color(0xff202521), () => buttonPressed(".")),
                        SizedBox(width: 4),
                        BuildButton(
                            "<-", Color(0xff202521), () => buttonPressed("<-")),
                        SizedBox(width: 4),
                        BuildButton(
                            "+", Color(0XFF3C4A40), () => buttonPressed("+")),
                      ],
                    ),
                    Row(
                      children: [
                        BuildButton(
                            "AC", Color(0XFF2F4B57), () => buttonPressed("AC")),
                        SizedBox(width: 4),
                        BuildButton(
                            "=", Color(0XFF245136), () => buttonPressed("=")),
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
