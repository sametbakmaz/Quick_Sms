import 'package:flutter/material.dart';

textFieldDecoration() {
  var decoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        offset: Offset(2, 3),
        blurRadius: 14,
        spreadRadius: -1,
        color: Color(0x0ffcfcfe2),
      ),
    ],
  );

  return decoration;
}
