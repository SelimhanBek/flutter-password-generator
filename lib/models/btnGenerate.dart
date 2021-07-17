import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  final String btnText;
  final Function generatePassword;

  GenerateButton(this.btnText, this.generatePassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 90.0),
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        elevation: 4.0,
        textColor: Theme.of(context).secondaryHeaderColor,
        child: Text(
          this.btnText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18.0),
          textScaleFactor: 0.9,
        ),
        onPressed: () => generatePassword(),
      ),
    );
  }
}
