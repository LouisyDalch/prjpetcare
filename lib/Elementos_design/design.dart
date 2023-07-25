import 'package:flutter/material.dart';

class DesignEntradaTxt {
  static InputDecoration decorarcaixa(
    {
      required String hintText,
      required String labelText, 
      required OutlineInputBorder border,
    }){
      return InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder()
      );
    }
}