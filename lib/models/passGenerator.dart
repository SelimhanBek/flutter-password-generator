import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:passge/models/btnGenerate.dart';
import 'package:passge/models/msgBox.dart';
import 'package:passge/models/txtPass.dart';

import 'dart:async'; // for timer ...
import 'dart:math';  // for math ...

class PassGenerator extends StatefulWidget {
  @override
  _PassGeneratorState createState() => _PassGeneratorState();
}

class _PassGeneratorState extends State<PassGenerator> {
  var alphabet = ['A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F','f', 'G','g', 'H', 'h', 'I', 'i', 'J','j', 'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z'];
  var zimbirti = ['!', '#', '%', '&', '?', '*', '@', '£', '€', ';'];
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  bool _msgStatus = false;
  var _generatedPassword = "";
  var _curPass = "Zımbrıt";
  var myPass = [];

  void _generatePassword() {
    Random _random = new Random();
    int min = 8;
    int max = 10;
    int cr = min + _random.nextInt(max - min);
    myPass.length = cr;

    for (var i = 0; i < cr; i++) {
      var dc = _random.nextInt(3);
      
      if (i == 0 && dc != 0) {
        dc = 0;
      }

      if (dc == 0) {
        var lk1 = _random.nextInt(alphabet.length);
        myPass[i] = alphabet[lk1];
      } else if (dc == 1) {
        var lk2 = _random.nextInt(zimbirti.length);
        myPass[i] = zimbirti[lk2];
      } else if (dc == 2) {
        var lk3 = _random.nextInt(numbers.length);
        myPass[i] = numbers[lk3];
      }  
    }

    var bf = StringBuffer();
    myPass.forEach((element) {
      bf.write(element);
    });

    _curPass = bf.toString();

    setState(() {
      _msgStatus = true;
      _generatedPassword = _curPass;
    });
    Clipboard.setData(new ClipboardData(text: _generatedPassword));
    
    Timer _timer;
    int _start = 1;  
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
      if (_start == 0) {
        setState(() {
          _msgStatus = false;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    },
  );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.6,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            elevation: 3.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: TxtPassword(_generatedPassword)),
                Center(child: GenerateButton("Generate", _generatePassword)),
              ],
            ),
          ),
        ),
        Center(child: MsgCopied("Copied to clipboard", _msgStatus)),
      ],
    );
  }
}