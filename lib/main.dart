import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prjpetcare/widstateless.dart';
  
main() {
  WidgetsFlutterBinding.ensureInitialized();  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const WidStateless(
    MaterialApp()
  ));
}
