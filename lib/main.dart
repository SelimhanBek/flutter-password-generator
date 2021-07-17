
import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:passge/models/passGenerator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  void _fncShare() {
    Share.share("I found a great password generator name is PassGe. Also you can download PassGe from store ...");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassGe',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amberAccent,
        secondaryHeaderColor: Colors.black87,
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              title: TextStyle(
                color: Colors.white,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              button: TextStyle(color: Colors.white),
            ),
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 75,
            textTheme: Theme.of(context).textTheme,
            title: Text("  PassGe  "),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                  tooltip: "Copy to clipboard",
                  icon: Icon(Icons.share),
                  onPressed: () => _fncShare(),
                ),
              )
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: PassGenerator()),
          ],
        ),
      ),
    );
  }
}
