import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void MostrarToast(
  String msg
) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    textColor: Colors.black,
    fontSize: 15,
    webPosition: "center",
    );
