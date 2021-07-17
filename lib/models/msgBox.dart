import 'package:flutter/material.dart';

class MsgCopied extends StatelessWidget {
  final String msg;
  final bool visible;

  MsgCopied(this.msg, this.visible);

  @override
  Widget build(BuildContext context) {
    return this.visible == false
        ? Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 100.0),
          )
        : Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 100.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black45,
            ),
            child: Center(
                child: Text(
              this.msg,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
              ),
            )),
          );
  }
}
