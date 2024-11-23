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
            Row(
              children: [
                BuildButton(),
                BuildButton(),
                BuildButton(),
                BuildButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BuildButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: Color(0xff202521),
        side: BorderSide.none,
      ),
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 12,
        width: MediaQuery.of(context).size.width / 8,
        child: Text(
          "1",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
