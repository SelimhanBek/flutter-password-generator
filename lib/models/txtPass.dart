import 'package:flutter/material.dart';

class TxtPassword extends StatelessWidget {
  final String pass;

  TxtPassword(this.pass);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Generated Password: ",
              textAlign: TextAlign.center,
              textScaleFactor: 0.9,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "QuickSand"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              this.pass,
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "QuickSand"),
            ),
          ),
        ],
      ),
    );
  }
}
